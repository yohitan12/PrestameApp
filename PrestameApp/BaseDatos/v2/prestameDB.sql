USE [master]
GO
/****** Object:  Database [prestameBD]    Script Date: 21/02/2018 18:13:04 ******/
CREATE DATABASE [prestameBD]
GO
ALTER DATABASE [prestameBD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prestameBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prestameBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prestameBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prestameBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prestameBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prestameBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [prestameBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prestameBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prestameBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prestameBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prestameBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prestameBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prestameBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prestameBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prestameBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prestameBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prestameBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prestameBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prestameBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prestameBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prestameBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prestameBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prestameBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prestameBD] SET RECOVERY FULL 
GO
ALTER DATABASE [prestameBD] SET  MULTI_USER 
GO
ALTER DATABASE [prestameBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prestameBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prestameBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prestameBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prestameBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'prestameBD', N'ON'
GO
ALTER DATABASE [prestameBD] SET QUERY_STORE = OFF
GO
USE [prestameBD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [prestameBD]
GO
/****** Object:  Table [dbo].[tblDestreza]    Script Date: 21/02/2018 18:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDestreza](
	[idDestreza] [int] IDENTITY(1,1) NOT NULL,
	[nombreDestreza] [varchar](50) NOT NULL,
	[porcentajeDestreza] [tinyint] NOT NULL,
	[descripcion] [varchar](200) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDestreza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDestrezaEmpleado]    Script Date: 21/02/2018 18:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDestrezaEmpleado](
	[idDestrezaEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idDestreza] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDestrezaEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpleado]    Script Date: 21/02/2018 18:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](80) NOT NULL,
	[documento] [varchar](13) NOT NULL,
	[idTipoDocumento] [tinyint] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[genero] [tinyint] NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[foto] [varchar](100) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 21/02/2018 18:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpresa](
	[idEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[NIT] [varchar](15) NOT NULL,
	[razonSocial] [varchar](60) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[nombreResponsable] [varchar](30) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpresa] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstudio]    Script Date: 21/02/2018 18:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstudio](
	[idEstudio] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstudio] [varchar](60) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[nivelEstudio] [varchar](50) NOT NULL,
	[graduado] [bit] NULL,
	[fechaTerminacion] [date] NULL,
	[nombreInstitucion] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstudioEmpleado]    Script Date: 21/02/2018 18:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstudioEmpleado](
	[idEstudioEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idEstudio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstudioEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblModulo]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblModulo](
	[idModulo] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[url] [varchar](100) NULL,
	[padre] [bit] NULL,
	[padreId] [tinyint] NULL,
	[icono] [varchar](20) NULL,
	[estado] [bit] NULL,
	[mostrar] [bit] NULL,
 CONSTRAINT [PK_tblModulo] PRIMARY KEY CLUSTERED 
(
	[idModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPrestamo]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrestamo](
	[idPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRol]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRol](
	[idRol] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreRol] [varchar](30) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_tblRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRolModulo]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolModulo](
	[idRolModulo] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [tinyint] NOT NULL,
	[idModulo] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRolModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoDocumento]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoDocumento](
	[idTipoDocumento] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreTipoDocumento] [varchar](30) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_tblTipoDocumento] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[correoElectronico] [varchar](50) NOT NULL,
	[usuario] [varchar](30) NOT NULL,
	[contrasena] [varchar](100) NOT NULL,
	[estado] [tinyint] NULL,
	[idRol] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEmpresa] ON 
GO
INSERT [dbo].[tblEmpresa] ([idEmpresa], [NIT], [razonSocial], [telefono], [nombreResponsable], [idUsuario]) VALUES (1, N'890635214-2', N'Colanta S.A.S', N'4450202', N'Yhoan Galeano', 1)
GO
INSERT [dbo].[tblEmpresa] ([idEmpresa], [NIT], [razonSocial], [telefono], [nombreResponsable], [idUsuario]) VALUES (2, N'890654784-9', N'Zenu S.A.S', N'5874963', N'Jose Pekerman', 2)
GO
INSERT [dbo].[tblEmpresa] ([idEmpresa], [NIT], [razonSocial], [telefono], [nombreResponsable], [idUsuario]) VALUES (3, N'8907453-9', N'Alpina S.A.S', N'5472441', N'Harrison Mazo', 3)
GO
SET IDENTITY_INSERT [dbo].[tblEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRol] ON 
GO
INSERT [dbo].[tblRol] ([idRol], [nombreRol], [estado]) VALUES (1, N'Administrador', 1)
GO
INSERT [dbo].[tblRol] ([idRol], [nombreRol], [estado]) VALUES (2, N'Empresa', 1)
GO
INSERT [dbo].[tblRol] ([idRol], [nombreRol], [estado]) VALUES (3, N'Empleado', 1)
GO
SET IDENTITY_INSERT [dbo].[tblRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsuario] ON 
GO
INSERT [dbo].[tblUsuario] ([idUsuario], [correoElectronico], [usuario], [contrasena], [estado], [idRol]) VALUES (1, N'info@colanta.com', N'colanta', N'123456', 0, 2)
GO
INSERT [dbo].[tblUsuario] ([idUsuario], [correoElectronico], [usuario], [contrasena], [estado], [idRol]) VALUES (2, N'info@zenu.com', N'zenu', N'123456', 0, 2)
GO
INSERT [dbo].[tblUsuario] ([idUsuario], [correoElectronico], [usuario], [contrasena], [estado], [idRol]) VALUES (3, N'harrison@alpina.com', N'alpina', N'123456', 0, 2)
GO
SET IDENTITY_INSERT [dbo].[tblUsuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tblEmpleado_documento]    Script Date: 21/02/2018 18:13:07 ******/
ALTER TABLE [dbo].[tblEmpleado] ADD  CONSTRAINT [UQ_tblEmpleado_documento] UNIQUE NONCLUSTERED 
(
	[documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tblEmpresa_NIT]    Script Date: 21/02/2018 18:13:07 ******/
ALTER TABLE [dbo].[tblEmpresa] ADD  CONSTRAINT [UQ_tblEmpresa_NIT] UNIQUE NONCLUSTERED 
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tblUsuario_correoElectronico]    Script Date: 21/02/2018 18:13:07 ******/
ALTER TABLE [dbo].[tblUsuario] ADD  CONSTRAINT [UQ_tblUsuario_correoElectronico] UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tblUsuario_usuario]    Script Date: 21/02/2018 18:13:07 ******/
ALTER TABLE [dbo].[tblUsuario] ADD  CONSTRAINT [UQ_tblUsuario_usuario] UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDestreza] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[tblEstudio] ADD  DEFAULT ((0)) FOR [graduado]
GO
ALTER TABLE [dbo].[tblEstudio] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[tblModulo] ADD  CONSTRAINT [DF_tblModulo_padre]  DEFAULT ((0)) FOR [padre]
GO
ALTER TABLE [dbo].[tblModulo] ADD  CONSTRAINT [DF_tblModulo_estado]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[tblModulo] ADD  CONSTRAINT [DF_tblModulo_mostrar]  DEFAULT ((1)) FOR [mostrar]
GO
ALTER TABLE [dbo].[tblPrestamo] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[tblRol] ADD  CONSTRAINT [DF_tblRol_estado]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[tblTipoDocumento] ADD  CONSTRAINT [DF_tblTipoDocumento_estado]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[tblUsuario] ADD  CONSTRAINT [DF_tblUsuario_estado]  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[tblDestrezaEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblDestrezaEmpleado_tblDestreza_idDestreza] FOREIGN KEY([idDestreza])
REFERENCES [dbo].[tblDestreza] ([idDestreza])
GO
ALTER TABLE [dbo].[tblDestrezaEmpleado] CHECK CONSTRAINT [FK_tblDestrezaEmpleado_tblDestreza_idDestreza]
GO
ALTER TABLE [dbo].[tblDestrezaEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblDestrezaEmpleado_tblEmpleado_idEmpleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[tblEmpleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[tblDestrezaEmpleado] CHECK CONSTRAINT [FK_tblDestrezaEmpleado_tblEmpleado_idEmpleado]
GO
ALTER TABLE [dbo].[tblEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpleado_tblEmpresa_idEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[tblEmpresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[tblEmpleado] CHECK CONSTRAINT [FK_tblEmpleado_tblEmpresa_idEmpresa]
GO
ALTER TABLE [dbo].[tblEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpleado_tblTipoDocumento_idTipoDocumento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tblTipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[tblEmpleado] CHECK CONSTRAINT [FK_tblEmpleado_tblTipoDocumento_idTipoDocumento]
GO
ALTER TABLE [dbo].[tblEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpleado_tblUsuario_idUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblEmpleado] CHECK CONSTRAINT [FK_tblEmpleado_tblUsuario_idUsuario]
GO
ALTER TABLE [dbo].[tblEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpresa_tblUsuario_idUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblEmpresa] CHECK CONSTRAINT [FK_tblEmpresa_tblUsuario_idUsuario]
GO
ALTER TABLE [dbo].[tblEstudioEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstudioEmpleado_tblEmpleado_idEmpleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[tblEmpleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[tblEstudioEmpleado] CHECK CONSTRAINT [FK_tblEstudioEmpleado_tblEmpleado_idEmpleado]
GO
ALTER TABLE [dbo].[tblEstudioEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstudioEmpleado_tblEstudio_idEstudio] FOREIGN KEY([idEstudio])
REFERENCES [dbo].[tblEstudio] ([idEstudio])
GO
ALTER TABLE [dbo].[tblEstudioEmpleado] CHECK CONSTRAINT [FK_tblEstudioEmpleado_tblEstudio_idEstudio]
GO
ALTER TABLE [dbo].[tblPrestamo]  WITH CHECK ADD  CONSTRAINT [FK_tblPrestamo_tblEmpleado_idEmpleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[tblEmpleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[tblPrestamo] CHECK CONSTRAINT [FK_tblPrestamo_tblEmpleado_idEmpleado]
GO
ALTER TABLE [dbo].[tblPrestamo]  WITH CHECK ADD  CONSTRAINT [FK_tblPrestamo_tblEmpresa_idEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[tblEmpresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[tblPrestamo] CHECK CONSTRAINT [FK_tblPrestamo_tblEmpresa_idEmpresa]
GO
ALTER TABLE [dbo].[tblRolModulo]  WITH CHECK ADD  CONSTRAINT [FK_tblRolModulo_tblModulo_idModulo] FOREIGN KEY([idModulo])
REFERENCES [dbo].[tblModulo] ([idModulo])
GO
ALTER TABLE [dbo].[tblRolModulo] CHECK CONSTRAINT [FK_tblRolModulo_tblModulo_idModulo]
GO
ALTER TABLE [dbo].[tblRolModulo]  WITH CHECK ADD  CONSTRAINT [FK_tblRolModulo_tblRol_idRol] FOREIGN KEY([idRol])
REFERENCES [dbo].[tblRol] ([idRol])
GO
ALTER TABLE [dbo].[tblRolModulo] CHECK CONSTRAINT [FK_tblRolModulo_tblRol_idRol]
GO
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuario_tblRol_idRol] FOREIGN KEY([idRol])
REFERENCES [dbo].[tblRol] ([idRol])
GO
ALTER TABLE [dbo].[tblUsuario] CHECK CONSTRAINT [FK_tblUsuario_tblRol_idRol]
GO
/****** Object:  StoredProcedure [dbo].[crud_tblEmpresaInsert]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[crud_tblEmpresaInsert]
	(
		@NIT [varchar](15),
		@razonSocial [varchar](60),
		@telefono [varchar](20),
		@nombreResponsable [varchar](30),
		@correoElectronico varchar(50),
		@usuario varchar(30),
		@contrasena varchar(100),
		@idRol tinyint
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	--Declaro las variables que vamos a utlizar posteriormente para obtener los ultimos ID autoIncrementables
	DECLARE @_idUsuario int = 0;
	DECLARE @_idEmpresa int = 0;

	--Insert en la tabla usuario
	INSERT INTO dbo.tblUsuario 
	(
		correoElectronico, usuario, contrasena, idRol
	)
	VALUES
	(
		@correoElectronico, @usuario, @contrasena, @idRol
	);

	-- Obtengo el ultimo id autoincrementable de la tabla usuario
	SET @_idUsuario = SCOPE_IDENTITY();


	--Insert de la tabla empresa
	INSERT INTO dbo.tblEmpresa
	(
		NIT, razonSocial, telefono, nombreResponsable, idUsuario
	)
	VALUES
	(
		@NIT,
		@razonSocial,
		@telefono,
		@nombreResponsable,
		@_idUsuario
	);

	-- Obtengo el ultimo id de la tabla empresa
	SET @_idEmpresa = SCOPE_IDENTITY();

	-- Llamo el procedmiento almacenado de la tabla empresa con sus respectivos INNER JOIN
	EXEC crud_tblEmpresaSelect @idEmpresa = @_idEmpresa;

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[crud_tblEmpresaSelect]    Script Date: 21/02/2018 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[crud_tblEmpresaSelect]
		@idEmpresa [int]
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	SELECT E.idEmpresa, E.NIT, E.razonSocial, E.telefono, 
		   E.nombreResponsable, E.idUsuario, U.correoElectronico,
		   U.usuario, U.estado, U.idRol, R.nombreRol
	FROM dbo.tblEmpresa as E
	INNER JOIN dbo.tblUsuario as U ON U.idUsuario = E.idUsuario
	INNER JOIN dbo.tblRol as R ON R.idRol = U.idRol
	WHERE (E.idEmpresa = @idEmpresa OR @idEmpresa IS NULL)

	COMMIT
GO
USE [master]
GO
ALTER DATABASE [prestameBD] SET  READ_WRITE 
GO
