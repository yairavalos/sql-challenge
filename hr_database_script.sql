
-- create database
create database hr_database;


-- create tables and relations

create table if not exists loc_region(
	id serial primary key not null,
	region varchar(50) not null
);

create table if not exists loc_country(
	id serial primary key not null,
	country varchar(50) not null,
	loc_region_id int not null,
	
	constraint fk_loc_region_id foreign key (loc_region_id) references loc_region(id)
);

create table if not exists office_loc(
	id serial primary key not null,
	street_address varchar(255),
	zip_code varchar(10),
	city varchar(50),
	state_province varchar(50),
	loc_country_id int not null,
	
	constraint fk_loc_country_id foreign key (loc_country_id) references loc_country(id)
);

create table if not exists department(
	id serial primary key not null,
	dept_name varchar(30) not null,
	manager_id int not null,
	office_loc_id int not null,
	
	constraint fk_office_loc_id foreign key (office_loc_id) references office_loc(id)
);

create table if not exists job_role(
	id serial primary key not null,
	job_title varchar(30) not null,
	dept_id int not null,
	minimum_salary float not null,
	maximum_salary float not null,
	commission_percent int,
	
	constraint fk_dept_id foreign key (dept_id) references department(id)
);

create table if not exists employee(
	id serial primary key not null,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	email varchar(150),
	phone_number varchar(20),
	hire_date date not null,
	job_id int not null,
	
	constraint fk_job_id foreign key (job_id) references job_role(id)	
);

alter table department add constraint fk_manager_id foreign key (manager_id) references employee(id);

create table if not exists employee_role(
	id serial primary key not null,
	employee_id int not null,
	job_id int not null,
	start_date date not null,
	end_date date,
	
	constraint fk_employee_id foreign key (employee_id) references employee(id),
	constraint fk_job_id foreign key (job_id) references job_role(id)
);



-- insert data into tables

insert into loc_region(region) values ();


insert into loc_country(country, loc_region_id) values ();


insert into office_loc(street_address, zip_code, city, state_province, loc_country_id) values ();


insert into department(dept_name, manager_id, office_loc_id) values ();


insert into job_role (job_title, dept_id, minimum_salary, maximum_salary, commission_percent) values ();


insert into employee (first_name, last_name, email, phone_number, hire_date, job_id) values ();


insert into employee_role (employee_id, job_id, start_date, end_date) values ();



-- create views


-------------- (ROSY) ---------------

--List of locations --	Enlista la ubicacion de todas las locaciones / oficinas. Permite borrar registros


--List of locations per region	-- Enlista la ubicacion de todas las locaciones / oficinas por region. Permite borrar registros


--List of employees	-- Enlista todos los empleados de la empresa


--Employee details	-- Muestra todos los datos de un empleado (datos personales y laborales)


--Employee history	-- Muestra el historial del empleado dentro de la empresa (todos los puestos que ha ocupado)


--List of departments per location	-- Muestra una lista de locaciones / oficinas por locacion


--List of employees per location	-- Enlista todos los empleados de una locacion




-------------- (IVAN) ---------------


--List of employees per department	-- Enlista todos los empleados de un departamento


--List of employees by job	-- Enlista de todos los empleados por puesto


--Job details	-- Muestra los detalles de un puesto de trabajo


--Department details	-- Muestra los detalles de un departamento (supervisior, empleados, ubicacion)


--Responsabilities	-- Muestra los empleados que trabajan para un supervisor


--Formulario para crear nuevas regiones	
--Region Name	Nombre de la región (North America, Europe, Asia, etc.)


--Formulario de creación de países	
--Country	Nombre del país
--Region	Region a la que pertenece
	
--Formulario para crear una nueva posición	
--Job Title	Nombre de la posición
--Minimum Salary	Salario mínimo
--Maximum Salary	Salario Máximo


-------------- (YAIR) ---------------

--Formulario para crear una nueva locación / oficina	
--Street Address	Dirección de la nueva locación
--ZIP Code	Código postal
--City	Ciudad
--State/Province	Estado o provincia
--Country	País
	
--Formulario para crear nuevos departamentos / áreas de trabajo	
--Name	Nombre del departamento
--Manager	Supervisor encargado
--Location	Locación / Oficina donde se ubica
	
--Formulario para crear un nuevo empleado	
--First Name	Nombre
--Last Name	Apellido
--Email	Email
--Phone Number	Teléfono
--Hire date	Fecha de contratación
--Job title	Posición / Puesto
--Salary	Salario
--Commision percent	Porcentaje de comisión
--Manager	Supervisor
--Department	Departamento / Área de trabajo
	
--Formulario para cambiar de puesto a un empleado	
--Employee	Empleado que se va a modificar
--New Job Title	Nueva posición
--New Salary	Nuevo salario
--New commission percent	Nuevo porcentaje de comisión
--New department	Nuevo departamento / área de trabajo
	
--Formulario para editar los datos de un empleado	
--First Name	Nombre
--Last Name	Apellido
--Email	Email
--Phone Number	Teléfono
--Hire date	Fecha de contratación




---- Quality control check ----

-- validate the employee has manager position at office loc
-- validate salary its into the salary range from job_role
-- validate that country its actually a valid region in office location



