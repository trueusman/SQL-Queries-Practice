-- =====================================================
-- Project: BikeStores SQL Practice
-- Description:
-- This file contains SQL Server queries performed on the BikeStores database.
-- It covers fundamental SQL concepts including:
-- - Data Retrieval (SELECT)
-- - Filtering (WHERE)
-- - Sorting (ORDER BY)
-- - Unique Values (DISTINCT)
-- - Row Limiting (TOP)
-- - Pagination (OFFSET-FETCH)
-- - Logical Operators (AND / OR)
-- =====================================================


-- CREATE DATABASE
CREATE DATABASE BikeStores;
USE BikeStores;


-- =========================
-- SELECTION QUERIES
-- =========================
SELECT * FROM sales.customers;
SELECT * FROM production.products;
SELECT product_id, product_name FROM production.products;
SELECT * FROM sales.orders;

SELECT *
FROM sales.customers
WHERE customer_id = 94;

SELECT first_name, last_name
FROM sales.customers
WHERE customer_id = 94;


-- =========================
-- WHERE CONDITION
-- =========================
SELECT *
FROM sales.customers
WHERE city = 'New York';


-- =========================
-- ORDER BY (SORTING)
-- =========================
SELECT first_name, last_name
FROM sales.customers
ORDER BY first_name;

SELECT *
FROM production.products
ORDER BY model_year ASC, list_price DESC;

SELECT city, first_name, last_name
FROM sales.customers
ORDER BY city ASC, first_name DESC;


-- =========================
-- LIMITING ROWS (TOP)
-- =========================
SELECT TOP 10 *
FROM production.products
ORDER BY list_price;

SELECT TOP 10 product_id, product_name, list_price
FROM production.products
ORDER BY list_price DESC;

SELECT TOP 1 PERCENT *
FROM production.products
ORDER BY list_price DESC;


-- =========================
-- OFFSET & FETCH (PAGINATION)
-- =========================
SELECT *
FROM production.products
ORDER BY list_price DESC
OFFSET 10 ROWS;

SELECT *
FROM production.products
ORDER BY list_price DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;


-- =========================
-- DISTINCT VALUES
-- =========================
SELECT DISTINCT city
FROM sales.customers
ORDER BY city;

SELECT DISTINCT model_year
FROM production.products;


-- =========================
-- NULL CHECK
-- =========================
SELECT *
FROM sales.customers
WHERE phone IS NOT NULL;


-- =========================
-- LOGICAL OPERATORS (AND / OR)
-- =========================
SELECT *
FROM production.products
WHERE category_id = 1 AND list_price > 400;

SELECT *
FROM production.products
WHERE category_id = 1 OR list_price > 400;

SELECT *
FROM production.products
WHERE list_price > 1000
AND (brand_id = 1 OR brand_id = 2);