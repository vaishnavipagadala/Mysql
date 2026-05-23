create table customers (customer_id   int primary key,customer_name varchar(89),region varchar(89));
insert into customers values(100 ,"sunitha","telangana");
select * from customers;
create table products (product_id int primary key,product_name varchar(78),category varchar(67));
insert into products values(5001,"grains","seeds");
select*from products;
create table   orders (order_id  int primary key,date date,customer_id int ,foreign key (customer_id) references customers(customer_id));
insert into orders values(10001,"2025-09-08",100);
select *from orders;
create table order_details(order_id  int ,foreign key(order_id) references orders(order_id),product_id int ,foreign key(product_id) references products(product_id),quantity varchar(89),sales decimal(10,2),profit decimal(10,2));
insert into order_details values(10002,5002,"2Kg",89.89,92);
select*from order_details;
--
select region ,sum(sales)  as total_sales from customers join orders on customers.customer_id=orders.customer_id join order_details on orders(order_id)=order_details(order_id) group by region; 
SELECT region, SUM(sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY region;

select   customer_name ,sum(sales) as total_sales 
from customers
join orders on orders.customer_id=customers.customer_id
join order_details on order_details.order_id=orders.order_id
group by customer_name
order by total_sales desc 
limit 5;

select  category  ,sum(sales),sum(profit) 
from  products 
join order_details on order_details.product_id=products.product_id
group by category
;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(sales) AS monthly_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY month
ORDER BY month;

select date_format(date,'%m') as month,sum(sales) as monthly_sales
from orders
join order_details on orders.order_id=order_details.order_id
group by month
order by month;

select customer_name,sum(profit) from customers  join  orders on orders.customer_id=customers.customer_id join order_details on order_details.order_id=orders.order_id group by customer_name   having sum(profit)<100;