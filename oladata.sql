create database OLA;
use OLA;
create view Successful_Bookings as 
Select * from bookings where Booking_Status = 'Success';
create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance) as avg_distance from bookings group by vehicle_type;

select count(*) as canceled_trips from bookings where Canceled_Rides_by_Customer is not null;
create view canceled_rides as
select count(*) as canceled_trips from bookings where booking_status="Canceled by Customer";
create view top_5_customers as
select customer_id, count(booking_id) as total_trip from bookings group by Customer_ID order by total_trip desc limit 5;
select count(booking_id) as canceled_bookings_by_driver from bookings where Canceled_Rides_by_Driver = "Personal & Car related issue";
select max(Driver_ratings), min(Driver_ratings) from bookings where Vehicle_Type = "Prime Sedan";
select * from bookings where Payment_Method= "UPI";
select vehicle_type, avg(Customer_rating) as customer_rating from bookings group by Vehicle_Type;
select sum(booking_value) from bookings where Booking_Status= "Success";
select booking_id, incomplete_rides_reason from bookings where Incomplete_Rides = "Yes";