--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administrative_regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrative_regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    code_name character varying(255),
    code_name_en character varying(255)
);


--
-- Name: administrative_units; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrative_units (
    id integer NOT NULL,
    full_name character varying(255),
    full_name_en character varying(255),
    short_name character varying(255),
    short_name_en character varying(255),
    code_name character varying(255),
    code_name_en character varying(255)
);


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    code character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    full_name character varying(255),
    full_name_en character varying(255),
    code_name character varying(255),
    province_code character varying(20),
    administrative_unit_id integer
);


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provinces (
    code character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    full_name character varying(255) NOT NULL,
    full_name_en character varying(255),
    code_name character varying(255),
    administrative_unit_id integer,
    administrative_region_id integer
);


--
-- Name: wards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wards (
    code character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    full_name character varying(255),
    full_name_en character varying(255),
    code_name character varying(255),
    district_code character varying(20),
    administrative_unit_id integer
);


--
-- Data for Name: administrative_regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.administrative_regions (id, name, name_en, code_name, code_name_en) FROM stdin;
1	Đông Bắc Bộ	Northeast	dong_bac_bo	northest
2	Tây Bắc Bộ	Northwest	tay_bac_bo	northwest
3	Đồng bằng sông Hồng	Red River Delta	dong_bang_song_hong	red_river_delta
4	Bắc Trung Bộ	North Central Coast	bac_trung_bo	north_central_coast
5	Duyên hải Nam Trung Bộ	South Central Coast	duyen_hai_nam_trung_bo	south_central_coast
6	Tây Nguyên	Central Highlands	tay_nguyen	central_highlands
7	Đông Nam Bộ	Southeast	dong_nam_bo	southeast
8	Đồng bằng sông Cửu Long	Mekong River Delta	dong_bang_song_cuu_long	southwest
\.


--
-- Data for Name: administrative_units; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.administrative_units (id, full_name, full_name_en, short_name, short_name_en, code_name, code_name_en) FROM stdin;
1	Thành phố trực thuộc trung ương	Municipality	Thành phố	City	thanh_pho_truc_thuoc_trung_uong	municipality
2	Tỉnh	Province	Tỉnh	Province	tinh	province
3	Thành phố thuộc thành phố trực thuộc trung ương	Municipal city	Thành phố	City	thanh_pho_thuoc_thanh_pho_truc_thuoc_trung_uong	municipal_city
4	Thành phố thuộc tỉnh	Provincial city	Thành phố	City	thanh_pho_thuoc_tinh	provincial_city
5	Quận	Urban district	Quận	District	quan	urban_district
6	Thị xã	District-level town	Thị xã	Town	thi_xa	district_level_town
7	Huyện	District	Huyện	District	huyen	district
8	Phường	Ward	Phường	Ward	phuong	ward
9	Thị trấn	Commune-level town	Thị trấn	Township	thi_tran	commune_level_town
10	Xã	Commune	Xã	Commune	xa	commune
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.districts (code, name, name_en, full_name, full_name_en, code_name, province_code, administrative_unit_id) FROM stdin;
725	Thuận An	Thuan An	Thành phố Thuận An	Thuan An City	thuan_an	74	4
001	Ba Đình	Ba Dinh	Quận Ba Đình	Ba Dinh District	ba_dinh	01	5
002	Hoàn Kiếm	Hoan Kiem	Quận Hoàn Kiếm	Hoan Kiem District	hoan_kiem	01	5
003	Tây Hồ	Tay Ho	Quận Tây Hồ	Tay Ho District	tay_ho	01	5
004	Long Biên	Long Bien	Quận Long Biên	Long Bien District	long_bien	01	5
005	Cầu Giấy	Cau Giay	Quận Cầu Giấy	Cau Giay District	cau_giay	01	5
006	Đống Đa	Dong Da	Quận Đống Đa	Dong Da District	dong_da	01	5
007	Hai Bà Trưng	Hai Ba Trung	Quận Hai Bà Trưng	Hai Ba Trung District	hai_ba_trung	01	5
008	Hoàng Mai	Hoang Mai	Quận Hoàng Mai	Hoang Mai District	hoang_mai	01	5
009	Thanh Xuân	Thanh Xuan	Quận Thanh Xuân	Thanh Xuan District	thanh_xuan	01	5
016	Sóc Sơn	Soc Son	Huyện Sóc Sơn	Soc Son District	soc_son	01	7
017	Đông Anh	Dong Anh	Huyện Đông Anh	Dong Anh District	dong_anh	01	7
018	Gia Lâm	Gia Lam	Huyện Gia Lâm	Gia Lam District	gia_lam	01	7
019	Nam Từ Liêm	Nam Tu Liem	Quận Nam Từ Liêm	Nam Tu Liem District	nam_tu_liem	01	5
020	Thanh Trì	Thanh Tri	Huyện Thanh Trì	Thanh Tri District	thanh_tri	01	7
021	Bắc Từ Liêm	Bac Tu Liem	Quận Bắc Từ Liêm	Bac Tu Liem District	bac_tu_liem	01	5
250	Mê Linh	Me Linh	Huyện Mê Linh	Me Linh District	me_linh	01	7
268	Hà Đông	Ha Dong	Quận Hà Đông	Ha Dong District	ha_dong	01	5
269	Sơn Tây	Son Tay	Thị xã Sơn Tây	Son Tay Town	son_tay	01	6
271	Ba Vì	Ba Vi	Huyện Ba Vì	Ba Vi District	ba_vi	01	7
272	Phúc Thọ	Phuc Tho	Huyện Phúc Thọ	Phuc Tho District	phuc_tho	01	7
273	Đan Phượng	Dan Phuong	Huyện Đan Phượng	Dan Phuong District	dan_phuong	01	7
274	Hoài Đức	Hoai Duc	Huyện Hoài Đức	Hoai Duc District	hoai_duc	01	7
275	Quốc Oai	Quoc Oai	Huyện Quốc Oai	Quoc Oai District	quoc_oai	01	7
276	Thạch Thất	Thach That	Huyện Thạch Thất	Thach That District	thach_that	01	7
277	Chương Mỹ	Chuong My	Huyện Chương Mỹ	Chuong My District	chuong_my	01	7
278	Thanh Oai	Thanh Oai	Huyện Thanh Oai	Thanh Oai District	thanh_oai	01	7
279	Thường Tín	Thuong Tin	Huyện Thường Tín	Thuong Tin District	thuong_tin	01	7
280	Phú Xuyên	Phu Xuyen	Huyện Phú Xuyên	Phu Xuyen District	phu_xuyen	01	7
281	Ứng Hòa	Ung Hoa	Huyện Ứng Hòa	Ung Hoa District	ung_hoa	01	7
282	Mỹ Đức	My Duc	Huyện Mỹ Đức	My Duc District	my_duc	01	7
024	Hà Giang	Ha Giang	Thành phố Hà Giang	Ha Giang City	ha_giang	02	4
026	Đồng Văn	Dong Van	Huyện Đồng Văn	Dong Van District	dong_van	02	7
027	Mèo Vạc	Meo Vac	Huyện Mèo Vạc	Meo Vac District	meo_vac	02	7
028	Yên Minh	Yen Minh	Huyện Yên Minh	Yen Minh District	yen_minh	02	7
029	Quản Bạ	Quan Ba	Huyện Quản Bạ	Quan Ba District	quan_ba	02	7
030	Vị Xuyên	Vi Xuyen	Huyện Vị Xuyên	Vi Xuyen District	vi_xuyen	02	7
031	Bắc Mê	Bac Me	Huyện Bắc Mê	Bac Me District	bac_me	02	7
032	Hoàng Su Phì	Hoang Su Phi	Huyện Hoàng Su Phì	Hoang Su Phi District	hoang_su_phi	02	7
033	Xín Mần	Xin Man	Huyện Xín Mần	Xin Man District	xin_man	02	7
034	Bắc Quang	Bac Quang	Huyện Bắc Quang	Bac Quang District	bac_quang	02	7
035	Quang Bình	Quang Binh	Huyện Quang Bình	Quang Binh District	quang_binh	02	7
040	Cao Bằng	Cao Bang	Thành phố Cao Bằng	Cao Bang City	cao_bang	04	4
042	Bảo Lâm	Bao Lam	Huyện Bảo Lâm	Bao Lam District	bao_lam	04	7
043	Bảo Lạc	Bao Lac	Huyện Bảo Lạc	Bao Lac District	bao_lac	04	7
045	Hà Quảng	Ha Quang	Huyện Hà Quảng	Ha Quang District	ha_quang	04	7
047	Trùng Khánh	Trung Khanh	Huyện Trùng Khánh	Trung Khanh District	trung_khanh	04	7
048	Hạ Lang	Ha Lang	Huyện Hạ Lang	Ha Lang District	ha_lang	04	7
049	Quảng Hòa	Quang Hoa	Huyện Quảng Hòa	Quang Hoa District	quang_hoa	04	7
051	Hoà An	Hoa An	Huyện Hoà An	Hoa An District	hoa_an	04	7
052	Nguyên Bình	Nguyen Binh	Huyện Nguyên Bình	Nguyen Binh District	nguyen_binh	04	7
053	Thạch An	Thach An	Huyện Thạch An	Thach An District	thach_an	04	7
058	Bắc Kạn	Bac Kan	Thành phố Bắc Kạn	Bac Kan City	bac_kan	06	4
060	Pác Nặm	Pac Nam	Huyện Pác Nặm	Pac Nam District	pac_nam	06	7
061	Ba Bể	Ba Be	Huyện Ba Bể	Ba Be District	ba_be	06	7
062	Ngân Sơn	Ngan Son	Huyện Ngân Sơn	Ngan Son District	ngan_son	06	7
063	Bạch Thông	Bach Thong	Huyện Bạch Thông	Bach Thong District	bach_thong	06	7
064	Chợ Đồn	Cho Don	Huyện Chợ Đồn	Cho Don District	cho_don	06	7
065	Chợ Mới	Cho Moi	Huyện Chợ Mới	Cho Moi District	cho_moi	06	7
066	Na Rì	Na Ri	Huyện Na Rì	Na Ri District	na_ri	06	7
070	Tuyên Quang	Tuyen Quang	Thành phố Tuyên Quang	Tuyen Quang City	tuyen_quang	08	4
071	Lâm Bình	Lam Binh	Huyện Lâm Bình	Lam Binh District	lam_binh	08	7
072	Na Hang	Na Hang	Huyện Na Hang	Na Hang District	na_hang	08	7
073	Chiêm Hóa	Chiem Hoa	Huyện Chiêm Hóa	Chiem Hoa District	chiem_hoa	08	7
074	Hàm Yên	Ham Yen	Huyện Hàm Yên	Ham Yen District	ham_yen	08	7
075	Yên Sơn	Yen Son	Huyện Yên Sơn	Yen Son District	yen_son	08	7
076	Sơn Dương	Son Duong	Huyện Sơn Dương	Son Duong District	son_duong	08	7
080	Lào Cai	Lao Cai	Thành phố Lào Cai	Lao Cai City	lao_cai	10	4
082	Bát Xát	Bat Xat	Huyện Bát Xát	Bat Xat District	bat_xat	10	7
083	Mường Khương	Muong Khuong	Huyện Mường Khương	Muong Khuong District	muong_khuong	10	7
084	Si Ma Cai	Si Ma Cai	Huyện Si Ma Cai	Si Ma Cai District	si_ma_cai	10	7
085	Bắc Hà	Bac Ha	Huyện Bắc Hà	Bac Ha District	bac_ha	10	7
086	Bảo Thắng	Bao Thang	Huyện Bảo Thắng	Bao Thang District	bao_thang	10	7
087	Bảo Yên	Bao Yen	Huyện Bảo Yên	Bao Yen District	bao_yen	10	7
088	Sa Pa	Sa Pa	Thị xã Sa Pa	Sa Pa Town	sa_pa	10	6
089	Văn Bàn	Van Ban	Huyện Văn Bàn	Van Ban District	van_ban	10	7
094	Điện Biên Phủ	Dien Bien Phu	Thành phố Điện Biên Phủ	Dien Bien Phu City	dien_bien_phu	11	4
095	Mường Lay	Muong Lay	Thị xã Mường Lay	Muong Lay Town	muong_lay	11	6
096	Mường Nhé	Muong Nhe	Huyện Mường Nhé	Muong Nhe District	muong_nhe	11	7
097	Mường Chà	Muong Cha	Huyện Mường Chà	Muong Cha District	muong_cha	11	7
098	Tủa Chùa	Tua Chua	Huyện Tủa Chùa	Tua Chua District	tua_chua	11	7
099	Tuần Giáo	Tuan Giao	Huyện Tuần Giáo	Tuan Giao District	tuan_giao	11	7
100	Điện Biên	Dien Bien	Huyện Điện Biên	Dien Bien District	dien_bien	11	7
101	Điện Biên Đông	Dien Bien Dong	Huyện Điện Biên Đông	Dien Bien Dong District	dien_bien_dong	11	7
102	Mường Ảng	Muong Ang	Huyện Mường Ảng	Muong Ang District	muong_ang	11	7
103	Nậm Pồ	Nam Po	Huyện Nậm Pồ	Nam Po District	nam_po	11	7
105	Lai Châu	Lai Chau	Thành phố Lai Châu	Lai Chau City	lai_chau	12	4
106	Tam Đường	Tam Duong	Huyện Tam Đường	Tam Duong District	tam_duong	12	7
107	Mường Tè	Muong Te	Huyện Mường Tè	Muong Te District	muong_te	12	7
108	Sìn Hồ	Sin Ho	Huyện Sìn Hồ	Sin Ho District	sin_ho	12	7
109	Phong Thổ	Phong Tho	Huyện Phong Thổ	Phong Tho District	phong_tho	12	7
110	Than Uyên	Than Uyen	Huyện Than Uyên	Than Uyen District	than_uyen	12	7
111	Tân Uyên	Tan Uyen	Huyện Tân Uyên	Tan Uyen District	tan_uyen	12	7
112	Nậm Nhùn	Nam Nhun	Huyện Nậm Nhùn	Nam Nhun District	nam_nhun	12	7
116	Sơn La	Son La	Thành phố Sơn La	Son La City	son_la	14	4
118	Quỳnh Nhai	Quynh Nhai	Huyện Quỳnh Nhai	Quynh Nhai District	quynh_nhai	14	7
119	Thuận Châu	Thuan Chau	Huyện Thuận Châu	Thuan Chau District	thuan_chau	14	7
120	Mường La	Muong La	Huyện Mường La	Muong La District	muong_la	14	7
121	Bắc Yên	Bac Yen	Huyện Bắc Yên	Bac Yen District	bac_yen	14	7
122	Phù Yên	Phu Yen	Huyện Phù Yên	Phu Yen District	phu_yen	14	7
123	Mộc Châu	Moc Chau	Huyện Mộc Châu	Moc Chau District	moc_chau	14	7
124	Yên Châu	Yen Chau	Huyện Yên Châu	Yen Chau District	yen_chau	14	7
125	Mai Sơn	Mai Son	Huyện Mai Sơn	Mai Son District	mai_son	14	7
126	Sông Mã	Song Ma	Huyện Sông Mã	Song Ma District	song_ma	14	7
127	Sốp Cộp	Sop Cop	Huyện Sốp Cộp	Sop Cop District	sop_cop	14	7
128	Vân Hồ	Van Ho	Huyện Vân Hồ	Van Ho District	van_ho	14	7
132	Yên Bái	Yen Bai	Thành phố Yên Bái	Yen Bai City	yen_bai	15	4
133	Nghĩa Lộ	Nghia Lo	Thị xã Nghĩa Lộ	Nghia Lo Town	nghia_lo	15	6
135	Lục Yên	Luc Yen	Huyện Lục Yên	Luc Yen District	luc_yen	15	7
136	Văn Yên	Van Yen	Huyện Văn Yên	Van Yen District	van_yen	15	7
137	Mù Căng Chải	Mu Cang Chai	Huyện Mù Căng Chải	Mu Cang Chai District	mu_cang_chai	15	7
138	Trấn Yên	Tran Yen	Huyện Trấn Yên	Tran Yen District	tran_yen	15	7
139	Trạm Tấu	Tram Tau	Huyện Trạm Tấu	Tram Tau District	tram_tau	15	7
140	Văn Chấn	Van Chan	Huyện Văn Chấn	Van Chan District	van_chan	15	7
141	Yên Bình	Yen Binh	Huyện Yên Bình	Yen Binh District	yen_binh	15	7
148	Hòa Bình	Hoa Binh	Thành phố Hòa Bình	Hoa Binh City	hoa_binh	17	4
150	Đà Bắc	Da Bac	Huyện Đà Bắc	Da Bac District	da_bac	17	7
152	Lương Sơn	Luong Son	Huyện Lương Sơn	Luong Son District	luong_son	17	7
153	Kim Bôi	Kim Boi	Huyện Kim Bôi	Kim Boi District	kim_boi	17	7
154	Cao Phong	Cao Phong	Huyện Cao Phong	Cao Phong District	cao_phong	17	7
155	Tân Lạc	Tan Lac	Huyện Tân Lạc	Tan Lac District	tan_lac	17	7
156	Mai Châu	Mai Chau	Huyện Mai Châu	Mai Chau District	mai_chau	17	7
157	Lạc Sơn	Lac Son	Huyện Lạc Sơn	Lac Son District	lac_son	17	7
158	Yên Thủy	Yen Thuy	Huyện Yên Thủy	Yen Thuy District	yen_thuy	17	7
159	Lạc Thủy	Lac Thuy	Huyện Lạc Thủy	Lac Thuy District	lac_thuy	17	7
164	Thái Nguyên	Thai Nguyen	Thành phố Thái Nguyên	Thai Nguyen City	thai_nguyen	19	4
165	Sông Công	Song Cong	Thành phố Sông Công	Song Cong City	song_cong	19	4
167	Định Hóa	Dinh Hoa	Huyện Định Hóa	Dinh Hoa District	dinh_hoa	19	7
168	Phú Lương	Phu Luong	Huyện Phú Lương	Phu Luong District	phu_luong	19	7
169	Đồng Hỷ	Dong Hy	Huyện Đồng Hỷ	Dong Hy District	dong_hy	19	7
170	Võ Nhai	Vo Nhai	Huyện Võ Nhai	Vo Nhai District	vo_nhai	19	7
171	Đại Từ	Dai Tu	Huyện Đại Từ	Dai Tu District	dai_tu	19	7
172	Phổ Yên	Pho Yen	Thị xã Phổ Yên	Pho Yen Town	pho_yen	19	6
173	Phú Bình	Phu Binh	Huyện Phú Bình	Phu Binh District	phu_binh	19	7
178	Lạng Sơn	Lang Son	Thành phố Lạng Sơn	Lang Son City	lang_son	20	4
180	Tràng Định	Trang Dinh	Huyện Tràng Định	Trang Dinh District	trang_dinh	20	7
181	Bình Gia	Binh Gia	Huyện Bình Gia	Binh Gia District	binh_gia	20	7
182	Văn Lãng	Van Lang	Huyện Văn Lãng	Van Lang District	van_lang	20	7
183	Cao Lộc	Cao Loc	Huyện Cao Lộc	Cao Loc District	cao_loc	20	7
184	Văn Quan	Van Quan	Huyện Văn Quan	Van Quan District	van_quan	20	7
185	Bắc Sơn	Bac Son	Huyện Bắc Sơn	Bac Son District	bac_son	20	7
186	Hữu Lũng	Huu Lung	Huyện Hữu Lũng	Huu Lung District	huu_lung	20	7
187	Chi Lăng	Chi Lang	Huyện Chi Lăng	Chi Lang District	chi_lang	20	7
188	Lộc Bình	Loc Binh	Huyện Lộc Bình	Loc Binh District	loc_binh	20	7
189	Đình Lập	Dinh Lap	Huyện Đình Lập	Dinh Lap District	dinh_lap	20	7
193	Hạ Long	Ha Long	Thành phố Hạ Long	Ha Long City	ha_long	22	4
194	Móng Cái	Mong Cai	Thành phố Móng Cái	Mong Cai City	mong_cai	22	4
195	Cẩm Phả	Cam Pha	Thành phố Cẩm Phả	Cam Pha City	cam_pha	22	4
196	Uông Bí	Uong Bi	Thành phố Uông Bí	Uong Bi City	uong_bi	22	4
198	Bình Liêu	Binh Lieu	Huyện Bình Liêu	Binh Lieu District	binh_lieu	22	7
199	Tiên Yên	Tien Yen	Huyện Tiên Yên	Tien Yen District	tien_yen	22	7
200	Đầm Hà	Dam Ha	Huyện Đầm Hà	Dam Ha District	dam_ha	22	7
201	Hải Hà	Hai Ha	Huyện Hải Hà	Hai Ha District	hai_ha	22	7
202	Ba Chẽ	Ba Che	Huyện Ba Chẽ	Ba Che District	ba_che	22	7
203	Vân Đồn	Van Don	Huyện Vân Đồn	Van Don District	van_don	22	7
205	Đông Triều	Dong Trieu	Thị xã Đông Triều	Dong Trieu Town	dong_trieu	22	6
206	Quảng Yên	Quang Yen	Thị xã Quảng Yên	Quang Yen Town	quang_yen	22	6
207	Cô Tô	Co To	Huyện Cô Tô	Co To District	co_to	22	7
213	Bắc Giang	Bac Giang	Thành phố Bắc Giang	Bac Giang City	bac_giang	24	4
215	Yên Thế	Yen The	Huyện Yên Thế	Yen The District	yen_the	24	7
216	Tân Yên	Tan Yen	Huyện Tân Yên	Tan Yen District	tan_yen	24	7
217	Lạng Giang	Lang Giang	Huyện Lạng Giang	Lang Giang District	lang_giang	24	7
218	Lục Nam	Luc Nam	Huyện Lục Nam	Luc Nam District	luc_nam	24	7
219	Lục Ngạn	Luc Ngan	Huyện Lục Ngạn	Luc Ngan District	luc_ngan	24	7
220	Sơn Động	Son Dong	Huyện Sơn Động	Son Dong District	son_dong	24	7
221	Yên Dũng	Yen Dung	Huyện Yên Dũng	Yen Dung District	yen_dung	24	7
222	Việt Yên	Viet Yen	Huyện Việt Yên	Viet Yen District	viet_yen	24	7
223	Hiệp Hòa	Hiep Hoa	Huyện Hiệp Hòa	Hiep Hoa District	hiep_hoa	24	7
227	Việt Trì	Viet Tri	Thành phố Việt Trì	Viet Tri City	viet_tri	25	4
228	Phú Thọ	Phu Tho	Thị xã Phú Thọ	Phu Tho Town	phu_tho	25	6
230	Đoan Hùng	Doan Hung	Huyện Đoan Hùng	Doan Hung District	doan_hung	25	7
231	Hạ Hoà	Ha Hoa	Huyện Hạ Hoà	Ha Hoa District	ha_hoa	25	7
232	Thanh Ba	Thanh Ba	Huyện Thanh Ba	Thanh Ba District	thanh_ba	25	7
233	Phù Ninh	Phu Ninh	Huyện Phù Ninh	Phu Ninh District	phu_ninh	25	7
234	Yên Lập	Yen Lap	Huyện Yên Lập	Yen Lap District	yen_lap	25	7
235	Cẩm Khê	Cam Khe	Huyện Cẩm Khê	Cam Khe District	cam_khe	25	7
236	Tam Nông	Tam Nong	Huyện Tam Nông	Tam Nong District	tam_nong	25	7
237	Lâm Thao	Lam Thao	Huyện Lâm Thao	Lam Thao District	lam_thao	25	7
238	Thanh Sơn	Thanh Son	Huyện Thanh Sơn	Thanh Son District	thanh_son	25	7
239	Thanh Thuỷ	Thanh Thuy	Huyện Thanh Thuỷ	Thanh Thuy District	thanh_thuy	25	7
240	Tân Sơn	Tan Son	Huyện Tân Sơn	Tan Son District	tan_son	25	7
243	Vĩnh Yên	Vinh Yen	Thành phố Vĩnh Yên	Vinh Yen City	vinh_yen	26	4
244	Phúc Yên	Phuc Yen	Thành phố Phúc Yên	Phuc Yen City	phuc_yen	26	4
246	Lập Thạch	Lap Thach	Huyện Lập Thạch	Lap Thach District	lap_thach	26	7
247	Tam Dương	Tam Duong	Huyện Tam Dương	Tam Duong District	tam_duong	26	7
248	Tam Đảo	Tam Dao	Huyện Tam Đảo	Tam Dao District	tam_dao	26	7
249	Bình Xuyên	Binh Xuyen	Huyện Bình Xuyên	Binh Xuyen District	binh_xuyen	26	7
251	Yên Lạc	Yen Lac	Huyện Yên Lạc	Yen Lac District	yen_lac	26	7
252	Vĩnh Tường	Vinh Tuong	Huyện Vĩnh Tường	Vinh Tuong District	vinh_tuong	26	7
253	Sông Lô	Song Lo	Huyện Sông Lô	Song Lo District	song_lo	26	7
256	Bắc Ninh	Bac Ninh	Thành phố Bắc Ninh	Bac Ninh City	bac_ninh	27	4
258	Yên Phong	Yen Phong	Huyện Yên Phong	Yen Phong District	yen_phong	27	7
259	Quế Võ	Que Vo	Huyện Quế Võ	Que Vo District	que_vo	27	7
260	Tiên Du	Tien Du	Huyện Tiên Du	Tien Du District	tien_du	27	7
261	Từ Sơn	Tu Son	Thành phố Từ Sơn	Tu Son City	tu_son	27	4
262	Thuận Thành	Thuan Thanh	Huyện Thuận Thành	Thuan Thanh District	thuan_thanh	27	7
263	Gia Bình	Gia Binh	Huyện Gia Bình	Gia Binh District	gia_binh	27	7
264	Lương Tài	Luong Tai	Huyện Lương Tài	Luong Tai District	luong_tai	27	7
288	Hải Dương	Hai Duong	Thành phố Hải Dương	Hai Duong City	hai_duong	30	4
290	Chí Linh	Chi Linh	Thành phố Chí Linh	Chi Linh City	chi_linh	30	4
291	Nam Sách	Nam Sach	Huyện Nam Sách	Nam Sach District	nam_sach	30	7
292	Kinh Môn	Kinh Mon	Thị xã Kinh Môn	Kinh Mon Town	kinh_mon	30	6
293	Kim Thành	Kim Thanh	Huyện Kim Thành	Kim Thanh District	kim_thanh	30	7
294	Thanh Hà	Thanh Ha	Huyện Thanh Hà	Thanh Ha District	thanh_ha	30	7
295	Cẩm Giàng	Cam Giang	Huyện Cẩm Giàng	Cam Giang District	cam_giang	30	7
296	Bình Giang	Binh Giang	Huyện Bình Giang	Binh Giang District	binh_giang	30	7
297	Gia Lộc	Gia Loc	Huyện Gia Lộc	Gia Loc District	gia_loc	30	7
298	Tứ Kỳ	Tu Ky	Huyện Tứ Kỳ	Tu Ky District	tu_ky	30	7
299	Ninh Giang	Ninh Giang	Huyện Ninh Giang	Ninh Giang District	ninh_giang	30	7
300	Thanh Miện	Thanh Mien	Huyện Thanh Miện	Thanh Mien District	thanh_mien	30	7
303	Hồng Bàng	Hong Bang	Quận Hồng Bàng	Hong Bang District	hong_bang	31	5
304	Ngô Quyền	Ngo Quyen	Quận Ngô Quyền	Ngo Quyen District	ngo_quyen	31	5
305	Lê Chân	Le Chan	Quận Lê Chân	Le Chan District	le_chan	31	5
306	Hải An	Hai An	Quận Hải An	Hai An District	hai_an	31	5
307	Kiến An	Kien An	Quận Kiến An	Kien An District	kien_an	31	5
308	Đồ Sơn	Do Son	Quận Đồ Sơn	Do Son District	do_son	31	5
309	Dương Kinh	Duong Kinh	Quận Dương Kinh	Duong Kinh District	duong_kinh	31	5
311	Thuỷ Nguyên	Thuy Nguyen	Huyện Thuỷ Nguyên	Thuy Nguyen District	thuy_nguyen	31	7
312	An Dương	An Duong	Huyện An Dương	An Duong District	an_duong	31	7
313	An Lão	An Lao	Huyện An Lão	An Lao District	an_lao	31	7
314	Kiến Thuỵ	Kien Thuy	Huyện Kiến Thuỵ	Kien Thuy District	kien_thuy	31	7
315	Tiên Lãng	Tien Lang	Huyện Tiên Lãng	Tien Lang District	tien_lang	31	7
710	Gò Dầu	Go Dau	Huyện Gò Dầu	Go Dau District	go_dau	72	7
316	Vĩnh Bảo	Vinh Bao	Huyện Vĩnh Bảo	Vinh Bao District	vinh_bao	31	7
317	Cát Hải	Cat Hai	Huyện Cát Hải	Cat Hai District	cat_hai	31	7
318	Bạch Long Vĩ	Bach Long Vi	Huyện Bạch Long Vĩ	Bach Long Vi District	bach_long_vi	31	7
323	Hưng Yên	Hung Yen	Thành phố Hưng Yên	Hung Yen City	hung_yen	33	4
325	Văn Lâm	Van Lam	Huyện Văn Lâm	Van Lam District	van_lam	33	7
326	Văn Giang	Van Giang	Huyện Văn Giang	Van Giang District	van_giang	33	7
327	Yên Mỹ	Yen My	Huyện Yên Mỹ	Yen My District	yen_my	33	7
328	Mỹ Hào	My Hao	Thị xã Mỹ Hào	My Hao Town	my_hao	33	6
329	Ân Thi	An Thi	Huyện Ân Thi	An Thi District	an_thi	33	7
330	Khoái Châu	Khoai Chau	Huyện Khoái Châu	Khoai Chau District	khoai_chau	33	7
331	Kim Động	Kim Dong	Huyện Kim Động	Kim Dong District	kim_dong	33	7
332	Tiên Lữ	Tien Lu	Huyện Tiên Lữ	Tien Lu District	tien_lu	33	7
333	Phù Cừ	Phu Cu	Huyện Phù Cừ	Phu Cu District	phu_cu	33	7
336	Thái Bình	Thai Binh	Thành phố Thái Bình	Thai Binh City	thai_binh	34	4
338	Quỳnh Phụ	Quynh Phu	Huyện Quỳnh Phụ	Quynh Phu District	quynh_phu	34	7
339	Hưng Hà	Hung Ha	Huyện Hưng Hà	Hung Ha District	hung_ha	34	7
340	Đông Hưng	Dong Hung	Huyện Đông Hưng	Dong Hung District	dong_hung	34	7
341	Thái Thụy	Thai Thuy	Huyện Thái Thụy	Thai Thuy District	thai_thuy	34	7
342	Tiền Hải	Tien Hai	Huyện Tiền Hải	Tien Hai District	tien_hai	34	7
343	Kiến Xương	Kien Xuong	Huyện Kiến Xương	Kien Xuong District	kien_xuong	34	7
344	Vũ Thư	Vu Thu	Huyện Vũ Thư	Vu Thu District	vu_thu	34	7
347	Phủ Lý	Phu Ly	Thành phố Phủ Lý	Phu Ly City	phu_ly	35	4
349	Duy Tiên	Duy Tien	Thị xã Duy Tiên	Duy Tien Town	duy_tien	35	6
350	Kim Bảng	Kim Bang	Huyện Kim Bảng	Kim Bang District	kim_bang	35	7
351	Thanh Liêm	Thanh Liem	Huyện Thanh Liêm	Thanh Liem District	thanh_liem	35	7
352	Bình Lục	Binh Luc	Huyện Bình Lục	Binh Luc District	binh_luc	35	7
353	Lý Nhân	Ly Nhan	Huyện Lý Nhân	Ly Nhan District	ly_nhan	35	7
356	Nam Định	Nam Dinh	Thành phố Nam Định	Nam Dinh City	nam_dinh	36	4
358	Mỹ Lộc	My Loc	Huyện Mỹ Lộc	My Loc District	my_loc	36	7
359	Vụ Bản	Vu Ban	Huyện Vụ Bản	Vu Ban District	vu_ban	36	7
360	Ý Yên	Y Yen	Huyện Ý Yên	Y Yen District	y_yen	36	7
361	Nghĩa Hưng	Nghia Hung	Huyện Nghĩa Hưng	Nghia Hung District	nghia_hung	36	7
362	Nam Trực	Nam Truc	Huyện Nam Trực	Nam Truc District	nam_truc	36	7
363	Trực Ninh	Truc Ninh	Huyện Trực Ninh	Truc Ninh District	truc_ninh	36	7
364	Xuân Trường	Xuan Truong	Huyện Xuân Trường	Xuan Truong District	xuan_truong	36	7
365	Giao Thủy	Giao Thuy	Huyện Giao Thủy	Giao Thuy District	giao_thuy	36	7
366	Hải Hậu	Hai Hau	Huyện Hải Hậu	Hai Hau District	hai_hau	36	7
369	Ninh Bình	Ninh Binh	Thành phố Ninh Bình	Ninh Binh City	ninh_binh	37	4
370	Tam Điệp	Tam Diep	Thành phố Tam Điệp	Tam Diep City	tam_diep	37	4
372	Nho Quan	Nho Quan	Huyện Nho Quan	Nho Quan District	nho_quan	37	7
373	Gia Viễn	Gia Vien	Huyện Gia Viễn	Gia Vien District	gia_vien	37	7
374	Hoa Lư	Hoa Lu	Huyện Hoa Lư	Hoa Lu District	hoa_lu	37	7
375	Yên Khánh	Yen Khanh	Huyện Yên Khánh	Yen Khanh District	yen_khanh	37	7
376	Kim Sơn	Kim Son	Huyện Kim Sơn	Kim Son District	kim_son	37	7
377	Yên Mô	Yen Mo	Huyện Yên Mô	Yen Mo District	yen_mo	37	7
380	Thanh Hóa	Thanh Hoa	Thành phố Thanh Hóa	Thanh Hoa City	thanh_hoa	38	4
381	Bỉm Sơn	Bim Son	Thị xã Bỉm Sơn	Bim Son Town	bim_son	38	6
382	Sầm Sơn	Sam Son	Thành phố Sầm Sơn	Sam Son City	sam_son	38	4
384	Mường Lát	Muong Lat	Huyện Mường Lát	Muong Lat District	muong_lat	38	7
385	Quan Hóa	Quan Hoa	Huyện Quan Hóa	Quan Hoa District	quan_hoa	38	7
386	Bá Thước	Ba Thuoc	Huyện Bá Thước	Ba Thuoc District	ba_thuoc	38	7
387	Quan Sơn	Quan Son	Huyện Quan Sơn	Quan Son District	quan_son	38	7
388	Lang Chánh	Lang Chanh	Huyện Lang Chánh	Lang Chanh District	lang_chanh	38	7
389	Ngọc Lặc	Ngoc Lac	Huyện Ngọc Lặc	Ngoc Lac District	ngoc_lac	38	7
390	Cẩm Thủy	Cam Thuy	Huyện Cẩm Thủy	Cam Thuy District	cam_thuy	38	7
391	Thạch Thành	Thach Thanh	Huyện Thạch Thành	Thach Thanh District	thach_thanh	38	7
392	Hà Trung	Ha Trung	Huyện Hà Trung	Ha Trung District	ha_trung	38	7
393	Vĩnh Lộc	Vinh Loc	Huyện Vĩnh Lộc	Vinh Loc District	vinh_loc	38	7
394	Yên Định	Yen Dinh	Huyện Yên Định	Yen Dinh District	yen_dinh	38	7
395	Thọ Xuân	Tho Xuan	Huyện Thọ Xuân	Tho Xuan District	tho_xuan	38	7
396	Thường Xuân	Thuong Xuan	Huyện Thường Xuân	Thuong Xuan District	thuong_xuan	38	7
397	Triệu Sơn	Trieu Son	Huyện Triệu Sơn	Trieu Son District	trieu_son	38	7
398	Thiệu Hóa	Thieu Hoa	Huyện Thiệu Hóa	Thieu Hoa District	thieu_hoa	38	7
399	Hoằng Hóa	Hoang Hoa	Huyện Hoằng Hóa	Hoang Hoa District	hoang_hoa	38	7
400	Hậu Lộc	Hau Loc	Huyện Hậu Lộc	Hau Loc District	hau_loc	38	7
401	Nga Sơn	Nga Son	Huyện Nga Sơn	Nga Son District	nga_son	38	7
402	Như Xuân	Nhu Xuan	Huyện Như Xuân	Nhu Xuan District	nhu_xuan	38	7
403	Như Thanh	Nhu Thanh	Huyện Như Thanh	Nhu Thanh District	nhu_thanh	38	7
404	Nông Cống	Nong Cong	Huyện Nông Cống	Nong Cong District	nong_cong	38	7
405	Đông Sơn	Dong Son	Huyện Đông Sơn	Dong Son District	dong_son	38	7
406	Quảng Xương	Quang Xuong	Huyện Quảng Xương	Quang Xuong District	quang_xuong	38	7
407	Nghi Sơn	Nghi Son	Thị xã Nghi Sơn	Nghi Son Town	nghi_son	38	6
412	Vinh	Vinh	Thành phố Vinh	Vinh City	vinh	40	4
413	Cửa Lò	Cua Lo	Thị xã Cửa Lò	Cua Lo Town	cua_lo	40	6
414	Thái Hoà	Thai Hoa	Thị xã Thái Hoà	Thai Hoa Town	thai_hoa	40	6
415	Quế Phong	Que Phong	Huyện Quế Phong	Que Phong District	que_phong	40	7
416	Quỳ Châu	Quy Chau	Huyện Quỳ Châu	Quy Chau District	quy_chau	40	7
417	Kỳ Sơn	Ky Son	Huyện Kỳ Sơn	Ky Son District	ky_son	40	7
418	Tương Dương	Tuong Duong	Huyện Tương Dương	Tuong Duong District	tuong_duong	40	7
419	Nghĩa Đàn	Nghia Dan	Huyện Nghĩa Đàn	Nghia Dan District	nghia_dan	40	7
420	Quỳ Hợp	Quy Hop	Huyện Quỳ Hợp	Quy Hop District	quy_hop	40	7
421	Quỳnh Lưu	Quynh Luu	Huyện Quỳnh Lưu	Quynh Luu District	quynh_luu	40	7
422	Con Cuông	Con Cuong	Huyện Con Cuông	Con Cuong District	con_cuong	40	7
423	Tân Kỳ	Tan Ky	Huyện Tân Kỳ	Tan Ky District	tan_ky	40	7
424	Anh Sơn	Anh Son	Huyện Anh Sơn	Anh Son District	anh_son	40	7
425	Diễn Châu	Dien Chau	Huyện Diễn Châu	Dien Chau District	dien_chau	40	7
426	Yên Thành	Yen Thanh	Huyện Yên Thành	Yen Thanh District	yen_thanh	40	7
427	Đô Lương	Do Luong	Huyện Đô Lương	Do Luong District	do_luong	40	7
428	Thanh Chương	Thanh Chuong	Huyện Thanh Chương	Thanh Chuong District	thanh_chuong	40	7
429	Nghi Lộc	Nghi Loc	Huyện Nghi Lộc	Nghi Loc District	nghi_loc	40	7
430	Nam Đàn	Nam Dan	Huyện Nam Đàn	Nam Dan District	nam_dan	40	7
431	Hưng Nguyên	Hung Nguyen	Huyện Hưng Nguyên	Hung Nguyen District	hung_nguyen	40	7
432	Hoàng Mai	Hoang Mai	Thị xã Hoàng Mai	Hoang Mai Town	hoang_mai	40	6
436	Hà Tĩnh	Ha Tinh	Thành phố Hà Tĩnh	Ha Tinh City	ha_tinh	42	4
437	Hồng Lĩnh	Hong Linh	Thị xã Hồng Lĩnh	Hong Linh Town	hong_linh	42	6
439	Hương Sơn	Huong Son	Huyện Hương Sơn	Huong Son District	huong_son	42	7
440	Đức Thọ	Duc Tho	Huyện Đức Thọ	Duc Tho District	duc_tho	42	7
441	Vũ Quang	Vu Quang	Huyện Vũ Quang	Vu Quang District	vu_quang	42	7
442	Nghi Xuân	Nghi Xuan	Huyện Nghi Xuân	Nghi Xuan District	nghi_xuan	42	7
443	Can Lộc	Can Loc	Huyện Can Lộc	Can Loc District	can_loc	42	7
444	Hương Khê	Huong Khe	Huyện Hương Khê	Huong Khe District	huong_khe	42	7
445	Thạch Hà	Thach Ha	Huyện Thạch Hà	Thach Ha District	thach_ha	42	7
446	Cẩm Xuyên	Cam Xuyen	Huyện Cẩm Xuyên	Cam Xuyen District	cam_xuyen	42	7
447	Kỳ Anh	Ky Anh	Huyện Kỳ Anh	Ky Anh District	ky_anh	42	7
448	Lộc Hà	Loc Ha	Huyện Lộc Hà	Loc Ha District	loc_ha	42	7
449	Kỳ Anh	Ky Anh	Thị xã Kỳ Anh	Ky Anh Town	ky_anh	42	6
450	Đồng Hới	Dong Hoi	Thành phố Đồng Hới	Dong Hoi City	dong_hoi	44	4
452	Minh Hóa	Minh Hoa	Huyện Minh Hóa	Minh Hoa District	minh_hoa	44	7
453	Tuyên Hóa	Tuyen Hoa	Huyện Tuyên Hóa	Tuyen Hoa District	tuyen_hoa	44	7
454	Quảng Trạch	Quang Trach	Huyện Quảng Trạch	Quang Trach District	quang_trach	44	7
455	Bố Trạch	Bo Trach	Huyện Bố Trạch	Bo Trach District	bo_trach	44	7
456	Quảng Ninh	Quang Ninh	Huyện Quảng Ninh	Quang Ninh District	quang_ninh	44	7
457	Lệ Thủy	Le Thuy	Huyện Lệ Thủy	Le Thuy District	le_thuy	44	7
458	Ba Đồn	Ba Don	Thị xã Ba Đồn	Ba Don Town	ba_don	44	6
461	Đông Hà	Dong Ha	Thành phố Đông Hà	Dong Ha City	dong_ha	45	4
462	Quảng Trị	Quang Tri	Thị xã Quảng Trị	Quang Tri Town	quang_tri	45	6
464	Vĩnh Linh	Vinh Linh	Huyện Vĩnh Linh	Vinh Linh District	vinh_linh	45	7
465	Hướng Hóa	Huong Hoa	Huyện Hướng Hóa	Huong Hoa District	huong_hoa	45	7
466	Gio Linh	Gio Linh	Huyện Gio Linh	Gio Linh District	gio_linh	45	7
467	Đa Krông	Da Krong	Huyện Đa Krông	Da Krong District	da_krong	45	7
468	Cam Lộ	Cam Lo	Huyện Cam Lộ	Cam Lo District	cam_lo	45	7
469	Triệu Phong	Trieu Phong	Huyện Triệu Phong	Trieu Phong District	trieu_phong	45	7
470	Hải Lăng	Hai Lang	Huyện Hải Lăng	Hai Lang District	hai_lang	45	7
471	Cồn Cỏ	Con Co	Huyện Cồn Cỏ	Con Co District	con_co	45	7
474	Huế	Hue	Thành phố Huế	Hue City	hue	46	4
476	Phong Điền	Phong Dien	Huyện Phong Điền	Phong Dien District	phong_dien	46	7
477	Quảng Điền	Quang Dien	Huyện Quảng Điền	Quang Dien District	quang_dien	46	7
478	Phú Vang	Phu Vang	Huyện Phú Vang	Phu Vang District	phu_vang	46	7
479	Hương Thủy	Huong Thuy	Thị xã Hương Thủy	Huong Thuy Town	huong_thuy	46	6
480	Hương Trà	Huong Tra	Thị xã Hương Trà	Huong Tra Town	huong_tra	46	6
481	A Lưới	A Luoi	Huyện A Lưới	A Luoi District	a_luoi	46	7
482	Phú Lộc	Phu Loc	Huyện Phú Lộc	Phu Loc District	phu_loc	46	7
483	Nam Đông	Nam Dong	Huyện Nam Đông	Nam Dong District	nam_dong	46	7
490	Liên Chiểu	Lien Chieu	Quận Liên Chiểu	Lien Chieu District	lien_chieu	48	5
491	Thanh Khê	Thanh Khe	Quận Thanh Khê	Thanh Khe District	thanh_khe	48	5
492	Hải Châu	Hai Chau	Quận Hải Châu	Hai Chau District	hai_chau	48	5
493	Sơn Trà	Son Tra	Quận Sơn Trà	Son Tra District	son_tra	48	5
494	Ngũ Hành Sơn	Ngu Hanh Son	Quận Ngũ Hành Sơn	Ngu Hanh Son District	ngu_hanh_son	48	5
495	Cẩm Lệ	Cam Le	Quận Cẩm Lệ	Cam Le District	cam_le	48	5
497	Hòa Vang	Hoa Vang	Huyện Hòa Vang	Hoa Vang District	hoa_vang	48	7
498	Hoàng Sa	Hoang Sa	Huyện Hoàng Sa	Hoang Sa District	hoang_sa	48	7
502	Tam Kỳ	Tam Ky	Thành phố Tam Kỳ	Tam Ky City	tam_ky	49	4
503	Hội An	Hoi An	Thành phố Hội An	Hoi An City	hoi_an	49	4
504	Tây Giang	Tay Giang	Huyện Tây Giang	Tay Giang District	tay_giang	49	7
505	Đông Giang	Dong Giang	Huyện Đông Giang	Dong Giang District	dong_giang	49	7
506	Đại Lộc	Dai Loc	Huyện Đại Lộc	Dai Loc District	dai_loc	49	7
507	Điện Bàn	Dien Ban	Thị xã Điện Bàn	Dien Ban Town	dien_ban	49	6
508	Duy Xuyên	Duy Xuyen	Huyện Duy Xuyên	Duy Xuyen District	duy_xuyen	49	7
509	Quế Sơn	Que Son	Huyện Quế Sơn	Que Son District	que_son	49	7
510	Nam Giang	Nam Giang	Huyện Nam Giang	Nam Giang District	nam_giang	49	7
511	Phước Sơn	Phuoc Son	Huyện Phước Sơn	Phuoc Son District	phuoc_son	49	7
512	Hiệp Đức	Hiep Duc	Huyện Hiệp Đức	Hiep Duc District	hiep_duc	49	7
513	Thăng Bình	Thang Binh	Huyện Thăng Bình	Thang Binh District	thang_binh	49	7
514	Tiên Phước	Tien Phuoc	Huyện Tiên Phước	Tien Phuoc District	tien_phuoc	49	7
515	Bắc Trà My	Bac Tra My	Huyện Bắc Trà My	Bac Tra My District	bac_tra_my	49	7
516	Nam Trà My	Nam Tra My	Huyện Nam Trà My	Nam Tra My District	nam_tra_my	49	7
517	Núi Thành	Nui Thanh	Huyện Núi Thành	Nui Thanh District	nui_thanh	49	7
518	Phú Ninh	Phu Ninh	Huyện Phú Ninh	Phu Ninh District	phu_ninh	49	7
519	Nông Sơn	Nong Son	Huyện Nông Sơn	Nong Son District	nong_son	49	7
522	Quảng Ngãi	Quang Ngai	Thành phố Quảng Ngãi	Quang Ngai City	quang_ngai	51	4
524	Bình Sơn	Binh Son	Huyện Bình Sơn	Binh Son District	binh_son	51	7
525	Trà Bồng	Tra Bong	Huyện Trà Bồng	Tra Bong District	tra_bong	51	7
527	Sơn Tịnh	Son Tinh	Huyện Sơn Tịnh	Son Tinh District	son_tinh	51	7
528	Tư Nghĩa	Tu Nghia	Huyện Tư Nghĩa	Tu Nghia District	tu_nghia	51	7
529	Sơn Hà	Son Ha	Huyện Sơn Hà	Son Ha District	son_ha	51	7
530	Sơn Tây	Son Tay	Huyện Sơn Tây	Son Tay District	son_tay	51	7
531	Minh Long	Minh Long	Huyện Minh Long	Minh Long District	minh_long	51	7
532	Nghĩa Hành	Nghia Hanh	Huyện Nghĩa Hành	Nghia Hanh District	nghia_hanh	51	7
533	Mộ Đức	Mo Duc	Huyện Mộ Đức	Mo Duc District	mo_duc	51	7
534	Đức Phổ	Duc Pho	Thị xã Đức Phổ	Duc Pho Town	duc_pho	51	6
535	Ba Tơ	Ba To	Huyện Ba Tơ	Ba To District	ba_to	51	7
536	Lý Sơn	Ly Son	Huyện Lý Sơn	Ly Son District	ly_son	51	7
540	Quy Nhơn	Quy Nhon	Thành phố Quy Nhơn	Quy Nhon City	quy_nhon	52	4
542	An Lão	An Lao	Huyện An Lão	An Lao District	an_lao	52	7
543	Hoài Nhơn	Hoai Nhon	Thị xã Hoài Nhơn	Hoai Nhon Town	hoai_nhon	52	6
544	Hoài Ân	Hoai An	Huyện Hoài Ân	Hoai An District	hoai_an	52	7
545	Phù Mỹ	Phu My	Huyện Phù Mỹ	Phu My District	phu_my	52	7
546	Vĩnh Thạnh	Vinh Thanh	Huyện Vĩnh Thạnh	Vinh Thanh District	vinh_thanh	52	7
547	Tây Sơn	Tay Son	Huyện Tây Sơn	Tay Son District	tay_son	52	7
548	Phù Cát	Phu Cat	Huyện Phù Cát	Phu Cat District	phu_cat	52	7
549	An Nhơn	An Nhon	Thị xã An Nhơn	An Nhon Town	an_nhon	52	6
550	Tuy Phước	Tuy Phuoc	Huyện Tuy Phước	Tuy Phuoc District	tuy_phuoc	52	7
551	Vân Canh	Van Canh	Huyện Vân Canh	Van Canh District	van_canh	52	7
555	Tuy Hoà	Tuy Hoa	Thành phố Tuy Hoà	Tuy Hoa City	tuy_hoa	54	4
557	Sông Cầu	Song Cau	Thị xã Sông Cầu	Song Cau Town	song_cau	54	6
558	Đồng Xuân	Dong Xuan	Huyện Đồng Xuân	Dong Xuan District	dong_xuan	54	7
559	Tuy An	Tuy An	Huyện Tuy An	Tuy An District	tuy_an	54	7
560	Sơn Hòa	Son Hoa	Huyện Sơn Hòa	Son Hoa District	son_hoa	54	7
561	Sông Hinh	Song Hinh	Huyện Sông Hinh	Song Hinh District	song_hinh	54	7
562	Tây Hoà	Tay Hoa	Huyện Tây Hoà	Tay Hoa District	tay_hoa	54	7
563	Phú Hoà	Phu Hoa	Huyện Phú Hoà	Phu Hoa District	phu_hoa	54	7
564	Đông Hòa	Dong Hoa	Thị xã Đông Hòa	Dong Hoa Town	dong_hoa	54	6
568	Nha Trang	Nha Trang	Thành phố Nha Trang	Nha Trang City	nha_trang	56	4
569	Cam Ranh	Cam Ranh	Thành phố Cam Ranh	Cam Ranh City	cam_ranh	56	4
570	Cam Lâm	Cam Lam	Huyện Cam Lâm	Cam Lam District	cam_lam	56	7
571	Vạn Ninh	Van Ninh	Huyện Vạn Ninh	Van Ninh District	van_ninh	56	7
572	Ninh Hòa	Ninh Hoa	Thị xã Ninh Hòa	Ninh Hoa Town	ninh_hoa	56	6
573	Khánh Vĩnh	Khanh Vinh	Huyện Khánh Vĩnh	Khanh Vinh District	khanh_vinh	56	7
574	Diên Khánh	Dien Khanh	Huyện Diên Khánh	Dien Khanh District	dien_khanh	56	7
575	Khánh Sơn	Khanh Son	Huyện Khánh Sơn	Khanh Son District	khanh_son	56	7
576	Trường Sa	Truong Sa	Huyện Trường Sa	Truong Sa District	truong_sa	56	7
582	Phan Rang-Tháp Chàm	Phan Rang-Thap Cham	Thành phố Phan Rang-Tháp Chàm	Phan Rang-Thap Cham City	phan_rang-thap_cham	58	4
584	Bác Ái	Bac Ai	Huyện Bác Ái	Bac Ai District	bac_ai	58	7
585	Ninh Sơn	Ninh Son	Huyện Ninh Sơn	Ninh Son District	ninh_son	58	7
586	Ninh Hải	Ninh Hai	Huyện Ninh Hải	Ninh Hai District	ninh_hai	58	7
587	Ninh Phước	Ninh Phuoc	Huyện Ninh Phước	Ninh Phuoc District	ninh_phuoc	58	7
588	Thuận Bắc	Thuan Bac	Huyện Thuận Bắc	Thuan Bac District	thuan_bac	58	7
589	Thuận Nam	Thuan Nam	Huyện Thuận Nam	Thuan Nam District	thuan_nam	58	7
593	Phan Thiết	Phan Thiet	Thành phố Phan Thiết	Phan Thiet City	phan_thiet	60	4
594	La Gi	La Gi	Thị xã La Gi	La Gi Town	la_gi	60	6
595	Tuy Phong	Tuy Phong	Huyện Tuy Phong	Tuy Phong District	tuy_phong	60	7
596	Bắc Bình	Bac Binh	Huyện Bắc Bình	Bac Binh District	bac_binh	60	7
597	Hàm Thuận Bắc	Ham Thuan Bac	Huyện Hàm Thuận Bắc	Ham Thuan Bac District	ham_thuan_bac	60	7
598	Hàm Thuận Nam	Ham Thuan Nam	Huyện Hàm Thuận Nam	Ham Thuan Nam District	ham_thuan_nam	60	7
599	Tánh Linh	Tanh Linh	Huyện Tánh Linh	Tanh Linh District	tanh_linh	60	7
600	Đức Linh	Duc Linh	Huyện Đức Linh	Duc Linh District	duc_linh	60	7
601	Hàm Tân	Ham Tan	Huyện Hàm Tân	Ham Tan District	ham_tan	60	7
602	Phú Quí	Phu Qui	Huyện Phú Quí	Phu Qui District	phu_qui	60	7
608	Kon Tum	Kon Tum	Thành phố Kon Tum	Kon Tum City	kon_tum	62	4
610	Đắk Glei	Dak Glei	Huyện Đắk Glei	Dak Glei District	dak_glei	62	7
611	Ngọc Hồi	Ngoc Hoi	Huyện Ngọc Hồi	Ngoc Hoi District	ngoc_hoi	62	7
612	Đắk Tô	Dak To	Huyện Đắk Tô	Dak To District	dak_to	62	7
613	Kon Plông	Kon Plong	Huyện Kon Plông	Kon Plong District	kon_plong	62	7
614	Kon Rẫy	Kon Ray	Huyện Kon Rẫy	Kon Ray District	kon_ray	62	7
615	Đắk Hà	Dak Ha	Huyện Đắk Hà	Dak Ha District	dak_ha	62	7
616	Sa Thầy	Sa Thay	Huyện Sa Thầy	Sa Thay District	sa_thay	62	7
617	Tu Mơ Rông	Tu Mo Rong	Huyện Tu Mơ Rông	Tu Mo Rong District	tu_mo_rong	62	7
618	Ia H' Drai	Ia H' Drai	Huyện Ia H' Drai	Ia H' Drai District	ia_h'_drai	62	7
622	Pleiku	Pleiku	Thành phố Pleiku	Pleiku City	pleiku	64	4
623	An Khê	An Khe	Thị xã An Khê	An Khe Town	an_khe	64	6
624	Ayun Pa	Ayun Pa	Thị xã Ayun Pa	Ayun Pa Town	ayun_pa	64	6
625	KBang	KBang	Huyện KBang	KBang District	kbang	64	7
626	Đăk Đoa	Dak Doa	Huyện Đăk Đoa	Dak Doa District	dak_doa	64	7
627	Chư Păh	Chu Pah	Huyện Chư Păh	Chu Pah District	chu_pah	64	7
628	Ia Grai	Ia Grai	Huyện Ia Grai	Ia Grai District	ia_grai	64	7
629	Mang Yang	Mang Yang	Huyện Mang Yang	Mang Yang District	mang_yang	64	7
630	Kông Chro	Kong Chro	Huyện Kông Chro	Kong Chro District	kong_chro	64	7
631	Đức Cơ	Duc Co	Huyện Đức Cơ	Duc Co District	duc_co	64	7
632	Chư Prông	Chu Prong	Huyện Chư Prông	Chu Prong District	chu_prong	64	7
633	Chư Sê	Chu Se	Huyện Chư Sê	Chu Se District	chu_se	64	7
634	Đăk Pơ	Dak Po	Huyện Đăk Pơ	Dak Po District	dak_po	64	7
635	Ia Pa	Ia Pa	Huyện Ia Pa	Ia Pa District	ia_pa	64	7
637	Krông Pa	Krong Pa	Huyện Krông Pa	Krong Pa District	krong_pa	64	7
638	Phú Thiện	Phu Thien	Huyện Phú Thiện	Phu Thien District	phu_thien	64	7
639	Chư Pưh	Chu Puh	Huyện Chư Pưh	Chu Puh District	chu_puh	64	7
643	Buôn Ma Thuột	Buon Ma Thuot	Thành phố Buôn Ma Thuột	Buon Ma Thuot City	buon_ma_thuot	66	4
644	Buôn Hồ	Buon Ho	Thị xã Buôn Hồ	Buon Ho Town	buon_ho	66	6
645	Ea H'leo	Ea H'leo	Huyện Ea H'leo	Ea H'leo District	ea_h'leo	66	7
646	Ea Súp	Ea Sup	Huyện Ea Súp	Ea Sup District	ea_sup	66	7
647	Buôn Đôn	Buon Don	Huyện Buôn Đôn	Buon Don District	buon_don	66	7
648	Cư M'gar	Cu M'gar	Huyện Cư M'gar	Cu M'gar District	cu_m'gar	66	7
649	Krông Búk	Krong Buk	Huyện Krông Búk	Krong Buk District	krong_buk	66	7
650	Krông Năng	Krong Nang	Huyện Krông Năng	Krong Nang District	krong_nang	66	7
651	Ea Kar	Ea Kar	Huyện Ea Kar	Ea Kar District	ea_kar	66	7
652	M'Đrắk	M'Drak	Huyện M'Đrắk	M'Drak District	m'drak	66	7
653	Krông Bông	Krong Bong	Huyện Krông Bông	Krong Bong District	krong_bong	66	7
654	Krông Pắc	Krong Pac	Huyện Krông Pắc	Krong Pac District	krong_pac	66	7
655	Krông A Na	Krong A Na	Huyện Krông A Na	Krong A Na District	krong_a_na	66	7
656	Lắk	Lak	Huyện Lắk	Lak District	lak	66	7
657	Cư Kuin	Cu Kuin	Huyện Cư Kuin	Cu Kuin District	cu_kuin	66	7
660	Gia Nghĩa	Gia Nghia	Thành phố Gia Nghĩa	Gia Nghia City	gia_nghia	67	4
661	Đăk Glong	Dak Glong	Huyện Đăk Glong	Dak Glong District	dak_glong	67	7
662	Cư Jút	Cu Jut	Huyện Cư Jút	Cu Jut District	cu_jut	67	7
663	Đắk Mil	Dak Mil	Huyện Đắk Mil	Dak Mil District	dak_mil	67	7
664	Krông Nô	Krong No	Huyện Krông Nô	Krong No District	krong_no	67	7
665	Đắk Song	Dak Song	Huyện Đắk Song	Dak Song District	dak_song	67	7
666	Đắk R'Lấp	Dak R'Lap	Huyện Đắk R'Lấp	Dak R'Lap District	dak_r'lap	67	7
667	Tuy Đức	Tuy Duc	Huyện Tuy Đức	Tuy Duc District	tuy_duc	67	7
672	Đà Lạt	Da Lat	Thành phố Đà Lạt	Da Lat City	da_lat	68	4
673	Bảo Lộc	Bao Loc	Thành phố Bảo Lộc	Bao Loc City	bao_loc	68	4
674	Đam Rông	Dam Rong	Huyện Đam Rông	Dam Rong District	dam_rong	68	7
675	Lạc Dương	Lac Duong	Huyện Lạc Dương	Lac Duong District	lac_duong	68	7
676	Lâm Hà	Lam Ha	Huyện Lâm Hà	Lam Ha District	lam_ha	68	7
677	Đơn Dương	Don Duong	Huyện Đơn Dương	Don Duong District	don_duong	68	7
678	Đức Trọng	Duc Trong	Huyện Đức Trọng	Duc Trong District	duc_trong	68	7
679	Di Linh	Di Linh	Huyện Di Linh	Di Linh District	di_linh	68	7
680	Bảo Lâm	Bao Lam	Huyện Bảo Lâm	Bao Lam District	bao_lam	68	7
681	Đạ Huoai	Da Huoai	Huyện Đạ Huoai	Da Huoai District	da_huoai	68	7
682	Đạ Tẻh	Da Teh	Huyện Đạ Tẻh	Da Teh District	da_teh	68	7
683	Cát Tiên	Cat Tien	Huyện Cát Tiên	Cat Tien District	cat_tien	68	7
688	Phước Long	Phuoc Long	Thị xã Phước Long	Phuoc Long Town	phuoc_long	70	6
689	Đồng Xoài	Dong Xoai	Thành phố Đồng Xoài	Dong Xoai City	dong_xoai	70	4
690	Bình Long	Binh Long	Thị xã Bình Long	Binh Long Town	binh_long	70	6
691	Bù Gia Mập	Bu Gia Map	Huyện Bù Gia Mập	Bu Gia Map District	bu_gia_map	70	7
692	Lộc Ninh	Loc Ninh	Huyện Lộc Ninh	Loc Ninh District	loc_ninh	70	7
693	Bù Đốp	Bu Dop	Huyện Bù Đốp	Bu Dop District	bu_dop	70	7
694	Hớn Quản	Hon Quan	Huyện Hớn Quản	Hon Quan District	hon_quan	70	7
695	Đồng Phú	Dong Phu	Huyện Đồng Phú	Dong Phu District	dong_phu	70	7
696	Bù Đăng	Bu Dang	Huyện Bù Đăng	Bu Dang District	bu_dang	70	7
697	Chơn Thành	Chon Thanh	Huyện Chơn Thành	Chon Thanh District	chon_thanh	70	7
698	Phú Riềng	Phu Rieng	Huyện Phú Riềng	Phu Rieng District	phu_rieng	70	7
703	Tây Ninh	Tay Ninh	Thành phố Tây Ninh	Tay Ninh City	tay_ninh	72	4
705	Tân Biên	Tan Bien	Huyện Tân Biên	Tan Bien District	tan_bien	72	7
706	Tân Châu	Tan Chau	Huyện Tân Châu	Tan Chau District	tan_chau	72	7
707	Dương Minh Châu	Duong Minh Chau	Huyện Dương Minh Châu	Duong Minh Chau District	duong_minh_chau	72	7
708	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	72	7
709	Hòa Thành	Hoa Thanh	Thị xã Hòa Thành	Hoa Thanh Town	hoa_thanh	72	6
711	Bến Cầu	Ben Cau	Huyện Bến Cầu	Ben Cau District	ben_cau	72	7
712	Trảng Bàng	Trang Bang	Thị xã Trảng Bàng	Trang Bang Town	trang_bang	72	6
718	Thủ Dầu Một	Thu Dau Mot	Thành phố Thủ Dầu Một	Thu Dau Mot City	thu_dau_mot	74	4
719	Bàu Bàng	Bau Bang	Huyện Bàu Bàng	Bau Bang District	bau_bang	74	7
720	Dầu Tiếng	Dau Tieng	Huyện Dầu Tiếng	Dau Tieng District	dau_tieng	74	7
721	Bến Cát	Ben Cat	Thị xã Bến Cát	Ben Cat Town	ben_cat	74	6
722	Phú Giáo	Phu Giao	Huyện Phú Giáo	Phu Giao District	phu_giao	74	7
723	Tân Uyên	Tan Uyen	Thị xã Tân Uyên	Tan Uyen Town	tan_uyen	74	6
724	Dĩ An	Di An	Thành phố Dĩ An	Di An City	di_an	74	4
726	Bắc Tân Uyên	Bac Tan Uyen	Huyện Bắc Tân Uyên	Bac Tan Uyen District	bac_tan_uyen	74	7
731	Biên Hòa	Bien Hoa	Thành phố Biên Hòa	Bien Hoa City	bien_hoa	75	4
732	Long Khánh	Long Khanh	Thành phố Long Khánh	Long Khanh City	long_khanh	75	4
734	Tân Phú	Tan Phu	Huyện Tân Phú	Tan Phu District	tan_phu	75	7
735	Vĩnh Cửu	Vinh Cuu	Huyện Vĩnh Cửu	Vinh Cuu District	vinh_cuu	75	7
736	Định Quán	Dinh Quan	Huyện Định Quán	Dinh Quan District	dinh_quan	75	7
737	Trảng Bom	Trang Bom	Huyện Trảng Bom	Trang Bom District	trang_bom	75	7
738	Thống Nhất	Thong Nhat	Huyện Thống Nhất	Thong Nhat District	thong_nhat	75	7
739	Cẩm Mỹ	Cam My	Huyện Cẩm Mỹ	Cam My District	cam_my	75	7
740	Long Thành	Long Thanh	Huyện Long Thành	Long Thanh District	long_thanh	75	7
741	Xuân Lộc	Xuan Loc	Huyện Xuân Lộc	Xuan Loc District	xuan_loc	75	7
742	Nhơn Trạch	Nhon Trach	Huyện Nhơn Trạch	Nhon Trach District	nhon_trach	75	7
747	Vũng Tàu	Vung Tau	Thành phố Vũng Tàu	Vung Tau City	vung_tau	77	4
748	Bà Rịa	Ba Ria	Thành phố Bà Rịa	Ba Ria City	ba_ria	77	4
750	Châu Đức	Chau Duc	Huyện Châu Đức	Chau Duc District	chau_duc	77	7
751	Xuyên Mộc	Xuyen Moc	Huyện Xuyên Mộc	Xuyen Moc District	xuyen_moc	77	7
752	Long Điền	Long Dien	Huyện Long Điền	Long Dien District	long_dien	77	7
753	Đất Đỏ	Dat Do	Huyện Đất Đỏ	Dat Do District	dat_do	77	7
754	Phú Mỹ	Phu My	Thị xã Phú Mỹ	Phu My Town	phu_my	77	6
755	Côn Đảo	Con Dao	Huyện Côn Đảo	Con Dao District	con_dao	77	7
760	1	1	Quận 1	1 District	1	79	5
761	12	12	Quận 12	12 District	12	79	5
764	Gò Vấp	Go Vap	Quận Gò Vấp	Go Vap District	go_vap	79	5
765	Bình Thạnh	Binh Thanh	Quận Bình Thạnh	Binh Thanh District	binh_thanh	79	5
766	Tân Bình	Tan Binh	Quận Tân Bình	Tan Binh District	tan_binh	79	5
767	Tân Phú	Tan Phu	Quận Tân Phú	Tan Phu District	tan_phu	79	5
768	Phú Nhuận	Phu Nhuan	Quận Phú Nhuận	Phu Nhuan District	phu_nhuan	79	5
770	3	3	Quận 3	3 District	3	79	5
771	10	10	Quận 10	10 District	10	79	5
772	11	11	Quận 11	11 District	11	79	5
773	4	4	Quận 4	4 District	4	79	5
774	5	5	Quận 5	5 District	5	79	5
775	6	6	Quận 6	6 District	6	79	5
776	8	8	Quận 8	8 District	8	79	5
777	Bình Tân	Binh Tan	Quận Bình Tân	Binh Tan District	binh_tan	79	5
778	7	7	Quận 7	7 District	7	79	5
783	Củ Chi	Cu Chi	Huyện Củ Chi	Cu Chi District	cu_chi	79	7
784	Hóc Môn	Hoc Mon	Huyện Hóc Môn	Hoc Mon District	hoc_mon	79	7
785	Bình Chánh	Binh Chanh	Huyện Bình Chánh	Binh Chanh District	binh_chanh	79	7
786	Nhà Bè	Nha Be	Huyện Nhà Bè	Nha Be District	nha_be	79	7
787	Cần Giờ	Can Gio	Huyện Cần Giờ	Can Gio District	can_gio	79	7
794	Tân An	Tan An	Thành phố Tân An	Tan An City	tan_an	80	4
795	Kiến Tường	Kien Tuong	Thị xã Kiến Tường	Kien Tuong Town	kien_tuong	80	6
796	Tân Hưng	Tan Hung	Huyện Tân Hưng	Tan Hung District	tan_hung	80	7
797	Vĩnh Hưng	Vinh Hung	Huyện Vĩnh Hưng	Vinh Hung District	vinh_hung	80	7
798	Mộc Hóa	Moc Hoa	Huyện Mộc Hóa	Moc Hoa District	moc_hoa	80	7
799	Tân Thạnh	Tan Thanh	Huyện Tân Thạnh	Tan Thanh District	tan_thanh	80	7
800	Thạnh Hóa	Thanh Hoa	Huyện Thạnh Hóa	Thanh Hoa District	thanh_hoa	80	7
801	Đức Huệ	Duc Hue	Huyện Đức Huệ	Duc Hue District	duc_hue	80	7
802	Đức Hòa	Duc Hoa	Huyện Đức Hòa	Duc Hoa District	duc_hoa	80	7
803	Bến Lức	Ben Luc	Huyện Bến Lức	Ben Luc District	ben_luc	80	7
804	Thủ Thừa	Thu Thua	Huyện Thủ Thừa	Thu Thua District	thu_thua	80	7
805	Tân Trụ	Tan Tru	Huyện Tân Trụ	Tan Tru District	tan_tru	80	7
806	Cần Đước	Can Duoc	Huyện Cần Đước	Can Duoc District	can_duoc	80	7
807	Cần Giuộc	Can Giuoc	Huyện Cần Giuộc	Can Giuoc District	can_giuoc	80	7
808	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	80	7
815	Mỹ Tho	My Tho	Thành phố Mỹ Tho	My Tho City	my_tho	82	4
816	Gò Công	Go Cong	Thị xã Gò Công	Go Cong Town	go_cong	82	6
817	Cai Lậy	Cai Lay	Thị xã Cai Lậy	Cai Lay Town	cai_lay	82	6
818	Tân Phước	Tan Phuoc	Huyện Tân Phước	Tan Phuoc District	tan_phuoc	82	7
819	Cái Bè	Cai Be	Huyện Cái Bè	Cai Be District	cai_be	82	7
820	Cai Lậy	Cai Lay	Huyện Cai Lậy	Cai Lay District	cai_lay	82	7
821	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	82	7
822	Chợ Gạo	Cho Gao	Huyện Chợ Gạo	Cho Gao District	cho_gao	82	7
823	Gò Công Tây	Go Cong Tay	Huyện Gò Công Tây	Go Cong Tay District	go_cong_tay	82	7
824	Gò Công Đông	Go Cong Dong	Huyện Gò Công Đông	Go Cong Dong District	go_cong_dong	82	7
825	Tân Phú Đông	Tan Phu Dong	Huyện Tân Phú Đông	Tan Phu Dong District	tan_phu_dong	82	7
829	Bến Tre	Ben Tre	Thành phố Bến Tre	Ben Tre City	ben_tre	83	4
831	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	83	7
832	Chợ Lách	Cho Lach	Huyện Chợ Lách	Cho Lach District	cho_lach	83	7
833	Mỏ Cày Nam	Mo Cay Nam	Huyện Mỏ Cày Nam	Mo Cay Nam District	mo_cay_nam	83	7
834	Giồng Trôm	Giong Trom	Huyện Giồng Trôm	Giong Trom District	giong_trom	83	7
835	Bình Đại	Binh Dai	Huyện Bình Đại	Binh Dai District	binh_dai	83	7
836	Ba Tri	Ba Tri	Huyện Ba Tri	Ba Tri District	ba_tri	83	7
837	Thạnh Phú	Thanh Phu	Huyện Thạnh Phú	Thanh Phu District	thanh_phu	83	7
838	Mỏ Cày Bắc	Mo Cay Bac	Huyện Mỏ Cày Bắc	Mo Cay Bac District	mo_cay_bac	83	7
842	Trà Vinh	Tra Vinh	Thành phố Trà Vinh	Tra Vinh City	tra_vinh	84	4
844	Càng Long	Cang Long	Huyện Càng Long	Cang Long District	cang_long	84	7
845	Cầu Kè	Cau Ke	Huyện Cầu Kè	Cau Ke District	cau_ke	84	7
846	Tiểu Cần	Tieu Can	Huyện Tiểu Cần	Tieu Can District	tieu_can	84	7
847	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	84	7
848	Cầu Ngang	Cau Ngang	Huyện Cầu Ngang	Cau Ngang District	cau_ngang	84	7
849	Trà Cú	Tra Cu	Huyện Trà Cú	Tra Cu District	tra_cu	84	7
850	Duyên Hải	Duyen Hai	Huyện Duyên Hải	Duyen Hai District	duyen_hai	84	7
851	Duyên Hải	Duyen Hai	Thị xã Duyên Hải	Duyen Hai Town	duyen_hai	84	6
855	Vĩnh Long	Vinh Long	Thành phố Vĩnh Long	Vinh Long City	vinh_long	86	4
857	Long Hồ	Long Ho	Huyện Long Hồ	Long Ho District	long_ho	86	7
858	Mang Thít	Mang Thit	Huyện Mang Thít	Mang Thit District	mang_thit	86	7
859	Vũng Liêm	Vung Liem	Huyện Vũng Liêm	Vung Liem District	vung_liem	86	7
860	Tam Bình	Tam Binh	Huyện Tam Bình	Tam Binh District	tam_binh	86	7
861	Bình Minh	Binh Minh	Thị xã Bình Minh	Binh Minh Town	binh_minh	86	6
862	Trà Ôn	Tra On	Huyện Trà Ôn	Tra On District	tra_on	86	7
863	Bình Tân	Binh Tan	Huyện Bình Tân	Binh Tan District	binh_tan	86	7
866	Cao Lãnh	Cao Lanh	Thành phố Cao Lãnh	Cao Lanh City	cao_lanh	87	4
867	Sa Đéc	Sa Dec	Thành phố Sa Đéc	Sa Dec City	sa_dec	87	4
868	Hồng Ngự	Hong Ngu	Thành phố Hồng Ngự	Hong Ngu City	hong_ngu	87	4
869	Tân Hồng	Tan Hong	Huyện Tân Hồng	Tan Hong District	tan_hong	87	7
870	Hồng Ngự	Hong Ngu	Huyện Hồng Ngự	Hong Ngu District	hong_ngu	87	7
871	Tam Nông	Tam Nong	Huyện Tam Nông	Tam Nong District	tam_nong	87	7
872	Tháp Mười	Thap Muoi	Huyện Tháp Mười	Thap Muoi District	thap_muoi	87	7
873	Cao Lãnh	Cao Lanh	Huyện Cao Lãnh	Cao Lanh District	cao_lanh	87	7
874	Thanh Bình	Thanh Binh	Huyện Thanh Bình	Thanh Binh District	thanh_binh	87	7
875	Lấp Vò	Lap Vo	Huyện Lấp Vò	Lap Vo District	lap_vo	87	7
876	Lai Vung	Lai Vung	Huyện Lai Vung	Lai Vung District	lai_vung	87	7
877	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	87	7
883	Long Xuyên	Long Xuyen	Thành phố Long Xuyên	Long Xuyen City	long_xuyen	89	4
884	Châu Đốc	Chau Doc	Thành phố Châu Đốc	Chau Doc City	chau_doc	89	4
886	An Phú	An Phu	Huyện An Phú	An Phu District	an_phu	89	7
887	Tân Châu	Tan Chau	Thị xã Tân Châu	Tan Chau Town	tan_chau	89	6
888	Phú Tân	Phu Tan	Huyện Phú Tân	Phu Tan District	phu_tan	89	7
889	Châu Phú	Chau Phu	Huyện Châu Phú	Chau Phu District	chau_phu	89	7
890	Tịnh Biên	Tinh Bien	Huyện Tịnh Biên	Tinh Bien District	tinh_bien	89	7
891	Tri Tôn	Tri Ton	Huyện Tri Tôn	Tri Ton District	tri_ton	89	7
892	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	89	7
893	Chợ Mới	Cho Moi	Huyện Chợ Mới	Cho Moi District	cho_moi	89	7
894	Thoại Sơn	Thoai Son	Huyện Thoại Sơn	Thoai Son District	thoai_son	89	7
899	Rạch Giá	Rach Gia	Thành phố Rạch Giá	Rach Gia City	rach_gia	91	4
900	Hà Tiên	Ha Tien	Thành phố Hà Tiên	Ha Tien City	ha_tien	91	4
902	Kiên Lương	Kien Luong	Huyện Kiên Lương	Kien Luong District	kien_luong	91	7
903	Hòn Đất	Hon Dat	Huyện Hòn Đất	Hon Dat District	hon_dat	91	7
904	Tân Hiệp	Tan Hiep	Huyện Tân Hiệp	Tan Hiep District	tan_hiep	91	7
905	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	91	7
906	Giồng Riềng	Giong Rieng	Huyện Giồng Riềng	Giong Rieng District	giong_rieng	91	7
907	Gò Quao	Go Quao	Huyện Gò Quao	Go Quao District	go_quao	91	7
908	An Biên	An Bien	Huyện An Biên	An Bien District	an_bien	91	7
909	An Minh	An Minh	Huyện An Minh	An Minh District	an_minh	91	7
910	Vĩnh Thuận	Vinh Thuan	Huyện Vĩnh Thuận	Vinh Thuan District	vinh_thuan	91	7
911	Phú Quốc	Phu Quoc	Thành phố Phú Quốc	Phu Quoc City	phu_quoc	91	4
912	Kiên Hải	Kien Hai	Huyện Kiên Hải	Kien Hai District	kien_hai	91	7
913	U Minh Thượng	U Minh Thuong	Huyện U Minh Thượng	U Minh Thuong District	u_minh_thuong	91	7
914	Giang Thành	Giang Thanh	Huyện Giang Thành	Giang Thanh District	giang_thanh	91	7
916	Ninh Kiều	Ninh Kieu	Quận Ninh Kiều	Ninh Kieu District	ninh_kieu	92	5
917	Ô Môn	O Mon	Quận Ô Môn	O Mon District	o_mon	92	5
918	Bình Thuỷ	Binh Thuy	Quận Bình Thuỷ	Binh Thuy District	binh_thuy	92	5
919	Cái Răng	Cai Rang	Quận Cái Răng	Cai Rang District	cai_rang	92	5
923	Thốt Nốt	Thot Not	Quận Thốt Nốt	Thot Not District	thot_not	92	5
924	Vĩnh Thạnh	Vinh Thanh	Huyện Vĩnh Thạnh	Vinh Thanh District	vinh_thanh	92	7
925	Cờ Đỏ	Co Do	Huyện Cờ Đỏ	Co Do District	co_do	92	7
926	Phong Điền	Phong Dien	Huyện Phong Điền	Phong Dien District	phong_dien	92	7
927	Thới Lai	Thoi Lai	Huyện Thới Lai	Thoi Lai District	thoi_lai	92	7
930	Vị Thanh	Vi Thanh	Thành phố Vị Thanh	Vi Thanh City	vi_thanh	93	4
931	Ngã Bảy	Nga Bay	Thành phố Ngã Bảy	Nga Bay City	nga_bay	93	4
932	Châu Thành A	Chau Thanh A	Huyện Châu Thành A	Chau Thanh A District	chau_thanh_a	93	7
933	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	93	7
934	Phụng Hiệp	Phung Hiep	Huyện Phụng Hiệp	Phung Hiep District	phung_hiep	93	7
935	Vị Thuỷ	Vi Thuy	Huyện Vị Thuỷ	Vi Thuy District	vi_thuy	93	7
936	Long Mỹ	Long My	Huyện Long Mỹ	Long My District	long_my	93	7
937	Long Mỹ	Long My	Thị xã Long Mỹ	Long My Town	long_my	93	6
941	Sóc Trăng	Soc Trang	Thành phố Sóc Trăng	Soc Trang City	soc_trang	94	4
942	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	94	7
943	Kế Sách	Ke Sach	Huyện Kế Sách	Ke Sach District	ke_sach	94	7
944	Mỹ Tú	My Tu	Huyện Mỹ Tú	My Tu District	my_tu	94	7
945	Cù Lao Dung	Cu Lao Dung	Huyện Cù Lao Dung	Cu Lao Dung District	cu_lao_dung	94	7
946	Long Phú	Long Phu	Huyện Long Phú	Long Phu District	long_phu	94	7
947	Mỹ Xuyên	My Xuyen	Huyện Mỹ Xuyên	My Xuyen District	my_xuyen	94	7
948	Ngã Năm	Nga Nam	Thị xã Ngã Năm	Nga Nam Town	nga_nam	94	6
949	Thạnh Trị	Thanh Tri	Huyện Thạnh Trị	Thanh Tri District	thanh_tri	94	7
950	Vĩnh Châu	Vinh Chau	Thị xã Vĩnh Châu	Vinh Chau Town	vinh_chau	94	6
951	Trần Đề	Tran De	Huyện Trần Đề	Tran De District	tran_de	94	7
954	Bạc Liêu	Bac Lieu	Thành phố Bạc Liêu	Bac Lieu City	bac_lieu	95	4
956	Hồng Dân	Hong Dan	Huyện Hồng Dân	Hong Dan District	hong_dan	95	7
957	Phước Long	Phuoc Long	Huyện Phước Long	Phuoc Long District	phuoc_long	95	7
958	Vĩnh Lợi	Vinh Loi	Huyện Vĩnh Lợi	Vinh Loi District	vinh_loi	95	7
959	Giá Rai	Gia Rai	Thị xã Giá Rai	Gia Rai Town	gia_rai	95	6
960	Đông Hải	Dong Hai	Huyện Đông Hải	Dong Hai District	dong_hai	95	7
961	Hoà Bình	Hoa Binh	Huyện Hoà Bình	Hoa Binh District	hoa_binh	95	7
964	Cà Mau	Ca Mau	Thành phố Cà Mau	Ca Mau City	ca_mau	96	4
966	U Minh	U Minh	Huyện U Minh	U Minh District	u_minh	96	7
967	Thới Bình	Thoi Binh	Huyện Thới Bình	Thoi Binh District	thoi_binh	96	7
968	Trần Văn Thời	Tran Van Thoi	Huyện Trần Văn Thời	Tran Van Thoi District	tran_van_thoi	96	7
969	Cái Nước	Cai Nuoc	Huyện Cái Nước	Cai Nuoc District	cai_nuoc	96	7
970	Đầm Dơi	Dam Doi	Huyện Đầm Dơi	Dam Doi District	dam_doi	96	7
971	Năm Căn	Nam Can	Huyện Năm Căn	Nam Can District	nam_can	96	7
972	Phú Tân	Phu Tan	Huyện Phú Tân	Phu Tan District	phu_tan	96	7
973	Ngọc Hiển	Ngoc Hien	Huyện Ngọc Hiển	Ngoc Hien District	ngoc_hien	96	7
769	Thủ Đức	Thu Duc	Thành phố Thủ Đức	Thu Duc City	thu_duc	79	3
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.provinces (code, name, name_en, full_name, full_name_en, code_name, administrative_unit_id, administrative_region_id) FROM stdin;
01	Hà Nội	Ha Noi	Thành phố Hà Nội	Ha Noi City	ha_noi	1	3
26	Vĩnh Phúc	Vinh Phuc	Tỉnh Vĩnh Phúc	Vinh Phuc Province	vinh_phuc	2	3
27	Bắc Ninh	Bac Ninh	Tỉnh Bắc Ninh	Bac Ninh Province	bac_ninh	2	3
30	Hải Dương	Hai Duong	Tỉnh Hải Dương	Hai Duong Province	hai_duong	2	3
31	Hải Phòng	Hai Phong	Thành phố Hải Phòng	Hai Phong City	hai_phong	1	3
33	Hưng Yên	Hung Yen	Tỉnh Hưng Yên	Hung Yen Province	hung_yen	2	3
34	Thái Bình	Thai Binh	Tỉnh Thái Bình	Thai Binh Province	thai_binh	2	3
35	Hà Nam	Ha Nam	Tỉnh Hà Nam	Ha Nam Province	ha_nam	2	3
96	Cà Mau	Ca Mau	Tỉnh Cà Mau	Ca Mau Province	ca_mau	2	8
02	Hà Giang	Ha Giang	Tỉnh Hà Giang	Ha Giang Province	ha_giang	2	1
04	Cao Bằng	Cao Bang	Tỉnh Cao Bằng	Cao Bang Province	cao_bang	2	1
06	Bắc Kạn	Bac Kan	Tỉnh Bắc Kạn	Bac Kan Province	bac_kan	2	1
08	Tuyên Quang	Tuyen Quang	Tỉnh Tuyên Quang	Tuyen Quang Province	tuyen_quang	2	1
19	Thái Nguyên	Thai Nguyen	Tỉnh Thái Nguyên	Thai Nguyen Province	thai_nguyen	2	1
20	Lạng Sơn	Lang Son	Tỉnh Lạng Sơn	Lang Son Province	lang_son	2	1
22	Quảng Ninh	Quang Ninh	Tỉnh Quảng Ninh	Quang Ninh Province	quang_ninh	2	1
24	Bắc Giang	Bac Giang	Tỉnh Bắc Giang	Bac Giang Province	bac_giang	2	1
25	Phú Thọ	Phu Tho	Tỉnh Phú Thọ	Phu Tho Province	phu_tho	2	1
10	Lào Cai	Lao Cai	Tỉnh Lào Cai	Lao Cai Province	lao_cai	2	2
11	Điện Biên	Dien Bien	Tỉnh Điện Biên	Dien Bien Province	dien_bien	2	2
12	Lai Châu	Lai Chau	Tỉnh Lai Châu	Lai Chau Province	lai_chau	2	2
14	Sơn La	Son La	Tỉnh Sơn La	Son La Province	son_la	2	2
15	Yên Bái	Yen Bai	Tỉnh Yên Bái	Yen Bai Province	yen_bai	2	2
17	Hoà Bình	Hoa Binh	Tỉnh Hoà Bình	Hoa Binh Province	hoa_binh	2	2
70	Bình Phước	Binh Phuoc	Tỉnh Bình Phước	Binh Phuoc Province	binh_phuoc	2	7
72	Tây Ninh	Tay Ninh	Tỉnh Tây Ninh	Tay Ninh Province	tay_ninh	2	7
74	Bình Dương	Binh Duong	Tỉnh Bình Dương	Binh Duong Province	binh_duong	2	7
75	Đồng Nai	Dong Nai	Tỉnh Đồng Nai	Dong Nai Province	dong_nai	2	7
79	Hồ Chí Minh	Ho Chi Minh	Thành phố Hồ Chí Minh	Ho Chi Minh City	ho_chi_minh	1	7
77	Bà Rịa - Vũng Tàu	Ba Ria - Vung Tau	Tỉnh Bà Rịa - Vũng Tàu	Ba Ria - Vung Tau Province	ba_ria_vung_tau	2	7
36	Nam Định	Nam Dinh	Tỉnh Nam Định	Nam Dinh Province	nam_dinh	2	3
37	Ninh Bình	Ninh Binh	Tỉnh Ninh Bình	Ninh Binh Province	ninh_binh	2	3
38	Thanh Hóa	Thanh Hoa	Tỉnh Thanh Hóa	Thanh Hoa Province	thanh_hoa	2	4
40	Nghệ An	Nghe An	Tỉnh Nghệ An	Nghe An Province	nghe_an	2	4
42	Hà Tĩnh	Ha Tinh	Tỉnh Hà Tĩnh	Ha Tinh Province	ha_tinh	2	4
44	Quảng Bình	Quang Binh	Tỉnh Quảng Bình	Quang Binh Province	quang_binh	2	4
45	Quảng Trị	Quang Tri	Tỉnh Quảng Trị	Quang Tri Province	quang_tri	2	4
46	Thừa Thiên Huế	Thua Thien Hue	Tỉnh Thừa Thiên Huế	Thua Thien Hue Province	thua_thien_hue	2	4
48	Đà Nẵng	Da Nang	Thành phố Đà Nẵng	Da Nang City	da_nang	1	5
49	Quảng Nam	Quang Nam	Tỉnh Quảng Nam	Quang Nam Province	quang_nam	2	5
51	Quảng Ngãi	Quang Ngai	Tỉnh Quảng Ngãi	Quang Ngai Province	quang_ngai	2	5
52	Bình Định	Binh Dinh	Tỉnh Bình Định	Binh Dinh Province	binh_dinh	2	5
54	Phú Yên	Phu Yen	Tỉnh Phú Yên	Phu Yen Province	phu_yen	2	5
56	Khánh Hòa	Khanh Hoa	Tỉnh Khánh Hòa	Khanh Hoa Province	khanh_hoa	2	5
58	Ninh Thuận	Ninh Thuan	Tỉnh Ninh Thuận	Ninh Thuan Province	ninh_thuan	2	5
60	Bình Thuận	Binh Thuan	Tỉnh Bình Thuận	Binh Thuan Province	binh_thuan	2	5
62	Kon Tum	Kon Tum	Tỉnh Kon Tum	Kon Tum Province	kon_tum	2	6
64	Gia Lai	Gia Lai	Tỉnh Gia Lai	Gia Lai Province	gia_lai	2	6
66	Đắk Lắk	Dak Lak	Tỉnh Đắk Lắk	Dak Lak Province	dak_lak	2	6
67	Đắk Nông	Dak Nong	Tỉnh Đắk Nông	Dak Nong Province	dak_nong	2	6
68	Lâm Đồng	Lam Dong	Tỉnh Lâm Đồng	Lam Dong Province	lam_dong	2	6
80	Long An	Long An	Tỉnh Long An	Long An Province	long_an	2	8
82	Tiền Giang	Tien Giang	Tỉnh Tiền Giang	Tien Giang Province	tien_giang	2	8
83	Bến Tre	Ben Tre	Tỉnh Bến Tre	Ben Tre Province	ben_tre	2	8
84	Trà Vinh	Tra Vinh	Tỉnh Trà Vinh	Tra Vinh Province	tra_vinh	2	8
86	Vĩnh Long	Vinh Long	Tỉnh Vĩnh Long	Vinh Long Province	vinh_long	2	8
87	Đồng Tháp	Dong Thap	Tỉnh Đồng Tháp	Dong Thap Province	dong_thap	2	8
89	An Giang	An Giang	Tỉnh An Giang	An Giang Province	an_giang	2	8
91	Kiên Giang	Kien Giang	Tỉnh Kiên Giang	Kien Giang Province	kien_giang	2	8
92	Cần Thơ	Can Tho	Thành phố Cần Thơ	Can Tho City	can_tho	1	8
93	Hậu Giang	Hau Giang	Tỉnh Hậu Giang	Hau Giang Province	hau_giang	2	8
94	Sóc Trăng	Soc Trang	Tỉnh Sóc Trăng	Soc Trang Province	soc_trang	2	8
95	Bạc Liêu	Bac Lieu	Tỉnh Bạc Liêu	Bac Lieu Province	bac_lieu	2	8
\.


--
-- Data for Name: wards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wards (code, name, name_en, full_name, full_name_en, code_name, district_code, administrative_unit_id) FROM stdin;
28759	8	8	Phường 8	8 Ward	8	829	8
29236	4	4	Phường 4	4 Ward	4	842	8
31564	An Mỹ	An My	Xã An Mỹ	An My Commune	an_my	943	10
31942	1	1	Phường 1	1 Ward	1	959	8
00001	Phúc Xá	Phuc Xa	Phường Phúc Xá	Phuc Xa Ward	phuc_xa	001	8
00004	Trúc Bạch	Truc Bach	Phường Trúc Bạch	Truc Bach Ward	truc_bach	001	8
00006	Vĩnh Phúc	Vinh Phuc	Phường Vĩnh Phúc	Vinh Phuc Ward	vinh_phuc	001	8
00007	Cống Vị	Cong Vi	Phường Cống Vị	Cong Vi Ward	cong_vi	001	8
00008	Liễu Giai	Lieu Giai	Phường Liễu Giai	Lieu Giai Ward	lieu_giai	001	8
00010	Nguyễn Trung Trực	Nguyen Trung Truc	Phường Nguyễn Trung Trực	Nguyen Trung Truc Ward	nguyen_trung_truc	001	8
00013	Quán Thánh	Quan Thanh	Phường Quán Thánh	Quan Thanh Ward	quan_thanh	001	8
00016	Ngọc Hà	Ngoc Ha	Phường Ngọc Hà	Ngoc Ha Ward	ngoc_ha	001	8
00019	Điện Biên	Dien Bien	Phường Điện Biên	Dien Bien Ward	dien_bien	001	8
00022	Đội Cấn	Doi Can	Phường Đội Cấn	Doi Can Ward	doi_can	001	8
00025	Ngọc Khánh	Ngoc Khanh	Phường Ngọc Khánh	Ngoc Khanh Ward	ngoc_khanh	001	8
00028	Kim Mã	Kim Ma	Phường Kim Mã	Kim Ma Ward	kim_ma	001	8
00031	Giảng Võ	Giang Vo	Phường Giảng Võ	Giang Vo Ward	giang_vo	001	8
00034	Thành Công	Thanh Cong	Phường Thành Công	Thanh Cong Ward	thanh_cong	001	8
00037	Phúc Tân	Phuc Tan	Phường Phúc Tân	Phuc Tan Ward	phuc_tan	002	8
00040	Đồng Xuân	Dong Xuan	Phường Đồng Xuân	Dong Xuan Ward	dong_xuan	002	8
00043	Hàng Mã	Hang Ma	Phường Hàng Mã	Hang Ma Ward	hang_ma	002	8
00046	Hàng Buồm	Hang Buom	Phường Hàng Buồm	Hang Buom Ward	hang_buom	002	8
00049	Hàng Đào	Hang Dao	Phường Hàng Đào	Hang Dao Ward	hang_dao	002	8
00052	Hàng Bồ	Hang Bo	Phường Hàng Bồ	Hang Bo Ward	hang_bo	002	8
00055	Cửa Đông	Cua Dong	Phường Cửa Đông	Cua Dong Ward	cua_dong	002	8
00058	Lý Thái Tổ	Ly Thai To	Phường Lý Thái Tổ	Ly Thai To Ward	ly_thai_to	002	8
00061	Hàng Bạc	Hang Bac	Phường Hàng Bạc	Hang Bac Ward	hang_bac	002	8
00064	Hàng Gai	Hang Gai	Phường Hàng Gai	Hang Gai Ward	hang_gai	002	8
00067	Chương Dương	Chuong Duong	Phường Chương Dương	Chuong Duong Ward	chuong_duong	002	8
00070	Hàng Trống	Hang Trong	Phường Hàng Trống	Hang Trong Ward	hang_trong	002	8
00073	Cửa Nam	Cua Nam	Phường Cửa Nam	Cua Nam Ward	cua_nam	002	8
00076	Hàng Bông	Hang Bong	Phường Hàng Bông	Hang Bong Ward	hang_bong	002	8
00079	Tràng Tiền	Trang Tien	Phường Tràng Tiền	Trang Tien Ward	trang_tien	002	8
00082	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	002	8
00085	Phan Chu Trinh	Phan Chu Trinh	Phường Phan Chu Trinh	Phan Chu Trinh Ward	phan_chu_trinh	002	8
00088	Hàng Bài	Hang Bai	Phường Hàng Bài	Hang Bai Ward	hang_bai	002	8
00091	Phú Thượng	Phu Thuong	Phường Phú Thượng	Phu Thuong Ward	phu_thuong	003	8
00094	Nhật Tân	Nhat Tan	Phường Nhật Tân	Nhat Tan Ward	nhat_tan	003	8
00097	Tứ Liên	Tu Lien	Phường Tứ Liên	Tu Lien Ward	tu_lien	003	8
00100	Quảng An	Quang An	Phường Quảng An	Quang An Ward	quang_an	003	8
00103	Xuân La	Xuan La	Phường Xuân La	Xuan La Ward	xuan_la	003	8
00106	Yên Phụ	Yen Phu	Phường Yên Phụ	Yen Phu Ward	yen_phu	003	8
00109	Bưởi	Buoi	Phường Bưởi	Buoi Ward	buoi	003	8
00112	Thụy Khuê	Thuy Khue	Phường Thụy Khuê	Thuy Khue Ward	thuy_khue	003	8
00115	Thượng Thanh	Thuong Thanh	Phường Thượng Thanh	Thuong Thanh Ward	thuong_thanh	004	8
00118	Ngọc Thụy	Ngoc Thuy	Phường Ngọc Thụy	Ngoc Thuy Ward	ngoc_thuy	004	8
00121	Giang Biên	Giang Bien	Phường Giang Biên	Giang Bien Ward	giang_bien	004	8
00124	Đức Giang	Duc Giang	Phường Đức Giang	Duc Giang Ward	duc_giang	004	8
00127	Việt Hưng	Viet Hung	Phường Việt Hưng	Viet Hung Ward	viet_hung	004	8
00130	Gia Thụy	Gia Thuy	Phường Gia Thụy	Gia Thuy Ward	gia_thuy	004	8
00133	Ngọc Lâm	Ngoc Lam	Phường Ngọc Lâm	Ngoc Lam Ward	ngoc_lam	004	8
00136	Phúc Lợi	Phuc Loi	Phường Phúc Lợi	Phuc Loi Ward	phuc_loi	004	8
00139	Bồ Đề	Bo De	Phường Bồ Đề	Bo De Ward	bo_de	004	8
00142	Sài Đồng	Sai Dong	Phường Sài Đồng	Sai Dong Ward	sai_dong	004	8
00145	Long Biên	Long Bien	Phường Long Biên	Long Bien Ward	long_bien	004	8
00148	Thạch Bàn	Thach Ban	Phường Thạch Bàn	Thach Ban Ward	thach_ban	004	8
00151	Phúc Đồng	Phuc Dong	Phường Phúc Đồng	Phuc Dong Ward	phuc_dong	004	8
00154	Cự Khối	Cu Khoi	Phường Cự Khối	Cu Khoi Ward	cu_khoi	004	8
00157	Nghĩa Đô	Nghia Do	Phường Nghĩa Đô	Nghia Do Ward	nghia_do	005	8
00160	Nghĩa Tân	Nghia Tan	Phường Nghĩa Tân	Nghia Tan Ward	nghia_tan	005	8
00163	Mai Dịch	Mai Dich	Phường Mai Dịch	Mai Dich Ward	mai_dich	005	8
00166	Dịch Vọng	Dich Vong	Phường Dịch Vọng	Dich Vong Ward	dich_vong	005	8
00167	Dịch Vọng Hậu	Dich Vong Hau	Phường Dịch Vọng Hậu	Dich Vong Hau Ward	dich_vong_hau	005	8
00169	Quan Hoa	Quan Hoa	Phường Quan Hoa	Quan Hoa Ward	quan_hoa	005	8
00172	Yên Hoà	Yen Hoa	Phường Yên Hoà	Yen Hoa Ward	yen_hoa	005	8
00175	Trung Hoà	Trung Hoa	Phường Trung Hoà	Trung Hoa Ward	trung_hoa	005	8
00178	Cát Linh	Cat Linh	Phường Cát Linh	Cat Linh Ward	cat_linh	006	8
00181	Văn Miếu	Van Mieu	Phường Văn Miếu	Van Mieu Ward	van_mieu	006	8
00184	Quốc Tử Giám	Quoc Tu Giam	Phường Quốc Tử Giám	Quoc Tu Giam Ward	quoc_tu_giam	006	8
00187	Láng Thượng	Lang Thuong	Phường Láng Thượng	Lang Thuong Ward	lang_thuong	006	8
00190	Ô Chợ Dừa	O Cho Dua	Phường Ô Chợ Dừa	O Cho Dua Ward	o_cho_dua	006	8
00193	Văn Chương	Van Chuong	Phường Văn Chương	Van Chuong Ward	van_chuong	006	8
00196	Hàng Bột	Hang Bot	Phường Hàng Bột	Hang Bot Ward	hang_bot	006	8
00199	Láng Hạ	Lang Ha	Phường Láng Hạ	Lang Ha Ward	lang_ha	006	8
00202	Khâm Thiên	Kham Thien	Phường Khâm Thiên	Kham Thien Ward	kham_thien	006	8
00205	Thổ Quan	Tho Quan	Phường Thổ Quan	Tho Quan Ward	tho_quan	006	8
00208	Nam Đồng	Nam Dong	Phường Nam Đồng	Nam Dong Ward	nam_dong	006	8
00211	Trung Phụng	Trung Phung	Phường Trung Phụng	Trung Phung Ward	trung_phung	006	8
00214	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	006	8
00217	Trung Liệt	Trung Liet	Phường Trung Liệt	Trung Liet Ward	trung_liet	006	8
00220	Phương Liên	Phuong Lien	Phường Phương Liên	Phuong Lien Ward	phuong_lien	006	8
00223	Thịnh Quang	Thinh Quang	Phường Thịnh Quang	Thinh Quang Ward	thinh_quang	006	8
00226	Trung Tự	Trung Tu	Phường Trung Tự	Trung Tu Ward	trung_tu	006	8
00229	Kim Liên	Kim Lien	Phường Kim Liên	Kim Lien Ward	kim_lien	006	8
00232	Phương Mai	Phuong Mai	Phường Phương Mai	Phuong Mai Ward	phuong_mai	006	8
00235	Ngã Tư Sở	Nga Tu So	Phường Ngã Tư Sở	Nga Tu So Ward	nga_tu_so	006	8
00238	Khương Thượng	Khuong Thuong	Phường Khương Thượng	Khuong Thuong Ward	khuong_thuong	006	8
00241	Nguyễn Du	Nguyen Du	Phường Nguyễn Du	Nguyen Du Ward	nguyen_du	007	8
00244	Bạch Đằng	Bach Dang	Phường Bạch Đằng	Bach Dang Ward	bach_dang	007	8
00247	Phạm Đình Hổ	Pham Dinh Ho	Phường Phạm Đình Hổ	Pham Dinh Ho Ward	pham_dinh_ho	007	8
00256	Lê Đại Hành	Le Dai Hanh	Phường Lê Đại Hành	Le Dai Hanh Ward	le_dai_hanh	007	8
00259	Đồng Nhân	Dong Nhan	Phường Đồng Nhân	Dong Nhan Ward	dong_nhan	007	8
00262	Phố Huế	Pho Hue	Phường Phố Huế	Pho Hue Ward	pho_hue	007	8
00265	Đống Mác	Dong Mac	Phường Đống Mác	Dong Mac Ward	dong_mac	007	8
00268	Thanh Lương	Thanh Luong	Phường Thanh Lương	Thanh Luong Ward	thanh_luong	007	8
00271	Thanh Nhàn	Thanh Nhan	Phường Thanh Nhàn	Thanh Nhan Ward	thanh_nhan	007	8
00274	Cầu Dền	Cau Den	Phường Cầu Dền	Cau Den Ward	cau_den	007	8
00277	Bách Khoa	Bach Khoa	Phường Bách Khoa	Bach Khoa Ward	bach_khoa	007	8
00280	Đồng Tâm	Dong Tam	Phường Đồng Tâm	Dong Tam Ward	dong_tam	007	8
00283	Vĩnh Tuy	Vinh Tuy	Phường Vĩnh Tuy	Vinh Tuy Ward	vinh_tuy	007	8
00286	Bạch Mai	Bach Mai	Phường Bạch Mai	Bach Mai Ward	bach_mai	007	8
00289	Quỳnh Mai	Quynh Mai	Phường Quỳnh Mai	Quynh Mai Ward	quynh_mai	007	8
00292	Quỳnh Lôi	Quynh Loi	Phường Quỳnh Lôi	Quynh Loi Ward	quynh_loi	007	8
00295	Minh Khai	Minh Khai	Phường Minh Khai	Minh Khai Ward	minh_khai	007	8
00298	Trương Định	Truong Dinh	Phường Trương Định	Truong Dinh Ward	truong_dinh	007	8
00301	Thanh Trì	Thanh Tri	Phường Thanh Trì	Thanh Tri Ward	thanh_tri	008	8
00304	Vĩnh Hưng	Vinh Hung	Phường Vĩnh Hưng	Vinh Hung Ward	vinh_hung	008	8
00307	Định Công	Dinh Cong	Phường Định Công	Dinh Cong Ward	dinh_cong	008	8
00310	Mai Động	Mai Dong	Phường Mai Động	Mai Dong Ward	mai_dong	008	8
00313	Tương Mai	Tuong Mai	Phường Tương Mai	Tuong Mai Ward	tuong_mai	008	8
00316	Đại Kim	Dai Kim	Phường Đại Kim	Dai Kim Ward	dai_kim	008	8
00319	Tân Mai	Tan Mai	Phường Tân Mai	Tan Mai Ward	tan_mai	008	8
00322	Hoàng Văn Thụ	Hoang Van Thu	Phường Hoàng Văn Thụ	Hoang Van Thu Ward	hoang_van_thu	008	8
00325	Giáp Bát	Giap Bat	Phường Giáp Bát	Giap Bat Ward	giap_bat	008	8
00328	Lĩnh Nam	Linh Nam	Phường Lĩnh Nam	Linh Nam Ward	linh_nam	008	8
00331	Thịnh Liệt	Thinh Liet	Phường Thịnh Liệt	Thinh Liet Ward	thinh_liet	008	8
00334	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	008	8
00337	Hoàng Liệt	Hoang Liet	Phường Hoàng Liệt	Hoang Liet Ward	hoang_liet	008	8
00340	Yên Sở	Yen So	Phường Yên Sở	Yen So Ward	yen_so	008	8
00343	Nhân Chính	Nhan Chinh	Phường Nhân Chính	Nhan Chinh Ward	nhan_chinh	009	8
00346	Thượng Đình	Thuong Dinh	Phường Thượng Đình	Thuong Dinh Ward	thuong_dinh	009	8
00349	Khương Trung	Khuong Trung	Phường Khương Trung	Khuong Trung Ward	khuong_trung	009	8
00352	Khương Mai	Khuong Mai	Phường Khương Mai	Khuong Mai Ward	khuong_mai	009	8
00355	Thanh Xuân Trung	Thanh Xuan Trung	Phường Thanh Xuân Trung	Thanh Xuan Trung Ward	thanh_xuan_trung	009	8
00358	Phương Liệt	Phuong Liet	Phường Phương Liệt	Phuong Liet Ward	phuong_liet	009	8
00361	Hạ Đình	Ha Dinh	Phường Hạ Đình	Ha Dinh Ward	ha_dinh	009	8
00364	Khương Đình	Khuong Dinh	Phường Khương Đình	Khuong Dinh Ward	khuong_dinh	009	8
00367	Thanh Xuân Bắc	Thanh Xuan Bac	Phường Thanh Xuân Bắc	Thanh Xuan Bac Ward	thanh_xuan_bac	009	8
00370	Thanh Xuân Nam	Thanh Xuan Nam	Phường Thanh Xuân Nam	Thanh Xuan Nam Ward	thanh_xuan_nam	009	8
00373	Kim Giang	Kim Giang	Phường Kim Giang	Kim Giang Ward	kim_giang	009	8
00376	Sóc Sơn	Soc Son	Thị trấn Sóc Sơn	Soc Son Township	soc_son	016	9
00379	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	016	10
00382	Minh Trí	Minh Tri	Xã Minh Trí	Minh Tri Commune	minh_tri	016	10
00385	Hồng Kỳ	Hong Ky	Xã Hồng Kỳ	Hong Ky Commune	hong_ky	016	10
00388	Nam Sơn	Nam Son	Xã Nam Sơn	Nam Son Commune	nam_son	016	10
00391	Trung Giã	Trung Gia	Xã Trung Giã	Trung Gia Commune	trung_gia	016	10
00394	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	016	10
00397	Minh Phú	Minh Phu	Xã Minh Phú	Minh Phu Commune	minh_phu	016	10
00400	Phù Linh	Phu Linh	Xã Phù Linh	Phu Linh Commune	phu_linh	016	10
00403	Bắc Phú	Bac Phu	Xã Bắc Phú	Bac Phu Commune	bac_phu	016	10
00406	Tân Minh	Tan Minh	Xã Tân Minh	Tan Minh Commune	tan_minh	016	10
00409	Quang Tiến	Quang Tien	Xã Quang Tiến	Quang Tien Commune	quang_tien	016	10
00412	Hiền Ninh	Hien Ninh	Xã Hiền Ninh	Hien Ninh Commune	hien_ninh	016	10
00415	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	016	10
00418	Tiên Dược	Tien Duoc	Xã Tiên Dược	Tien Duoc Commune	tien_duoc	016	10
00421	Việt Long	Viet Long	Xã Việt Long	Viet Long Commune	viet_long	016	10
00424	Xuân Giang	Xuan Giang	Xã Xuân Giang	Xuan Giang Commune	xuan_giang	016	10
00427	Mai Đình	Mai Dinh	Xã Mai Đình	Mai Dinh Commune	mai_dinh	016	10
00430	Đức Hoà	Duc Hoa	Xã Đức Hoà	Duc Hoa Commune	duc_hoa	016	10
00433	Thanh Xuân	Thanh Xuan	Xã Thanh Xuân	Thanh Xuan Commune	thanh_xuan	016	10
00436	Đông Xuân	Dong Xuan	Xã Đông Xuân	Dong Xuan Commune	dong_xuan	016	10
00439	Kim Lũ	Kim Lu	Xã Kim Lũ	Kim Lu Commune	kim_lu	016	10
00442	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	016	10
00445	Phú Minh	Phu Minh	Xã Phú Minh	Phu Minh Commune	phu_minh	016	10
00448	Phù Lỗ	Phu Lo	Xã Phù Lỗ	Phu Lo Commune	phu_lo	016	10
00451	Xuân Thu	Xuan Thu	Xã Xuân Thu	Xuan Thu Commune	xuan_thu	016	10
00454	Đông Anh	Dong Anh	Thị trấn Đông Anh	Dong Anh Township	dong_anh	017	9
00457	Xuân Nộn	Xuan Non	Xã Xuân Nộn	Xuan Non Commune	xuan_non	017	10
00460	Thuỵ Lâm	Thuy Lam	Xã Thuỵ Lâm	Thuy Lam Commune	thuy_lam	017	10
00463	Bắc Hồng	Bac Hong	Xã Bắc Hồng	Bac Hong Commune	bac_hong	017	10
00466	Nguyên Khê	Nguyen Khe	Xã Nguyên Khê	Nguyen Khe Commune	nguyen_khe	017	10
00469	Nam Hồng	Nam Hong	Xã Nam Hồng	Nam Hong Commune	nam_hong	017	10
00472	Tiên Dương	Tien Duong	Xã Tiên Dương	Tien Duong Commune	tien_duong	017	10
00475	Vân Hà	Van Ha	Xã Vân Hà	Van Ha Commune	van_ha	017	10
00478	Uy Nỗ	Uy No	Xã Uy Nỗ	Uy No Commune	uy_no	017	10
00481	Vân Nội	Van Noi	Xã Vân Nội	Van Noi Commune	van_noi	017	10
00484	Liên Hà	Lien Ha	Xã Liên Hà	Lien Ha Commune	lien_ha	017	10
00487	Việt Hùng	Viet Hung	Xã Việt Hùng	Viet Hung Commune	viet_hung	017	10
00490	Kim Nỗ	Kim No	Xã Kim Nỗ	Kim No Commune	kim_no	017	10
00493	Kim Chung	Kim Chung	Xã Kim Chung	Kim Chung Commune	kim_chung	017	10
00496	Dục Tú	Duc Tu	Xã Dục Tú	Duc Tu Commune	duc_tu	017	10
00499	Đại Mạch	Dai Mach	Xã Đại Mạch	Dai Mach Commune	dai_mach	017	10
00502	Vĩnh Ngọc	Vinh Ngoc	Xã Vĩnh Ngọc	Vinh Ngoc Commune	vinh_ngoc	017	10
00505	Cổ Loa	Co Loa	Xã Cổ Loa	Co Loa Commune	co_loa	017	10
00508	Hải Bối	Hai Boi	Xã Hải Bối	Hai Boi Commune	hai_boi	017	10
00511	Xuân Canh	Xuan Canh	Xã Xuân Canh	Xuan Canh Commune	xuan_canh	017	10
00514	Võng La	Vong La	Xã Võng La	Vong La Commune	vong_la	017	10
00517	Tàm Xá	Tam Xa	Xã Tàm Xá	Tam Xa Commune	tam_xa	017	10
00520	Mai Lâm	Mai Lam	Xã Mai Lâm	Mai Lam Commune	mai_lam	017	10
00523	Đông Hội	Dong Hoi	Xã Đông Hội	Dong Hoi Commune	dong_hoi	017	10
00526	Yên Viên	Yen Vien	Thị trấn Yên Viên	Yen Vien Township	yen_vien	018	9
00529	Yên Thường	Yen Thuong	Xã Yên Thường	Yen Thuong Commune	yen_thuong	018	10
00532	Yên Viên	Yen Vien	Xã Yên Viên	Yen Vien Commune	yen_vien	018	10
00535	Ninh Hiệp	Ninh Hiep	Xã Ninh Hiệp	Ninh Hiep Commune	ninh_hiep	018	10
00538	Đình Xuyên	Dinh Xuyen	Xã Đình Xuyên	Dinh Xuyen Commune	dinh_xuyen	018	10
00541	Dương Hà	Duong Ha	Xã Dương Hà	Duong Ha Commune	duong_ha	018	10
00544	Phù Đổng	Phu Dong	Xã Phù Đổng	Phu Dong Commune	phu_dong	018	10
00547	Trung Mầu	Trung Mau	Xã Trung Mầu	Trung Mau Commune	trung_mau	018	10
00550	Lệ Chi	Le Chi	Xã Lệ Chi	Le Chi Commune	le_chi	018	10
00553	Cổ Bi	Co Bi	Xã Cổ Bi	Co Bi Commune	co_bi	018	10
00556	Đặng Xá	Dang Xa	Xã Đặng Xá	Dang Xa Commune	dang_xa	018	10
00559	Phú Thị	Phu Thi	Xã Phú Thị	Phu Thi Commune	phu_thi	018	10
00562	Kim Sơn	Kim Son	Xã Kim Sơn	Kim Son Commune	kim_son	018	10
00565	Trâu Quỳ	Trau Quy	Thị trấn Trâu Quỳ	Trau Quy Township	trau_quy	018	9
00568	Dương Quang	Duong Quang	Xã Dương Quang	Duong Quang Commune	duong_quang	018	10
00571	Dương Xá	Duong Xa	Xã Dương Xá	Duong Xa Commune	duong_xa	018	10
00574	Đông Dư	Dong Du	Xã Đông Dư	Dong Du Commune	dong_du	018	10
00577	Đa Tốn	Da Ton	Xã Đa Tốn	Da Ton Commune	da_ton	018	10
00580	Kiêu Kỵ	Kieu Ky	Xã Kiêu Kỵ	Kieu Ky Commune	kieu_ky	018	10
00583	Bát Tràng	Bat Trang	Xã Bát Tràng	Bat Trang Commune	bat_trang	018	10
00586	Kim Lan	Kim Lan	Xã Kim Lan	Kim Lan Commune	kim_lan	018	10
00589	Văn Đức	Van Duc	Xã Văn Đức	Van Duc Commune	van_duc	018	10
00592	Cầu Diễn	Cau Dien	Phường Cầu Diễn	Cau Dien Ward	cau_dien	019	8
00622	Xuân Phương	Xuan Phuong	Phường Xuân Phương	Xuan Phuong Ward	xuan_phuong	019	8
00623	Phương Canh	Phuong Canh	Phường Phương Canh	Phuong Canh Ward	phuong_canh	019	8
00625	Mỹ Đình 1	My Dinh 1	Phường Mỹ Đình 1	My Dinh 1 Ward	my_dinh_1	019	8
00626	Mỹ Đình 2	My Dinh 2	Phường Mỹ Đình 2	My Dinh 2 Ward	my_dinh_2	019	8
00628	Tây Mỗ	Tay Mo	Phường Tây Mỗ	Tay Mo Ward	tay_mo	019	8
00631	Mễ Trì	Me Tri	Phường Mễ Trì	Me Tri Ward	me_tri	019	8
00632	Phú Đô	Phu Do	Phường Phú Đô	Phu Do Ward	phu_do	019	8
00634	Đại Mỗ	Dai Mo	Phường Đại Mỗ	Dai Mo Ward	dai_mo	019	8
00637	Trung Văn	Trung Van	Phường Trung Văn	Trung Van Ward	trung_van	019	8
00640	Văn Điển	Van Dien	Thị trấn Văn Điển	Van Dien Township	van_dien	020	9
00643	Tân Triều	Tan Trieu	Xã Tân Triều	Tan Trieu Commune	tan_trieu	020	10
00646	Thanh Liệt	Thanh Liet	Xã Thanh Liệt	Thanh Liet Commune	thanh_liet	020	10
00649	Tả Thanh Oai	Ta Thanh Oai	Xã Tả Thanh Oai	Ta Thanh Oai Commune	ta_thanh_oai	020	10
00652	Hữu Hoà	Huu Hoa	Xã Hữu Hoà	Huu Hoa Commune	huu_hoa	020	10
00655	Tam Hiệp	Tam Hiep	Xã Tam Hiệp	Tam Hiep Commune	tam_hiep	020	10
00658	Tứ Hiệp	Tu Hiep	Xã Tứ Hiệp	Tu Hiep Commune	tu_hiep	020	10
00661	Yên Mỹ	Yen My	Xã Yên Mỹ	Yen My Commune	yen_my	020	10
00664	Vĩnh Quỳnh	Vinh Quynh	Xã Vĩnh Quỳnh	Vinh Quynh Commune	vinh_quynh	020	10
00667	Ngũ Hiệp	Ngu Hiep	Xã Ngũ Hiệp	Ngu Hiep Commune	ngu_hiep	020	10
00670	Duyên Hà	Duyen Ha	Xã Duyên Hà	Duyen Ha Commune	duyen_ha	020	10
00673	Ngọc Hồi	Ngoc Hoi	Xã Ngọc Hồi	Ngoc Hoi Commune	ngoc_hoi	020	10
00676	Vạn Phúc	Van Phuc	Xã Vạn Phúc	Van Phuc Commune	van_phuc	020	10
00679	Đại áng	Dai ang	Xã Đại áng	Dai ang Commune	dai_ang	020	10
00682	Liên Ninh	Lien Ninh	Xã Liên Ninh	Lien Ninh Commune	lien_ninh	020	10
00685	Đông Mỹ	Dong My	Xã Đông Mỹ	Dong My Commune	dong_my	020	10
00595	Thượng Cát	Thuong Cat	Phường Thượng Cát	Thuong Cat Ward	thuong_cat	021	8
00598	Liên Mạc	Lien Mac	Phường Liên Mạc	Lien Mac Ward	lien_mac	021	8
00601	Đông Ngạc	Dong Ngac	Phường Đông Ngạc	Dong Ngac Ward	dong_ngac	021	8
00602	Đức Thắng	Duc Thang	Phường Đức Thắng	Duc Thang Ward	duc_thang	021	8
00604	Thụy Phương	Thuy Phuong	Phường Thụy Phương	Thuy Phuong Ward	thuy_phuong	021	8
00607	Tây Tựu	Tay Tuu	Phường Tây Tựu	Tay Tuu Ward	tay_tuu	021	8
00610	Xuân Đỉnh	Xuan Dinh	Phường Xuân Đỉnh	Xuan Dinh Ward	xuan_dinh	021	8
00611	Xuân Tảo	Xuan Tao	Phường Xuân Tảo	Xuan Tao Ward	xuan_tao	021	8
00613	Minh Khai	Minh Khai	Phường Minh Khai	Minh Khai Ward	minh_khai	021	8
00616	Cổ Nhuế 1	Co Nhue 1	Phường Cổ Nhuế 1	Co Nhue 1 Ward	co_nhue_1	021	8
00617	Cổ Nhuế 2	Co Nhue 2	Phường Cổ Nhuế 2	Co Nhue 2 Ward	co_nhue_2	021	8
00619	Phú Diễn	Phu Dien	Phường Phú Diễn	Phu Dien Ward	phu_dien	021	8
00620	Phúc Diễn	Phuc Dien	Phường Phúc Diễn	Phuc Dien Ward	phuc_dien	021	8
00688	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	024	8
00691	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	024	8
00692	Ngọc Hà	Ngoc Ha	Phường Ngọc Hà	Ngoc Ha Ward	ngoc_ha	024	8
00694	Nguyễn Trãi	Nguyen Trai	Phường Nguyễn Trãi	Nguyen Trai Ward	nguyen_trai	024	8
00697	Minh Khai	Minh Khai	Phường Minh Khai	Minh Khai Ward	minh_khai	024	8
00700	Ngọc Đường	Ngoc Duong	Xã Ngọc Đường	Ngoc Duong Commune	ngoc_duong	024	10
00946	Phương Độ	Phuong Do	Xã Phương Độ	Phuong Do Commune	phuong_do	024	10
00949	Phương Thiện	Phuong Thien	Xã Phương Thiện	Phuong Thien Commune	phuong_thien	024	10
00712	Phó Bảng	Pho Bang	Thị trấn Phó Bảng	Pho Bang Township	pho_bang	026	9
00715	Lũng Cú	Lung Cu	Xã Lũng Cú	Lung Cu Commune	lung_cu	026	10
00718	Má Lé	Ma Le	Xã Má Lé	Ma Le Commune	ma_le	026	10
00721	Đồng Văn	Dong Van	Thị trấn Đồng Văn	Dong Van Township	dong_van	026	9
00724	Lũng Táo	Lung Tao	Xã Lũng Táo	Lung Tao Commune	lung_tao	026	10
00727	Phố Là	Pho La	Xã Phố Là	Pho La Commune	pho_la	026	10
27337	06	06	Phường 06	06 Ward	06	774	8
00730	Thài Phìn Tủng	Thai Phin Tung	Xã Thài Phìn Tủng	Thai Phin Tung Commune	thai_phin_tung	026	10
00733	Sủng Là	Sung La	Xã Sủng Là	Sung La Commune	sung_la	026	10
00736	Xà Phìn	Xa Phin	Xã Xà Phìn	Xa Phin Commune	xa_phin	026	10
00739	Tả Phìn	Ta Phin	Xã Tả Phìn	Ta Phin Commune	ta_phin	026	10
00742	Tả Lủng	Ta Lung	Xã Tả Lủng	Ta Lung Commune	ta_lung	026	10
00745	Phố Cáo	Pho Cao	Xã Phố Cáo	Pho Cao Commune	pho_cao	026	10
00748	Sính Lủng	Sinh Lung	Xã Sính Lủng	Sinh Lung Commune	sinh_lung	026	10
00751	Sảng Tủng	Sang Tung	Xã Sảng Tủng	Sang Tung Commune	sang_tung	026	10
00754	Lũng Thầu	Lung Thau	Xã Lũng Thầu	Lung Thau Commune	lung_thau	026	10
00757	Hố Quáng Phìn	Ho Quang Phin	Xã Hố Quáng Phìn	Ho Quang Phin Commune	ho_quang_phin	026	10
00760	Vần Chải	Van Chai	Xã Vần Chải	Van Chai Commune	van_chai	026	10
00763	Lũng Phìn	Lung Phin	Xã Lũng Phìn	Lung Phin Commune	lung_phin	026	10
00766	Sủng Trái	Sung Trai	Xã Sủng Trái	Sung Trai Commune	sung_trai	026	10
00769	Mèo Vạc	Meo Vac	Thị trấn Mèo Vạc	Meo Vac Township	meo_vac	027	9
00772	Thượng Phùng	Thuong Phung	Xã Thượng Phùng	Thuong Phung Commune	thuong_phung	027	10
00775	Pải Lủng	Pai Lung	Xã Pải Lủng	Pai Lung Commune	pai_lung	027	10
00778	Xín Cái	Xin Cai	Xã Xín Cái	Xin Cai Commune	xin_cai	027	10
00781	Pả Vi	Pa Vi	Xã Pả Vi	Pa Vi Commune	pa_vi	027	10
00784	Giàng Chu Phìn	Giang Chu Phin	Xã Giàng Chu Phìn	Giang Chu Phin Commune	giang_chu_phin	027	10
00787	Sủng Trà	Sung Tra	Xã Sủng Trà	Sung Tra Commune	sung_tra	027	10
00790	Sủng Máng	Sung Mang	Xã Sủng Máng	Sung Mang Commune	sung_mang	027	10
00793	Sơn Vĩ	Son Vi	Xã Sơn Vĩ	Son Vi Commune	son_vi	027	10
00796	Tả Lủng	Ta Lung	Xã Tả Lủng	Ta Lung Commune	ta_lung	027	10
00799	Cán Chu Phìn	Can Chu Phin	Xã Cán Chu Phìn	Can Chu Phin Commune	can_chu_phin	027	10
00802	Lũng Pù	Lung Pu	Xã Lũng Pù	Lung Pu Commune	lung_pu	027	10
00805	Lũng Chinh	Lung Chinh	Xã Lũng Chinh	Lung Chinh Commune	lung_chinh	027	10
00808	Tát Ngà	Tat Nga	Xã Tát Ngà	Tat Nga Commune	tat_nga	027	10
00811	Nậm Ban	Nam Ban	Xã Nậm Ban	Nam Ban Commune	nam_ban	027	10
00814	Khâu Vai	Khau Vai	Xã Khâu Vai	Khau Vai Commune	khau_vai	027	10
00815	Niêm Tòng	Niem Tong	Xã Niêm Tòng	Niem Tong Commune	niem_tong	027	10
00817	Niêm Sơn	Niem Son	Xã Niêm Sơn	Niem Son Commune	niem_son	027	10
00820	Yên Minh	Yen Minh	Thị trấn Yên Minh	Yen Minh Township	yen_minh	028	9
00823	Thắng Mố	Thang Mo	Xã Thắng Mố	Thang Mo Commune	thang_mo	028	10
00826	Phú Lũng	Phu Lung	Xã Phú Lũng	Phu Lung Commune	phu_lung	028	10
00829	Sủng Tráng	Sung Trang	Xã Sủng Tráng	Sung Trang Commune	sung_trang	028	10
00832	Bạch Đích	Bach Dich	Xã Bạch Đích	Bach Dich Commune	bach_dich	028	10
00835	Na Khê	Na Khe	Xã Na Khê	Na Khe Commune	na_khe	028	10
00838	Sủng Thài	Sung Thai	Xã Sủng Thài	Sung Thai Commune	sung_thai	028	10
00841	Hữu Vinh	Huu Vinh	Xã Hữu Vinh	Huu Vinh Commune	huu_vinh	028	10
00844	Lao Và Chải	Lao Va Chai	Xã Lao Và Chải	Lao Va Chai Commune	lao_va_chai	028	10
00847	Mậu Duệ	Mau Due	Xã Mậu Duệ	Mau Due Commune	mau_due	028	10
00850	Đông Minh	Dong Minh	Xã Đông Minh	Dong Minh Commune	dong_minh	028	10
00853	Mậu Long	Mau Long	Xã Mậu Long	Mau Long Commune	mau_long	028	10
00856	Ngam La	Ngam La	Xã Ngam La	Ngam La Commune	ngam_la	028	10
00859	Ngọc Long	Ngoc Long	Xã Ngọc Long	Ngoc Long Commune	ngoc_long	028	10
00862	Đường Thượng	Duong Thuong	Xã Đường Thượng	Duong Thuong Commune	duong_thuong	028	10
00865	Lũng Hồ	Lung Ho	Xã Lũng Hồ	Lung Ho Commune	lung_ho	028	10
00868	Du Tiến	Du Tien	Xã Du Tiến	Du Tien Commune	du_tien	028	10
00871	Du Già	Du Gia	Xã Du Già	Du Gia Commune	du_gia	028	10
00874	Tam Sơn	Tam Son	Thị trấn Tam Sơn	Tam Son Township	tam_son	029	9
00877	Bát Đại Sơn	Bat Dai Son	Xã Bát Đại Sơn	Bat Dai Son Commune	bat_dai_son	029	10
00880	Nghĩa Thuận	Nghia Thuan	Xã Nghĩa Thuận	Nghia Thuan Commune	nghia_thuan	029	10
00883	Cán Tỷ	Can Ty	Xã Cán Tỷ	Can Ty Commune	can_ty	029	10
00886	Cao Mã Pờ	Cao Ma Po	Xã Cao Mã Pờ	Cao Ma Po Commune	cao_ma_po	029	10
00889	Thanh Vân	Thanh Van	Xã Thanh Vân	Thanh Van Commune	thanh_van	029	10
00892	Tùng Vài	Tung Vai	Xã Tùng Vài	Tung Vai Commune	tung_vai	029	10
00895	Đông Hà	Dong Ha	Xã Đông Hà	Dong Ha Commune	dong_ha	029	10
00898	Quản Bạ	Quan Ba	Xã Quản Bạ	Quan Ba Commune	quan_ba	029	10
00901	Lùng Tám	Lung Tam	Xã Lùng Tám	Lung Tam Commune	lung_tam	029	10
00904	Quyết Tiến	Quyet Tien	Xã Quyết Tiến	Quyet Tien Commune	quyet_tien	029	10
00907	Tả Ván	Ta Van	Xã Tả Ván	Ta Van Commune	ta_van	029	10
00910	Thái An	Thai An	Xã Thái An	Thai An Commune	thai_an	029	10
00703	Kim Thạch	Kim Thach	Xã Kim Thạch	Kim Thach Commune	kim_thach	030	10
00706	Phú Linh	Phu Linh	Xã Phú Linh	Phu Linh Commune	phu_linh	030	10
00709	Kim Linh	Kim Linh	Xã Kim Linh	Kim Linh Commune	kim_linh	030	10
00913	Vị Xuyên	Vi Xuyen	Thị trấn Vị Xuyên	Vi Xuyen Township	vi_xuyen	030	9
00916	Nông Trường Việt Lâm	Nong Truong Viet Lam	Thị trấn Nông Trường Việt Lâm	Nong Truong Viet Lam Township	nong_truong_viet_lam	030	9
00919	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	030	10
00922	Thuận Hoà	Thuan Hoa	Xã Thuận Hoà	Thuan Hoa Commune	thuan_hoa	030	10
00925	Tùng Bá	Tung Ba	Xã Tùng Bá	Tung Ba Commune	tung_ba	030	10
00928	Thanh Thủy	Thanh Thuy	Xã Thanh Thủy	Thanh Thuy Commune	thanh_thuy	030	10
00931	Thanh Đức	Thanh Duc	Xã Thanh Đức	Thanh Duc Commune	thanh_duc	030	10
00934	Phong Quang	Phong Quang	Xã Phong Quang	Phong Quang Commune	phong_quang	030	10
00937	Xín Chải	Xin Chai	Xã Xín Chải	Xin Chai Commune	xin_chai	030	10
00940	Phương Tiến	Phuong Tien	Xã Phương Tiến	Phuong Tien Commune	phuong_tien	030	10
00943	Lao Chải	Lao Chai	Xã Lao Chải	Lao Chai Commune	lao_chai	030	10
00952	Cao Bồ	Cao Bo	Xã Cao Bồ	Cao Bo Commune	cao_bo	030	10
00955	Đạo Đức	Dao Duc	Xã Đạo Đức	Dao Duc Commune	dao_duc	030	10
00958	Thượng Sơn	Thuong Son	Xã Thượng Sơn	Thuong Son Commune	thuong_son	030	10
00961	Linh Hồ	Linh Ho	Xã Linh Hồ	Linh Ho Commune	linh_ho	030	10
00964	Quảng Ngần	Quang Ngan	Xã Quảng Ngần	Quang Ngan Commune	quang_ngan	030	10
00967	Việt Lâm	Viet Lam	Xã Việt Lâm	Viet Lam Commune	viet_lam	030	10
00970	Ngọc Linh	Ngoc Linh	Xã Ngọc Linh	Ngoc Linh Commune	ngoc_linh	030	10
00973	Ngọc Minh	Ngoc Minh	Xã Ngọc Minh	Ngoc Minh Commune	ngoc_minh	030	10
00976	Bạch Ngọc	Bach Ngoc	Xã Bạch Ngọc	Bach Ngoc Commune	bach_ngoc	030	10
00979	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	030	10
00982	Minh Sơn	Minh Son	Xã Minh Sơn	Minh Son Commune	minh_son	031	10
00985	Giáp Trung	Giap Trung	Xã Giáp Trung	Giap Trung Commune	giap_trung	031	10
00988	Yên Định	Yen Dinh	Xã Yên Định	Yen Dinh Commune	yen_dinh	031	10
00991	Yên Phú	Yen Phu	Thị trấn Yên Phú	Yen Phu Township	yen_phu	031	9
00994	Minh Ngọc	Minh Ngoc	Xã Minh Ngọc	Minh Ngoc Commune	minh_ngoc	031	10
00997	Yên Phong	Yen Phong	Xã Yên Phong	Yen Phong Commune	yen_phong	031	10
01000	Lạc Nông	Lac Nong	Xã Lạc Nông	Lac Nong Commune	lac_nong	031	10
01003	Phú Nam	Phu Nam	Xã Phú Nam	Phu Nam Commune	phu_nam	031	10
01006	Yên Cường	Yen Cuong	Xã Yên Cường	Yen Cuong Commune	yen_cuong	031	10
01009	Thượng Tân	Thuong Tan	Xã Thượng Tân	Thuong Tan Commune	thuong_tan	031	10
01012	Đường Âm	Duong Am	Xã Đường Âm	Duong Am Commune	duong_am	031	10
01015	Đường Hồng	Duong Hong	Xã Đường Hồng	Duong Hong Commune	duong_hong	031	10
01018	Phiêng Luông	Phieng Luong	Xã Phiêng Luông	Phieng Luong Commune	phieng_luong	031	10
01021	Vinh Quang	Vinh Quang	Thị trấn Vinh Quang	Vinh Quang Township	vinh_quang	032	9
01024	Bản Máy	Ban May	Xã Bản Máy	Ban May Commune	ban_may	032	10
01027	Thàng Tín	Thang Tin	Xã Thàng Tín	Thang Tin Commune	thang_tin	032	10
01030	Thèn Chu Phìn	Then Chu Phin	Xã Thèn Chu Phìn	Then Chu Phin Commune	then_chu_phin	032	10
01033	Pố Lồ	Po Lo	Xã Pố Lồ	Po Lo Commune	po_lo	032	10
01036	Bản Phùng	Ban Phung	Xã Bản Phùng	Ban Phung Commune	ban_phung	032	10
01039	Túng Sán	Tung San	Xã Túng Sán	Tung San Commune	tung_san	032	10
01042	Chiến Phố	Chien Pho	Xã Chiến Phố	Chien Pho Commune	chien_pho	032	10
01045	Đản Ván	Dan Van	Xã Đản Ván	Dan Van Commune	dan_van	032	10
01048	Tụ Nhân	Tu Nhan	Xã Tụ Nhân	Tu Nhan Commune	tu_nhan	032	10
01051	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	032	10
01054	Nàng Đôn	Nang Don	Xã Nàng Đôn	Nang Don Commune	nang_don	032	10
01057	Pờ Ly Ngài	Po Ly Ngai	Xã Pờ Ly Ngài	Po Ly Ngai Commune	po_ly_ngai	032	10
01060	Sán Xả Hồ	San Xa Ho	Xã Sán Xả Hồ	San Xa Ho Commune	san_xa_ho	032	10
01063	Bản Luốc	Ban Luoc	Xã Bản Luốc	Ban Luoc Commune	ban_luoc	032	10
01066	Ngàm Đăng Vài	Ngam Dang Vai	Xã Ngàm Đăng Vài	Ngam Dang Vai Commune	ngam_dang_vai	032	10
01069	Bản Nhùng	Ban Nhung	Xã Bản Nhùng	Ban Nhung Commune	ban_nhung	032	10
01072	Tả Sử Choóng	Ta Su Choong	Xã Tả Sử Choóng	Ta Su Choong Commune	ta_su_choong	032	10
01075	Nậm Dịch	Nam Dich	Xã Nậm Dịch	Nam Dich Commune	nam_dich	032	10
01081	Hồ Thầu	Ho Thau	Xã Hồ Thầu	Ho Thau Commune	ho_thau	032	10
01084	Nam Sơn	Nam Son	Xã Nam Sơn	Nam Son Commune	nam_son	032	10
01087	Nậm Tỵ	Nam Ty	Xã Nậm Tỵ	Nam Ty Commune	nam_ty	032	10
01090	Thông Nguyên	Thong Nguyen	Xã Thông Nguyên	Thong Nguyen Commune	thong_nguyen	032	10
01093	Nậm Khòa	Nam Khoa	Xã Nậm Khòa	Nam Khoa Commune	nam_khoa	032	10
01096	Cốc Pài	Coc Pai	Thị trấn Cốc Pài	Coc Pai Township	coc_pai	033	9
01099	Nàn Xỉn	Nan Xin	Xã Nàn Xỉn	Nan Xin Commune	nan_xin	033	10
01102	Bản Díu	Ban Diu	Xã Bản Díu	Ban Diu Commune	ban_diu	033	10
01105	Chí Cà	Chi Ca	Xã Chí Cà	Chi Ca Commune	chi_ca	033	10
01108	Xín Mần	Xin Man	Xã Xín Mần	Xin Man Commune	xin_man	033	10
01114	Thèn Phàng	Then Phang	Xã Thèn Phàng	Then Phang Commune	then_phang	033	10
01117	Trung Thịnh	Trung Thinh	Xã Trung Thịnh	Trung Thinh Commune	trung_thinh	033	10
01120	Pà Vầy Sủ	Pa Vay Su	Xã Pà Vầy Sủ	Pa Vay Su Commune	pa_vay_su	033	10
01123	Cốc Rế	Coc Re	Xã Cốc Rế	Coc Re Commune	coc_re	033	10
01126	Thu Tà	Thu Ta	Xã Thu Tà	Thu Ta Commune	thu_ta	033	10
01129	Nàn Ma	Nan Ma	Xã Nàn Ma	Nan Ma Commune	nan_ma	033	10
01132	Tả Nhìu	Ta Nhiu	Xã Tả Nhìu	Ta Nhiu Commune	ta_nhiu	033	10
01135	Bản Ngò	Ban Ngo	Xã Bản Ngò	Ban Ngo Commune	ban_ngo	033	10
01138	Chế Là	Che La	Xã Chế Là	Che La Commune	che_la	033	10
01141	Nấm Dẩn	Nam Dan	Xã Nấm Dẩn	Nam Dan Commune	nam_dan	033	10
01144	Quảng Nguyên	Quang Nguyen	Xã Quảng Nguyên	Quang Nguyen Commune	quang_nguyen	033	10
01147	Nà Chì	Na Chi	Xã Nà Chì	Na Chi Commune	na_chi	033	10
01150	Khuôn Lùng	Khuon Lung	Xã Khuôn Lùng	Khuon Lung Commune	khuon_lung	033	10
01153	Việt Quang	Viet Quang	Thị trấn Việt Quang	Viet Quang Township	viet_quang	034	9
01156	Vĩnh Tuy	Vinh Tuy	Thị trấn Vĩnh Tuy	Vinh Tuy Township	vinh_tuy	034	9
01159	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	034	10
01162	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	034	10
01165	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	034	10
01168	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	034	10
01171	Tân Quang	Tan Quang	Xã Tân Quang	Tan Quang Commune	tan_quang	034	10
01174	Thượng Bình	Thuong Binh	Xã Thượng Bình	Thuong Binh Commune	thuong_binh	034	10
01177	Hữu Sản	Huu San	Xã Hữu Sản	Huu San Commune	huu_san	034	10
01180	Kim Ngọc	Kim Ngoc	Xã Kim Ngọc	Kim Ngoc Commune	kim_ngoc	034	10
01183	Việt Vinh	Viet Vinh	Xã Việt Vinh	Viet Vinh Commune	viet_vinh	034	10
01186	Bằng Hành	Bang Hanh	Xã Bằng Hành	Bang Hanh Commune	bang_hanh	034	10
01189	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	034	10
01192	Liên Hiệp	Lien Hiep	Xã Liên Hiệp	Lien Hiep Commune	lien_hiep	034	10
01195	Vô Điếm	Vo Diem	Xã Vô Điếm	Vo Diem Commune	vo_diem	034	10
01198	Việt Hồng	Viet Hong	Xã Việt Hồng	Viet Hong Commune	viet_hong	034	10
01201	Hùng An	Hung An	Xã Hùng An	Hung An Commune	hung_an	034	10
01204	Đức Xuân	Duc Xuan	Xã Đức Xuân	Duc Xuan Commune	duc_xuan	034	10
01207	Tiên Kiều	Tien Kieu	Xã Tiên Kiều	Tien Kieu Commune	tien_kieu	034	10
01210	Vĩnh Hảo	Vinh Hao	Xã Vĩnh Hảo	Vinh Hao Commune	vinh_hao	034	10
01213	Vĩnh Phúc	Vinh Phuc	Xã Vĩnh Phúc	Vinh Phuc Commune	vinh_phuc	034	10
01216	Đồng Yên	Dong Yen	Xã Đồng Yên	Dong Yen Commune	dong_yen	034	10
01219	Đông Thành	Dong Thanh	Xã Đông Thành	Dong Thanh Commune	dong_thanh	034	10
01222	Xuân Minh	Xuan Minh	Xã Xuân Minh	Xuan Minh Commune	xuan_minh	035	10
01225	Tiên Nguyên	Tien Nguyen	Xã Tiên Nguyên	Tien Nguyen Commune	tien_nguyen	035	10
01228	Tân Nam	Tan Nam	Xã Tân Nam	Tan Nam Commune	tan_nam	035	10
01231	Bản Rịa	Ban Ria	Xã Bản Rịa	Ban Ria Commune	ban_ria	035	10
01234	Yên Thành	Yen Thanh	Xã Yên Thành	Yen Thanh Commune	yen_thanh	035	10
01237	Yên Bình	Yen Binh	Thị trấn Yên Bình	Yen Binh Township	yen_binh	035	9
01240	Tân Trịnh	Tan Trinh	Xã Tân Trịnh	Tan Trinh Commune	tan_trinh	035	10
01243	Tân Bắc	Tan Bac	Xã Tân Bắc	Tan Bac Commune	tan_bac	035	10
01246	Bằng Lang	Bang Lang	Xã Bằng Lang	Bang Lang Commune	bang_lang	035	10
01249	Yên Hà	Yen Ha	Xã Yên Hà	Yen Ha Commune	yen_ha	035	10
27340	10	10	Phường 10	10 Ward	10	774	8
01252	Hương Sơn	Huong Son	Xã Hương Sơn	Huong Son Commune	huong_son	035	10
01255	Xuân Giang	Xuan Giang	Xã Xuân Giang	Xuan Giang Commune	xuan_giang	035	10
01258	Nà Khương	Na Khuong	Xã Nà Khương	Na Khuong Commune	na_khuong	035	10
01261	Tiên Yên	Tien Yen	Xã Tiên Yên	Tien Yen Commune	tien_yen	035	10
01264	Vĩ Thượng	Vi Thuong	Xã Vĩ Thượng	Vi Thuong Commune	vi_thuong	035	10
01267	Sông Hiến	Song Hien	Phường Sông Hiến	Song Hien Ward	song_hien	040	8
01270	Sông Bằng	Song Bang	Phường Sông Bằng	Song Bang Ward	song_bang	040	8
01273	Hợp Giang	Hop Giang	Phường Hợp Giang	Hop Giang Ward	hop_giang	040	8
01276	Tân Giang	Tan Giang	Phường Tân Giang	Tan Giang Ward	tan_giang	040	8
01279	Ngọc Xuân	Ngoc Xuan	Phường Ngọc Xuân	Ngoc Xuan Ward	ngoc_xuan	040	8
01282	Đề Thám	De Tham	Phường Đề Thám	De Tham Ward	de_tham	040	8
01285	Hoà Chung	Hoa Chung	Phường Hoà Chung	Hoa Chung Ward	hoa_chung	040	8
01288	Duyệt Trung	Duyet Trung	Phường Duyệt Trung	Duyet Trung Ward	duyet_trung	040	8
01693	Vĩnh Quang	Vinh Quang	Xã Vĩnh Quang	Vinh Quang Commune	vinh_quang	040	10
01705	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	040	10
01720	Chu Trinh	Chu Trinh	Xã Chu Trinh	Chu Trinh Commune	chu_trinh	040	10
01290	Pác Miầu	Pac Miau	Thị trấn Pác Miầu	Pac Miau Township	pac_miau	042	9
01291	Đức Hạnh	Duc Hanh	Xã Đức Hạnh	Duc Hanh Commune	duc_hanh	042	10
01294	Lý Bôn	Ly Bon	Xã Lý Bôn	Ly Bon Commune	ly_bon	042	10
01296	Nam Cao	Nam Cao	Xã Nam Cao	Nam Cao Commune	nam_cao	042	10
01297	Nam Quang	Nam Quang	Xã Nam Quang	Nam Quang Commune	nam_quang	042	10
01300	Vĩnh Quang	Vinh Quang	Xã Vĩnh Quang	Vinh Quang Commune	vinh_quang	042	10
01303	Quảng Lâm	Quang Lam	Xã Quảng Lâm	Quang Lam Commune	quang_lam	042	10
01304	Thạch Lâm	Thach Lam	Xã Thạch Lâm	Thach Lam Commune	thach_lam	042	10
01309	Vĩnh Phong	Vinh Phong	Xã Vĩnh Phong	Vinh Phong Commune	vinh_phong	042	10
01312	Mông Ân	Mong An	Xã Mông Ân	Mong An Commune	mong_an	042	10
01315	Thái Học	Thai Hoc	Xã Thái Học	Thai Hoc Commune	thai_hoc	042	10
01316	Thái Sơn	Thai Son	Xã Thái Sơn	Thai Son Commune	thai_son	042	10
01318	Yên Thổ	Yen Tho	Xã Yên Thổ	Yen Tho Commune	yen_tho	042	10
01321	Bảo Lạc	Bao Lac	Thị trấn Bảo Lạc	Bao Lac Township	bao_lac	043	9
01324	Cốc Pàng	Coc Pang	Xã Cốc Pàng	Coc Pang Commune	coc_pang	043	10
01327	Thượng Hà	Thuong Ha	Xã Thượng Hà	Thuong Ha Commune	thuong_ha	043	10
01330	Cô Ba	Co Ba	Xã Cô Ba	Co Ba Commune	co_ba	043	10
01333	Bảo Toàn	Bao Toan	Xã Bảo Toàn	Bao Toan Commune	bao_toan	043	10
01336	Khánh Xuân	Khanh Xuan	Xã Khánh Xuân	Khanh Xuan Commune	khanh_xuan	043	10
01339	Xuân Trường	Xuan Truong	Xã Xuân Trường	Xuan Truong Commune	xuan_truong	043	10
01342	Hồng Trị	Hong Tri	Xã Hồng Trị	Hong Tri Commune	hong_tri	043	10
01343	Kim Cúc	Kim Cuc	Xã Kim Cúc	Kim Cuc Commune	kim_cuc	043	10
01345	Phan Thanh	Phan Thanh	Xã Phan Thanh	Phan Thanh Commune	phan_thanh	043	10
01348	Hồng An	Hong An	Xã Hồng An	Hong An Commune	hong_an	043	10
01351	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	043	10
01352	Hưng Thịnh	Hung Thinh	Xã Hưng Thịnh	Hung Thinh Commune	hung_thinh	043	10
01354	Huy Giáp	Huy Giap	Xã Huy Giáp	Huy Giap Commune	huy_giap	043	10
01357	Đình Phùng	Dinh Phung	Xã Đình Phùng	Dinh Phung Commune	dinh_phung	043	10
01359	Sơn Lập	Son Lap	Xã Sơn Lập	Son Lap Commune	son_lap	043	10
01360	Sơn Lộ	Son Lo	Xã Sơn Lộ	Son Lo Commune	son_lo	043	10
01363	Thông Nông	Thong Nong	Thị trấn Thông Nông	Thong Nong Township	thong_nong	045	9
01366	Cần Yên	Can Yen	Xã Cần Yên	Can Yen Commune	can_yen	045	10
01367	Cần Nông	Can Nong	Xã Cần Nông	Can Nong Commune	can_nong	045	10
01372	Lương Thông	Luong Thong	Xã Lương Thông	Luong Thong Commune	luong_thong	045	10
01375	Đa Thông	Da Thong	Xã Đa Thông	Da Thong Commune	da_thong	045	10
01378	Ngọc Động	Ngoc Dong	Xã Ngọc Động	Ngoc Dong Commune	ngoc_dong	045	10
01381	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	045	10
01384	Lương Can	Luong Can	Xã Lương Can	Luong Can Commune	luong_can	045	10
01387	Thanh Long	Thanh Long	Xã Thanh Long	Thanh Long Commune	thanh_long	045	10
01392	Xuân Hòa	Xuan Hoa	Thị trấn Xuân Hòa	Xuan Hoa Township	xuan_hoa	045	9
01393	Lũng Nặm	Lung Nam	Xã Lũng Nặm	Lung Nam Commune	lung_nam	045	10
01399	Trường Hà	Truong Ha	Xã Trường Hà	Truong Ha Commune	truong_ha	045	10
01402	Cải Viên	Cai Vien	Xã Cải Viên	Cai Vien Commune	cai_vien	045	10
01411	Nội Thôn	Noi Thon	Xã Nội Thôn	Noi Thon Commune	noi_thon	045	10
01414	Tổng Cọt	Tong Cot	Xã Tổng Cọt	Tong Cot Commune	tong_cot	045	10
01417	Sóc Hà	Soc Ha	Xã Sóc Hà	Soc Ha Commune	soc_ha	045	10
01420	Thượng Thôn	Thuong Thon	Xã Thượng Thôn	Thuong Thon Commune	thuong_thon	045	10
01429	Hồng Sỹ	Hong Sy	Xã Hồng Sỹ	Hong Sy Commune	hong_sy	045	10
01432	Quý Quân	Quy Quan	Xã Quý Quân	Quy Quan Commune	quy_quan	045	10
01435	Mã Ba	Ma Ba	Xã Mã Ba	Ma Ba Commune	ma_ba	045	10
01438	Ngọc Đào	Ngoc Dao	Xã Ngọc Đào	Ngoc Dao Commune	ngoc_dao	045	10
01447	Trà Lĩnh	Tra Linh	Thị trấn Trà Lĩnh	Tra Linh Township	tra_linh	047	9
01453	Tri Phương	Tri Phuong	Xã Tri Phương	Tri Phuong Commune	tri_phuong	047	10
01456	Quang Hán	Quang Han	Xã Quang Hán	Quang Han Commune	quang_han	047	10
01462	Xuân Nội	Xuan Noi	Xã Xuân Nội	Xuan Noi Commune	xuan_noi	047	10
01465	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	047	10
01468	Quang Vinh	Quang Vinh	Xã Quang Vinh	Quang Vinh Commune	quang_vinh	047	10
01471	Cao Chương	Cao Chuong	Xã Cao Chương	Cao Chuong Commune	cao_chuong	047	10
01477	Trùng Khánh	Trung Khanh	Thị trấn Trùng Khánh	Trung Khanh Township	trung_khanh	047	9
01480	Ngọc Khê	Ngoc Khe	Xã Ngọc Khê	Ngoc Khe Commune	ngoc_khe	047	10
01481	Ngọc Côn	Ngoc Con	Xã Ngọc Côn	Ngoc Con Commune	ngoc_con	047	10
01483	Phong Nậm	Phong Nam	Xã Phong Nậm	Phong Nam Commune	phong_nam	047	10
01489	Đình Phong	Dinh Phong	Xã Đình Phong	Dinh Phong Commune	dinh_phong	047	10
01495	Đàm Thuỷ	Dam Thuy	Xã Đàm Thuỷ	Dam Thuy Commune	dam_thuy	047	10
01498	Khâm Thành	Kham Thanh	Xã Khâm Thành	Kham Thanh Commune	kham_thanh	047	10
01501	Chí Viễn	Chi Vien	Xã Chí Viễn	Chi Vien Commune	chi_vien	047	10
01504	Lăng Hiếu	Lang Hieu	Xã Lăng Hiếu	Lang Hieu Commune	lang_hieu	047	10
01507	Phong Châu	Phong Chau	Xã Phong Châu	Phong Chau Commune	phong_chau	047	10
01516	Trung Phúc	Trung Phuc	Xã Trung Phúc	Trung Phuc Commune	trung_phuc	047	10
01519	Cao Thăng	Cao Thang	Xã Cao Thăng	Cao Thang Commune	cao_thang	047	10
01522	Đức Hồng	Duc Hong	Xã Đức Hồng	Duc Hong Commune	duc_hong	047	10
01525	Đoài Dương	Doai Duong	Xã Đoài Dương	Doai Duong Commune	doai_duong	047	10
01534	Minh Long	Minh Long	Xã Minh Long	Minh Long Commune	minh_long	048	10
01537	Lý Quốc	Ly Quoc	Xã Lý Quốc	Ly Quoc Commune	ly_quoc	048	10
01540	Thắng Lợi	Thang Loi	Xã Thắng Lợi	Thang Loi Commune	thang_loi	048	10
01543	Đồng Loan	Dong Loan	Xã Đồng Loan	Dong Loan Commune	dong_loan	048	10
01546	Đức Quang	Duc Quang	Xã Đức Quang	Duc Quang Commune	duc_quang	048	10
01549	Kim Loan	Kim Loan	Xã Kim Loan	Kim Loan Commune	kim_loan	048	10
01552	Quang Long	Quang Long	Xã Quang Long	Quang Long Commune	quang_long	048	10
01555	An Lạc	An Lac	Xã An Lạc	An Lac Commune	an_lac	048	10
01558	Thanh Nhật	Thanh Nhat	Thị trấn Thanh Nhật	Thanh Nhat Township	thanh_nhat	048	9
01561	Vinh Quý	Vinh Quy	Xã Vinh Quý	Vinh Quy Commune	vinh_quy	048	10
01564	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	048	10
01567	Cô Ngân	Co Ngan	Xã Cô Ngân	Co Ngan Commune	co_ngan	048	10
01573	Thị Hoa	Thi Hoa	Xã Thị Hoa	Thi Hoa Commune	thi_hoa	048	10
01474	Quốc Toản	Quoc Toan	Xã Quốc Toản	Quoc Toan Commune	quoc_toan	049	10
01576	Quảng Uyên	Quang Uyen	Thị trấn Quảng Uyên	Quang Uyen Township	quang_uyen	049	9
01579	Phi Hải	Phi Hai	Xã Phi Hải	Phi Hai Commune	phi_hai	049	10
01582	Quảng Hưng	Quang Hung	Xã Quảng Hưng	Quang Hung Commune	quang_hung	049	10
01594	Độc Lập	Doc Lap	Xã Độc Lập	Doc Lap Commune	doc_lap	049	10
01597	Cai Bộ	Cai Bo	Xã Cai Bộ	Cai Bo Commune	cai_bo	049	10
01603	Phúc Sen	Phuc Sen	Xã Phúc Sen	Phuc Sen Commune	phuc_sen	049	10
01606	Chí Thảo	Chi Thao	Xã Chí Thảo	Chi Thao Commune	chi_thao	049	10
01609	Tự Do	Tu Do	Xã Tự Do	Tu Do Commune	tu_do	049	10
01615	Hồng Quang	Hong Quang	Xã Hồng Quang	Hong Quang Commune	hong_quang	049	10
01618	Ngọc Động	Ngoc Dong	Xã Ngọc Động	Ngoc Dong Commune	ngoc_dong	049	10
01624	Hạnh Phúc	Hanh Phuc	Xã Hạnh Phúc	Hanh Phuc Commune	hanh_phuc	049	10
01627	Tà Lùng	Ta Lung	Thị trấn Tà Lùng	Ta Lung Township	ta_lung	049	9
01630	Bế Văn Đàn	Be Van Dan	Xã Bế Văn Đàn	Be Van Dan Commune	be_van_dan	049	10
01636	Cách Linh	Cach Linh	Xã Cách Linh	Cach Linh Commune	cach_linh	049	10
01639	Đại Sơn	Dai Son	Xã Đại Sơn	Dai Son Commune	dai_son	049	10
01645	Tiên Thành	Tien Thanh	Xã Tiên Thành	Tien Thanh Commune	tien_thanh	049	10
01648	Hoà Thuận	Hoa Thuan	Thị trấn Hoà Thuận	Hoa Thuan Township	hoa_thuan	049	9
01651	Mỹ Hưng	My Hung	Xã Mỹ Hưng	My Hung Commune	my_hung	049	10
01654	Nước Hai	Nuoc Hai	Thị trấn Nước Hai	Nuoc Hai Township	nuoc_hai	051	9
01657	Dân Chủ	Dan Chu	Xã Dân Chủ	Dan Chu Commune	dan_chu	051	10
01660	Nam Tuấn	Nam Tuan	Xã Nam Tuấn	Nam Tuan Commune	nam_tuan	051	10
01666	Đại Tiến	Dai Tien	Xã Đại Tiến	Dai Tien Commune	dai_tien	051	10
01669	Đức Long	Duc Long	Xã Đức Long	Duc Long Commune	duc_long	051	10
01672	Ngũ Lão	Ngu Lao	Xã Ngũ Lão	Ngu Lao Commune	ngu_lao	051	10
01675	Trương Lương	Truong Luong	Xã Trương Lương	Truong Luong Commune	truong_luong	051	10
01687	Hồng Việt	Hong Viet	Xã Hồng Việt	Hong Viet Commune	hong_viet	051	10
01696	Hoàng Tung	Hoang Tung	Xã Hoàng Tung	Hoang Tung Commune	hoang_tung	051	10
01699	Nguyễn Huệ	Nguyen Hue	Xã Nguyễn Huệ	Nguyen Hue Commune	nguyen_hue	051	10
01702	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	051	10
01708	Bạch Đằng	Bach Dang	Xã Bạch Đằng	Bach Dang Commune	bach_dang	051	10
01711	Bình Dương	Binh Duong	Xã Bình Dương	Binh Duong Commune	binh_duong	051	10
01714	Lê Chung	Le Chung	Xã Lê Chung	Le Chung Commune	le_chung	051	10
01723	Hồng Nam	Hong Nam	Xã Hồng Nam	Hong Nam Commune	hong_nam	051	10
01726	Nguyên Bình	Nguyen Binh	Thị trấn Nguyên Bình	Nguyen Binh Township	nguyen_binh	052	9
01729	Tĩnh Túc	Tinh Tuc	Thị trấn Tĩnh Túc	Tinh Tuc Township	tinh_tuc	052	9
01732	Yên Lạc	Yen Lac	Xã Yên Lạc	Yen Lac Commune	yen_lac	052	10
01735	Triệu Nguyên	Trieu Nguyen	Xã Triệu Nguyên	Trieu Nguyen Commune	trieu_nguyen	052	10
01738	Ca Thành	Ca Thanh	Xã Ca Thành	Ca Thanh Commune	ca_thanh	052	10
01744	Vũ Nông	Vu Nong	Xã Vũ Nông	Vu Nong Commune	vu_nong	052	10
01747	Minh Tâm	Minh Tam	Xã Minh Tâm	Minh Tam Commune	minh_tam	052	10
01750	Thể Dục	The Duc	Xã Thể Dục	The Duc Commune	the_duc	052	10
01756	Mai Long	Mai Long	Xã Mai Long	Mai Long Commune	mai_long	052	10
01762	Vũ Minh	Vu Minh	Xã Vũ Minh	Vu Minh Commune	vu_minh	052	10
01765	Hoa Thám	Hoa Tham	Xã Hoa Thám	Hoa Tham Commune	hoa_tham	052	10
01768	Phan Thanh	Phan Thanh	Xã Phan Thanh	Phan Thanh Commune	phan_thanh	052	10
01771	Quang Thành	Quang Thanh	Xã Quang Thành	Quang Thanh Commune	quang_thanh	052	10
01774	Tam Kim	Tam Kim	Xã Tam Kim	Tam Kim Commune	tam_kim	052	10
01777	Thành Công	Thanh Cong	Xã Thành Công	Thanh Cong Commune	thanh_cong	052	10
01780	Thịnh Vượng	Thinh Vuong	Xã Thịnh Vượng	Thinh Vuong Commune	thinh_vuong	052	10
01783	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	052	10
01786	Đông Khê	Dong Khe	Thị trấn Đông Khê	Dong Khe Township	dong_khe	053	9
01789	Canh Tân	Canh Tan	Xã Canh Tân	Canh Tan Commune	canh_tan	053	10
01792	Kim Đồng	Kim Dong	Xã Kim Đồng	Kim Dong Commune	kim_dong	053	10
01795	Minh Khai	Minh Khai	Xã Minh Khai	Minh Khai Commune	minh_khai	053	10
01801	Đức Thông	Duc Thong	Xã Đức Thông	Duc Thong Commune	duc_thong	053	10
01804	Thái Cường	Thai Cuong	Xã Thái Cường	Thai Cuong Commune	thai_cuong	053	10
01807	Vân Trình	Van Trinh	Xã Vân Trình	Van Trinh Commune	van_trinh	053	10
01810	Thụy Hùng	Thuy Hung	Xã Thụy Hùng	Thuy Hung Commune	thuy_hung	053	10
01813	Quang Trọng	Quang Trong	Xã Quang Trọng	Quang Trong Commune	quang_trong	053	10
01816	Trọng Con	Trong Con	Xã Trọng Con	Trong Con Commune	trong_con	053	10
01819	Lê Lai	Le Lai	Xã Lê Lai	Le Lai Commune	le_lai	053	10
01822	Đức Long	Duc Long	Xã Đức Long	Duc Long Commune	duc_long	053	10
01828	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	053	10
01831	Đức Xuân	Duc Xuan	Xã Đức Xuân	Duc Xuan Commune	duc_xuan	053	10
01834	Nguyễn Thị Minh Khai	Nguyen Thi Minh Khai	Phường Nguyễn Thị Minh Khai	Nguyen Thi Minh Khai Ward	nguyen_thi_minh_khai	058	8
01837	Sông Cầu	Song Cau	Phường Sông Cầu	Song Cau Ward	song_cau	058	8
01840	Đức Xuân	Duc Xuan	Phường Đức Xuân	Duc Xuan Ward	duc_xuan	058	8
01843	Phùng Chí Kiên	Phung Chi Kien	Phường Phùng Chí Kiên	Phung Chi Kien Ward	phung_chi_kien	058	8
01846	Huyền Tụng	Huyen Tung	Phường Huyền Tụng	Huyen Tung Ward	huyen_tung	058	8
01849	Dương Quang	Duong Quang	Xã Dương Quang	Duong Quang Commune	duong_quang	058	10
01852	Nông Thượng	Nong Thuong	Xã Nông Thượng	Nong Thuong Commune	nong_thuong	058	10
01855	Xuất Hóa	Xuat Hoa	Phường Xuất Hóa	Xuat Hoa Ward	xuat_hoa	058	8
01858	Bằng Thành	Bang Thanh	Xã Bằng Thành	Bang Thanh Commune	bang_thanh	060	10
01861	Nhạn Môn	Nhan Mon	Xã Nhạn Môn	Nhan Mon Commune	nhan_mon	060	10
01864	Bộc Bố	Boc Bo	Xã Bộc Bố	Boc Bo Commune	boc_bo	060	10
01867	Công Bằng	Cong Bang	Xã Công Bằng	Cong Bang Commune	cong_bang	060	10
01870	Giáo Hiệu	Giao Hieu	Xã Giáo Hiệu	Giao Hieu Commune	giao_hieu	060	10
01873	Xuân La	Xuan La	Xã Xuân La	Xuan La Commune	xuan_la	060	10
01876	An Thắng	An Thang	Xã An Thắng	An Thang Commune	an_thang	060	10
01879	Cổ Linh	Co Linh	Xã Cổ Linh	Co Linh Commune	co_linh	060	10
01882	Nghiên Loan	Nghien Loan	Xã Nghiên Loan	Nghien Loan Commune	nghien_loan	060	10
01885	Cao Tân	Cao Tan	Xã Cao Tân	Cao Tan Commune	cao_tan	060	10
01888	Chợ Rã	Cho Ra	Thị trấn Chợ Rã	Cho Ra Township	cho_ra	061	9
01891	Bành Trạch	Banh Trach	Xã Bành Trạch	Banh Trach Commune	banh_trach	061	10
01894	Phúc Lộc	Phuc Loc	Xã Phúc Lộc	Phuc Loc Commune	phuc_loc	061	10
01897	Hà Hiệu	Ha Hieu	Xã Hà Hiệu	Ha Hieu Commune	ha_hieu	061	10
01900	Cao Thượng	Cao Thuong	Xã Cao Thượng	Cao Thuong Commune	cao_thuong	061	10
01906	Khang Ninh	Khang Ninh	Xã Khang Ninh	Khang Ninh Commune	khang_ninh	061	10
01909	Nam Mẫu	Nam Mau	Xã Nam Mẫu	Nam Mau Commune	nam_mau	061	10
01912	Thượng Giáo	Thuong Giao	Xã Thượng Giáo	Thuong Giao Commune	thuong_giao	061	10
01915	Địa Linh	Dia Linh	Xã Địa Linh	Dia Linh Commune	dia_linh	061	10
01918	Yến Dương	Yen Duong	Xã Yến Dương	Yen Duong Commune	yen_duong	061	10
01921	Chu Hương	Chu Huong	Xã Chu Hương	Chu Huong Commune	chu_huong	061	10
01924	Quảng Khê	Quang Khe	Xã Quảng Khê	Quang Khe Commune	quang_khe	061	10
01927	Mỹ Phương	My Phuong	Xã Mỹ Phương	My Phuong Commune	my_phuong	061	10
01930	Hoàng Trĩ	Hoang Tri	Xã Hoàng Trĩ	Hoang Tri Commune	hoang_tri	061	10
01933	Đồng Phúc	Dong Phuc	Xã Đồng Phúc	Dong Phuc Commune	dong_phuc	061	10
01936	Nà Phặc	Na Phac	Thị trấn Nà Phặc	Na Phac Township	na_phac	062	9
01939	Thượng Ân	Thuong An	Xã Thượng Ân	Thuong An Commune	thuong_an	062	10
01942	Bằng Vân	Bang Van	Xã Bằng Vân	Bang Van Commune	bang_van	062	10
01945	Cốc Đán	Coc Dan	Xã Cốc Đán	Coc Dan Commune	coc_dan	062	10
01948	Trung Hoà	Trung Hoa	Xã Trung Hoà	Trung Hoa Commune	trung_hoa	062	10
01951	Đức Vân	Duc Van	Xã Đức Vân	Duc Van Commune	duc_van	062	10
01954	Vân Tùng	Van Tung	Xã Vân Tùng	Van Tung Commune	van_tung	062	10
01957	Thượng Quan	Thuong Quan	Xã Thượng Quan	Thuong Quan Commune	thuong_quan	062	10
01960	Hiệp Lực	Hiep Luc	Xã Hiệp Lực	Hiep Luc Commune	hiep_luc	062	10
01963	Thuần Mang	Thuan Mang	Xã Thuần Mang	Thuan Mang Commune	thuan_mang	062	10
01969	Phủ Thông	Phu Thong	Thị trấn Phủ Thông	Phu Thong Township	phu_thong	063	9
01975	Vi Hương	Vi Huong	Xã Vi Hương	Vi Huong Commune	vi_huong	063	10
01978	Sĩ Bình	Si Binh	Xã Sĩ Bình	Si Binh Commune	si_binh	063	10
01981	Vũ Muộn	Vu Muon	Xã Vũ Muộn	Vu Muon Commune	vu_muon	063	10
01984	Đôn Phong	Don Phong	Xã Đôn Phong	Don Phong Commune	don_phong	063	10
01990	Lục Bình	Luc Binh	Xã Lục Bình	Luc Binh Commune	luc_binh	063	10
01993	Tân Tú	Tan Tu	Xã Tân Tú	Tan Tu Commune	tan_tu	063	10
01999	Nguyên Phúc	Nguyen Phuc	Xã Nguyên Phúc	Nguyen Phuc Commune	nguyen_phuc	063	10
02002	Cao Sơn	Cao Son	Xã Cao Sơn	Cao Son Commune	cao_son	063	10
02005	Quân Hà	Quan Ha	Xã Quân Hà	Quan Ha Commune	quan_ha	063	10
02008	Cẩm Giàng	Cam Giang	Xã Cẩm Giàng	Cam Giang Commune	cam_giang	063	10
02011	Mỹ Thanh	My Thanh	Xã Mỹ Thanh	My Thanh Commune	my_thanh	063	10
02014	Dương Phong	Duong Phong	Xã Dương Phong	Duong Phong Commune	duong_phong	063	10
02017	Quang Thuận	Quang Thuan	Xã Quang Thuận	Quang Thuan Commune	quang_thuan	063	10
02020	Bằng Lũng	Bang Lung	Thị trấn Bằng Lũng	Bang Lung Township	bang_lung	064	9
02023	Xuân Lạc	Xuan Lac	Xã Xuân Lạc	Xuan Lac Commune	xuan_lac	064	10
02026	Nam Cường	Nam Cuong	Xã Nam Cường	Nam Cuong Commune	nam_cuong	064	10
02029	Đồng Lạc	Dong Lac	Xã Đồng Lạc	Dong Lac Commune	dong_lac	064	10
02032	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	064	10
02035	Bản Thi	Ban Thi	Xã Bản Thi	Ban Thi Commune	ban_thi	064	10
02038	Quảng Bạch	Quang Bach	Xã Quảng Bạch	Quang Bach Commune	quang_bach	064	10
02041	Bằng Phúc	Bang Phuc	Xã Bằng Phúc	Bang Phuc Commune	bang_phuc	064	10
02044	Yên Thịnh	Yen Thinh	Xã Yên Thịnh	Yen Thinh Commune	yen_thinh	064	10
02047	Yên Thượng	Yen Thuong	Xã Yên Thượng	Yen Thuong Commune	yen_thuong	064	10
02050	Phương Viên	Phuong Vien	Xã Phương Viên	Phuong Vien Commune	phuong_vien	064	10
02053	Ngọc Phái	Ngoc Phai	Xã Ngọc Phái	Ngoc Phai Commune	ngoc_phai	064	10
02059	Đồng Thắng	Dong Thang	Xã Đồng Thắng	Dong Thang Commune	dong_thang	064	10
02062	Lương Bằng	Luong Bang	Xã Lương Bằng	Luong Bang Commune	luong_bang	064	10
02065	Bằng Lãng	Bang Lang	Xã Bằng Lãng	Bang Lang Commune	bang_lang	064	10
02068	Đại Sảo	Dai Sao	Xã Đại Sảo	Dai Sao Commune	dai_sao	064	10
02071	Nghĩa Tá	Nghia Ta	Xã Nghĩa Tá	Nghia Ta Commune	nghia_ta	064	10
02077	Yên Mỹ	Yen My	Xã Yên Mỹ	Yen My Commune	yen_my	064	10
02080	Bình Trung	Binh Trung	Xã Bình Trung	Binh Trung Commune	binh_trung	064	10
02083	Yên Phong	Yen Phong	Xã Yên Phong	Yen Phong Commune	yen_phong	064	10
02086	Đồng Tâm	Dong Tam	Thị trấn Đồng Tâm	Dong Tam Township	dong_tam	065	9
02089	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	065	10
02092	Thanh Vận	Thanh Van	Xã Thanh Vận	Thanh Van Commune	thanh_van	065	10
02095	Mai Lạp	Mai Lap	Xã Mai Lạp	Mai Lap Commune	mai_lap	065	10
02098	Hoà Mục	Hoa Muc	Xã Hoà Mục	Hoa Muc Commune	hoa_muc	065	10
02101	Thanh Mai	Thanh Mai	Xã Thanh Mai	Thanh Mai Commune	thanh_mai	065	10
02104	Cao Kỳ	Cao Ky	Xã Cao Kỳ	Cao Ky Commune	cao_ky	065	10
02107	Nông Hạ	Nong Ha	Xã Nông Hạ	Nong Ha Commune	nong_ha	065	10
02110	Yên Cư	Yen Cu	Xã Yên Cư	Yen Cu Commune	yen_cu	065	10
02113	Thanh Thịnh	Thanh Thinh	Xã Thanh Thịnh	Thanh Thinh Commune	thanh_thinh	065	10
02116	Yên Hân	Yen Han	Xã Yên Hân	Yen Han Commune	yen_han	065	10
02122	Như Cố	Nhu Co	Xã Như Cố	Nhu Co Commune	nhu_co	065	10
02125	Bình Văn	Binh Van	Xã Bình Văn	Binh Van Commune	binh_van	065	10
02131	Quảng Chu	Quang Chu	Xã Quảng Chu	Quang Chu Commune	quang_chu	065	10
02137	Văn Vũ	Van Vu	Xã Văn Vũ	Van Vu Commune	van_vu	066	10
02140	Văn Lang	Van Lang	Xã Văn Lang	Van Lang Commune	van_lang	066	10
02143	Lương Thượng	Luong Thuong	Xã Lương Thượng	Luong Thuong Commune	luong_thuong	066	10
02146	Kim Hỷ	Kim Hy	Xã Kim Hỷ	Kim Hy Commune	kim_hy	066	10
02152	Cường Lợi	Cuong Loi	Xã Cường Lợi	Cuong Loi Commune	cuong_loi	066	10
02155	Yến Lạc	Yen Lac	Thị trấn Yến Lạc	Yen Lac Township	yen_lac	066	9
02158	Kim Lư	Kim Lu	Xã Kim Lư	Kim Lu Commune	kim_lu	066	10
02161	Sơn Thành	Son Thanh	Xã Sơn Thành	Son Thanh Commune	son_thanh	066	10
02170	Văn Minh	Van Minh	Xã Văn Minh	Van Minh Commune	van_minh	066	10
02173	Côn Minh	Con Minh	Xã Côn Minh	Con Minh Commune	con_minh	066	10
02176	Cư Lễ	Cu Le	Xã Cư Lễ	Cu Le Commune	cu_le	066	10
02179	Trần Phú	Tran Phu	Xã Trần Phú	Tran Phu Commune	tran_phu	066	10
02185	Quang Phong	Quang Phong	Xã Quang Phong	Quang Phong Commune	quang_phong	066	10
02188	Dương Sơn	Duong Son	Xã Dương Sơn	Duong Son Commune	duong_son	066	10
02191	Xuân Dương	Xuan Duong	Xã Xuân Dương	Xuan Duong Commune	xuan_duong	066	10
02194	Đổng Xá	Dong Xa	Xã Đổng Xá	Dong Xa Commune	dong_xa	066	10
02197	Liêm Thuỷ	Liem Thuy	Xã Liêm Thuỷ	Liem Thuy Commune	liem_thuy	066	10
02200	Phan Thiết	Phan Thiet	Phường Phan Thiết	Phan Thiet Ward	phan_thiet	070	8
02203	Minh Xuân	Minh Xuan	Phường Minh Xuân	Minh Xuan Ward	minh_xuan	070	8
02206	Tân Quang	Tan Quang	Phường Tân Quang	Tan Quang Ward	tan_quang	070	8
02209	Tràng Đà	Trang Da	Xã Tràng Đà	Trang Da Commune	trang_da	070	10
02212	Nông Tiến	Nong Tien	Phường Nông Tiến	Nong Tien Ward	nong_tien	070	8
02215	Ỷ La	Y La	Phường Ỷ La	Y La Ward	y_la	070	8
02216	Tân Hà	Tan Ha	Phường Tân Hà	Tan Ha Ward	tan_ha	070	8
02218	Hưng Thành	Hung Thanh	Phường Hưng Thành	Hung Thanh Ward	hung_thanh	070	8
02497	Kim Phú	Kim Phu	Xã Kim Phú	Kim Phu Commune	kim_phu	070	10
02503	An Khang	An Khang	Xã An Khang	An Khang Commune	an_khang	070	10
02509	Mỹ Lâm	My Lam	Phường Mỹ Lâm	My Lam Ward	my_lam	070	8
02512	An Tường	An Tuong	Phường An Tường	An Tuong Ward	an_tuong	070	8
02515	Lưỡng Vượng	Luong Vuong	Xã Lưỡng Vượng	Luong Vuong Commune	luong_vuong	070	10
02521	Thái Long	Thai Long	Xã Thái Long	Thai Long Commune	thai_long	070	10
02524	Đội Cấn	Doi Can	Phường Đội Cấn	Doi Can Ward	doi_can	070	8
02233	Phúc Yên	Phuc Yen	Xã Phúc Yên	Phuc Yen Commune	phuc_yen	071	10
02242	Xuân Lập	Xuan Lap	Xã Xuân Lập	Xuan Lap Commune	xuan_lap	071	10
02251	Khuôn Hà	Khuon Ha	Xã Khuôn Hà	Khuon Ha Commune	khuon_ha	071	10
02266	Lăng Can	Lang Can	Thị trấn Lăng Can	Lang Can Township	lang_can	071	9
02269	Thượng Lâm	Thuong Lam	Xã Thượng Lâm	Thuong Lam Commune	thuong_lam	071	10
02290	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	071	10
02293	Hồng Quang	Hong Quang	Xã Hồng Quang	Hong Quang Commune	hong_quang	071	10
02296	Thổ Bình	Tho Binh	Xã Thổ Bình	Tho Binh Commune	tho_binh	071	10
02299	Phúc Sơn	Phuc Son	Xã Phúc Sơn	Phuc Son Commune	phuc_son	071	10
02302	Minh Quang	Minh Quang	Xã Minh Quang	Minh Quang Commune	minh_quang	071	10
02221	Na Hang	Na Hang	Thị trấn Na Hang	Na Hang Township	na_hang	072	9
02227	Sinh Long	Sinh Long	Xã Sinh Long	Sinh Long Commune	sinh_long	072	10
02230	Thượng Giáp	Thuong Giap	Xã Thượng Giáp	Thuong Giap Commune	thuong_giap	072	10
02239	Thượng Nông	Thuong Nong	Xã Thượng Nông	Thuong Nong Commune	thuong_nong	072	10
02245	Côn Lôn	Con Lon	Xã Côn Lôn	Con Lon Commune	con_lon	072	10
02248	Yên Hoa	Yen Hoa	Xã Yên Hoa	Yen Hoa Commune	yen_hoa	072	10
02254	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	072	10
02260	Đà Vị	Da Vi	Xã Đà Vị	Da Vi Commune	da_vi	072	10
02263	Khau Tinh	Khau Tinh	Xã Khau Tinh	Khau Tinh Commune	khau_tinh	072	10
02275	Sơn Phú	Son Phu	Xã Sơn Phú	Son Phu Commune	son_phu	072	10
02281	Năng Khả	Nang Kha	Xã Năng Khả	Nang Kha Commune	nang_kha	072	10
02284	Thanh Tương	Thanh Tuong	Xã Thanh Tương	Thanh Tuong Commune	thanh_tuong	072	10
02287	Vĩnh Lộc	Vinh Loc	Thị trấn Vĩnh Lộc	Vinh Loc Township	vinh_loc	073	9
02305	Trung Hà	Trung Ha	Xã Trung Hà	Trung Ha Commune	trung_ha	073	10
02308	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	073	10
02311	Hà Lang	Ha Lang	Xã Hà Lang	Ha Lang Commune	ha_lang	073	10
02314	Hùng Mỹ	Hung My	Xã Hùng Mỹ	Hung My Commune	hung_my	073	10
02317	Yên Lập	Yen Lap	Xã Yên Lập	Yen Lap Commune	yen_lap	073	10
02320	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	073	10
02323	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	073	10
02326	Xuân Quang	Xuan Quang	Xã Xuân Quang	Xuan Quang Commune	xuan_quang	073	10
02329	Ngọc Hội	Ngoc Hoi	Xã Ngọc Hội	Ngoc Hoi Commune	ngoc_hoi	073	10
02332	Phú Bình	Phu Binh	Xã Phú Bình	Phu Binh Commune	phu_binh	073	10
02335	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	073	10
02338	Phúc Thịnh	Phuc Thinh	Xã Phúc Thịnh	Phuc Thinh Commune	phuc_thinh	073	10
02341	Kiên Đài	Kien Dai	Xã Kiên Đài	Kien Dai Commune	kien_dai	073	10
02344	Tân Thịnh	Tan Thinh	Xã Tân Thịnh	Tan Thinh Commune	tan_thinh	073	10
02347	Trung Hòa	Trung Hoa	Xã Trung Hòa	Trung Hoa Commune	trung_hoa	073	10
02350	Kim Bình	Kim Binh	Xã Kim Bình	Kim Binh Commune	kim_binh	073	10
02353	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	073	10
02356	Vinh Quang	Vinh Quang	Xã Vinh Quang	Vinh Quang Commune	vinh_quang	073	10
02359	Tri Phú	Tri Phu	Xã Tri Phú	Tri Phu Commune	tri_phu	073	10
02362	Nhân Lý	Nhan Ly	Xã Nhân Lý	Nhan Ly Commune	nhan_ly	073	10
02365	Yên Nguyên	Yen Nguyen	Xã Yên Nguyên	Yen Nguyen Commune	yen_nguyen	073	10
02368	Linh Phú	Linh Phu	Xã Linh Phú	Linh Phu Commune	linh_phu	073	10
02371	Bình Nhân	Binh Nhan	Xã Bình Nhân	Binh Nhan Commune	binh_nhan	073	10
02374	Tân Yên	Tan Yen	Thị trấn Tân Yên	Tan Yen Township	tan_yen	074	9
02377	Yên Thuận	Yen Thuan	Xã Yên Thuận	Yen Thuan Commune	yen_thuan	074	10
02380	Bạch Xa	Bach Xa	Xã Bạch Xa	Bach Xa Commune	bach_xa	074	10
02383	Minh Khương	Minh Khuong	Xã Minh Khương	Minh Khuong Commune	minh_khuong	074	10
02386	Yên Lâm	Yen Lam	Xã Yên Lâm	Yen Lam Commune	yen_lam	074	10
02389	Minh Dân	Minh Dan	Xã Minh Dân	Minh Dan Commune	minh_dan	074	10
02392	Phù Lưu	Phu Luu	Xã Phù Lưu	Phu Luu Commune	phu_luu	074	10
02395	Minh Hương	Minh Huong	Xã Minh Hương	Minh Huong Commune	minh_huong	074	10
02398	Yên Phú	Yen Phu	Xã Yên Phú	Yen Phu Commune	yen_phu	074	10
02401	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	074	10
02404	Bình Xa	Binh Xa	Xã Bình Xa	Binh Xa Commune	binh_xa	074	10
02407	Thái Sơn	Thai Son	Xã Thái Sơn	Thai Son Commune	thai_son	074	10
02410	Nhân Mục	Nhan Muc	Xã Nhân Mục	Nhan Muc Commune	nhan_muc	074	10
02413	Thành Long	Thanh Long	Xã Thành Long	Thanh Long Commune	thanh_long	074	10
02416	Bằng Cốc	Bang Coc	Xã Bằng Cốc	Bang Coc Commune	bang_coc	074	10
02419	Thái Hòa	Thai Hoa	Xã Thái Hòa	Thai Hoa Commune	thai_hoa	074	10
02422	Đức Ninh	Duc Ninh	Xã Đức Ninh	Duc Ninh Commune	duc_ninh	074	10
02425	Hùng Đức	Hung Duc	Xã Hùng Đức	Hung Duc Commune	hung_duc	074	10
02431	Quí Quân	Qui Quan	Xã Quí Quân	Qui Quan Commune	qui_quan	075	10
02434	Lực Hành	Luc Hanh	Xã Lực Hành	Luc Hanh Commune	luc_hanh	075	10
02437	Kiến Thiết	Kien Thiet	Xã Kiến Thiết	Kien Thiet Commune	kien_thiet	075	10
02440	Trung Minh	Trung Minh	Xã Trung Minh	Trung Minh Commune	trung_minh	075	10
02443	Chiêu Yên	Chieu Yen	Xã Chiêu Yên	Chieu Yen Commune	chieu_yen	075	10
02446	Trung Trực	Trung Truc	Xã Trung Trực	Trung Truc Commune	trung_truc	075	10
02449	Xuân Vân	Xuan Van	Xã Xuân Vân	Xuan Van Commune	xuan_van	075	10
02452	Phúc Ninh	Phuc Ninh	Xã Phúc Ninh	Phuc Ninh Commune	phuc_ninh	075	10
02455	Hùng Lợi	Hung Loi	Xã Hùng Lợi	Hung Loi Commune	hung_loi	075	10
02458	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	075	10
02461	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	075	10
02464	Tứ Quận	Tu Quan	Xã Tứ Quận	Tu Quan Commune	tu_quan	075	10
02467	Đạo Viện	Dao Vien	Xã Đạo Viện	Dao Vien Commune	dao_vien	075	10
02470	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	075	10
02473	Yên Sơn	Yen Son	Thị trấn Yên Sơn	Yen Son Township	yen_son	075	9
02476	Kim Quan	Kim Quan	Xã Kim Quan	Kim Quan Commune	kim_quan	075	10
02479	Lang Quán	Lang Quan	Xã Lang Quán	Lang Quan Commune	lang_quan	075	10
02482	Phú Thịnh	Phu Thinh	Xã Phú Thịnh	Phu Thinh Commune	phu_thinh	075	10
02485	Công Đa	Cong Da	Xã Công Đa	Cong Da Commune	cong_da	075	10
02488	Trung Môn	Trung Mon	Xã Trung Môn	Trung Mon Commune	trung_mon	075	10
02491	Chân Sơn	Chan Son	Xã Chân Sơn	Chan Son Commune	chan_son	075	10
02494	Thái Bình	Thai Binh	Xã Thái Bình	Thai Binh Commune	thai_binh	075	10
02500	Tiến Bộ	Tien Bo	Xã Tiến Bộ	Tien Bo Commune	tien_bo	075	10
02506	Mỹ Bằng	My Bang	Xã Mỹ Bằng	My Bang Commune	my_bang	075	10
02518	Hoàng Khai	Hoang Khai	Xã Hoàng Khai	Hoang Khai Commune	hoang_khai	075	10
02527	Nhữ Hán	Nhu Han	Xã Nhữ Hán	Nhu Han Commune	nhu_han	075	10
02530	Nhữ Khê	Nhu Khe	Xã Nhữ Khê	Nhu Khe Commune	nhu_khe	075	10
02533	Đội Bình	Doi Binh	Xã Đội Bình	Doi Binh Commune	doi_binh	075	10
02536	Sơn Dương	Son Duong	Thị trấn Sơn Dương	Son Duong Township	son_duong	076	9
02539	Trung Yên	Trung Yen	Xã Trung Yên	Trung Yen Commune	trung_yen	076	10
02542	Minh Thanh	Minh Thanh	Xã Minh Thanh	Minh Thanh Commune	minh_thanh	076	10
02545	Tân Trào	Tan Trao	Xã Tân Trào	Tan Trao Commune	tan_trao	076	10
02548	Vĩnh Lợi	Vinh Loi	Xã Vĩnh Lợi	Vinh Loi Commune	vinh_loi	076	10
02551	Thượng Ấm	Thuong Am	Xã Thượng Ấm	Thuong Am Commune	thuong_am	076	10
02554	Bình Yên	Binh Yen	Xã Bình Yên	Binh Yen Commune	binh_yen	076	10
02557	Lương Thiện	Luong Thien	Xã Lương Thiện	Luong Thien Commune	luong_thien	076	10
02560	Tú Thịnh	Tu Thinh	Xã Tú Thịnh	Tu Thinh Commune	tu_thinh	076	10
02563	Cấp Tiến	Cap Tien	Xã Cấp Tiến	Cap Tien Commune	cap_tien	076	10
02566	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	076	10
02569	Phúc Ứng	Phuc Ung	Xã Phúc Ứng	Phuc Ung Commune	phuc_ung	076	10
02572	Đông Thọ	Dong Tho	Xã Đông Thọ	Dong Tho Commune	dong_tho	076	10
02575	Kháng Nhật	Khang Nhat	Xã Kháng Nhật	Khang Nhat Commune	khang_nhat	076	10
02578	Hợp Hòa	Hop Hoa	Xã Hợp Hòa	Hop Hoa Commune	hop_hoa	076	10
02584	Quyết Thắng	Quyet Thang	Xã Quyết Thắng	Quyet Thang Commune	quyet_thang	076	10
02587	Đồng Quý	Dong Quy	Xã Đồng Quý	Dong Quy Commune	dong_quy	076	10
02590	Tân Thanh	Tan Thanh	Xã Tân Thanh	Tan Thanh Commune	tan_thanh	076	10
02593	Vân Sơn	Van Son	Xã Vân Sơn	Van Son Commune	van_son	076	10
02596	Văn Phú	Van Phu	Xã Văn Phú	Van Phu Commune	van_phu	076	10
02599	Chi Thiết	Chi Thiet	Xã Chi Thiết	Chi Thiet Commune	chi_thiet	076	10
02602	Đông Lợi	Dong Loi	Xã Đông Lợi	Dong Loi Commune	dong_loi	076	10
02605	Thiện Kế	Thien Ke	Xã Thiện Kế	Thien Ke Commune	thien_ke	076	10
02608	Hồng Lạc	Hong Lac	Xã Hồng Lạc	Hong Lac Commune	hong_lac	076	10
02611	Phú Lương	Phu Luong	Xã Phú Lương	Phu Luong Commune	phu_luong	076	10
02614	Ninh Lai	Ninh Lai	Xã Ninh Lai	Ninh Lai Commune	ninh_lai	076	10
02617	Đại Phú	Dai Phu	Xã Đại Phú	Dai Phu Commune	dai_phu	076	10
02620	Sơn Nam	Son Nam	Xã Sơn Nam	Son Nam Commune	son_nam	076	10
02623	Hào Phú	Hao Phu	Xã Hào Phú	Hao Phu Commune	hao_phu	076	10
02626	Tam Đa	Tam Da	Xã Tam Đa	Tam Da Commune	tam_da	076	10
02632	Trường Sinh	Truong Sinh	Xã Trường Sinh	Truong Sinh Commune	truong_sinh	076	10
02635	Duyên Hải	Duyen Hai	Phường Duyên Hải	Duyen Hai Ward	duyen_hai	080	8
02641	Lào Cai	Lao Cai	Phường Lào Cai	Lao Cai Ward	lao_cai	080	8
02644	Cốc Lếu	Coc Leu	Phường Cốc Lếu	Coc Leu Ward	coc_leu	080	8
02647	Kim Tân	Kim Tan	Phường Kim Tân	Kim Tan Ward	kim_tan	080	8
02650	Bắc Lệnh	Bac Lenh	Phường Bắc Lệnh	Bac Lenh Ward	bac_lenh	080	8
02653	Pom Hán	Pom Han	Phường Pom Hán	Pom Han Ward	pom_han	080	8
02656	Xuân Tăng	Xuan Tang	Phường Xuân Tăng	Xuan Tang Ward	xuan_tang	080	8
02658	Bình Minh	Binh Minh	Phường Bình Minh	Binh Minh Ward	binh_minh	080	8
02659	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	080	10
02662	Đồng Tuyển	Dong Tuyen	Xã Đồng Tuyển	Dong Tuyen Commune	dong_tuyen	080	10
02665	Vạn Hoà	Van Hoa	Xã Vạn Hoà	Van Hoa Commune	van_hoa	080	10
02668	Bắc Cường	Bac Cuong	Phường Bắc Cường	Bac Cuong Ward	bac_cuong	080	8
02671	Nam Cường	Nam Cuong	Phường Nam Cường	Nam Cuong Ward	nam_cuong	080	8
02674	Cam Đường	Cam Duong	Xã Cam Đường	Cam Duong Commune	cam_duong	080	10
02677	Tả Phời	Ta Phoi	Xã Tả Phời	Ta Phoi Commune	ta_phoi	080	10
02680	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	080	10
02746	Cốc San	Coc San	Xã Cốc San	Coc San Commune	coc_san	080	10
02683	Bát Xát	Bat Xat	Thị trấn Bát Xát	Bat Xat Township	bat_xat	082	9
02686	A Mú Sung	A Mu Sung	Xã A Mú Sung	A Mu Sung Commune	a_mu_sung	082	10
02689	Nậm Chạc	Nam Chac	Xã Nậm Chạc	Nam Chac Commune	nam_chac	082	10
02692	A Lù	A Lu	Xã A Lù	A Lu Commune	a_lu	082	10
02695	Trịnh Tường	Trinh Tuong	Xã Trịnh Tường	Trinh Tuong Commune	trinh_tuong	082	10
02701	Y Tý	Y Ty	Xã Y Tý	Y Ty Commune	y_ty	082	10
02704	Cốc Mỳ	Coc My	Xã Cốc Mỳ	Coc My Commune	coc_my	082	10
02707	Dền Sáng	Den Sang	Xã Dền Sáng	Den Sang Commune	den_sang	082	10
02710	Bản Vược	Ban Vuoc	Xã Bản Vược	Ban Vuoc Commune	ban_vuoc	082	10
02713	Sàng Ma Sáo	Sang Ma Sao	Xã Sàng Ma Sáo	Sang Ma Sao Commune	sang_ma_sao	082	10
02716	Bản Qua	Ban Qua	Xã Bản Qua	Ban Qua Commune	ban_qua	082	10
02719	Mường Vi	Muong Vi	Xã Mường Vi	Muong Vi Commune	muong_vi	082	10
02722	Dền Thàng	Den Thang	Xã Dền Thàng	Den Thang Commune	den_thang	082	10
02725	Bản Xèo	Ban Xeo	Xã Bản Xèo	Ban Xeo Commune	ban_xeo	082	10
02728	Mường Hum	Muong Hum	Xã Mường Hum	Muong Hum Commune	muong_hum	082	10
02731	Trung Lèng Hồ	Trung Leng Ho	Xã Trung Lèng Hồ	Trung Leng Ho Commune	trung_leng_ho	082	10
02734	Quang Kim	Quang Kim	Xã Quang Kim	Quang Kim Commune	quang_kim	082	10
02737	Pa Cheo	Pa Cheo	Xã Pa Cheo	Pa Cheo Commune	pa_cheo	082	10
02740	Nậm Pung	Nam Pung	Xã Nậm Pung	Nam Pung Commune	nam_pung	082	10
02743	Phìn Ngan	Phin Ngan	Xã Phìn Ngan	Phin Ngan Commune	phin_ngan	082	10
02749	Tòng Sành	Tong Sanh	Xã Tòng Sành	Tong Sanh Commune	tong_sanh	082	10
02752	Pha Long	Pha Long	Xã Pha Long	Pha Long Commune	pha_long	083	10
02755	Tả Ngải Chồ	Ta Ngai Cho	Xã Tả Ngải Chồ	Ta Ngai Cho Commune	ta_ngai_cho	083	10
02758	Tung Chung Phố	Tung Chung Pho	Xã Tung Chung Phố	Tung Chung Pho Commune	tung_chung_pho	083	10
02761	Mường Khương	Muong Khuong	Thị trấn Mường Khương	Muong Khuong Township	muong_khuong	083	9
02764	Dìn Chin	Din Chin	Xã Dìn Chin	Din Chin Commune	din_chin	083	10
02767	Tả Gia Khâu	Ta Gia Khau	Xã Tả Gia Khâu	Ta Gia Khau Commune	ta_gia_khau	083	10
04186	Nậm Ty	Nam Ty	Xã Nậm Ty	Nam Ty Commune	nam_ty	126	10
02770	Nậm Chảy	Nam Chay	Xã Nậm Chảy	Nam Chay Commune	nam_chay	083	10
02773	Nấm Lư	Nam Lu	Xã Nấm Lư	Nam Lu Commune	nam_lu	083	10
02776	Lùng Khấu Nhin	Lung Khau Nhin	Xã Lùng Khấu Nhin	Lung Khau Nhin Commune	lung_khau_nhin	083	10
02779	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	083	10
02782	Cao Sơn	Cao Son	Xã Cao Sơn	Cao Son Commune	cao_son	083	10
02785	Lùng Vai	Lung Vai	Xã Lùng Vai	Lung Vai Commune	lung_vai	083	10
02788	Bản Lầu	Ban Lau	Xã Bản Lầu	Ban Lau Commune	ban_lau	083	10
02791	La Pan Tẩn	La Pan Tan	Xã La Pan Tẩn	La Pan Tan Commune	la_pan_tan	083	10
02794	Tả Thàng	Ta Thang	Xã Tả Thàng	Ta Thang Commune	ta_thang	083	10
02797	Bản Sen	Ban Sen	Xã Bản Sen	Ban Sen Commune	ban_sen	083	10
02800	Nàn Sán	Nan San	Xã Nàn Sán	Nan San Commune	nan_san	084	10
02803	Thào Chư Phìn	Thao Chu Phin	Xã Thào Chư Phìn	Thao Chu Phin Commune	thao_chu_phin	084	10
02806	Bản Mế	Ban Me	Xã Bản Mế	Ban Me Commune	ban_me	084	10
02809	Si Ma Cai	Si Ma Cai	Thị trấn Si Ma Cai	Si Ma Cai Township	si_ma_cai	084	9
02812	Sán Chải	San Chai	Xã Sán Chải	San Chai Commune	san_chai	084	10
02818	Lùng Thẩn	Lung Than	Xã Lùng Thẩn	Lung Than Commune	lung_than	084	10
02821	Cán Cấu	Can Cau	Xã Cán Cấu	Can Cau Commune	can_cau	084	10
02824	Sín Chéng	Sin Cheng	Xã Sín Chéng	Sin Cheng Commune	sin_cheng	084	10
02827	Quan Hồ Thẩn	Quan Ho Than	Xã Quan Hồ Thẩn	Quan Ho Than Commune	quan_ho_than	084	10
02836	Nàn Xín	Nan Xin	Xã Nàn Xín	Nan Xin Commune	nan_xin	084	10
02839	Bắc Hà	Bac Ha	Thị trấn Bắc Hà	Bac Ha Township	bac_ha	085	9
02842	Lùng Cải	Lung Cai	Xã Lùng Cải	Lung Cai Commune	lung_cai	085	10
02848	Lùng Phình	Lung Phinh	Xã Lùng Phình	Lung Phinh Commune	lung_phinh	085	10
02851	Tả Van Chư	Ta Van Chu	Xã Tả Van Chư	Ta Van Chu Commune	ta_van_chu	085	10
02854	Tả Củ Tỷ	Ta Cu Ty	Xã Tả Củ Tỷ	Ta Cu Ty Commune	ta_cu_ty	085	10
02857	Thải Giàng Phố	Thai Giang Pho	Xã Thải Giàng Phố	Thai Giang Pho Commune	thai_giang_pho	085	10
02863	Hoàng Thu Phố	Hoang Thu Pho	Xã Hoàng Thu Phố	Hoang Thu Pho Commune	hoang_thu_pho	085	10
02866	Bản Phố	Ban Pho	Xã Bản Phố	Ban Pho Commune	ban_pho	085	10
02869	Bản Liền	Ban Lien	Xã Bản Liền	Ban Lien Commune	ban_lien	085	10
02872	Tà Chải	Ta Chai	Xã Tà Chải	Ta Chai Commune	ta_chai	085	10
02875	Na Hối	Na Hoi	Xã Na Hối	Na Hoi Commune	na_hoi	085	10
02878	Cốc Ly	Coc Ly	Xã Cốc Ly	Coc Ly Commune	coc_ly	085	10
02881	Nậm Mòn	Nam Mon	Xã Nậm Mòn	Nam Mon Commune	nam_mon	085	10
02884	Nậm Đét	Nam Det	Xã Nậm Đét	Nam Det Commune	nam_det	085	10
02887	Nậm Khánh	Nam Khanh	Xã Nậm Khánh	Nam Khanh Commune	nam_khanh	085	10
02890	Bảo Nhai	Bao Nhai	Xã Bảo Nhai	Bao Nhai Commune	bao_nhai	085	10
02893	Nậm Lúc	Nam Luc	Xã Nậm Lúc	Nam Luc Commune	nam_luc	085	10
02896	Cốc Lầu	Coc Lau	Xã Cốc Lầu	Coc Lau Commune	coc_lau	085	10
02899	Bản Cái	Ban Cai	Xã Bản Cái	Ban Cai Commune	ban_cai	085	10
02902	N.T Phong Hải	N.T Phong Hai	Thị trấn N.T Phong Hải	N.T Phong Hai Township	n.t_phong_hai	086	9
02905	Phố Lu	Pho Lu	Thị trấn Phố Lu	Pho Lu Township	pho_lu	086	9
02908	Tằng Loỏng	Tang Loong	Thị trấn Tằng Loỏng	Tang Loong Township	tang_loong	086	9
02911	Bản Phiệt	Ban Phiet	Xã Bản Phiệt	Ban Phiet Commune	ban_phiet	086	10
02914	Bản Cầm	Ban Cam	Xã Bản Cầm	Ban Cam Commune	ban_cam	086	10
02917	Thái Niên	Thai Nien	Xã Thái Niên	Thai Nien Commune	thai_nien	086	10
02920	Phong Niên	Phong Nien	Xã Phong Niên	Phong Nien Commune	phong_nien	086	10
02923	Gia Phú	Gia Phu	Xã Gia Phú	Gia Phu Commune	gia_phu	086	10
02926	Xuân Quang	Xuan Quang	Xã Xuân Quang	Xuan Quang Commune	xuan_quang	086	10
02929	Sơn Hải	Son Hai	Xã Sơn Hải	Son Hai Commune	son_hai	086	10
02932	Xuân Giao	Xuan Giao	Xã Xuân Giao	Xuan Giao Commune	xuan_giao	086	10
02935	Trì Quang	Tri Quang	Xã Trì Quang	Tri Quang Commune	tri_quang	086	10
02938	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	086	10
02944	Phú Nhuận	Phu Nhuan	Xã Phú Nhuận	Phu Nhuan Commune	phu_nhuan	086	10
02947	Phố Ràng	Pho Rang	Thị trấn Phố Ràng	Pho Rang Township	pho_rang	087	9
02950	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	087	10
02953	Nghĩa Đô	Nghia Do	Xã Nghĩa Đô	Nghia Do Commune	nghia_do	087	10
02956	Vĩnh Yên	Vinh Yen	Xã Vĩnh Yên	Vinh Yen Commune	vinh_yen	087	10
02959	Điện Quan	Dien Quan	Xã Điện Quan	Dien Quan Commune	dien_quan	087	10
02962	Xuân Hoà	Xuan Hoa	Xã Xuân Hoà	Xuan Hoa Commune	xuan_hoa	087	10
02965	Tân Dương	Tan Duong	Xã Tân Dương	Tan Duong Commune	tan_duong	087	10
02968	Thượng Hà	Thuong Ha	Xã Thượng Hà	Thuong Ha Commune	thuong_ha	087	10
02971	Kim Sơn	Kim Son	Xã Kim Sơn	Kim Son Commune	kim_son	087	10
02974	Cam Cọn	Cam Con	Xã Cam Cọn	Cam Con Commune	cam_con	087	10
02977	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	087	10
02980	Xuân Thượng	Xuan Thuong	Xã Xuân Thượng	Xuan Thuong Commune	xuan_thuong	087	10
02983	Việt Tiến	Viet Tien	Xã Việt Tiến	Viet Tien Commune	viet_tien	087	10
02986	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	087	10
02989	Bảo Hà	Bao Ha	Xã Bảo Hà	Bao Ha Commune	bao_ha	087	10
02992	Lương Sơn	Luong Son	Xã Lương Sơn	Luong Son Commune	luong_son	087	10
02998	Phúc Khánh	Phuc Khanh	Xã Phúc Khánh	Phuc Khanh Commune	phuc_khanh	087	10
03001	Sa Pa	Sa Pa	Phường Sa Pa	Sa Pa Ward	sa_pa	088	8
03002	Sa Pả	Sa Pa	Phường Sa Pả	Sa Pa Ward	sa_pa	088	8
03003	Ô Quý Hồ	O Quy Ho	Phường Ô Quý Hồ	O Quy Ho Ward	o_quy_ho	088	8
04582	Vân Hội	Van Hoi	Xã Vân Hội	Van Hoi Commune	van_hoi	138	10
03004	Ngũ Chỉ Sơn	Ngu Chi Son	Xã Ngũ Chỉ Sơn	Ngu Chi Son Commune	ngu_chi_son	088	10
03006	Phan Si Păng	Phan Si Pang	Phường Phan Si Păng	Phan Si Pang Ward	phan_si_pang	088	8
03010	Trung Chải	Trung Chai	Xã Trung Chải	Trung Chai Commune	trung_chai	088	10
03013	Tả Phìn	Ta Phin	Xã Tả Phìn	Ta Phin Commune	ta_phin	088	10
03016	Hàm Rồng	Ham Rong	Phường Hàm Rồng	Ham Rong Ward	ham_rong	088	8
03019	Hoàng Liên	Hoang Lien	Xã Hoàng Liên	Hoang Lien Commune	hoang_lien	088	10
03022	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	088	10
03028	Cầu Mây	Cau May	Phường Cầu Mây	Cau May Ward	cau_may	088	8
03037	Mường Hoa	Muong Hoa	Xã Mường Hoa	Muong Hoa Commune	muong_hoa	088	10
03040	Tả Van	Ta Van	Xã Tả Van	Ta Van Commune	ta_van	088	10
03043	Mường Bo	Muong Bo	Xã Mường Bo	Muong Bo Commune	muong_bo	088	10
03046	Bản Hồ	Ban Ho	Xã Bản Hồ	Ban Ho Commune	ban_ho	088	10
03052	Liên Minh	Lien Minh	Xã Liên Minh	Lien Minh Commune	lien_minh	088	10
03055	Khánh Yên	Khanh Yen	Thị trấn Khánh Yên	Khanh Yen Township	khanh_yen	089	9
03061	Võ Lao	Vo Lao	Xã Võ Lao	Vo Lao Commune	vo_lao	089	10
03064	Sơn Thuỷ	Son Thuy	Xã Sơn Thuỷ	Son Thuy Commune	son_thuy	089	10
03067	Nậm Mả	Nam Ma	Xã Nậm Mả	Nam Ma Commune	nam_ma	089	10
03070	Tân Thượng	Tan Thuong	Xã Tân Thượng	Tan Thuong Commune	tan_thuong	089	10
03073	Nậm Rạng	Nam Rang	Xã Nậm Rạng	Nam Rang Commune	nam_rang	089	10
03076	Nậm Chầy	Nam Chay	Xã Nậm Chầy	Nam Chay Commune	nam_chay	089	10
03079	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	089	10
03082	Khánh Yên Thượng	Khanh Yen Thuong	Xã Khánh Yên Thượng	Khanh Yen Thuong Commune	khanh_yen_thuong	089	10
03085	Nậm Xé	Nam Xe	Xã Nậm Xé	Nam Xe Commune	nam_xe	089	10
03088	Dần Thàng	Dan Thang	Xã Dần Thàng	Dan Thang Commune	dan_thang	089	10
03091	Chiềng Ken	Chieng Ken	Xã Chiềng Ken	Chieng Ken Commune	chieng_ken	089	10
03094	Làng Giàng	Lang Giang	Xã Làng Giàng	Lang Giang Commune	lang_giang	089	10
03097	Hoà Mạc	Hoa Mac	Xã Hoà Mạc	Hoa Mac Commune	hoa_mac	089	10
03100	Khánh Yên Trung	Khanh Yen Trung	Xã Khánh Yên Trung	Khanh Yen Trung Commune	khanh_yen_trung	089	10
03103	Khánh Yên Hạ	Khanh Yen Ha	Xã Khánh Yên Hạ	Khanh Yen Ha Commune	khanh_yen_ha	089	10
03106	Dương Quỳ	Duong Quy	Xã Dương Quỳ	Duong Quy Commune	duong_quy	089	10
03109	Nậm Tha	Nam Tha	Xã Nậm Tha	Nam Tha Commune	nam_tha	089	10
03112	Minh Lương	Minh Luong	Xã Minh Lương	Minh Luong Commune	minh_luong	089	10
03115	Thẩm Dương	Tham Duong	Xã Thẩm Dương	Tham Duong Commune	tham_duong	089	10
03118	Liêm Phú	Liem Phu	Xã Liêm Phú	Liem Phu Commune	liem_phu	089	10
03121	Nậm Xây	Nam Xay	Xã Nậm Xây	Nam Xay Commune	nam_xay	089	10
03124	Noong Bua	Noong Bua	Phường Noong Bua	Noong Bua Ward	noong_bua	094	8
03127	Him Lam	Him Lam	Phường Him Lam	Him Lam Ward	him_lam	094	8
03130	Thanh Bình	Thanh Binh	Phường Thanh Bình	Thanh Binh Ward	thanh_binh	094	8
03133	Tân Thanh	Tan Thanh	Phường Tân Thanh	Tan Thanh Ward	tan_thanh	094	8
03136	Mường Thanh	Muong Thanh	Phường Mường Thanh	Muong Thanh Ward	muong_thanh	094	8
03139	Nam Thanh	Nam Thanh	Phường Nam Thanh	Nam Thanh Ward	nam_thanh	094	8
03142	Thanh Trường	Thanh Truong	Phường Thanh Trường	Thanh Truong Ward	thanh_truong	094	8
03145	Thanh Minh	Thanh Minh	Xã Thanh Minh	Thanh Minh Commune	thanh_minh	094	10
03316	Nà Tấu	Na Tau	Xã Nà Tấu	Na Tau Commune	na_tau	094	10
03317	Nà Nhạn	Na Nhan	Xã Nà Nhạn	Na Nhan Commune	na_nhan	094	10
03325	Mường Phăng	Muong Phang	Xã Mường Phăng	Muong Phang Commune	muong_phang	094	10
03326	Pá Khoang	Pa Khoang	Xã Pá Khoang	Pa Khoang Commune	pa_khoang	094	10
03148	Sông Đà	Song Da	Phường Sông Đà	Song Da Ward	song_da	095	8
03151	Na Lay	Na Lay	Phường Na Lay	Na Lay Ward	na_lay	095	8
03184	Lay Nưa	Lay Nua	Xã Lay Nưa	Lay Nua Commune	lay_nua	095	10
03154	Sín Thầu	Sin Thau	Xã Sín Thầu	Sin Thau Commune	sin_thau	096	10
03155	Sen Thượng	Sen Thuong	Xã Sen Thượng	Sen Thuong Commune	sen_thuong	096	10
03157	Chung Chải	Chung Chai	Xã Chung Chải	Chung Chai Commune	chung_chai	096	10
03158	Leng Su Sìn	Leng Su Sin	Xã Leng Su Sìn	Leng Su Sin Commune	leng_su_sin	096	10
03159	Pá Mỳ	Pa My	Xã Pá Mỳ	Pa My Commune	pa_my	096	10
03160	Mường Nhé	Muong Nhe	Xã Mường Nhé	Muong Nhe Commune	muong_nhe	096	10
03161	Nậm Vì	Nam Vi	Xã Nậm Vì	Nam Vi Commune	nam_vi	096	10
03162	Nậm Kè	Nam Ke	Xã Nậm Kè	Nam Ke Commune	nam_ke	096	10
03163	Mường Toong	Muong Toong	Xã Mường Toong	Muong Toong Commune	muong_toong	096	10
03164	Quảng Lâm	Quang Lam	Xã Quảng Lâm	Quang Lam Commune	quang_lam	096	10
03177	Huổi Lếnh	Huoi Lenh	Xã Huổi Lếnh	Huoi Lenh Commune	huoi_lenh	096	10
03172	Mường Chà	Muong Cha	Thị trấn Mường Chà	Muong Cha Township	muong_cha	097	9
03178	Xá Tổng	Xa Tong	Xã Xá Tổng	Xa Tong Commune	xa_tong	097	10
03181	Mường Tùng	Muong Tung	Xã Mường Tùng	Muong Tung Commune	muong_tung	097	10
03190	Hừa Ngài	Hua Ngai	Xã Hừa Ngài	Hua Ngai Commune	hua_ngai	097	10
03191	Huổi Mí	Huoi Mi	Xã Huổi Mí	Huoi Mi Commune	huoi_mi	097	10
03193	Pa Ham	Pa Ham	Xã Pa Ham	Pa Ham Commune	pa_ham	097	10
03194	Nậm Nèn	Nam Nen	Xã Nậm Nèn	Nam Nen Commune	nam_nen	097	10
03196	Huổi Lèng	Huoi Leng	Xã Huổi Lèng	Huoi Leng Commune	huoi_leng	097	10
03197	Sa Lông	Sa Long	Xã Sa Lông	Sa Long Commune	sa_long	097	10
03200	Ma Thì Hồ	Ma Thi Ho	Xã Ma Thì Hồ	Ma Thi Ho Commune	ma_thi_ho	097	10
03201	Na Sang	Na Sang	Xã Na Sang	Na Sang Commune	na_sang	097	10
03202	Mường Mươn	Muong Muon	Xã Mường Mươn	Muong Muon Commune	muong_muon	097	10
03217	Tủa Chùa	Tua Chua	Thị trấn Tủa Chùa	Tua Chua Township	tua_chua	098	9
03220	Huổi Só	Huoi So	Xã Huổi Só	Huoi So Commune	huoi_so	098	10
03223	Xín Chải	Xin Chai	Xã Xín Chải	Xin Chai Commune	xin_chai	098	10
03226	Tả Sìn Thàng	Ta Sin Thang	Xã Tả Sìn Thàng	Ta Sin Thang Commune	ta_sin_thang	098	10
03229	Lao Xả Phình	Lao Xa Phinh	Xã Lao Xả Phình	Lao Xa Phinh Commune	lao_xa_phinh	098	10
03232	Tả Phìn	Ta Phin	Xã Tả Phìn	Ta Phin Commune	ta_phin	098	10
03235	Tủa Thàng	Tua Thang	Xã Tủa Thàng	Tua Thang Commune	tua_thang	098	10
03238	Trung Thu	Trung Thu	Xã Trung Thu	Trung Thu Commune	trung_thu	098	10
03241	Sính Phình	Sinh Phinh	Xã Sính Phình	Sinh Phinh Commune	sinh_phinh	098	10
03244	Sáng Nhè	Sang Nhe	Xã Sáng Nhè	Sang Nhe Commune	sang_nhe	098	10
03247	Mường Đun	Muong Dun	Xã Mường Đun	Muong Dun Commune	muong_dun	098	10
03250	Mường Báng	Muong Bang	Xã Mường Báng	Muong Bang Commune	muong_bang	098	10
03253	Tuần Giáo	Tuan Giao	Thị trấn Tuần Giáo	Tuan Giao Township	tuan_giao	099	9
03259	Phình Sáng	Phinh Sang	Xã Phình Sáng	Phinh Sang Commune	phinh_sang	099	10
03260	Rạng Đông	Rang Dong	Xã Rạng Đông	Rang Dong Commune	rang_dong	099	10
03262	Mùn Chung	Mun Chung	Xã Mùn Chung	Mun Chung Commune	mun_chung	099	10
03263	Nà Tòng	Na Tong	Xã Nà Tòng	Na Tong Commune	na_tong	099	10
03265	Ta Ma	Ta Ma	Xã Ta Ma	Ta Ma Commune	ta_ma	099	10
03268	Mường Mùn	Muong Mun	Xã Mường Mùn	Muong Mun Commune	muong_mun	099	10
03269	Pú Xi	Pu Xi	Xã Pú Xi	Pu Xi Commune	pu_xi	099	10
03271	Pú Nhung	Pu Nhung	Xã Pú Nhung	Pu Nhung Commune	pu_nhung	099	10
03274	Quài Nưa	Quai Nua	Xã Quài Nưa	Quai Nua Commune	quai_nua	099	10
03277	Mường Thín	Muong Thin	Xã Mường Thín	Muong Thin Commune	muong_thin	099	10
03280	Tỏa Tình	Toa Tinh	Xã Tỏa Tình	Toa Tinh Commune	toa_tinh	099	10
03283	Nà Sáy	Na Say	Xã Nà Sáy	Na Say Commune	na_say	099	10
03284	Mường Khong	Muong Khong	Xã Mường Khong	Muong Khong Commune	muong_khong	099	10
03289	Quài Cang	Quai Cang	Xã Quài Cang	Quai Cang Commune	quai_cang	099	10
03295	Quài Tở	Quai To	Xã Quài Tở	Quai To Commune	quai_to	099	10
03298	Chiềng Sinh	Chieng Sinh	Xã Chiềng Sinh	Chieng Sinh Commune	chieng_sinh	099	10
03299	Chiềng Đông	Chieng Dong	Xã Chiềng Đông	Chieng Dong Commune	chieng_dong	099	10
03304	Tênh Phông	Tenh Phong	Xã Tênh Phông	Tenh Phong Commune	tenh_phong	099	10
03319	Mường Pồn	Muong Pon	Xã Mường Pồn	Muong Pon Commune	muong_pon	100	10
03322	Thanh Nưa	Thanh Nua	Xã Thanh Nưa	Thanh Nua Commune	thanh_nua	100	10
03323	Hua Thanh	Hua Thanh	Xã Hua Thanh	Hua Thanh Commune	hua_thanh	100	10
03328	Thanh Luông	Thanh Luong	Xã Thanh Luông	Thanh Luong Commune	thanh_luong	100	10
03331	Thanh Hưng	Thanh Hung	Xã Thanh Hưng	Thanh Hung Commune	thanh_hung	100	10
03334	Thanh Xương	Thanh Xuong	Xã Thanh Xương	Thanh Xuong Commune	thanh_xuong	100	10
03337	Thanh Chăn	Thanh Chan	Xã Thanh Chăn	Thanh Chan Commune	thanh_chan	100	10
03340	Pa Thơm	Pa Thom	Xã Pa Thơm	Pa Thom Commune	pa_thom	100	10
03343	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	100	10
03346	Thanh Yên	Thanh Yen	Xã Thanh Yên	Thanh Yen Commune	thanh_yen	100	10
03349	Noong Luống	Noong Luong	Xã Noong Luống	Noong Luong Commune	noong_luong	100	10
03352	Noọng Hẹt	Noong Het	Xã Noọng Hẹt	Noong Het Commune	noong_het	100	10
03355	Sam Mứn	Sam Mun	Xã Sam Mứn	Sam Mun Commune	sam_mun	100	10
03356	Pom Lót	Pom Lot	Xã Pom Lót	Pom Lot Commune	pom_lot	100	10
03358	Núa Ngam	Nua Ngam	Xã Núa Ngam	Nua Ngam Commune	nua_ngam	100	10
03359	Hẹ Muông	He Muong	Xã Hẹ Muông	He Muong Commune	he_muong	100	10
03361	Na Ư	Na U	Xã Na Ư	Na U Commune	na_u	100	10
03364	Mường Nhà	Muong Nha	Xã Mường Nhà	Muong Nha Commune	muong_nha	100	10
03365	Na Tông	Na Tong	Xã Na Tông	Na Tong Commune	na_tong	100	10
03367	Mường Lói	Muong Loi	Xã Mường Lói	Muong Loi Commune	muong_loi	100	10
03368	Phu Luông	Phu Luong	Xã Phu Luông	Phu Luong Commune	phu_luong	100	10
03203	Điện Biên Đông	Dien Bien Dong	Thị trấn Điện Biên Đông	Dien Bien Dong Township	dien_bien_dong	101	9
03205	Na Son	Na Son	Xã Na Son	Na Son Commune	na_son	101	10
03208	Phì Nhừ	Phi Nhu	Xã Phì Nhừ	Phi Nhu Commune	phi_nhu	101	10
03211	Chiềng Sơ	Chieng So	Xã Chiềng Sơ	Chieng So Commune	chieng_so	101	10
03214	Mường Luân	Muong Luan	Xã Mường Luân	Muong Luan Commune	muong_luan	101	10
03370	Pú Nhi	Pu Nhi	Xã Pú Nhi	Pu Nhi Commune	pu_nhi	101	10
03371	Nong U	Nong U	Xã Nong U	Nong U Commune	nong_u	101	10
03373	Xa Dung	Xa Dung	Xã Xa Dung	Xa Dung Commune	xa_dung	101	10
03376	Keo Lôm	Keo Lom	Xã Keo Lôm	Keo Lom Commune	keo_lom	101	10
03379	Luân Giới	Luan Gioi	Xã Luân Giới	Luan Gioi Commune	luan_gioi	101	10
03382	Phình Giàng	Phinh Giang	Xã Phình Giàng	Phinh Giang Commune	phinh_giang	101	10
03383	Pú Hồng	Pu Hong	Xã Pú Hồng	Pu Hong Commune	pu_hong	101	10
03384	Tìa Dình	Tia Dinh	Xã Tìa Dình	Tia Dinh Commune	tia_dinh	101	10
03385	Háng Lìa	Hang Lia	Xã Háng Lìa	Hang Lia Commune	hang_lia	101	10
03256	Mường Ảng	Muong Ang	Thị trấn Mường Ảng	Muong Ang Township	muong_ang	102	9
03286	Mường Đăng	Muong Dang	Xã Mường Đăng	Muong Dang Commune	muong_dang	102	10
03287	Ngối Cáy	Ngoi Cay	Xã Ngối Cáy	Ngoi Cay Commune	ngoi_cay	102	10
03292	Ẳng Tở	Ang To	Xã Ẳng Tở	Ang To Commune	ang_to	102	10
03301	Búng Lao	Bung Lao	Xã Búng Lao	Bung Lao Commune	bung_lao	102	10
03302	Xuân Lao	Xuan Lao	Xã Xuân Lao	Xuan Lao Commune	xuan_lao	102	10
03307	Ẳng Nưa	Ang Nua	Xã Ẳng Nưa	Ang Nua Commune	ang_nua	102	10
07336	Cao Xá	Cao Xa	Xã Cao Xá	Cao Xa Commune	cao_xa	216	10
03310	Ẳng Cang	Ang Cang	Xã Ẳng Cang	Ang Cang Commune	ang_cang	102	10
03312	Nặm Lịch	Nam Lich	Xã Nặm Lịch	Nam Lich Commune	nam_lich	102	10
03313	Mường Lạn	Muong Lan	Xã Mường Lạn	Muong Lan Commune	muong_lan	102	10
03156	Nậm Tin	Nam Tin	Xã Nậm Tin	Nam Tin Commune	nam_tin	103	10
03165	Pa Tần	Pa Tan	Xã Pa Tần	Pa Tan Commune	pa_tan	103	10
03166	Chà Cang	Cha Cang	Xã Chà Cang	Cha Cang Commune	cha_cang	103	10
03167	Na Cô Sa	Na Co Sa	Xã Na Cô Sa	Na Co Sa Commune	na_co_sa	103	10
03168	Nà Khoa	Na Khoa	Xã Nà Khoa	Na Khoa Commune	na_khoa	103	10
03169	Nà Hỳ	Na Hy	Xã Nà Hỳ	Na Hy Commune	na_hy	103	10
03170	Nà Bủng	Na Bung	Xã Nà Bủng	Na Bung Commune	na_bung	103	10
03171	Nậm Nhừ	Nam Nhu	Xã Nậm Nhừ	Nam Nhu Commune	nam_nhu	103	10
03173	Nậm Chua	Nam Chua	Xã Nậm Chua	Nam Chua Commune	nam_chua	103	10
03174	Nậm Khăn	Nam Khan	Xã Nậm Khăn	Nam Khan Commune	nam_khan	103	10
03175	Chà Tở	Cha To	Xã Chà Tở	Cha To Commune	cha_to	103	10
03176	Vàng Đán	Vang Dan	Xã Vàng Đán	Vang Dan Commune	vang_dan	103	10
03187	Chà Nưa	Cha Nua	Xã Chà Nưa	Cha Nua Commune	cha_nua	103	10
03198	Phìn Hồ	Phin Ho	Xã Phìn Hồ	Phin Ho Commune	phin_ho	103	10
03199	Si Pa Phìn	Si Pa Phin	Xã Si Pa Phìn	Si Pa Phin Commune	si_pa_phin	103	10
03386	Quyết Thắng	Quyet Thang	Phường Quyết Thắng	Quyet Thang Ward	quyet_thang	105	8
03387	Tân Phong	Tan Phong	Phường Tân Phong	Tan Phong Ward	tan_phong	105	8
03388	Quyết Tiến	Quyet Tien	Phường Quyết Tiến	Quyet Tien Ward	quyet_tien	105	8
03389	Đoàn Kết	Doan Ket	Phường Đoàn Kết	Doan Ket Ward	doan_ket	105	8
03403	Sùng Phài	Sung Phai	Xã Sùng Phài	Sung Phai Commune	sung_phai	105	10
03408	Đông Phong	Dong Phong	Phường Đông Phong	Dong Phong Ward	dong_phong	105	8
03409	San Thàng	San Thang	Xã San Thàng	San Thang Commune	san_thang	105	10
03472	Mường Mô	Muong Mo	Xã Mường Mô	Muong Mo Commune	muong_mo	112	10
03390	Tam Đường	Tam Duong	Thị trấn Tam Đường	Tam Duong Township	tam_duong	106	9
03394	Thèn Sin	Then Sin	Xã Thèn Sin	Then Sin Commune	then_sin	106	10
03400	Tả Lèng	Ta Leng	Xã Tả Lèng	Ta Leng Commune	ta_leng	106	10
03405	Giang Ma	Giang Ma	Xã Giang Ma	Giang Ma Commune	giang_ma	106	10
03406	Hồ Thầu	Ho Thau	Xã Hồ Thầu	Ho Thau Commune	ho_thau	106	10
03412	Bình Lư	Binh Lu	Xã Bình Lư	Binh Lu Commune	binh_lu	106	10
03413	Sơn Bình	Son Binh	Xã Sơn Bình	Son Binh Commune	son_binh	106	10
03415	Nùng Nàng	Nung Nang	Xã Nùng Nàng	Nung Nang Commune	nung_nang	106	10
03418	Bản Giang	Ban Giang	Xã Bản Giang	Ban Giang Commune	ban_giang	106	10
03421	Bản Hon	Ban Hon	Xã Bản Hon	Ban Hon Commune	ban_hon	106	10
03424	Bản Bo	Ban Bo	Xã Bản Bo	Ban Bo Commune	ban_bo	106	10
03427	Nà Tăm	Na Tam	Xã Nà Tăm	Na Tam Commune	na_tam	106	10
03430	Khun Há	Khun Ha	Xã Khun Há	Khun Ha Commune	khun_ha	106	10
03433	Mường Tè	Muong Te	Thị trấn Mường Tè	Muong Te Township	muong_te	107	9
03436	Thu Lũm	Thu Lum	Xã Thu Lũm	Thu Lum Commune	thu_lum	107	10
03439	Ka Lăng	Ka Lang	Xã Ka Lăng	Ka Lang Commune	ka_lang	107	10
03440	Tá Bạ	Ta Ba	Xã Tá Bạ	Ta Ba Commune	ta_ba	107	10
03442	Pa ủ	Pa u	Xã Pa ủ	Pa u Commune	pa_u	107	10
03445	Mường Tè	Muong Te	Xã Mường Tè	Muong Te Commune	muong_te	107	10
03448	Pa Vệ Sử	Pa Ve Su	Xã Pa Vệ Sử	Pa Ve Su Commune	pa_ve_su	107	10
03451	Mù Cả	Mu Ca	Xã Mù Cả	Mu Ca Commune	mu_ca	107	10
03454	Bum Tở	Bum To	Xã Bum Tở	Bum To Commune	bum_to	107	10
03457	Nậm Khao	Nam Khao	Xã Nậm Khao	Nam Khao Commune	nam_khao	107	10
03463	Tà Tổng	Ta Tong	Xã Tà Tổng	Ta Tong Commune	ta_tong	107	10
03466	Bum Nưa	Bum Nua	Xã Bum Nưa	Bum Nua Commune	bum_nua	107	10
03467	Vàng San	Vang San	Xã Vàng San	Vang San Commune	vang_san	107	10
03469	Kan Hồ	Kan Ho	Xã Kan Hồ	Kan Ho Commune	kan_ho	107	10
03478	Sìn Hồ	Sin Ho	Thị trấn Sìn Hồ	Sin Ho Township	sin_ho	108	9
03487	Chăn Nưa	Chan Nua	Xã Chăn Nưa	Chan Nua Commune	chan_nua	108	10
03493	Pa Tần	Pa Tan	Xã Pa Tần	Pa Tan Commune	pa_tan	108	10
03496	Phìn Hồ	Phin Ho	Xã Phìn Hồ	Phin Ho Commune	phin_ho	108	10
03499	Hồng Thu	Hong Thu	Xã Hồng Thu	Hong Thu Commune	hong_thu	108	10
03505	Phăng Sô Lin	Phang So Lin	Xã Phăng Sô Lin	Phang So Lin Commune	phang_so_lin	108	10
03508	Ma Quai	Ma Quai	Xã Ma Quai	Ma Quai Commune	ma_quai	108	10
03509	Lùng Thàng	Lung Thang	Xã Lùng Thàng	Lung Thang Commune	lung_thang	108	10
03511	Tả Phìn	Ta Phin	Xã Tả Phìn	Ta Phin Commune	ta_phin	108	10
03514	Sà Dề Phìn	Sa De Phin	Xã Sà Dề Phìn	Sa De Phin Commune	sa_de_phin	108	10
03517	Nậm Tăm	Nam Tam	Xã Nậm Tăm	Nam Tam Commune	nam_tam	108	10
03520	Tả Ngảo	Ta Ngao	Xã Tả Ngảo	Ta Ngao Commune	ta_ngao	108	10
03523	Pu Sam Cáp	Pu Sam Cap	Xã Pu Sam Cáp	Pu Sam Cap Commune	pu_sam_cap	108	10
03526	Nậm Cha	Nam Cha	Xã Nậm Cha	Nam Cha Commune	nam_cha	108	10
03527	Pa Khoá	Pa Khoa	Xã Pa Khoá	Pa Khoa Commune	pa_khoa	108	10
03529	Làng Mô	Lang Mo	Xã Làng Mô	Lang Mo Commune	lang_mo	108	10
03532	Noong Hẻo	Noong Heo	Xã Noong Hẻo	Noong Heo Commune	noong_heo	108	10
03535	Nậm Mạ	Nam Ma	Xã Nậm Mạ	Nam Ma Commune	nam_ma	108	10
03538	Căn Co	Can Co	Xã Căn Co	Can Co Commune	can_co	108	10
03541	Tủa Sín Chải	Tua Sin Chai	Xã Tủa Sín Chải	Tua Sin Chai Commune	tua_sin_chai	108	10
03544	Nậm Cuổi	Nam Cuoi	Xã Nậm Cuổi	Nam Cuoi Commune	nam_cuoi	108	10
03547	Nậm Hăn	Nam Han	Xã Nậm Hăn	Nam Han Commune	nam_han	108	10
03391	Lả Nhì Thàng	La Nhi Thang	Xã Lả Nhì Thàng	La Nhi Thang Commune	la_nhi_thang	109	10
03490	Huổi Luông	Huoi Luong	Xã Huổi Luông	Huoi Luong Commune	huoi_luong	109	10
03549	Phong Thổ	Phong Tho	Thị trấn Phong Thổ	Phong Tho Township	phong_tho	109	9
03550	Sì Lở Lầu	Si Lo Lau	Xã Sì Lở Lầu	Si Lo Lau Commune	si_lo_lau	109	10
03553	Mồ Sì San	Mo Si San	Xã Mồ Sì San	Mo Si San Commune	mo_si_san	109	10
03559	Pa Vây Sử	Pa Vay Su	Xã Pa Vây Sử	Pa Vay Su Commune	pa_vay_su	109	10
03562	Vàng Ma Chải	Vang Ma Chai	Xã Vàng Ma Chải	Vang Ma Chai Commune	vang_ma_chai	109	10
03565	Tông Qua Lìn	Tong Qua Lin	Xã Tông Qua Lìn	Tong Qua Lin Commune	tong_qua_lin	109	10
03568	Mù Sang	Mu Sang	Xã Mù Sang	Mu Sang Commune	mu_sang	109	10
03571	Dào San	Dao San	Xã Dào San	Dao San Commune	dao_san	109	10
03574	Ma Ly Pho	Ma Ly Pho	Xã Ma Ly Pho	Ma Ly Pho Commune	ma_ly_pho	109	10
03577	Bản Lang	Ban Lang	Xã Bản Lang	Ban Lang Commune	ban_lang	109	10
03580	Hoang Thèn	Hoang Then	Xã Hoang Thèn	Hoang Then Commune	hoang_then	109	10
03583	Khổng Lào	Khong Lao	Xã Khổng Lào	Khong Lao Commune	khong_lao	109	10
03586	Nậm Xe	Nam Xe	Xã Nậm Xe	Nam Xe Commune	nam_xe	109	10
03589	Mường So	Muong So	Xã Mường So	Muong So Commune	muong_so	109	10
03592	Sin Suối Hồ	Sin Suoi Ho	Xã Sin Suối Hồ	Sin Suoi Ho Commune	sin_suoi_ho	109	10
03595	Than Uyên	Than Uyen	Thị trấn Than Uyên	Than Uyen Township	than_uyen	110	9
03618	Phúc Than	Phuc Than	Xã Phúc Than	Phuc Than Commune	phuc_than	110	10
03619	Mường Than	Muong Than	Xã Mường Than	Muong Than Commune	muong_than	110	10
03625	Mường Mít	Muong Mit	Xã Mường Mít	Muong Mit Commune	muong_mit	110	10
03628	Pha Mu	Pha Mu	Xã Pha Mu	Pha Mu Commune	pha_mu	110	10
03631	Mường Cang	Muong Cang	Xã Mường Cang	Muong Cang Commune	muong_cang	110	10
03632	Hua Nà	Hua Na	Xã Hua Nà	Hua Na Commune	hua_na	110	10
03634	Tà Hừa	Ta Hua	Xã Tà Hừa	Ta Hua Commune	ta_hua	110	10
03637	Mường Kim	Muong Kim	Xã Mường Kim	Muong Kim Commune	muong_kim	110	10
03638	Tà Mung	Ta Mung	Xã Tà Mung	Ta Mung Commune	ta_mung	110	10
03640	Tà Gia	Ta Gia	Xã Tà Gia	Ta Gia Commune	ta_gia	110	10
03643	Khoen On	Khoen On	Xã Khoen On	Khoen On Commune	khoen_on	110	10
03598	Tân Uyên	Tan Uyen	Thị trấn Tân Uyên	Tan Uyen Township	tan_uyen	111	9
03601	Mường Khoa	Muong Khoa	Xã Mường Khoa	Muong Khoa Commune	muong_khoa	111	10
03602	Phúc Khoa	Phuc Khoa	Xã Phúc Khoa	Phuc Khoa Commune	phuc_khoa	111	10
03604	Thân Thuộc	Than Thuoc	Xã Thân Thuộc	Than Thuoc Commune	than_thuoc	111	10
03605	Trung Đồng	Trung Dong	Xã Trung Đồng	Trung Dong Commune	trung_dong	111	10
03607	Hố Mít	Ho Mit	Xã Hố Mít	Ho Mit Commune	ho_mit	111	10
03610	Nậm Cần	Nam Can	Xã Nậm Cần	Nam Can Commune	nam_can	111	10
03613	Nậm Sỏ	Nam So	Xã Nậm Sỏ	Nam So Commune	nam_so	111	10
03616	Pắc Ta	Pac Ta	Xã Pắc Ta	Pac Ta Commune	pac_ta	111	10
03622	Tà Mít	Ta Mit	Xã Tà Mít	Ta Mit Commune	ta_mit	111	10
03434	Nậm Nhùn	Nam Nhun	Thị trấn Nậm Nhùn	Nam Nhun Township	nam_nhun	112	9
03460	Hua Bun	Hua Bun	Xã Hua Bun	Hua Bun Commune	hua_bun	112	10
03473	Nậm Chà	Nam Cha	Xã Nậm Chà	Nam Cha Commune	nam_cha	112	10
03474	Nậm Manh	Nam Manh	Xã Nậm Manh	Nam Manh Commune	nam_manh	112	10
03475	Nậm Hàng	Nam Hang	Xã Nậm Hàng	Nam Hang Commune	nam_hang	112	10
03481	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	112	10
03484	Pú Đao	Pu Dao	Xã Pú Đao	Pu Dao Commune	pu_dao	112	10
03488	Nậm Pì	Nam Pi	Xã Nậm Pì	Nam Pi Commune	nam_pi	112	10
03502	Nậm Ban	Nam Ban	Xã Nậm Ban	Nam Ban Commune	nam_ban	112	10
03503	Trung Chải	Trung Chai	Xã Trung Chải	Trung Chai Commune	trung_chai	112	10
03646	Chiềng Lề	Chieng Le	Phường Chiềng Lề	Chieng Le Ward	chieng_le	116	8
03649	Tô Hiệu	To Hieu	Phường Tô Hiệu	To Hieu Ward	to_hieu	116	8
03652	Quyết Thắng	Quyet Thang	Phường Quyết Thắng	Quyet Thang Ward	quyet_thang	116	8
03655	Quyết Tâm	Quyet Tam	Phường Quyết Tâm	Quyet Tam Ward	quyet_tam	116	8
03658	Chiềng Cọ	Chieng Co	Xã Chiềng Cọ	Chieng Co Commune	chieng_co	116	10
03661	Chiềng Đen	Chieng Den	Xã Chiềng Đen	Chieng Den Commune	chieng_den	116	10
03664	Chiềng Xôm	Chieng Xom	Xã Chiềng Xôm	Chieng Xom Commune	chieng_xom	116	10
03667	Chiềng An	Chieng An	Phường Chiềng An	Chieng An Ward	chieng_an	116	8
03670	Chiềng Cơi	Chieng Coi	Phường Chiềng Cơi	Chieng Coi Ward	chieng_coi	116	8
03673	Chiềng Ngần	Chieng Ngan	Xã Chiềng Ngần	Chieng Ngan Commune	chieng_ngan	116	10
03676	Hua La	Hua La	Xã Hua La	Hua La Commune	hua_la	116	10
03679	Chiềng Sinh	Chieng Sinh	Phường Chiềng Sinh	Chieng Sinh Ward	chieng_sinh	116	8
03682	Mường Chiên	Muong Chien	Xã Mường Chiên	Muong Chien Commune	muong_chien	118	10
03685	Cà Nàng	Ca Nang	Xã Cà Nàng	Ca Nang Commune	ca_nang	118	10
03688	Chiềng Khay	Chieng Khay	Xã Chiềng Khay	Chieng Khay Commune	chieng_khay	118	10
03694	Mường Giôn	Muong Gion	Xã Mường Giôn	Muong Gion Commune	muong_gion	118	10
03697	Pá Ma Pha Khinh	Pa Ma Pha Khinh	Xã Pá Ma Pha Khinh	Pa Ma Pha Khinh Commune	pa_ma_pha_khinh	118	10
03700	Chiềng Ơn	Chieng On	Xã Chiềng Ơn	Chieng On Commune	chieng_on	118	10
03703	Mường Giàng	Muong Giang	Xã Mường Giàng	Muong Giang Commune	muong_giang	118	10
03706	Chiềng Bằng	Chieng Bang	Xã Chiềng Bằng	Chieng Bang Commune	chieng_bang	118	10
03709	Mường Sại	Muong Sai	Xã Mường Sại	Muong Sai Commune	muong_sai	118	10
03712	Nậm ét	Nam et	Xã Nậm ét	Nam et Commune	nam_et	118	10
03718	Chiềng Khoang	Chieng Khoang	Xã Chiềng Khoang	Chieng Khoang Commune	chieng_khoang	118	10
03721	Thuận Châu	Thuan Chau	Thị trấn Thuận Châu	Thuan Chau Township	thuan_chau	119	9
03724	Phổng Lái	Phong Lai	Xã Phổng Lái	Phong Lai Commune	phong_lai	119	10
03727	Mường é	Muong e	Xã Mường é	Muong e Commune	muong_e	119	10
03730	Chiềng Pha	Chieng Pha	Xã Chiềng Pha	Chieng Pha Commune	chieng_pha	119	10
03733	Chiềng La	Chieng La	Xã Chiềng La	Chieng La Commune	chieng_la	119	10
03736	Chiềng Ngàm	Chieng Ngam	Xã Chiềng Ngàm	Chieng Ngam Commune	chieng_ngam	119	10
03739	Liệp Tè	Liep Te	Xã Liệp Tè	Liep Te Commune	liep_te	119	10
03742	é Tòng	e Tong	Xã é Tòng	e Tong Commune	e_tong	119	10
03745	Phổng Lập	Phong Lap	Xã Phổng Lập	Phong Lap Commune	phong_lap	119	10
03748	Phổng Lăng	Phong Lang	Xã Phổng Lăng	Phong Lang Commune	phong_lang	119	10
03751	Chiềng Ly	Chieng Ly	Xã Chiềng Ly	Chieng Ly Commune	chieng_ly	119	10
03754	Noong Lay	Noong Lay	Xã Noong Lay	Noong Lay Commune	noong_lay	119	10
03757	Mường Khiêng	Muong Khieng	Xã Mường Khiêng	Muong Khieng Commune	muong_khieng	119	10
03760	Mường Bám	Muong Bam	Xã Mường Bám	Muong Bam Commune	muong_bam	119	10
03763	Long Hẹ	Long He	Xã Long Hẹ	Long He Commune	long_he	119	10
03766	Chiềng Bôm	Chieng Bom	Xã Chiềng Bôm	Chieng Bom Commune	chieng_bom	119	10
03769	Thôm Mòn	Thom Mon	Xã Thôm Mòn	Thom Mon Commune	thom_mon	119	10
03772	Tông Lạnh	Tong Lanh	Xã Tông Lạnh	Tong Lanh Commune	tong_lanh	119	10
03775	Tông Cọ	Tong Co	Xã Tông Cọ	Tong Co Commune	tong_co	119	10
03778	Bó Mười	Bo Muoi	Xã Bó Mười	Bo Muoi Commune	bo_muoi	119	10
03781	Co Mạ	Co Ma	Xã Co Mạ	Co Ma Commune	co_ma	119	10
03784	Púng Tra	Pung Tra	Xã Púng Tra	Pung Tra Commune	pung_tra	119	10
03787	Chiềng Pấc	Chieng Pac	Xã Chiềng Pấc	Chieng Pac Commune	chieng_pac	119	10
03790	Nậm Lầu	Nam Lau	Xã Nậm Lầu	Nam Lau Commune	nam_lau	119	10
03793	Bon Phặng	Bon Phang	Xã Bon Phặng	Bon Phang Commune	bon_phang	119	10
03796	Co Tòng	Co Tong	Xã Co Tòng	Co Tong Commune	co_tong	119	10
03799	Muổi Nọi	Muoi Noi	Xã Muổi Nọi	Muoi Noi Commune	muoi_noi	119	10
03802	Pá Lông	Pa Long	Xã Pá Lông	Pa Long Commune	pa_long	119	10
03805	Bản Lầm	Ban Lam	Xã Bản Lầm	Ban Lam Commune	ban_lam	119	10
03808	Ít Ong	It Ong	Thị trấn Ít Ong	It Ong Township	it_ong	120	9
03811	Nậm Giôn	Nam Gion	Xã Nậm Giôn	Nam Gion Commune	nam_gion	120	10
03814	Chiềng Lao	Chieng Lao	Xã Chiềng Lao	Chieng Lao Commune	chieng_lao	120	10
03817	Hua Trai	Hua Trai	Xã Hua Trai	Hua Trai Commune	hua_trai	120	10
03820	Ngọc Chiến	Ngoc Chien	Xã Ngọc Chiến	Ngoc Chien Commune	ngoc_chien	120	10
03823	Mường Trai	Muong Trai	Xã Mường Trai	Muong Trai Commune	muong_trai	120	10
03826	Nậm Păm	Nam Pam	Xã Nậm Păm	Nam Pam Commune	nam_pam	120	10
03829	Chiềng Muôn	Chieng Muon	Xã Chiềng Muôn	Chieng Muon Commune	chieng_muon	120	10
03832	Chiềng Ân	Chieng An	Xã Chiềng Ân	Chieng An Commune	chieng_an	120	10
03835	Pi Toong	Pi Toong	Xã Pi Toong	Pi Toong Commune	pi_toong	120	10
03838	Chiềng Công	Chieng Cong	Xã Chiềng Công	Chieng Cong Commune	chieng_cong	120	10
03841	Tạ Bú	Ta Bu	Xã Tạ Bú	Ta Bu Commune	ta_bu	120	10
03844	Chiềng San	Chieng San	Xã Chiềng San	Chieng San Commune	chieng_san	120	10
03847	Mường Bú	Muong Bu	Xã Mường Bú	Muong Bu Commune	muong_bu	120	10
03850	Chiềng Hoa	Chieng Hoa	Xã Chiềng Hoa	Chieng Hoa Commune	chieng_hoa	120	10
03853	Mường Chùm	Muong Chum	Xã Mường Chùm	Muong Chum Commune	muong_chum	120	10
03856	Bắc Yên	Bac Yen	Thị trấn Bắc Yên	Bac Yen Township	bac_yen	121	9
03859	Phiêng Ban	Phieng Ban	Xã Phiêng Ban	Phieng Ban Commune	phieng_ban	121	10
03862	Hang Chú	Hang Chu	Xã Hang Chú	Hang Chu Commune	hang_chu	121	10
03865	Xím Vàng	Xim Vang	Xã Xím Vàng	Xim Vang Commune	xim_vang	121	10
03868	Tà Xùa	Ta Xua	Xã Tà Xùa	Ta Xua Commune	ta_xua	121	10
03869	Háng Đồng	Hang Dong	Xã Háng Đồng	Hang Dong Commune	hang_dong	121	10
03871	Pắc Ngà	Pac Nga	Xã Pắc Ngà	Pac Nga Commune	pac_nga	121	10
03874	Làng Chếu	Lang Cheu	Xã Làng Chếu	Lang Cheu Commune	lang_cheu	121	10
03877	Chim Vàn	Chim Van	Xã Chim Vàn	Chim Van Commune	chim_van	121	10
03880	Mường Khoa	Muong Khoa	Xã Mường Khoa	Muong Khoa Commune	muong_khoa	121	10
03883	Song Pe	Song Pe	Xã Song Pe	Song Pe Commune	song_pe	121	10
03886	Hồng Ngài	Hong Ngai	Xã Hồng Ngài	Hong Ngai Commune	hong_ngai	121	10
03889	Tạ Khoa	Ta Khoa	Xã Tạ Khoa	Ta Khoa Commune	ta_khoa	121	10
03890	Hua Nhàn	Hua Nhan	Xã Hua Nhàn	Hua Nhan Commune	hua_nhan	121	10
03892	Phiêng Côn	Phieng Con	Xã Phiêng Côn	Phieng Con Commune	phieng_con	121	10
03895	Chiềng Sại	Chieng Sai	Xã Chiềng Sại	Chieng Sai Commune	chieng_sai	121	10
03898	Phù Yên	Phu Yen	Thị trấn Phù Yên	Phu Yen Township	phu_yen	122	9
03901	Suối Tọ	Suoi To	Xã Suối Tọ	Suoi To Commune	suoi_to	122	10
03904	Mường Thải	Muong Thai	Xã Mường Thải	Muong Thai Commune	muong_thai	122	10
03907	Mường Cơi	Muong Coi	Xã Mường Cơi	Muong Coi Commune	muong_coi	122	10
03910	Quang Huy	Quang Huy	Xã Quang Huy	Quang Huy Commune	quang_huy	122	10
03913	Huy Bắc	Huy Bac	Xã Huy Bắc	Huy Bac Commune	huy_bac	122	10
03916	Huy Thượng	Huy Thuong	Xã Huy Thượng	Huy Thuong Commune	huy_thuong	122	10
03919	Tân Lang	Tan Lang	Xã Tân Lang	Tan Lang Commune	tan_lang	122	10
03922	Gia Phù	Gia Phu	Xã Gia Phù	Gia Phu Commune	gia_phu	122	10
03925	Tường Phù	Tuong Phu	Xã Tường Phù	Tuong Phu Commune	tuong_phu	122	10
03928	Huy Hạ	Huy Ha	Xã Huy Hạ	Huy Ha Commune	huy_ha	122	10
03931	Huy Tân	Huy Tan	Xã Huy Tân	Huy Tan Commune	huy_tan	122	10
03934	Mường Lang	Muong Lang	Xã Mường Lang	Muong Lang Commune	muong_lang	122	10
03937	Suối Bau	Suoi Bau	Xã Suối Bau	Suoi Bau Commune	suoi_bau	122	10
03940	Huy Tường	Huy Tuong	Xã Huy Tường	Huy Tuong Commune	huy_tuong	122	10
03943	Mường Do	Muong Do	Xã Mường Do	Muong Do Commune	muong_do	122	10
03946	Sập Xa	Sap Xa	Xã Sập Xa	Sap Xa Commune	sap_xa	122	10
03949	Tường Thượng	Tuong Thuong	Xã Tường Thượng	Tuong Thuong Commune	tuong_thuong	122	10
03952	Tường Tiến	Tuong Tien	Xã Tường Tiến	Tuong Tien Commune	tuong_tien	122	10
03955	Tường Phong	Tuong Phong	Xã Tường Phong	Tuong Phong Commune	tuong_phong	122	10
03958	Tường Hạ	Tuong Ha	Xã Tường Hạ	Tuong Ha Commune	tuong_ha	122	10
03961	Kim Bon	Kim Bon	Xã Kim Bon	Kim Bon Commune	kim_bon	122	10
03964	Mường Bang	Muong Bang	Xã Mường Bang	Muong Bang Commune	muong_bang	122	10
03967	Đá Đỏ	Da Do	Xã Đá Đỏ	Da Do Commune	da_do	122	10
03970	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	122	10
03973	Nam Phong	Nam Phong	Xã Nam Phong	Nam Phong Commune	nam_phong	122	10
03976	Bắc Phong	Bac Phong	Xã Bắc Phong	Bac Phong Commune	bac_phong	122	10
03979	Mộc Châu	Moc Chau	Thị trấn Mộc Châu	Moc Chau Township	moc_chau	123	9
03982	NT Mộc Châu	NT Moc Chau	Thị trấn NT Mộc Châu	NT Moc Chau Township	nt_moc_chau	123	9
03985	Chiềng Sơn	Chieng Son	Xã Chiềng Sơn	Chieng Son Commune	chieng_son	123	10
03988	Tân Hợp	Tan Hop	Xã Tân Hợp	Tan Hop Commune	tan_hop	123	10
03991	Qui Hướng	Qui Huong	Xã Qui Hướng	Qui Huong Commune	qui_huong	123	10
03997	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	123	10
04000	Nà Mường	Na Muong	Xã Nà Mường	Na Muong Commune	na_muong	123	10
04003	Tà Lai	Ta Lai	Xã Tà Lai	Ta Lai Commune	ta_lai	123	10
04012	Chiềng Hắc	Chieng Hac	Xã Chiềng Hắc	Chieng Hac Commune	chieng_hac	123	10
04015	Hua Păng	Hua Pang	Xã Hua Păng	Hua Pang Commune	hua_pang	123	10
04024	Chiềng Khừa	Chieng Khua	Xã Chiềng Khừa	Chieng Khua Commune	chieng_khua	123	10
04027	Mường Sang	Muong Sang	Xã Mường Sang	Muong Sang Commune	muong_sang	123	10
04030	Đông Sang	Dong Sang	Xã Đông Sang	Dong Sang Commune	dong_sang	123	10
04033	Phiêng Luông	Phieng Luong	Xã Phiêng Luông	Phieng Luong Commune	phieng_luong	123	10
04045	Lóng Sập	Long Sap	Xã Lóng Sập	Long Sap Commune	long_sap	123	10
04060	Yên Châu	Yen Chau	Thị trấn Yên Châu	Yen Chau Township	yen_chau	124	9
04063	Chiềng Đông	Chieng Dong	Xã Chiềng Đông	Chieng Dong Commune	chieng_dong	124	10
04066	Sập Vạt	Sap Vat	Xã Sập Vạt	Sap Vat Commune	sap_vat	124	10
04069	Chiềng Sàng	Chieng Sang	Xã Chiềng Sàng	Chieng Sang Commune	chieng_sang	124	10
04072	Chiềng Pằn	Chieng Pan	Xã Chiềng Pằn	Chieng Pan Commune	chieng_pan	124	10
04075	Viêng Lán	Vieng Lan	Xã Viêng Lán	Vieng Lan Commune	vieng_lan	124	10
04078	Chiềng Hặc	Chieng Hac	Xã Chiềng Hặc	Chieng Hac Commune	chieng_hac	124	10
04081	Mường Lựm	Muong Lum	Xã Mường Lựm	Muong Lum Commune	muong_lum	124	10
04084	Chiềng On	Chieng On	Xã Chiềng On	Chieng On Commune	chieng_on	124	10
04087	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	124	10
04090	Chiềng Khoi	Chieng Khoi	Xã Chiềng Khoi	Chieng Khoi Commune	chieng_khoi	124	10
04093	Tú Nang	Tu Nang	Xã Tú Nang	Tu Nang Commune	tu_nang	124	10
04096	Lóng Phiêng	Long Phieng	Xã Lóng Phiêng	Long Phieng Commune	long_phieng	124	10
04099	Phiêng Khoài	Phieng Khoai	Xã Phiêng Khoài	Phieng Khoai Commune	phieng_khoai	124	10
04102	Chiềng Tương	Chieng Tuong	Xã Chiềng Tương	Chieng Tuong Commune	chieng_tuong	124	10
04105	Hát Lót	Hat Lot	Thị trấn Hát Lót	Hat Lot Township	hat_lot	125	9
04108	Chiềng Sung	Chieng Sung	Xã Chiềng Sung	Chieng Sung Commune	chieng_sung	125	10
04111	Mường Bằng	Muong Bang	Xã Mường Bằng	Muong Bang Commune	muong_bang	125	10
04114	Chiềng Chăn	Chieng Chan	Xã Chiềng Chăn	Chieng Chan Commune	chieng_chan	125	10
04117	Mương Chanh	Muong Chanh	Xã Mương Chanh	Muong Chanh Commune	muong_chanh	125	10
04120	Chiềng Ban	Chieng Ban	Xã Chiềng Ban	Chieng Ban Commune	chieng_ban	125	10
04123	Chiềng Mung	Chieng Mung	Xã Chiềng Mung	Chieng Mung Commune	chieng_mung	125	10
04126	Mường Bon	Muong Bon	Xã Mường Bon	Muong Bon Commune	muong_bon	125	10
04129	Chiềng Chung	Chieng Chung	Xã Chiềng Chung	Chieng Chung Commune	chieng_chung	125	10
04132	Chiềng Mai	Chieng Mai	Xã Chiềng Mai	Chieng Mai Commune	chieng_mai	125	10
04135	Hát Lót	Hat Lot	Xã Hát Lót	Hat Lot Commune	hat_lot	125	10
04136	Nà Pó	Na Po	Xã Nà Pó	Na Po Commune	na_po	125	10
04138	Cò  Nòi	Co  Noi	Xã Cò  Nòi	Co  Noi Commune	co__noi	125	10
04141	Chiềng Nơi	Chieng Noi	Xã Chiềng Nơi	Chieng Noi Commune	chieng_noi	125	10
04144	Phiêng Cằm	Phieng Cam	Xã Phiêng Cằm	Phieng Cam Commune	phieng_cam	125	10
04147	Chiềng Dong	Chieng Dong	Xã Chiềng Dong	Chieng Dong Commune	chieng_dong	125	10
04150	Chiềng Kheo	Chieng Kheo	Xã Chiềng Kheo	Chieng Kheo Commune	chieng_kheo	125	10
04153	Chiềng Ve	Chieng Ve	Xã Chiềng Ve	Chieng Ve Commune	chieng_ve	125	10
04156	Chiềng Lương	Chieng Luong	Xã Chiềng Lương	Chieng Luong Commune	chieng_luong	125	10
04159	Phiêng Pằn	Phieng Pan	Xã Phiêng Pằn	Phieng Pan Commune	phieng_pan	125	10
04162	Nà Ơt	Na Ot	Xã Nà Ơt	Na Ot Commune	na_ot	125	10
04165	Tà Hộc	Ta Hoc	Xã Tà Hộc	Ta Hoc Commune	ta_hoc	125	10
04168	Sông Mã	Song Ma	Thị trấn Sông Mã	Song Ma Township	song_ma	126	9
04171	Bó Sinh	Bo Sinh	Xã Bó Sinh	Bo Sinh Commune	bo_sinh	126	10
04174	Pú Pẩu	Pu Pau	Xã Pú Pẩu	Pu Pau Commune	pu_pau	126	10
04177	Chiềng Phung	Chieng Phung	Xã Chiềng Phung	Chieng Phung Commune	chieng_phung	126	10
04180	Chiềng En	Chieng En	Xã Chiềng En	Chieng En Commune	chieng_en	126	10
04183	Mường Lầm	Muong Lam	Xã Mường Lầm	Muong Lam Commune	muong_lam	126	10
04189	Đứa Mòn	Dua Mon	Xã Đứa Mòn	Dua Mon Commune	dua_mon	126	10
04192	Yên Hưng	Yen Hung	Xã Yên Hưng	Yen Hung Commune	yen_hung	126	10
04195	Chiềng Sơ	Chieng So	Xã Chiềng Sơ	Chieng So Commune	chieng_so	126	10
04198	Nà Nghịu	Na Nghiu	Xã Nà Nghịu	Na Nghiu Commune	na_nghiu	126	10
04201	Nậm Mằn	Nam Man	Xã Nậm Mằn	Nam Man Commune	nam_man	126	10
04204	Chiềng Khoong	Chieng Khoong	Xã Chiềng Khoong	Chieng Khoong Commune	chieng_khoong	126	10
04207	Chiềng Cang	Chieng Cang	Xã Chiềng Cang	Chieng Cang Commune	chieng_cang	126	10
04210	Huổi Một	Huoi Mot	Xã Huổi Một	Huoi Mot Commune	huoi_mot	126	10
04213	Mường Sai	Muong Sai	Xã Mường Sai	Muong Sai Commune	muong_sai	126	10
04216	Mường Cai	Muong Cai	Xã Mường Cai	Muong Cai Commune	muong_cai	126	10
04219	Mường Hung	Muong Hung	Xã Mường Hung	Muong Hung Commune	muong_hung	126	10
04222	Chiềng Khương	Chieng Khuong	Xã Chiềng Khương	Chieng Khuong Commune	chieng_khuong	126	10
04225	Sam Kha	Sam Kha	Xã Sam Kha	Sam Kha Commune	sam_kha	127	10
04228	Púng Bánh	Pung Banh	Xã Púng Bánh	Pung Banh Commune	pung_banh	127	10
04231	Sốp Cộp	Sop Cop	Xã Sốp Cộp	Sop Cop Commune	sop_cop	127	10
04234	Dồm Cang	Dom Cang	Xã Dồm Cang	Dom Cang Commune	dom_cang	127	10
04237	Nậm Lạnh	Nam Lanh	Xã Nậm Lạnh	Nam Lanh Commune	nam_lanh	127	10
04240	Mường Lèo	Muong Leo	Xã Mường Lèo	Muong Leo Commune	muong_leo	127	10
04243	Mường Và	Muong Va	Xã Mường Và	Muong Va Commune	muong_va	127	10
04246	Mường Lạn	Muong Lan	Xã Mường Lạn	Muong Lan Commune	muong_lan	127	10
03994	Suối Bàng	Suoi Bang	Xã Suối Bàng	Suoi Bang Commune	suoi_bang	128	10
04006	Song Khủa	Song Khua	Xã Song Khủa	Song Khua Commune	song_khua	128	10
04009	Liên Hoà	Lien Hoa	Xã Liên Hoà	Lien Hoa Commune	lien_hoa	128	10
04018	Tô Múa	To Mua	Xã Tô Múa	To Mua Commune	to_mua	128	10
04021	Mường Tè	Muong Te	Xã Mường Tè	Muong Te Commune	muong_te	128	10
04036	Chiềng Khoa	Chieng Khoa	Xã Chiềng Khoa	Chieng Khoa Commune	chieng_khoa	128	10
04039	Mường Men	Muong Men	Xã Mường Men	Muong Men Commune	muong_men	128	10
04042	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	128	10
04048	Vân Hồ	Van Ho	Xã Vân Hồ	Van Ho Commune	van_ho	128	10
04051	Lóng Luông	Long Luong	Xã Lóng Luông	Long Luong Commune	long_luong	128	10
04054	Chiềng Yên	Chieng Yen	Xã Chiềng Yên	Chieng Yen Commune	chieng_yen	128	10
04056	Chiềng Xuân	Chieng Xuan	Xã Chiềng Xuân	Chieng Xuan Commune	chieng_xuan	128	10
04057	Xuân Nha	Xuan Nha	Xã Xuân Nha	Xuan Nha Commune	xuan_nha	128	10
04058	Tân Xuân	Tan Xuan	Xã Tân Xuân	Tan Xuan Commune	tan_xuan	128	10
04249	Yên Thịnh	Yen Thinh	Phường Yên Thịnh	Yen Thinh Ward	yen_thinh	132	8
04252	Yên Ninh	Yen Ninh	Phường Yên Ninh	Yen Ninh Ward	yen_ninh	132	8
04255	Minh Tân	Minh Tan	Phường Minh Tân	Minh Tan Ward	minh_tan	132	8
04258	Nguyễn Thái Học	Nguyen Thai Hoc	Phường Nguyễn Thái Học	Nguyen Thai Hoc Ward	nguyen_thai_hoc	132	8
04261	Đồng Tâm	Dong Tam	Phường Đồng Tâm	Dong Tam Ward	dong_tam	132	8
04264	Nguyễn Phúc	Nguyen Phuc	Phường Nguyễn Phúc	Nguyen Phuc Ward	nguyen_phuc	132	8
04267	Hồng Hà	Hong Ha	Phường Hồng Hà	Hong Ha Ward	hong_ha	132	8
04270	Minh Bảo	Minh Bao	Xã Minh Bảo	Minh Bao Commune	minh_bao	132	10
04273	Nam Cường	Nam Cuong	Phường Nam Cường	Nam Cuong Ward	nam_cuong	132	8
04276	Tuy Lộc	Tuy Loc	Xã Tuy Lộc	Tuy Loc Commune	tuy_loc	132	10
04279	Tân Thịnh	Tan Thinh	Xã Tân Thịnh	Tan Thinh Commune	tan_thinh	132	10
04540	Âu Lâu	Au Lau	Xã Âu Lâu	Au Lau Commune	au_lau	132	10
04543	Giới Phiên	Gioi Phien	Xã Giới Phiên	Gioi Phien Commune	gioi_phien	132	10
04546	Hợp Minh	Hop Minh	Phường Hợp Minh	Hop Minh Ward	hop_minh	132	8
04558	Văn Phú	Van Phu	Xã Văn Phú	Van Phu Commune	van_phu	132	10
04282	Pú Trạng	Pu Trang	Phường Pú Trạng	Pu Trang Ward	pu_trang	133	8
04285	Trung Tâm	Trung Tam	Phường Trung Tâm	Trung Tam Ward	trung_tam	133	8
04288	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	133	8
04291	Cầu Thia	Cau Thia	Phường Cầu Thia	Cau Thia Ward	cau_thia	133	8
04294	Nghĩa Lợi	Nghia Loi	Xã Nghĩa Lợi	Nghia Loi Commune	nghia_loi	133	10
04297	Nghĩa Phúc	Nghia Phuc	Xã Nghĩa Phúc	Nghia Phuc Commune	nghia_phuc	133	10
04300	Nghĩa An	Nghia An	Xã Nghĩa An	Nghia An Commune	nghia_an	133	10
04624	Nghĩa Lộ	Nghia Lo	Xã Nghĩa Lộ	Nghia Lo Commune	nghia_lo	133	10
04660	Sơn A	Son A	Xã Sơn A	Son A Commune	son_a	133	10
04663	Phù Nham	Phu Nham	Xã Phù Nham	Phu Nham Commune	phu_nham	133	10
04675	Thanh Lương	Thanh Luong	Xã Thanh Lương	Thanh Luong Commune	thanh_luong	133	10
04678	Hạnh Sơn	Hanh Son	Xã Hạnh Sơn	Hanh Son Commune	hanh_son	133	10
04681	Phúc Sơn	Phuc Son	Xã Phúc Sơn	Phuc Son Commune	phuc_son	133	10
04684	Thạch Lương	Thach Luong	Xã Thạch Lương	Thach Luong Commune	thach_luong	133	10
04303	Yên Thế	Yen The	Thị trấn Yên Thế	Yen The Township	yen_the	135	9
04306	Tân Phượng	Tan Phuong	Xã Tân Phượng	Tan Phuong Commune	tan_phuong	135	10
04309	Lâm Thượng	Lam Thuong	Xã Lâm Thượng	Lam Thuong Commune	lam_thuong	135	10
04312	Khánh Thiện	Khanh Thien	Xã Khánh Thiện	Khanh Thien Commune	khanh_thien	135	10
04315	Minh Chuẩn	Minh Chuan	Xã Minh Chuẩn	Minh Chuan Commune	minh_chuan	135	10
04318	Mai Sơn	Mai Son	Xã Mai Sơn	Mai Son Commune	mai_son	135	10
04321	Khai Trung	Khai Trung	Xã Khai Trung	Khai Trung Commune	khai_trung	135	10
04324	Mường Lai	Muong Lai	Xã Mường Lai	Muong Lai Commune	muong_lai	135	10
04327	An Lạc	An Lac	Xã An Lạc	An Lac Commune	an_lac	135	10
04330	Minh Xuân	Minh Xuan	Xã Minh Xuân	Minh Xuan Commune	minh_xuan	135	10
04333	Tô Mậu	To Mau	Xã Tô Mậu	To Mau Commune	to_mau	135	10
04336	Tân Lĩnh	Tan Linh	Xã Tân Lĩnh	Tan Linh Commune	tan_linh	135	10
04339	Yên Thắng	Yen Thang	Xã Yên Thắng	Yen Thang Commune	yen_thang	135	10
04342	Khánh Hoà	Khanh Hoa	Xã Khánh Hoà	Khanh Hoa Commune	khanh_hoa	135	10
04345	Vĩnh Lạc	Vinh Lac	Xã Vĩnh Lạc	Vinh Lac Commune	vinh_lac	135	10
04348	Liễu Đô	Lieu Do	Xã Liễu Đô	Lieu Do Commune	lieu_do	135	10
04351	Động Quan	Dong Quan	Xã Động Quan	Dong Quan Commune	dong_quan	135	10
04354	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	135	10
04357	Minh Tiến	Minh Tien	Xã Minh Tiến	Minh Tien Commune	minh_tien	135	10
04360	Trúc Lâu	Truc Lau	Xã Trúc Lâu	Truc Lau Commune	truc_lau	135	10
04363	Phúc Lợi	Phuc Loi	Xã Phúc Lợi	Phuc Loi Commune	phuc_loi	135	10
04366	Phan Thanh	Phan Thanh	Xã Phan Thanh	Phan Thanh Commune	phan_thanh	135	10
04369	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	135	10
04372	Trung Tâm	Trung Tam	Xã Trung Tâm	Trung Tam Commune	trung_tam	135	10
04375	Mậu A	Mau A	Thị trấn Mậu A	Mau A Township	mau_a	136	9
04378	Lang Thíp	Lang Thip	Xã Lang Thíp	Lang Thip Commune	lang_thip	136	10
04381	Lâm Giang	Lam Giang	Xã Lâm Giang	Lam Giang Commune	lam_giang	136	10
04384	Châu Quế Thượng	Chau Que Thuong	Xã Châu Quế Thượng	Chau Que Thuong Commune	chau_que_thuong	136	10
04387	Châu Quế Hạ	Chau Que Ha	Xã Châu Quế Hạ	Chau Que Ha Commune	chau_que_ha	136	10
04390	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	136	10
04393	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	136	10
04396	Đông An	Dong An	Xã Đông An	Dong An Commune	dong_an	136	10
04399	Đông Cuông	Dong Cuong	Xã Đông Cuông	Dong Cuong Commune	dong_cuong	136	10
04402	Phong Dụ Hạ	Phong Du Ha	Xã Phong Dụ Hạ	Phong Du Ha Commune	phong_du_ha	136	10
04405	Mậu Đông	Mau Dong	Xã Mậu Đông	Mau Dong Commune	mau_dong	136	10
04408	Ngòi A	Ngoi A	Xã Ngòi A	Ngoi A Commune	ngoi_a	136	10
04411	Xuân Tầm	Xuan Tam	Xã Xuân Tầm	Xuan Tam Commune	xuan_tam	136	10
04414	Tân Hợp	Tan Hop	Xã Tân Hợp	Tan Hop Commune	tan_hop	136	10
04417	An Thịnh	An Thinh	Xã An Thịnh	An Thinh Commune	an_thinh	136	10
04420	Yên Thái	Yen Thai	Xã Yên Thái	Yen Thai Commune	yen_thai	136	10
04423	Phong Dụ Thượng	Phong Du Thuong	Xã Phong Dụ Thượng	Phong Du Thuong Commune	phong_du_thuong	136	10
04426	Yên Hợp	Yen Hop	Xã Yên Hợp	Yen Hop Commune	yen_hop	136	10
04429	Đại Sơn	Dai Son	Xã Đại Sơn	Dai Son Commune	dai_son	136	10
04435	Đại Phác	Dai Phac	Xã Đại Phác	Dai Phac Commune	dai_phac	136	10
04438	Yên Phú	Yen Phu	Xã Yên Phú	Yen Phu Commune	yen_phu	136	10
04441	Xuân Ái	Xuan Ai	Xã Xuân Ái	Xuan Ai Commune	xuan_ai	136	10
04447	Viễn Sơn	Vien Son	Xã Viễn Sơn	Vien Son Commune	vien_son	136	10
04450	Mỏ Vàng	Mo Vang	Xã Mỏ Vàng	Mo Vang Commune	mo_vang	136	10
04453	Nà Hẩu	Na Hau	Xã Nà Hẩu	Na Hau Commune	na_hau	136	10
04456	Mù Căng Chải	Mu Cang Chai	Thị trấn Mù Căng Chải	Mu Cang Chai Township	mu_cang_chai	137	9
04459	Hồ Bốn	Ho Bon	Xã Hồ Bốn	Ho Bon Commune	ho_bon	137	10
04462	Nậm Có	Nam Co	Xã Nậm Có	Nam Co Commune	nam_co	137	10
04465	Khao Mang	Khao Mang	Xã Khao Mang	Khao Mang Commune	khao_mang	137	10
04468	Mồ Dề	Mo De	Xã Mồ Dề	Mo De Commune	mo_de	137	10
04471	Chế Cu Nha	Che Cu Nha	Xã Chế Cu Nha	Che Cu Nha Commune	che_cu_nha	137	10
04474	Lao Chải	Lao Chai	Xã Lao Chải	Lao Chai Commune	lao_chai	137	10
04477	Kim Nọi	Kim Noi	Xã Kim Nọi	Kim Noi Commune	kim_noi	137	10
04480	Cao Phạ	Cao Pha	Xã Cao Phạ	Cao Pha Commune	cao_pha	137	10
04483	La Pán Tẩn	La Pan Tan	Xã La Pán Tẩn	La Pan Tan Commune	la_pan_tan	137	10
04486	Dế Su Phình	De Su Phinh	Xã Dế Su Phình	De Su Phinh Commune	de_su_phinh	137	10
04489	Chế Tạo	Che Tao	Xã Chế Tạo	Che Tao Commune	che_tao	137	10
04492	Púng Luông	Pung Luong	Xã Púng Luông	Pung Luong Commune	pung_luong	137	10
04495	Nậm Khắt	Nam Khat	Xã Nậm Khắt	Nam Khat Commune	nam_khat	137	10
04498	Cổ Phúc	Co Phuc	Thị trấn Cổ Phúc	Co Phuc Township	co_phuc	138	9
04501	Tân Đồng	Tan Dong	Xã Tân Đồng	Tan Dong Commune	tan_dong	138	10
04504	Báo Đáp	Bao Dap	Xã Báo Đáp	Bao Dap Commune	bao_dap	138	10
04507	Đào Thịnh	Dao Thinh	Xã Đào Thịnh	Dao Thinh Commune	dao_thinh	138	10
04510	Việt Thành	Viet Thanh	Xã Việt Thành	Viet Thanh Commune	viet_thanh	138	10
04513	Hòa Cuông	Hoa Cuong	Xã Hòa Cuông	Hoa Cuong Commune	hoa_cuong	138	10
04516	Minh Quán	Minh Quan	Xã Minh Quán	Minh Quan Commune	minh_quan	138	10
04519	Quy Mông	Quy Mong	Xã Quy Mông	Quy Mong Commune	quy_mong	138	10
04522	Cường Thịnh	Cuong Thinh	Xã Cường Thịnh	Cuong Thinh Commune	cuong_thinh	138	10
04525	Kiên Thành	Kien Thanh	Xã Kiên Thành	Kien Thanh Commune	kien_thanh	138	10
04528	Nga Quán	Nga Quan	Xã Nga Quán	Nga Quan Commune	nga_quan	138	10
04531	Y Can	Y Can	Xã Y Can	Y Can Commune	y_can	138	10
04537	Lương Thịnh	Luong Thinh	Xã Lương Thịnh	Luong Thinh Commune	luong_thinh	138	10
04561	Bảo Hưng	Bao Hung	Xã Bảo Hưng	Bao Hung Commune	bao_hung	138	10
04564	Việt Cường	Viet Cuong	Xã Việt Cường	Viet Cuong Commune	viet_cuong	138	10
04567	Minh Quân	Minh Quan	Xã Minh Quân	Minh Quan Commune	minh_quan	138	10
04570	Hồng Ca	Hong Ca	Xã Hồng Ca	Hong Ca Commune	hong_ca	138	10
04573	Hưng Thịnh	Hung Thinh	Xã Hưng Thịnh	Hung Thinh Commune	hung_thinh	138	10
04576	Hưng Khánh	Hung Khanh	Xã Hưng Khánh	Hung Khanh Commune	hung_khanh	138	10
04579	Việt Hồng	Viet Hong	Xã Việt Hồng	Viet Hong Commune	viet_hong	138	10
04585	Trạm Tấu	Tram Tau	Thị trấn Trạm Tấu	Tram Tau Township	tram_tau	139	9
04588	Túc Đán	Tuc Dan	Xã Túc Đán	Tuc Dan Commune	tuc_dan	139	10
04591	Pá Lau	Pa Lau	Xã Pá Lau	Pa Lau Commune	pa_lau	139	10
04594	Xà Hồ	Xa Ho	Xã Xà Hồ	Xa Ho Commune	xa_ho	139	10
04597	Phình Hồ	Phinh Ho	Xã Phình Hồ	Phinh Ho Commune	phinh_ho	139	10
04600	Trạm Tấu	Tram Tau	Xã Trạm Tấu	Tram Tau Commune	tram_tau	139	10
04603	Tà Si Láng	Ta Si Lang	Xã Tà Si Láng	Ta Si Lang Commune	ta_si_lang	139	10
04606	Pá Hu	Pa Hu	Xã Pá Hu	Pa Hu Commune	pa_hu	139	10
04609	Làng Nhì	Lang Nhi	Xã Làng Nhì	Lang Nhi Commune	lang_nhi	139	10
04612	Bản Công	Ban Cong	Xã Bản Công	Ban Cong Commune	ban_cong	139	10
04615	Bản Mù	Ban Mu	Xã Bản Mù	Ban Mu Commune	ban_mu	139	10
04618	Hát Lìu	Hat Liu	Xã Hát Lìu	Hat Liu Commune	hat_liu	139	10
04621	NT Liên Sơn	NT Lien Son	Thị trấn NT Liên Sơn	NT Lien Son Township	nt_lien_son	140	9
04627	NT Trần Phú	NT Tran Phu	Thị trấn NT Trần Phú	NT Tran Phu Township	nt_tran_phu	140	9
04630	Tú Lệ	Tu Le	Xã Tú Lệ	Tu Le Commune	tu_le	140	10
04633	Nậm Búng	Nam Bung	Xã Nậm Búng	Nam Bung Commune	nam_bung	140	10
04636	Gia Hội	Gia Hoi	Xã Gia Hội	Gia Hoi Commune	gia_hoi	140	10
04639	Sùng Đô	Sung Do	Xã Sùng Đô	Sung Do Commune	sung_do	140	10
04642	Nậm Mười	Nam Muoi	Xã Nậm Mười	Nam Muoi Commune	nam_muoi	140	10
04645	An Lương	An Luong	Xã An Lương	An Luong Commune	an_luong	140	10
04648	Nậm Lành	Nam Lanh	Xã Nậm Lành	Nam Lanh Commune	nam_lanh	140	10
04651	Sơn Lương	Son Luong	Xã Sơn Lương	Son Luong Commune	son_luong	140	10
04654	Suối Quyền	Suoi Quyen	Xã Suối Quyền	Suoi Quyen Commune	suoi_quyen	140	10
04657	Suối Giàng	Suoi Giang	Xã Suối Giàng	Suoi Giang Commune	suoi_giang	140	10
04666	Nghĩa Sơn	Nghia Son	Xã Nghĩa Sơn	Nghia Son Commune	nghia_son	140	10
04669	Suối Bu	Suoi Bu	Xã Suối Bu	Suoi Bu Commune	suoi_bu	140	10
04672	Sơn Thịnh	Son Thinh	Thị trấn Sơn Thịnh	Son Thinh Township	son_thinh	140	9
04687	Đại Lịch	Dai Lich	Xã Đại Lịch	Dai Lich Commune	dai_lich	140	10
04690	Đồng Khê	Dong Khe	Xã Đồng Khê	Dong Khe Commune	dong_khe	140	10
04693	Cát Thịnh	Cat Thinh	Xã Cát Thịnh	Cat Thinh Commune	cat_thinh	140	10
04696	Tân Thịnh	Tan Thinh	Xã Tân Thịnh	Tan Thinh Commune	tan_thinh	140	10
04699	Chấn Thịnh	Chan Thinh	Xã Chấn Thịnh	Chan Thinh Commune	chan_thinh	140	10
04702	Bình Thuận	Binh Thuan	Xã Bình Thuận	Binh Thuan Commune	binh_thuan	140	10
04705	Thượng Bằng La	Thuong Bang La	Xã Thượng Bằng La	Thuong Bang La Commune	thuong_bang_la	140	10
04708	Minh An	Minh An	Xã Minh An	Minh An Commune	minh_an	140	10
04711	Nghĩa Tâm	Nghia Tam	Xã Nghĩa Tâm	Nghia Tam Commune	nghia_tam	140	10
04714	Yên Bình	Yen Binh	Thị trấn Yên Bình	Yen Binh Township	yen_binh	141	9
04717	Thác Bà	Thac Ba	Thị trấn Thác Bà	Thac Ba Township	thac_ba	141	9
04720	Xuân Long	Xuan Long	Xã Xuân Long	Xuan Long Commune	xuan_long	141	10
04726	Cảm Nhân	Cam Nhan	Xã Cảm Nhân	Cam Nhan Commune	cam_nhan	141	10
04729	Ngọc Chấn	Ngoc Chan	Xã Ngọc Chấn	Ngoc Chan Commune	ngoc_chan	141	10
04732	Tân Nguyên	Tan Nguyen	Xã Tân Nguyên	Tan Nguyen Commune	tan_nguyen	141	10
04735	Phúc Ninh	Phuc Ninh	Xã Phúc Ninh	Phuc Ninh Commune	phuc_ninh	141	10
04738	Bảo Ái	Bao Ai	Xã Bảo Ái	Bao Ai Commune	bao_ai	141	10
04741	Mỹ Gia	My Gia	Xã Mỹ Gia	My Gia Commune	my_gia	141	10
04744	Xuân Lai	Xuan Lai	Xã Xuân Lai	Xuan Lai Commune	xuan_lai	141	10
04747	Mông Sơn	Mong Son	Xã Mông Sơn	Mong Son Commune	mong_son	141	10
04750	Cảm Ân	Cam An	Xã Cảm Ân	Cam An Commune	cam_an	141	10
04753	Yên Thành	Yen Thanh	Xã Yên Thành	Yen Thanh Commune	yen_thanh	141	10
04756	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	141	10
04759	Phúc An	Phuc An	Xã Phúc An	Phuc An Commune	phuc_an	141	10
04762	Bạch Hà	Bach Ha	Xã Bạch Hà	Bach Ha Commune	bach_ha	141	10
04765	Vũ Linh	Vu Linh	Xã Vũ Linh	Vu Linh Commune	vu_linh	141	10
04768	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	141	10
04771	Vĩnh Kiên	Vinh Kien	Xã Vĩnh Kiên	Vinh Kien Commune	vinh_kien	141	10
04774	Yên Bình	Yen Binh	Xã Yên Bình	Yen Binh Commune	yen_binh	141	10
04777	Thịnh Hưng	Thinh Hung	Xã Thịnh Hưng	Thinh Hung Commune	thinh_hung	141	10
04780	Hán Đà	Han Da	Xã Hán Đà	Han Da Commune	han_da	141	10
04783	Phú Thịnh	Phu Thinh	Xã Phú Thịnh	Phu Thinh Commune	phu_thinh	141	10
04786	Đại Minh	Dai Minh	Xã Đại Minh	Dai Minh Commune	dai_minh	141	10
04789	Thái Bình	Thai Binh	Phường Thái Bình	Thai Binh Ward	thai_binh	148	8
04792	Tân Hòa	Tan Hoa	Phường Tân Hòa	Tan Hoa Ward	tan_hoa	148	8
04795	Thịnh Lang	Thinh Lang	Phường Thịnh Lang	Thinh Lang Ward	thinh_lang	148	8
04798	Hữu Nghị	Huu Nghi	Phường Hữu Nghị	Huu Nghi Ward	huu_nghi	148	8
04801	Tân Thịnh	Tan Thinh	Phường Tân Thịnh	Tan Thinh Ward	tan_thinh	148	8
04804	Đồng Tiến	Dong Tien	Phường Đồng Tiến	Dong Tien Ward	dong_tien	148	8
04807	Phương Lâm	Phuong Lam	Phường Phương Lâm	Phuong Lam Ward	phuong_lam	148	8
04813	Yên Mông	Yen Mong	Xã Yên Mông	Yen Mong Commune	yen_mong	148	10
04816	Quỳnh Lâm	Quynh Lam	Phường Quỳnh Lâm	Quynh Lam Ward	quynh_lam	148	8
04819	Dân Chủ	Dan Chu	Phường Dân Chủ	Dan Chu Ward	dan_chu	148	8
04825	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	148	10
04828	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	148	8
04894	Kỳ Sơn	Ky Son	Phường Kỳ Sơn	Ky Son Ward	ky_son	148	8
04897	Thịnh Minh	Thinh Minh	Xã Thịnh Minh	Thinh Minh Commune	thinh_minh	148	10
04903	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	148	10
04906	Quang Tiến	Quang Tien	Xã Quang Tiến	Quang Tien Commune	quang_tien	148	10
04912	Mông Hóa	Mong Hoa	Xã Mông Hóa	Mong Hoa Commune	mong_hoa	148	10
04918	Trung Minh	Trung Minh	Phường Trung Minh	Trung Minh Ward	trung_minh	148	8
04921	Độc Lập	Doc Lap	Xã Độc Lập	Doc Lap Commune	doc_lap	148	10
04831	Đà Bắc	Da Bac	Thị trấn Đà Bắc	Da Bac Township	da_bac	150	9
04834	Nánh Nghê	Nanh Nghe	Xã Nánh Nghê	Nanh Nghe Commune	nanh_nghe	150	10
04840	Giáp Đắt	Giap Dat	Xã Giáp Đắt	Giap Dat Commune	giap_dat	150	10
04846	Mường Chiềng	Muong Chieng	Xã Mường Chiềng	Muong Chieng Commune	muong_chieng	150	10
04849	Tân Pheo	Tan Pheo	Xã Tân Pheo	Tan Pheo Commune	tan_pheo	150	10
04852	Đồng Chum	Dong Chum	Xã Đồng Chum	Dong Chum Commune	dong_chum	150	10
04855	Tân Minh	Tan Minh	Xã Tân Minh	Tan Minh Commune	tan_minh	150	10
04858	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	150	10
04861	Đồng Ruộng	Dong Ruong	Xã Đồng Ruộng	Dong Ruong Commune	dong_ruong	150	10
04867	Tú Lý	Tu Ly	Xã Tú Lý	Tu Ly Commune	tu_ly	150	10
04870	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	150	10
04873	Yên Hòa	Yen Hoa	Xã Yên Hòa	Yen Hoa Commune	yen_hoa	150	10
04876	Cao Sơn	Cao Son	Xã Cao Sơn	Cao Son Commune	cao_son	150	10
04879	Toàn Sơn	Toan Son	Xã Toàn Sơn	Toan Son Commune	toan_son	150	10
04885	Hiền Lương	Hien Luong	Xã Hiền Lương	Hien Luong Commune	hien_luong	150	10
04888	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	150	10
04891	Vầy Nưa	Vay Nua	Xã Vầy Nưa	Vay Nua Commune	vay_nua	150	10
04924	Lương Sơn	Luong Son	Thị trấn Lương Sơn	Luong Son Township	luong_son	152	9
04942	Lâm Sơn	Lam Son	Xã Lâm Sơn	Lam Son Commune	lam_son	152	10
04945	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	152	10
04951	Tân Vinh	Tan Vinh	Xã Tân Vinh	Tan Vinh Commune	tan_vinh	152	10
04954	Nhuận Trạch	Nhuan Trach	Xã Nhuận Trạch	Nhuan Trach Commune	nhuan_trach	152	10
04957	Cao Sơn	Cao Son	Xã Cao Sơn	Cao Son Commune	cao_son	152	10
04960	Cư Yên	Cu Yen	Xã Cư Yên	Cu Yen Commune	cu_yen	152	10
04969	Liên Sơn	Lien Son	Xã Liên Sơn	Lien Son Commune	lien_son	152	10
05008	Cao Dương	Cao Duong	Xã Cao Dương	Cao Duong Commune	cao_duong	152	10
05041	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	152	10
05047	Thanh Cao	Thanh Cao	Xã Thanh Cao	Thanh Cao Commune	thanh_cao	152	10
04978	Bo	Bo	Thị trấn Bo	Bo Township	bo	153	9
04984	Đú Sáng	Du Sang	Xã Đú Sáng	Du Sang Commune	du_sang	153	10
27259	13	13	Phường 13	13 Ward	13	773	8
04987	Hùng Sơn	Hung Son	Xã Hùng Sơn	Hung Son Commune	hung_son	153	10
04990	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	153	10
04999	Tú Sơn	Tu Son	Xã Tú Sơn	Tu Son Commune	tu_son	153	10
05005	Vĩnh Tiến	Vinh Tien	Xã Vĩnh Tiến	Vinh Tien Commune	vinh_tien	153	10
05014	Đông Bắc	Dong Bac	Xã Đông Bắc	Dong Bac Commune	dong_bac	153	10
05017	Xuân Thủy	Xuan Thuy	Xã Xuân Thủy	Xuan Thuy Commune	xuan_thuy	153	10
05026	Vĩnh Đồng	Vinh Dong	Xã Vĩnh Đồng	Vinh Dong Commune	vinh_dong	153	10
05035	Kim Lập	Kim Lap	Xã Kim Lập	Kim Lap Commune	kim_lap	153	10
05038	Hợp Tiến	Hop Tien	Xã Hợp Tiến	Hop Tien Commune	hop_tien	153	10
05065	Kim Bôi	Kim Boi	Xã Kim Bôi	Kim Boi Commune	kim_boi	153	10
05068	Nam Thượng	Nam Thuong	Xã Nam Thượng	Nam Thuong Commune	nam_thuong	153	10
05077	Cuối Hạ	Cuoi Ha	Xã Cuối Hạ	Cuoi Ha Commune	cuoi_ha	153	10
05080	Sào Báy	Sao Bay	Xã Sào Báy	Sao Bay Commune	sao_bay	153	10
05083	Mi Hòa	Mi Hoa	Xã Mi Hòa	Mi Hoa Commune	mi_hoa	153	10
05086	Nuông Dăm	Nuong Dam	Xã Nuông Dăm	Nuong Dam Commune	nuong_dam	153	10
05089	Cao Phong	Cao Phong	Thị trấn Cao Phong	Cao Phong Township	cao_phong	154	9
05092	Bình Thanh	Binh Thanh	Xã Bình Thanh	Binh Thanh Commune	binh_thanh	154	10
05095	Thung Nai	Thung Nai	Xã Thung Nai	Thung Nai Commune	thung_nai	154	10
05098	Bắc Phong	Bac Phong	Xã Bắc Phong	Bac Phong Commune	bac_phong	154	10
05101	Thu Phong	Thu Phong	Xã Thu Phong	Thu Phong Commune	thu_phong	154	10
05104	Hợp Phong	Hop Phong	Xã Hợp Phong	Hop Phong Commune	hop_phong	154	10
05110	Tây Phong	Tay Phong	Xã Tây Phong	Tay Phong Commune	tay_phong	154	10
05116	Dũng Phong	Dung Phong	Xã Dũng Phong	Dung Phong Commune	dung_phong	154	10
05119	Nam Phong	Nam Phong	Xã Nam Phong	Nam Phong Commune	nam_phong	154	10
05125	Thạch Yên	Thach Yen	Xã Thạch Yên	Thach Yen Commune	thach_yen	154	10
05128	Mãn Đức	Man Duc	Thị trấn Mãn Đức	Man Duc Township	man_duc	155	9
05134	Suối Hoa	Suoi Hoa	Xã Suối Hoa	Suoi Hoa Commune	suoi_hoa	155	10
05137	Phú Vinh	Phu Vinh	Xã Phú Vinh	Phu Vinh Commune	phu_vinh	155	10
05140	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	155	10
05143	Mỹ Hòa	My Hoa	Xã Mỹ Hòa	My Hoa Commune	my_hoa	155	10
05152	Quyết Chiến	Quyet Chien	Xã Quyết Chiến	Quyet Chien Commune	quyet_chien	155	10
05158	Phong Phú	Phong Phu	Xã Phong Phú	Phong Phu Commune	phong_phu	155	10
05164	Tử Nê	Tu Ne	Xã Tử Nê	Tu Ne Commune	tu_ne	155	10
05167	Thanh Hối	Thanh Hoi	Xã Thanh Hối	Thanh Hoi Commune	thanh_hoi	155	10
05170	Ngọc Mỹ	Ngoc My	Xã Ngọc Mỹ	Ngoc My Commune	ngoc_my	155	10
05173	Đông Lai	Dong Lai	Xã Đông Lai	Dong Lai Commune	dong_lai	155	10
05176	Vân Sơn	Van Son	Xã Vân Sơn	Van Son Commune	van_son	155	10
05182	Nhân Mỹ	Nhan My	Xã Nhân Mỹ	Nhan My Commune	nhan_my	155	10
05191	Lỗ Sơn	Lo Son	Xã Lỗ Sơn	Lo Son Commune	lo_son	155	10
05194	Ngổ Luông	Ngo Luong	Xã Ngổ Luông	Ngo Luong Commune	ngo_luong	155	10
05197	Gia Mô	Gia Mo	Xã Gia Mô	Gia Mo Commune	gia_mo	155	10
04882	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	156	10
05200	Mai Châu	Mai Chau	Thị trấn Mai Châu	Mai Chau Township	mai_chau	156	9
05206	Sơn Thủy	Son Thuy	Xã Sơn Thủy	Son Thuy Commune	son_thuy	156	10
05209	Pà Cò	Pa Co	Xã Pà Cò	Pa Co Commune	pa_co	156	10
05212	Hang Kia	Hang Kia	Xã Hang Kia	Hang Kia Commune	hang_kia	156	10
05221	Đồng Tân	Dong Tan	Xã Đồng Tân	Dong Tan Commune	dong_tan	156	10
05224	Cun Pheo	Cun Pheo	Xã Cun Pheo	Cun Pheo Commune	cun_pheo	156	10
05227	Bao La	Bao La	Xã Bao La	Bao La Commune	bao_la	156	10
05233	Tòng Đậu	Tong Dau	Xã Tòng Đậu	Tong Dau Commune	tong_dau	156	10
05242	Nà Phòn	Na Phon	Xã Nà Phòn	Na Phon Commune	na_phon	156	10
05245	Săm Khóe	Sam Khoe	Xã Săm Khóe	Sam Khoe Commune	sam_khoe	156	10
05248	Chiềng Châu	Chieng Chau	Xã Chiềng Châu	Chieng Chau Commune	chieng_chau	156	10
05251	Mai Hạ	Mai Ha	Xã Mai Hạ	Mai Ha Commune	mai_ha	156	10
05254	Thành Sơn	Thanh Son	Xã Thành Sơn	Thanh Son Commune	thanh_son	156	10
05257	Mai Hịch	Mai Hich	Xã Mai Hịch	Mai Hich Commune	mai_hich	156	10
05263	Vạn Mai	Van Mai	Xã Vạn Mai	Van Mai Commune	van_mai	156	10
05266	Vụ Bản	Vu Ban	Thị trấn Vụ Bản	Vu Ban Township	vu_ban	157	9
05269	Quý Hòa	Quy Hoa	Xã Quý Hòa	Quy Hoa Commune	quy_hoa	157	10
05272	Miền Đồi	Mien Doi	Xã Miền Đồi	Mien Doi Commune	mien_doi	157	10
05275	Mỹ Thành	My Thanh	Xã Mỹ Thành	My Thanh Commune	my_thanh	157	10
05278	Tuân Đạo	Tuan Dao	Xã Tuân Đạo	Tuan Dao Commune	tuan_dao	157	10
05281	Văn Nghĩa	Van Nghia	Xã Văn Nghĩa	Van Nghia Commune	van_nghia	157	10
05284	Văn Sơn	Van Son	Xã Văn Sơn	Van Son Commune	van_son	157	10
05287	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	157	10
05290	Nhân Nghĩa	Nhan Nghia	Xã Nhân Nghĩa	Nhan Nghia Commune	nhan_nghia	157	10
05293	Thượng Cốc	Thuong Coc	Xã Thượng Cốc	Thuong Coc Commune	thuong_coc	157	10
05299	Quyết Thắng	Quyet Thang	Xã Quyết Thắng	Quyet Thang Commune	quyet_thang	157	10
05302	Xuất Hóa	Xuat Hoa	Xã Xuất Hóa	Xuat Hoa Commune	xuat_hoa	157	10
05305	Yên Phú	Yen Phu	Xã Yên Phú	Yen Phu Commune	yen_phu	157	10
05308	Bình Hẻm	Binh Hem	Xã Bình Hẻm	Binh Hem Commune	binh_hem	157	10
05320	Định Cư	Dinh Cu	Xã Định Cư	Dinh Cu Commune	dinh_cu	157	10
05323	Chí Đạo	Chi Dao	Xã Chí Đạo	Chi Dao Commune	chi_dao	157	10
05329	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	157	10
05332	Hương Nhượng	Huong Nhuong	Xã Hương Nhượng	Huong Nhuong Commune	huong_nhuong	157	10
05335	Vũ Bình	Vu Binh	Xã Vũ Bình	Vu Binh Commune	vu_binh	157	10
05338	Tự Do	Tu Do	Xã Tự Do	Tu Do Commune	tu_do	157	10
05341	Yên Nghiệp	Yen Nghiep	Xã Yên Nghiệp	Yen Nghiep Commune	yen_nghiep	157	10
05344	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	157	10
05347	Ân Nghĩa	An Nghia	Xã Ân Nghĩa	An Nghia Commune	an_nghia	157	10
05350	Ngọc Lâu	Ngoc Lau	Xã Ngọc Lâu	Ngoc Lau Commune	ngoc_lau	157	10
05353	Hàng Trạm	Hang Tram	Thị trấn Hàng Trạm	Hang Tram Township	hang_tram	158	9
05356	Lạc Sỹ	Lac Sy	Xã Lạc Sỹ	Lac Sy Commune	lac_sy	158	10
05362	Lạc Lương	Lac Luong	Xã Lạc Lương	Lac Luong Commune	lac_luong	158	10
05365	Bảo Hiệu	Bao Hieu	Xã Bảo Hiệu	Bao Hieu Commune	bao_hieu	158	10
05368	Đa Phúc	Da Phuc	Xã Đa Phúc	Da Phuc Commune	da_phuc	158	10
05371	Hữu Lợi	Huu Loi	Xã Hữu Lợi	Huu Loi Commune	huu_loi	158	10
05374	Lạc Thịnh	Lac Thinh	Xã Lạc Thịnh	Lac Thinh Commune	lac_thinh	158	10
05380	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	158	10
05383	Phú Lai	Phu Lai	Xã Phú Lai	Phu Lai Commune	phu_lai	158	10
05386	Yên Trị	Yen Tri	Xã Yên Trị	Yen Tri Commune	yen_tri	158	10
05389	Ngọc Lương	Ngoc Luong	Xã Ngọc Lương	Ngoc Luong Commune	ngoc_luong	158	10
04981	Ba Hàng Đồi	Ba Hang Doi	Thị trấn Ba Hàng Đồi	Ba Hang Doi Township	ba_hang_doi	159	9
05392	Chi Nê	Chi Ne	Thị trấn Chi Nê	Chi Ne Township	chi_ne	159	9
05395	Phú Nghĩa	Phu Nghia	Xã Phú Nghĩa	Phu Nghia Commune	phu_nghia	159	10
05398	Phú Thành	Phu Thanh	Xã Phú Thành	Phu Thanh Commune	phu_thanh	159	10
05404	Hưng Thi	Hung Thi	Xã Hưng Thi	Hung Thi Commune	hung_thi	159	10
05413	Khoan Dụ	Khoan Du	Xã Khoan Dụ	Khoan Du Commune	khoan_du	159	10
05419	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	159	10
05422	Yên Bồng	Yen Bong	Xã Yên Bồng	Yen Bong Commune	yen_bong	159	10
05425	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	159	10
05428	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	159	10
05431	Quán Triều	Quan Trieu	Phường Quán Triều	Quan Trieu Ward	quan_trieu	164	8
05434	Quang Vinh	Quang Vinh	Phường Quang Vinh	Quang Vinh Ward	quang_vinh	164	8
05437	Túc Duyên	Tuc Duyen	Phường Túc Duyên	Tuc Duyen Ward	tuc_duyen	164	8
05440	Hoàng Văn Thụ	Hoang Van Thu	Phường Hoàng Văn Thụ	Hoang Van Thu Ward	hoang_van_thu	164	8
05443	Trưng Vương	Trung Vuong	Phường Trưng Vương	Trung Vuong Ward	trung_vuong	164	8
05446	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	164	8
05449	Phan Đình Phùng	Phan Dinh Phung	Phường Phan Đình Phùng	Phan Dinh Phung Ward	phan_dinh_phung	164	8
05452	Tân Thịnh	Tan Thinh	Phường Tân Thịnh	Tan Thinh Ward	tan_thinh	164	8
05455	Thịnh Đán	Thinh Dan	Phường Thịnh Đán	Thinh Dan Ward	thinh_dan	164	8
05458	Đồng Quang	Dong Quang	Phường Đồng Quang	Dong Quang Ward	dong_quang	164	8
05461	Gia Sàng	Gia Sang	Phường Gia Sàng	Gia Sang Ward	gia_sang	164	8
05464	Tân Lập	Tan Lap	Phường Tân Lập	Tan Lap Ward	tan_lap	164	8
05467	Cam Giá	Cam Gia	Phường Cam Giá	Cam Gia Ward	cam_gia	164	8
05470	Phú Xá	Phu Xa	Phường Phú Xá	Phu Xa Ward	phu_xa	164	8
05473	Hương Sơn	Huong Son	Phường Hương Sơn	Huong Son Ward	huong_son	164	8
05476	Trung Thành	Trung Thanh	Phường Trung Thành	Trung Thanh Ward	trung_thanh	164	8
05479	Tân Thành	Tan Thanh	Phường Tân Thành	Tan Thanh Ward	tan_thanh	164	8
05482	Tân Long	Tan Long	Phường Tân Long	Tan Long Ward	tan_long	164	8
05485	Phúc Hà	Phuc Ha	Xã Phúc Hà	Phuc Ha Commune	phuc_ha	164	10
05488	Phúc Xuân	Phuc Xuan	Xã Phúc Xuân	Phuc Xuan Commune	phuc_xuan	164	10
05491	Quyết Thắng	Quyet Thang	Xã Quyết Thắng	Quyet Thang Commune	quyet_thang	164	10
05494	Phúc Trìu	Phuc Triu	Xã Phúc Trìu	Phuc Triu Commune	phuc_triu	164	10
05497	Thịnh Đức	Thinh Duc	Xã Thịnh Đức	Thinh Duc Commune	thinh_duc	164	10
05500	Tích Lương	Tich Luong	Phường Tích Lương	Tich Luong Ward	tich_luong	164	8
05503	Tân Cương	Tan Cuong	Xã Tân Cương	Tan Cuong Commune	tan_cuong	164	10
05653	Sơn Cẩm	Son Cam	Xã Sơn Cẩm	Son Cam Commune	son_cam	164	10
05659	Chùa Hang	Chua Hang	Phường Chùa Hang	Chua Hang Ward	chua_hang	164	8
05695	Cao Ngạn	Cao Ngan	Xã Cao Ngạn	Cao Ngan Commune	cao_ngan	164	10
05701	Linh Sơn	Linh Son	Xã Linh Sơn	Linh Son Commune	linh_son	164	10
05710	Đồng Bẩm	Dong Bam	Phường Đồng Bẩm	Dong Bam Ward	dong_bam	164	8
05713	Huống Thượng	Huong Thuong	Xã Huống Thượng	Huong Thuong Commune	huong_thuong	164	10
05914	Đồng Liên	Dong Lien	Xã Đồng Liên	Dong Lien Commune	dong_lien	164	10
05506	Lương Sơn	Luong Son	Phường Lương Sơn	Luong Son Ward	luong_son	165	8
05509	Châu Sơn	Chau Son	Phường Châu Sơn	Chau Son Ward	chau_son	165	8
05512	Mỏ Chè	Mo Che	Phường Mỏ Chè	Mo Che Ward	mo_che	165	8
05515	Cải Đan	Cai Dan	Phường Cải Đan	Cai Dan Ward	cai_dan	165	8
05518	Thắng Lợi	Thang Loi	Phường Thắng Lợi	Thang Loi Ward	thang_loi	165	8
05521	Phố Cò	Pho Co	Phường Phố Cò	Pho Co Ward	pho_co	165	8
05527	Tân Quang	Tan Quang	Xã Tân Quang	Tan Quang Commune	tan_quang	165	10
05528	Bách Quang	Bach Quang	Phường Bách Quang	Bach Quang Ward	bach_quang	165	8
05530	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	165	10
05533	Bá Xuyên	Ba Xuyen	Xã Bá Xuyên	Ba Xuyen Commune	ba_xuyen	165	10
05536	Chợ Chu	Cho Chu	Thị trấn Chợ Chu	Cho Chu Township	cho_chu	167	9
05539	Linh Thông	Linh Thong	Xã Linh Thông	Linh Thong Commune	linh_thong	167	10
05542	Lam Vỹ	Lam Vy	Xã Lam Vỹ	Lam Vy Commune	lam_vy	167	10
05545	Quy Kỳ	Quy Ky	Xã Quy Kỳ	Quy Ky Commune	quy_ky	167	10
05548	Tân Thịnh	Tan Thinh	Xã Tân Thịnh	Tan Thinh Commune	tan_thinh	167	10
05551	Kim Phượng	Kim Phuong	Xã Kim Phượng	Kim Phuong Commune	kim_phuong	167	10
05554	Bảo Linh	Bao Linh	Xã Bảo Linh	Bao Linh Commune	bao_linh	167	10
05560	Phúc Chu	Phuc Chu	Xã Phúc Chu	Phuc Chu Commune	phuc_chu	167	10
05563	Tân Dương	Tan Duong	Xã Tân Dương	Tan Duong Commune	tan_duong	167	10
05566	Phượng Tiến	Phuong Tien	Xã Phượng Tiến	Phuong Tien Commune	phuong_tien	167	10
05569	Bảo Cường	Bao Cuong	Xã Bảo Cường	Bao Cuong Commune	bao_cuong	167	10
05572	Đồng Thịnh	Dong Thinh	Xã Đồng Thịnh	Dong Thinh Commune	dong_thinh	167	10
05575	Định Biên	Dinh Bien	Xã Định Biên	Dinh Bien Commune	dinh_bien	167	10
05578	Thanh Định	Thanh Dinh	Xã Thanh Định	Thanh Dinh Commune	thanh_dinh	167	10
05581	Trung Hội	Trung Hoi	Xã Trung Hội	Trung Hoi Commune	trung_hoi	167	10
05584	Trung Lương	Trung Luong	Xã Trung Lương	Trung Luong Commune	trung_luong	167	10
05587	Bình Yên	Binh Yen	Xã Bình Yên	Binh Yen Commune	binh_yen	167	10
05590	Điềm Mặc	Diem Mac	Xã Điềm Mặc	Diem Mac Commune	diem_mac	167	10
05593	Phú Tiến	Phu Tien	Xã Phú Tiến	Phu Tien Commune	phu_tien	167	10
05596	Bộc Nhiêu	Boc Nhieu	Xã Bộc Nhiêu	Boc Nhieu Commune	boc_nhieu	167	10
05599	Sơn Phú	Son Phu	Xã Sơn Phú	Son Phu Commune	son_phu	167	10
05602	Phú Đình	Phu Dinh	Xã Phú Đình	Phu Dinh Commune	phu_dinh	167	10
05605	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	167	10
05608	Giang Tiên	Giang Tien	Thị trấn Giang Tiên	Giang Tien Township	giang_tien	168	9
05611	Đu	Du	Thị trấn Đu	Du Township	du	168	9
05614	Yên Ninh	Yen Ninh	Xã Yên Ninh	Yen Ninh Commune	yen_ninh	168	10
05617	Yên Trạch	Yen Trach	Xã Yên Trạch	Yen Trach Commune	yen_trach	168	10
05620	Yên Đổ	Yen Do	Xã Yên Đổ	Yen Do Commune	yen_do	168	10
05623	Yên Lạc	Yen Lac	Xã Yên Lạc	Yen Lac Commune	yen_lac	168	10
05626	Ôn Lương	On Luong	Xã Ôn Lương	On Luong Commune	on_luong	168	10
05629	Động Đạt	Dong Dat	Xã Động Đạt	Dong Dat Commune	dong_dat	168	10
05632	Phủ Lý	Phu Ly	Xã Phủ Lý	Phu Ly Commune	phu_ly	168	10
05635	Phú Đô	Phu Do	Xã Phú Đô	Phu Do Commune	phu_do	168	10
05638	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	168	10
05641	Tức Tranh	Tuc Tranh	Xã Tức Tranh	Tuc Tranh Commune	tuc_tranh	168	10
05644	Phấn Mễ	Phan Me	Xã Phấn Mễ	Phan Me Commune	phan_me	168	10
05647	Vô Tranh	Vo Tranh	Xã Vô Tranh	Vo Tranh Commune	vo_tranh	168	10
05650	Cổ Lũng	Co Lung	Xã Cổ Lũng	Co Lung Commune	co_lung	168	10
05656	Sông Cầu	Song Cau	Thị trấn Sông Cầu	Song Cau Township	song_cau	169	9
05662	Trại Cau	Trai Cau	Thị trấn Trại Cau	Trai Cau Township	trai_cau	169	9
05665	Văn Lăng	Van Lang	Xã Văn Lăng	Van Lang Commune	van_lang	169	10
05668	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	169	10
05671	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	169	10
05674	Quang Sơn	Quang Son	Xã Quang Sơn	Quang Son Commune	quang_son	169	10
05677	Minh Lập	Minh Lap	Xã Minh Lập	Minh Lap Commune	minh_lap	169	10
05680	Văn Hán	Van Han	Xã Văn Hán	Van Han Commune	van_han	169	10
05683	Hóa Trung	Hoa Trung	Xã Hóa Trung	Hoa Trung Commune	hoa_trung	169	10
05686	Khe Mo	Khe Mo	Xã Khe Mo	Khe Mo Commune	khe_mo	169	10
05689	Cây Thị	Cay Thi	Xã Cây Thị	Cay Thi Commune	cay_thi	169	10
05692	Hóa Thượng	Hoa Thuong	Xã Hóa Thượng	Hoa Thuong Commune	hoa_thuong	169	10
05698	Hợp Tiến	Hop Tien	Xã Hợp Tiến	Hop Tien Commune	hop_tien	169	10
05704	Tân Lợi	Tan Loi	Xã Tân Lợi	Tan Loi Commune	tan_loi	169	10
05707	Nam Hòa	Nam Hoa	Xã Nam Hòa	Nam Hoa Commune	nam_hoa	169	10
05716	Đình Cả	Dinh Ca	Thị trấn Đình Cả	Dinh Ca Township	dinh_ca	170	9
05719	Sảng Mộc	Sang Moc	Xã Sảng Mộc	Sang Moc Commune	sang_moc	170	10
05722	Nghinh Tường	Nghinh Tuong	Xã Nghinh Tường	Nghinh Tuong Commune	nghinh_tuong	170	10
05725	Thần Xa	Than Xa	Xã Thần Xa	Than Xa Commune	than_xa	170	10
05728	Vũ Chấn	Vu Chan	Xã Vũ Chấn	Vu Chan Commune	vu_chan	170	10
05731	Thượng Nung	Thuong Nung	Xã Thượng Nung	Thuong Nung Commune	thuong_nung	170	10
05734	Phú Thượng	Phu Thuong	Xã Phú Thượng	Phu Thuong Commune	phu_thuong	170	10
05737	Cúc Đường	Cuc Duong	Xã Cúc Đường	Cuc Duong Commune	cuc_duong	170	10
05740	La Hiên	La Hien	Xã La Hiên	La Hien Commune	la_hien	170	10
05743	Lâu Thượng	Lau Thuong	Xã Lâu Thượng	Lau Thuong Commune	lau_thuong	170	10
05746	Tràng Xá	Trang Xa	Xã Tràng Xá	Trang Xa Commune	trang_xa	170	10
05749	Phương Giao	Phuong Giao	Xã Phương Giao	Phuong Giao Commune	phuong_giao	170	10
05752	Liên Minh	Lien Minh	Xã Liên Minh	Lien Minh Commune	lien_minh	170	10
05755	Dân Tiến	Dan Tien	Xã Dân Tiến	Dan Tien Commune	dan_tien	170	10
05758	Bình Long	Binh Long	Xã Bình Long	Binh Long Commune	binh_long	170	10
05761	Hùng Sơn	Hung Son	Thị trấn Hùng Sơn	Hung Son Township	hung_son	171	9
05764	Quân Chu	Quan Chu	Thị trấn Quân Chu	Quan Chu Township	quan_chu	171	9
05767	Phúc Lương	Phuc Luong	Xã Phúc Lương	Phuc Luong Commune	phuc_luong	171	10
05770	Minh Tiến	Minh Tien	Xã Minh Tiến	Minh Tien Commune	minh_tien	171	10
05773	Yên Lãng	Yen Lang	Xã Yên Lãng	Yen Lang Commune	yen_lang	171	10
05776	Đức Lương	Duc Luong	Xã Đức Lương	Duc Luong Commune	duc_luong	171	10
05779	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	171	10
05782	Na Mao	Na Mao	Xã Na Mao	Na Mao Commune	na_mao	171	10
05785	Phú Lạc	Phu Lac	Xã Phú Lạc	Phu Lac Commune	phu_lac	171	10
05788	Tân Linh	Tan Linh	Xã Tân Linh	Tan Linh Commune	tan_linh	171	10
05791	Phú Thịnh	Phu Thinh	Xã Phú Thịnh	Phu Thinh Commune	phu_thinh	171	10
05794	Phục Linh	Phuc Linh	Xã Phục Linh	Phuc Linh Commune	phuc_linh	171	10
05797	Phú Xuyên	Phu Xuyen	Xã Phú Xuyên	Phu Xuyen Commune	phu_xuyen	171	10
05800	Bản Ngoại	Ban Ngoai	Xã Bản Ngoại	Ban Ngoai Commune	ban_ngoai	171	10
05803	Tiên Hội	Tien Hoi	Xã Tiên Hội	Tien Hoi Commune	tien_hoi	171	10
05809	Cù Vân	Cu Van	Xã Cù Vân	Cu Van Commune	cu_van	171	10
05812	Hà Thượng	Ha Thuong	Xã Hà Thượng	Ha Thuong Commune	ha_thuong	171	10
05815	La Bằng	La Bang	Xã La Bằng	La Bang Commune	la_bang	171	10
05818	Hoàng Nông	Hoang Nong	Xã Hoàng Nông	Hoang Nong Commune	hoang_nong	171	10
05821	Khôi Kỳ	Khoi Ky	Xã Khôi Kỳ	Khoi Ky Commune	khoi_ky	171	10
05824	An Khánh	An Khanh	Xã An Khánh	An Khanh Commune	an_khanh	171	10
05827	Tân Thái	Tan Thai	Xã Tân Thái	Tan Thai Commune	tan_thai	171	10
05830	Bình Thuận	Binh Thuan	Xã Bình Thuận	Binh Thuan Commune	binh_thuan	171	10
05833	Lục Ba	Luc Ba	Xã Lục Ba	Luc Ba Commune	luc_ba	171	10
05836	Mỹ Yên	My Yen	Xã Mỹ Yên	My Yen Commune	my_yen	171	10
05839	Vạn Thọ	Van Tho	Xã Vạn Thọ	Van Tho Commune	van_tho	171	10
05842	Văn Yên	Van Yen	Xã Văn Yên	Van Yen Commune	van_yen	171	10
05845	Ký Phú	Ky Phu	Xã Ký Phú	Ky Phu Commune	ky_phu	171	10
05848	Cát Nê	Cat Ne	Xã Cát Nê	Cat Ne Commune	cat_ne	171	10
05851	Quân Chu	Quan Chu	Xã Quân Chu	Quan Chu Commune	quan_chu	171	10
05854	Bãi Bông	Bai Bong	Phường Bãi Bông	Bai Bong Ward	bai_bong	172	8
05857	Bắc Sơn	Bac Son	Phường Bắc Sơn	Bac Son Ward	bac_son	172	8
05860	Ba Hàng	Ba Hang	Phường Ba Hàng	Ba Hang Ward	ba_hang	172	8
05863	Phúc Tân	Phuc Tan	Xã Phúc Tân	Phuc Tan Commune	phuc_tan	172	10
05866	Phúc Thuận	Phuc Thuan	Xã Phúc Thuận	Phuc Thuan Commune	phuc_thuan	172	10
05869	Hồng Tiến	Hong Tien	Xã Hồng Tiến	Hong Tien Commune	hong_tien	172	10
05872	Minh Đức	Minh Duc	Xã Minh Đức	Minh Duc Commune	minh_duc	172	10
05875	Đắc Sơn	Dac Son	Xã Đắc Sơn	Dac Son Commune	dac_son	172	10
05878	Đồng Tiến	Dong Tien	Phường Đồng Tiến	Dong Tien Ward	dong_tien	172	8
05881	Thành Công	Thanh Cong	Xã Thành Công	Thanh Cong Commune	thanh_cong	172	10
05884	Tiên Phong	Tien Phong	Xã Tiên Phong	Tien Phong Commune	tien_phong	172	10
05887	Vạn Phái	Van Phai	Xã Vạn Phái	Van Phai Commune	van_phai	172	10
05890	Nam Tiến	Nam Tien	Xã Nam Tiến	Nam Tien Commune	nam_tien	172	10
05893	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	172	10
05896	Đông Cao	Dong Cao	Xã Đông Cao	Dong Cao Commune	dong_cao	172	10
05899	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	172	10
05902	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	172	10
05905	Thuận Thành	Thuan Thanh	Xã Thuận Thành	Thuan Thanh Commune	thuan_thanh	172	10
05908	Hương Sơn	Huong Son	Thị trấn Hương Sơn	Huong Son Township	huong_son	173	9
05911	Bàn Đạt	Ban Dat	Xã Bàn Đạt	Ban Dat Commune	ban_dat	173	10
05917	Tân Khánh	Tan Khanh	Xã Tân Khánh	Tan Khanh Commune	tan_khanh	173	10
27262	09	09	Phường 09	09 Ward	09	773	8
05920	Tân Kim	Tan Kim	Xã Tân Kim	Tan Kim Commune	tan_kim	173	10
05923	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	173	10
05926	Đào Xá	Dao Xa	Xã Đào Xá	Dao Xa Commune	dao_xa	173	10
05929	Bảo Lý	Bao Ly	Xã Bảo Lý	Bao Ly Commune	bao_ly	173	10
05932	Thượng Đình	Thuong Dinh	Xã Thượng Đình	Thuong Dinh Commune	thuong_dinh	173	10
05935	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	173	10
05938	Nhã Lộng	Nha Long	Xã Nhã Lộng	Nha Long Commune	nha_long	173	10
05941	Điềm Thụy	Diem Thuy	Xã Điềm Thụy	Diem Thuy Commune	diem_thuy	173	10
05944	Xuân Phương	Xuan Phuong	Xã Xuân Phương	Xuan Phuong Commune	xuan_phuong	173	10
05947	Tân Đức	Tan Duc	Xã Tân Đức	Tan Duc Commune	tan_duc	173	10
05950	Úc Kỳ	Uc Ky	Xã Úc Kỳ	Uc Ky Commune	uc_ky	173	10
05953	Lương Phú	Luong Phu	Xã Lương Phú	Luong Phu Commune	luong_phu	173	10
05956	Nga My	Nga My	Xã Nga My	Nga My Commune	nga_my	173	10
05959	Kha Sơn	Kha Son	Xã Kha Sơn	Kha Son Commune	kha_son	173	10
05962	Thanh Ninh	Thanh Ninh	Xã Thanh Ninh	Thanh Ninh Commune	thanh_ninh	173	10
05965	Dương Thành	Duong Thanh	Xã Dương Thành	Duong Thanh Commune	duong_thanh	173	10
05968	Hà Châu	Ha Chau	Xã Hà Châu	Ha Chau Commune	ha_chau	173	10
05971	Hoàng Văn Thụ	Hoang Van Thu	Phường Hoàng Văn Thụ	Hoang Van Thu Ward	hoang_van_thu	178	8
05974	Tam Thanh	Tam Thanh	Phường Tam Thanh	Tam Thanh Ward	tam_thanh	178	8
05977	Vĩnh Trại	Vinh Trai	Phường Vĩnh Trại	Vinh Trai Ward	vinh_trai	178	8
05980	Đông Kinh	Dong Kinh	Phường Đông Kinh	Dong Kinh Ward	dong_kinh	178	8
05983	Chi Lăng	Chi Lang	Phường Chi Lăng	Chi Lang Ward	chi_lang	178	8
05986	Hoàng Đồng	Hoang Dong	Xã Hoàng Đồng	Hoang Dong Commune	hoang_dong	178	10
05989	Quảng Lạc	Quang Lac	Xã Quảng Lạc	Quang Lac Commune	quang_lac	178	10
05992	Mai Pha	Mai Pha	Xã Mai Pha	Mai Pha Commune	mai_pha	178	10
05995	Thất Khê	That Khe	Thị trấn Thất Khê	That Khe Township	that_khe	180	9
05998	Khánh Long	Khanh Long	Xã Khánh Long	Khanh Long Commune	khanh_long	180	10
06001	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	180	10
06004	Quốc Khánh	Quoc Khanh	Xã Quốc Khánh	Quoc Khanh Commune	quoc_khanh	180	10
06007	Vĩnh Tiến	Vinh Tien	Xã Vĩnh Tiến	Vinh Tien Commune	vinh_tien	180	10
06010	Cao Minh	Cao Minh	Xã Cao Minh	Cao Minh Commune	cao_minh	180	10
06013	Chí Minh	Chi Minh	Xã Chí Minh	Chi Minh Commune	chi_minh	180	10
06016	Tri Phương	Tri Phuong	Xã Tri Phương	Tri Phuong Commune	tri_phuong	180	10
06019	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	180	10
06022	Tân Yên	Tan Yen	Xã Tân Yên	Tan Yen Commune	tan_yen	180	10
06025	Đội Cấn	Doi Can	Xã Đội Cấn	Doi Can Commune	doi_can	180	10
06028	Tân Minh	Tan Minh	Xã Tân Minh	Tan Minh Commune	tan_minh	180	10
06031	Kim Đồng	Kim Dong	Xã Kim Đồng	Kim Dong Commune	kim_dong	180	10
06034	Chi Lăng	Chi Lang	Xã Chi Lăng	Chi Lang Commune	chi_lang	180	10
06037	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	180	10
06040	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	180	10
06043	Đào Viên	Dao Vien	Xã Đào Viên	Dao Vien Commune	dao_vien	180	10
06046	Đề Thám	De Tham	Xã Đề Thám	De Tham Commune	de_tham	180	10
06049	Kháng Chiến	Khang Chien	Xã Kháng Chiến	Khang Chien Commune	khang_chien	180	10
06055	Hùng Sơn	Hung Son	Xã Hùng Sơn	Hung Son Commune	hung_son	180	10
06058	Quốc Việt	Quoc Viet	Xã Quốc Việt	Quoc Viet Commune	quoc_viet	180	10
06061	Hùng Việt	Hung Viet	Xã Hùng Việt	Hung Viet Commune	hung_viet	180	10
06067	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	181	10
06070	Vĩnh Yên	Vinh Yen	Xã Vĩnh Yên	Vinh Yen Commune	vinh_yen	181	10
06073	Hoa Thám	Hoa Tham	Xã Hoa Thám	Hoa Tham Commune	hoa_tham	181	10
06076	Quý Hòa	Quy Hoa	Xã Quý Hòa	Quy Hoa Commune	quy_hoa	181	10
06079	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	181	10
06082	Yên Lỗ	Yen Lo	Xã Yên Lỗ	Yen Lo Commune	yen_lo	181	10
06085	Thiện Hòa	Thien Hoa	Xã Thiện Hòa	Thien Hoa Commune	thien_hoa	181	10
06088	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	181	10
06091	Thiện Thuật	Thien Thuat	Xã Thiện Thuật	Thien Thuat Commune	thien_thuat	181	10
06094	Minh Khai	Minh Khai	Xã Minh Khai	Minh Khai Commune	minh_khai	181	10
06097	Thiện Long	Thien Long	Xã Thiện Long	Thien Long Commune	thien_long	181	10
06100	Hoàng Văn Thụ	Hoang Van Thu	Xã Hoàng Văn Thụ	Hoang Van Thu Commune	hoang_van_thu	181	10
06103	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	181	10
06106	Mông Ân	Mong An	Xã Mông Ân	Mong An Commune	mong_an	181	10
06109	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	181	10
06112	Bình Gia	Binh Gia	Thị trấn Bình Gia	Binh Gia Township	binh_gia	181	9
06115	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	181	10
06118	Bình La	Binh La	Xã Bình La	Binh La Commune	binh_la	181	10
06121	Tân Văn	Tan Van	Xã Tân Văn	Tan Van Commune	tan_van	181	10
06124	Na Sầm	Na Sam	Thị trấn Na Sầm	Na Sam Township	na_sam	182	9
06127	Trùng Khánh	Trung Khanh	Xã Trùng Khánh	Trung Khanh Commune	trung_khanh	182	10
06133	Bắc La	Bac La	Xã Bắc La	Bac La Commune	bac_la	182	10
06136	Thụy Hùng	Thuy Hung	Xã Thụy Hùng	Thuy Hung Commune	thuy_hung	182	10
06139	Bắc Hùng	Bac Hung	Xã Bắc Hùng	Bac Hung Commune	bac_hung	182	10
06142	Tân Tác	Tan Tac	Xã Tân Tác	Tan Tac Commune	tan_tac	182	10
06148	Thanh Long	Thanh Long	Xã Thanh Long	Thanh Long Commune	thanh_long	182	10
06151	Hội Hoan	Hoi Hoan	Xã Hội Hoan	Hoi Hoan Commune	hoi_hoan	182	10
06154	Bắc Việt	Bac Viet	Xã Bắc Việt	Bac Viet Commune	bac_viet	182	10
06157	Hoàng Việt	Hoang Viet	Xã Hoàng Việt	Hoang Viet Commune	hoang_viet	182	10
06160	Gia Miễn	Gia Mien	Xã Gia Miễn	Gia Mien Commune	gia_mien	182	10
06163	Thành Hòa	Thanh Hoa	Xã Thành Hòa	Thanh Hoa Commune	thanh_hoa	182	10
06166	Tân Thanh	Tan Thanh	Xã Tân Thanh	Tan Thanh Commune	tan_thanh	182	10
06172	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	182	10
06175	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	182	10
06178	 Hoàng Văn Thụ	 Hoang Van Thu	Xã  Hoàng Văn Thụ	 Hoang Van Thu Commune	_hoang_van_thu	182	10
06181	Nhạc Kỳ	Nhac Ky	Xã Nhạc Kỳ	Nhac Ky Commune	nhac_ky	182	10
06184	Đồng Đăng	Dong Dang	Thị trấn Đồng Đăng	Dong Dang Township	dong_dang	183	9
06187	Cao Lộc	Cao Loc	Thị trấn Cao Lộc	Cao Loc Township	cao_loc	183	9
06190	Bảo Lâm	Bao Lam	Xã Bảo Lâm	Bao Lam Commune	bao_lam	183	10
06193	Thanh Lòa	Thanh Loa	Xã Thanh Lòa	Thanh Loa Commune	thanh_loa	183	10
06196	Cao Lâu	Cao Lau	Xã Cao Lâu	Cao Lau Commune	cao_lau	183	10
06199	Thạch Đạn	Thach Dan	Xã Thạch Đạn	Thach Dan Commune	thach_dan	183	10
06202	Xuất Lễ	Xuat Le	Xã Xuất Lễ	Xuat Le Commune	xuat_le	183	10
06205	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	183	10
06208	Thụy Hùng	Thuy Hung	Xã Thụy Hùng	Thuy Hung Commune	thuy_hung	183	10
06211	Lộc Yên	Loc Yen	Xã Lộc Yên	Loc Yen Commune	loc_yen	183	10
06214	Phú Xá	Phu Xa	Xã Phú Xá	Phu Xa Commune	phu_xa	183	10
06217	Bình Trung	Binh Trung	Xã Bình Trung	Binh Trung Commune	binh_trung	183	10
06220	Hải Yến	Hai Yen	Xã Hải Yến	Hai Yen Commune	hai_yen	183	10
06223	Hòa Cư	Hoa Cu	Xã Hòa Cư	Hoa Cu Commune	hoa_cu	183	10
06226	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	183	10
06232	Công Sơn	Cong Son	Xã Công Sơn	Cong Son Commune	cong_son	183	10
06235	Gia Cát	Gia Cat	Xã Gia Cát	Gia Cat Commune	gia_cat	183	10
06238	Mẫu Sơn	Mau Son	Xã Mẫu Sơn	Mau Son Commune	mau_son	183	10
06241	Xuân Long	Xuan Long	Xã Xuân Long	Xuan Long Commune	xuan_long	183	10
06244	Tân Liên	Tan Lien	Xã Tân Liên	Tan Lien Commune	tan_lien	183	10
06247	Yên Trạch	Yen Trach	Xã Yên Trạch	Yen Trach Commune	yen_trach	183	10
06250	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	183	10
06253	Văn Quan	Van Quan	Thị trấn Văn Quan	Van Quan Township	van_quan	184	9
06256	Trấn Ninh	Tran Ninh	Xã Trấn Ninh	Tran Ninh Commune	tran_ninh	184	10
06268	Liên Hội	Lien Hoi	Xã Liên Hội	Lien Hoi Commune	lien_hoi	184	10
06274	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	184	10
06277	Tú Xuyên	Tu Xuyen	Xã Tú Xuyên	Tu Xuyen Commune	tu_xuyen	184	10
06280	Điềm He	Diem He	Xã Điềm He	Diem He Commune	diem_he	184	10
06283	An Sơn	An Son	Xã An Sơn	An Son Commune	an_son	184	10
06286	Khánh Khê	Khanh Khe	Xã Khánh Khê	Khanh Khe Commune	khanh_khe	184	10
06292	Lương Năng	Luong Nang	Xã Lương Năng	Luong Nang Commune	luong_nang	184	10
06295	Đồng Giáp	Dong Giap	Xã Đồng Giáp	Dong Giap Commune	dong_giap	184	10
06298	Bình Phúc	Binh Phuc	Xã Bình Phúc	Binh Phuc Commune	binh_phuc	184	10
06301	Tràng Các	Trang Cac	Xã Tràng Các	Trang Cac Commune	trang_cac	184	10
06307	Tân Đoàn	Tan Doan	Xã Tân Đoàn	Tan Doan Commune	tan_doan	184	10
06313	Tri Lễ	Tri Le	Xã Tri Lễ	Tri Le Commune	tri_le	184	10
06316	Tràng Phái	Trang Phai	Xã Tràng Phái	Trang Phai Commune	trang_phai	184	10
06319	Yên Phúc	Yen Phuc	Xã Yên Phúc	Yen Phuc Commune	yen_phuc	184	10
06322	Hữu Lễ	Huu Le	Xã Hữu Lễ	Huu Le Commune	huu_le	184	10
06325	Bắc Sơn	Bac Son	Thị trấn Bắc Sơn	Bac Son Township	bac_son	185	9
06328	Long Đống	Long Dong	Xã Long Đống	Long Dong Commune	long_dong	185	10
06331	Vạn Thủy	Van Thuy	Xã Vạn Thủy	Van Thuy Commune	van_thuy	185	10
06337	Đồng ý	Dong y	Xã Đồng ý	Dong y Commune	dong_y	185	10
06340	Tân Tri	Tan Tri	Xã Tân Tri	Tan Tri Commune	tan_tri	185	10
06343	Bắc Quỳnh	Bac Quynh	Xã Bắc Quỳnh	Bac Quynh Commune	bac_quynh	185	10
06349	Hưng Vũ	Hung Vu	Xã Hưng Vũ	Hung Vu Commune	hung_vu	185	10
06352	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	185	10
06355	Vũ Sơn	Vu Son	Xã Vũ Sơn	Vu Son Commune	vu_son	185	10
06358	Chiêu Vũ	Chieu Vu	Xã Chiêu Vũ	Chieu Vu Commune	chieu_vu	185	10
06361	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	185	10
06364	Chiến Thắng	Chien Thang	Xã Chiến Thắng	Chien Thang Commune	chien_thang	185	10
06367	Vũ Lăng	Vu Lang	Xã Vũ Lăng	Vu Lang Commune	vu_lang	185	10
06370	Trấn Yên	Tran Yen	Xã Trấn Yên	Tran Yen Commune	tran_yen	185	10
06373	Vũ Lễ	Vu Le	Xã Vũ Lễ	Vu Le Commune	vu_le	185	10
06376	Nhất Hòa	Nhat Hoa	Xã Nhất Hòa	Nhat Hoa Commune	nhat_hoa	185	10
06379	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	185	10
06382	Nhất Tiến	Nhat Tien	Xã Nhất Tiến	Nhat Tien Commune	nhat_tien	185	10
06385	Hữu Lũng	Huu Lung	Thị trấn Hữu Lũng	Huu Lung Township	huu_lung	186	9
06388	Hữu Liên	Huu Lien	Xã Hữu Liên	Huu Lien Commune	huu_lien	186	10
06391	Yên Bình	Yen Binh	Xã Yên Bình	Yen Binh Commune	yen_binh	186	10
06394	Quyết Thắng	Quyet Thang	Xã Quyết Thắng	Quyet Thang Commune	quyet_thang	186	10
06397	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	186	10
06400	Yên Thịnh	Yen Thinh	Xã Yên Thịnh	Yen Thinh Commune	yen_thinh	186	10
06403	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	186	10
06406	Thiện Tân	Thien Tan	Xã Thiện Tân	Thien Tan Commune	thien_tan	186	10
06412	Yên Vượng	Yen Vuong	Xã Yên Vượng	Yen Vuong Commune	yen_vuong	186	10
06415	Minh Tiến	Minh Tien	Xã Minh Tiến	Minh Tien Commune	minh_tien	186	10
06418	Nhật Tiến	Nhat Tien	Xã Nhật Tiến	Nhat Tien Commune	nhat_tien	186	10
06421	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	186	10
06424	Đồng Tân	Dong Tan	Xã Đồng Tân	Dong Tan Commune	dong_tan	186	10
06427	Cai Kinh	Cai Kinh	Xã Cai Kinh	Cai Kinh Commune	cai_kinh	186	10
06430	Hòa Lạc	Hoa Lac	Xã Hòa Lạc	Hoa Lac Commune	hoa_lac	186	10
06433	Vân Nham	Van Nham	Xã Vân Nham	Van Nham Commune	van_nham	186	10
06436	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	186	10
06442	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	186	10
06445	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	186	10
06448	Minh Sơn	Minh Son	Xã Minh Sơn	Minh Son Commune	minh_son	186	10
06451	Hồ Sơn	Ho Son	Xã Hồ Sơn	Ho Son Commune	ho_son	186	10
06454	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	186	10
06457	Minh Hòa	Minh Hoa	Xã Minh Hòa	Minh Hoa Commune	minh_hoa	186	10
06460	Hòa Thắng	Hoa Thang	Xã Hòa Thắng	Hoa Thang Commune	hoa_thang	186	10
06463	Đồng Mỏ	Dong Mo	Thị trấn Đồng Mỏ	Dong Mo Township	dong_mo	187	9
06466	Chi Lăng	Chi Lang	Thị trấn Chi Lăng	Chi Lang Township	chi_lang	187	9
06469	Vân An	Van An	Xã Vân An	Van An Commune	van_an	187	10
06472	Vân Thủy	Van Thuy	Xã Vân Thủy	Van Thuy Commune	van_thuy	187	10
06475	Gia Lộc	Gia Loc	Xã Gia Lộc	Gia Loc Commune	gia_loc	187	10
06478	Bắc Thủy	Bac Thuy	Xã Bắc Thủy	Bac Thuy Commune	bac_thuy	187	10
06481	Chiến Thắng	Chien Thang	Xã Chiến Thắng	Chien Thang Commune	chien_thang	187	10
06484	Mai Sao	Mai Sao	Xã Mai Sao	Mai Sao Commune	mai_sao	187	10
06487	Bằng Hữu	Bang Huu	Xã Bằng Hữu	Bang Huu Commune	bang_huu	187	10
06490	Thượng Cường	Thuong Cuong	Xã Thượng Cường	Thuong Cuong Commune	thuong_cuong	187	10
06493	Bằng Mạc	Bang Mac	Xã Bằng Mạc	Bang Mac Commune	bang_mac	187	10
06496	Nhân Lý	Nhan Ly	Xã Nhân Lý	Nhan Ly Commune	nhan_ly	187	10
06499	Lâm Sơn	Lam Son	Xã Lâm Sơn	Lam Son Commune	lam_son	187	10
06502	Liên Sơn	Lien Son	Xã Liên Sơn	Lien Son Commune	lien_son	187	10
06505	Vạn Linh	Van Linh	Xã Vạn Linh	Van Linh Commune	van_linh	187	10
06508	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	187	10
06514	Hữu Kiên	Huu Kien	Xã Hữu Kiên	Huu Kien Commune	huu_kien	187	10
06517	Quan Sơn	Quan Son	Xã Quan Sơn	Quan Son Commune	quan_son	187	10
06520	Y Tịch	Y Tich	Xã Y Tịch	Y Tich Commune	y_tich	187	10
06523	Chi Lăng	Chi Lang	Xã Chi Lăng	Chi Lang Commune	chi_lang	187	10
06526	Na Dương	Na Duong	Thị trấn Na Dương	Na Duong Township	na_duong	188	9
06529	Lộc Bình	Loc Binh	Thị trấn Lộc Bình	Loc Binh Township	loc_binh	188	9
06532	Mẫu Sơn	Mau Son	Xã Mẫu Sơn	Mau Son Commune	mau_son	188	10
06541	Yên Khoái	Yen Khoai	Xã Yên Khoái	Yen Khoai Commune	yen_khoai	188	10
06544	Khánh Xuân	Khanh Xuan	Xã Khánh Xuân	Khanh Xuan Commune	khanh_xuan	188	10
06547	Tú Mịch	Tu Mich	Xã Tú Mịch	Tu Mich Commune	tu_mich	188	10
06550	Hữu Khánh	Huu Khanh	Xã Hữu Khánh	Huu Khanh Commune	huu_khanh	188	10
06553	Đồng Bục	Dong Buc	Xã Đồng Bục	Dong Buc Commune	dong_buc	188	10
06559	Tam Gia	Tam Gia	Xã Tam Gia	Tam Gia Commune	tam_gia	188	10
06562	Tú Đoạn	Tu Doan	Xã Tú Đoạn	Tu Doan Commune	tu_doan	188	10
06565	Khuất Xá	Khuat Xa	Xã Khuất Xá	Khuat Xa Commune	khuat_xa	188	10
06574	Tĩnh Bắc	Tinh Bac	Xã Tĩnh Bắc	Tinh Bac Commune	tinh_bac	188	10
06577	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	188	10
06589	Sàn Viên	San Vien	Xã Sàn Viên	San Vien Commune	san_vien	188	10
06592	Đông Quan	Dong Quan	Xã Đông Quan	Dong Quan Commune	dong_quan	188	10
06595	Minh Hiệp	Minh Hiep	Xã Minh Hiệp	Minh Hiep Commune	minh_hiep	188	10
06598	Hữu Lân	Huu Lan	Xã Hữu Lân	Huu Lan Commune	huu_lan	188	10
06601	Lợi Bác	Loi Bac	Xã Lợi Bác	Loi Bac Commune	loi_bac	188	10
06604	Nam Quan	Nam Quan	Xã Nam Quan	Nam Quan Commune	nam_quan	188	10
06607	Xuân Dương	Xuan Duong	Xã Xuân Dương	Xuan Duong Commune	xuan_duong	188	10
06610	Ái Quốc	Ai Quoc	Xã Ái Quốc	Ai Quoc Commune	ai_quoc	188	10
06613	Đình Lập	Dinh Lap	Thị trấn Đình Lập	Dinh Lap Township	dinh_lap	189	9
06616	NT Thái Bình	NT Thai Binh	Thị trấn NT Thái Bình	NT Thai Binh Township	nt_thai_binh	189	9
06619	Bắc Xa	Bac Xa	Xã Bắc Xa	Bac Xa Commune	bac_xa	189	10
06622	Bính Xá	Binh Xa	Xã Bính Xá	Binh Xa Commune	binh_xa	189	10
06625	Kiên Mộc	Kien Moc	Xã Kiên Mộc	Kien Moc Commune	kien_moc	189	10
06628	Đình Lập	Dinh Lap	Xã Đình Lập	Dinh Lap Commune	dinh_lap	189	10
06631	Thái Bình	Thai Binh	Xã Thái Bình	Thai Binh Commune	thai_binh	189	10
06634	Cường Lợi	Cuong Loi	Xã Cường Lợi	Cuong Loi Commune	cuong_loi	189	10
06637	Châu Sơn	Chau Son	Xã Châu Sơn	Chau Son Commune	chau_son	189	10
06640	Lâm Ca	Lam Ca	Xã Lâm Ca	Lam Ca Commune	lam_ca	189	10
06643	Đồng Thắng	Dong Thang	Xã Đồng Thắng	Dong Thang Commune	dong_thang	189	10
06646	Bắc Lãng	Bac Lang	Xã Bắc Lãng	Bac Lang Commune	bac_lang	189	10
06649	Hà Khánh	Ha Khanh	Phường Hà Khánh	Ha Khanh Ward	ha_khanh	193	8
06652	Hà Phong	Ha Phong	Phường Hà Phong	Ha Phong Ward	ha_phong	193	8
06655	Hà Khẩu	Ha Khau	Phường Hà Khẩu	Ha Khau Ward	ha_khau	193	8
06658	Cao Xanh	Cao Xanh	Phường Cao Xanh	Cao Xanh Ward	cao_xanh	193	8
06661	Giếng Đáy	Gieng Day	Phường Giếng Đáy	Gieng Day Ward	gieng_day	193	8
06664	Hà Tu	Ha Tu	Phường Hà Tu	Ha Tu Ward	ha_tu	193	8
06667	Hà Trung	Ha Trung	Phường Hà Trung	Ha Trung Ward	ha_trung	193	8
06670	Hà Lầm	Ha Lam	Phường Hà Lầm	Ha Lam Ward	ha_lam	193	8
06673	Bãi Cháy	Bai Chay	Phường Bãi Cháy	Bai Chay Ward	bai_chay	193	8
06676	Cao Thắng	Cao Thang	Phường Cao Thắng	Cao Thang Ward	cao_thang	193	8
06679	Hùng Thắng	Hung Thang	Phường Hùng Thắng	Hung Thang Ward	hung_thang	193	8
06682	Yết Kiêu	Yet Kieu	Phường Yết Kiêu	Yet Kieu Ward	yet_kieu	193	8
06685	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	193	8
06688	Hồng Hải	Hong Hai	Phường Hồng Hải	Hong Hai Ward	hong_hai	193	8
06691	Hồng Gai	Hong Gai	Phường Hồng Gai	Hong Gai Ward	hong_gai	193	8
06694	Bạch Đằng	Bach Dang	Phường Bạch Đằng	Bach Dang Ward	bach_dang	193	8
06697	Hồng Hà	Hong Ha	Phường Hồng Hà	Hong Ha Ward	hong_ha	193	8
06700	Tuần Châu	Tuan Chau	Phường Tuần Châu	Tuan Chau Ward	tuan_chau	193	8
06703	Việt Hưng	Viet Hung	Phường Việt Hưng	Viet Hung Ward	viet_hung	193	8
06706	Đại Yên	Dai Yen	Phường Đại Yên	Dai Yen Ward	dai_yen	193	8
07030	Hoành Bồ	Hoanh Bo	Phường Hoành Bồ	Hoanh Bo Ward	hoanh_bo	193	8
07033	Kỳ Thượng	Ky Thuong	Xã Kỳ Thượng	Ky Thuong Commune	ky_thuong	193	10
07036	Đồng Sơn	Dong Son	Xã Đồng Sơn	Dong Son Commune	dong_son	193	10
07039	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	193	10
07042	Đồng Lâm	Dong Lam	Xã Đồng Lâm	Dong Lam Commune	dong_lam	193	10
07045	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	193	10
07048	Vũ Oai	Vu Oai	Xã Vũ Oai	Vu Oai Commune	vu_oai	193	10
07051	Dân Chủ	Dan Chu	Xã Dân Chủ	Dan Chu Commune	dan_chu	193	10
07054	Quảng La	Quang La	Xã Quảng La	Quang La Commune	quang_la	193	10
07057	Bằng Cả	Bang Ca	Xã Bằng Cả	Bang Ca Commune	bang_ca	193	10
07060	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	193	10
07063	Sơn Dương	Son Duong	Xã Sơn Dương	Son Duong Commune	son_duong	193	10
07066	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	193	10
06709	Ka Long	Ka Long	Phường Ka Long	Ka Long Ward	ka_long	194	8
06712	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	194	8
06715	Ninh Dương	Ninh Duong	Phường Ninh Dương	Ninh Duong Ward	ninh_duong	194	8
06718	Hoà Lạc	Hoa Lac	Phường Hoà Lạc	Hoa Lac Ward	hoa_lac	194	8
06721	Trà Cổ	Tra Co	Phường Trà Cổ	Tra Co Ward	tra_co	194	8
06724	Hải Sơn	Hai Son	Xã Hải Sơn	Hai Son Commune	hai_son	194	10
06727	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	194	10
06730	Hải Đông	Hai Dong	Xã Hải Đông	Hai Dong Commune	hai_dong	194	10
06733	Hải Tiến	Hai Tien	Xã Hải Tiến	Hai Tien Commune	hai_tien	194	10
06736	Hải Yên	Hai Yen	Phường Hải Yên	Hai Yen Ward	hai_yen	194	8
06739	Quảng Nghĩa	Quang Nghia	Xã Quảng Nghĩa	Quang Nghia Commune	quang_nghia	194	10
06742	Hải Hoà	Hai Hoa	Phường Hải Hoà	Hai Hoa Ward	hai_hoa	194	8
06745	Hải Xuân	Hai Xuan	Xã Hải Xuân	Hai Xuan Commune	hai_xuan	194	10
06748	Vạn Ninh	Van Ninh	Xã Vạn Ninh	Van Ninh Commune	van_ninh	194	10
06751	Bình Ngọc	Binh Ngoc	Phường Bình Ngọc	Binh Ngoc Ward	binh_ngoc	194	8
06754	Vĩnh Trung	Vinh Trung	Xã Vĩnh Trung	Vinh Trung Commune	vinh_trung	194	10
06757	Vĩnh Thực	Vinh Thuc	Xã Vĩnh Thực	Vinh Thuc Commune	vinh_thuc	194	10
06760	Mông Dương	Mong Duong	Phường Mông Dương	Mong Duong Ward	mong_duong	195	8
06763	Cửa Ông	Cua Ong	Phường Cửa Ông	Cua Ong Ward	cua_ong	195	8
06766	Cẩm Sơn	Cam Son	Phường Cẩm Sơn	Cam Son Ward	cam_son	195	8
06769	Cẩm Đông	Cam Dong	Phường Cẩm Đông	Cam Dong Ward	cam_dong	195	8
06772	Cẩm Phú	Cam Phu	Phường Cẩm Phú	Cam Phu Ward	cam_phu	195	8
06775	Cẩm Tây	Cam Tay	Phường Cẩm Tây	Cam Tay Ward	cam_tay	195	8
06778	Quang Hanh	Quang Hanh	Phường Quang Hanh	Quang Hanh Ward	quang_hanh	195	8
06781	Cẩm Thịnh	Cam Thinh	Phường Cẩm Thịnh	Cam Thinh Ward	cam_thinh	195	8
06784	Cẩm Thủy	Cam Thuy	Phường Cẩm Thủy	Cam Thuy Ward	cam_thuy	195	8
06787	Cẩm Thạch	Cam Thach	Phường Cẩm Thạch	Cam Thach Ward	cam_thach	195	8
06790	Cẩm Thành	Cam Thanh	Phường Cẩm Thành	Cam Thanh Ward	cam_thanh	195	8
06793	Cẩm Trung	Cam Trung	Phường Cẩm Trung	Cam Trung Ward	cam_trung	195	8
06796	Cẩm Bình	Cam Binh	Phường Cẩm Bình	Cam Binh Ward	cam_binh	195	8
06799	Cộng Hòa	Cong Hoa	Xã Cộng Hòa	Cong Hoa Commune	cong_hoa	195	10
06802	Cẩm Hải	Cam Hai	Xã Cẩm Hải	Cam Hai Commune	cam_hai	195	10
06805	Dương Huy	Duong Huy	Xã Dương Huy	Duong Huy Commune	duong_huy	195	10
06808	Vàng Danh	Vang Danh	Phường Vàng Danh	Vang Danh Ward	vang_danh	196	8
06811	Thanh Sơn	Thanh Son	Phường Thanh Sơn	Thanh Son Ward	thanh_son	196	8
06814	Bắc Sơn	Bac Son	Phường Bắc Sơn	Bac Son Ward	bac_son	196	8
06817	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	196	8
06820	Trưng Vương	Trung Vuong	Phường Trưng Vương	Trung Vuong Ward	trung_vuong	196	8
06823	Nam Khê	Nam Khe	Phường Nam Khê	Nam Khe Ward	nam_khe	196	8
06826	Yên Thanh	Yen Thanh	Phường Yên Thanh	Yen Thanh Ward	yen_thanh	196	8
06829	Thượng Yên Công	Thuong Yen Cong	Xã Thượng Yên Công	Thuong Yen Cong Commune	thuong_yen_cong	196	10
06832	Phương Đông	Phuong Dong	Phường Phương Đông	Phuong Dong Ward	phuong_dong	196	8
06835	Phương Nam	Phuong Nam	Phường Phương Nam	Phuong Nam Ward	phuong_nam	196	8
06838	Bình Liêu	Binh Lieu	Thị trấn Bình Liêu	Binh Lieu Township	binh_lieu	198	9
06841	Hoành Mô	Hoanh Mo	Xã Hoành Mô	Hoanh Mo Commune	hoanh_mo	198	10
06844	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	198	10
06847	Đồng Văn	Dong Van	Xã Đồng Văn	Dong Van Commune	dong_van	198	10
06853	Vô Ngại	Vo Ngai	Xã Vô Ngại	Vo Ngai Commune	vo_ngai	198	10
06856	Lục Hồn	Luc Hon	Xã Lục Hồn	Luc Hon Commune	luc_hon	198	10
06859	Húc Động	Huc Dong	Xã Húc Động	Huc Dong Commune	huc_dong	198	10
06862	Tiên Yên	Tien Yen	Thị trấn Tiên Yên	Tien Yen Township	tien_yen	199	9
06865	Hà Lâu	Ha Lau	Xã Hà Lâu	Ha Lau Commune	ha_lau	199	10
06868	Đại Dực	Dai Duc	Xã Đại Dực	Dai Duc Commune	dai_duc	199	10
06871	Phong Dụ	Phong Du	Xã Phong Dụ	Phong Du Commune	phong_du	199	10
06874	Điền Xá	Dien Xa	Xã Điền Xá	Dien Xa Commune	dien_xa	199	10
06877	Đông Ngũ	Dong Ngu	Xã Đông Ngũ	Dong Ngu Commune	dong_ngu	199	10
06880	Yên Than	Yen Than	Xã Yên Than	Yen Than Commune	yen_than	199	10
06883	Đông Hải	Dong Hai	Xã Đông Hải	Dong Hai Commune	dong_hai	199	10
06886	Hải Lạng	Hai Lang	Xã Hải Lạng	Hai Lang Commune	hai_lang	199	10
06889	Tiên Lãng	Tien Lang	Xã Tiên Lãng	Tien Lang Commune	tien_lang	199	10
06892	Đồng Rui	Dong Rui	Xã Đồng Rui	Dong Rui Commune	dong_rui	199	10
06895	Đầm Hà	Dam Ha	Thị trấn Đầm Hà	Dam Ha Township	dam_ha	200	9
06898	Quảng Lâm	Quang Lam	Xã Quảng Lâm	Quang Lam Commune	quang_lam	200	10
06901	Quảng An	Quang An	Xã Quảng An	Quang An Commune	quang_an	200	10
06904	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	200	10
06910	Dực Yên	Duc Yen	Xã Dực Yên	Duc Yen Commune	duc_yen	200	10
06913	Quảng Tân	Quang Tan	Xã Quảng Tân	Quang Tan Commune	quang_tan	200	10
06916	Đầm Hà	Dam Ha	Xã Đầm Hà	Dam Ha Commune	dam_ha	200	10
06917	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	200	10
06919	Đại Bình	Dai Binh	Xã Đại Bình	Dai Binh Commune	dai_binh	200	10
06922	Quảng Hà	Quang Ha	Thị trấn Quảng Hà	Quang Ha Township	quang_ha	201	9
06925	Quảng Đức	Quang Duc	Xã Quảng Đức	Quang Duc Commune	quang_duc	201	10
06928	Quảng Sơn	Quang Son	Xã Quảng Sơn	Quang Son Commune	quang_son	201	10
06931	Quảng Thành	Quang Thanh	Xã Quảng Thành	Quang Thanh Commune	quang_thanh	201	10
06937	Quảng Thịnh	Quang Thinh	Xã Quảng Thịnh	Quang Thinh Commune	quang_thinh	201	10
06940	Quảng Minh	Quang Minh	Xã Quảng Minh	Quang Minh Commune	quang_minh	201	10
06943	Quảng Chính	Quang Chinh	Xã Quảng Chính	Quang Chinh Commune	quang_chinh	201	10
06946	Quảng Long	Quang Long	Xã Quảng Long	Quang Long Commune	quang_long	201	10
06949	Đường Hoa	Duong Hoa	Xã Đường Hoa	Duong Hoa Commune	duong_hoa	201	10
06952	Quảng Phong	Quang Phong	Xã Quảng Phong	Quang Phong Commune	quang_phong	201	10
06967	Cái Chiên	Cai Chien	Xã Cái Chiên	Cai Chien Commune	cai_chien	201	10
06970	Ba Chẽ	Ba Che	Thị trấn Ba Chẽ	Ba Che Township	ba_che	202	9
06973	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	202	10
06976	Thanh Lâm	Thanh Lam	Xã Thanh Lâm	Thanh Lam Commune	thanh_lam	202	10
06979	Đạp Thanh	Dap Thanh	Xã Đạp Thanh	Dap Thanh Commune	dap_thanh	202	10
06982	Nam Sơn	Nam Son	Xã Nam Sơn	Nam Son Commune	nam_son	202	10
06985	Lương Mông	Luong Mong	Xã Lương Mông	Luong Mong Commune	luong_mong	202	10
06988	Đồn Đạc	Don Dac	Xã Đồn Đạc	Don Dac Commune	don_dac	202	10
06991	Minh Cầm	Minh Cam	Xã Minh Cầm	Minh Cam Commune	minh_cam	202	10
06994	Cái Rồng	Cai Rong	Thị trấn Cái Rồng	Cai Rong Township	cai_rong	203	9
06997	Đài Xuyên	Dai Xuyen	Xã Đài Xuyên	Dai Xuyen Commune	dai_xuyen	203	10
07000	Bình Dân	Binh Dan	Xã Bình Dân	Binh Dan Commune	binh_dan	203	10
07003	Vạn Yên	Van Yen	Xã Vạn Yên	Van Yen Commune	van_yen	203	10
07006	Minh Châu	Minh Chau	Xã Minh Châu	Minh Chau Commune	minh_chau	203	10
07009	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	203	10
07012	Hạ Long	Ha Long	Xã Hạ Long	Ha Long Commune	ha_long	203	10
07015	Đông Xá	Dong Xa	Xã Đông Xá	Dong Xa Commune	dong_xa	203	10
07018	Bản Sen	Ban Sen	Xã Bản Sen	Ban Sen Commune	ban_sen	203	10
07021	Thắng Lợi	Thang Loi	Xã Thắng Lợi	Thang Loi Commune	thang_loi	203	10
07024	Quan Lạn	Quan Lan	Xã Quan Lạn	Quan Lan Commune	quan_lan	203	10
07027	Ngọc Vừng	Ngoc Vung	Xã Ngọc Vừng	Ngoc Vung Commune	ngoc_vung	203	10
07069	Mạo Khê	Mao Khe	Phường Mạo Khê	Mao Khe Ward	mao_khe	205	8
07072	Đông Triều	Dong Trieu	Phường Đông Triều	Dong Trieu Ward	dong_trieu	205	8
07075	An Sinh	An Sinh	Xã An Sinh	An Sinh Commune	an_sinh	205	10
07078	Tràng Lương	Trang Luong	Xã Tràng Lương	Trang Luong Commune	trang_luong	205	10
07081	Bình Khê	Binh Khe	Xã Bình Khê	Binh Khe Commune	binh_khe	205	10
07084	Việt Dân	Viet Dan	Xã Việt Dân	Viet Dan Commune	viet_dan	205	10
07087	Tân Việt	Tan Viet	Xã Tân Việt	Tan Viet Commune	tan_viet	205	10
07090	Bình Dương	Binh Duong	Xã Bình Dương	Binh Duong Commune	binh_duong	205	10
07093	Đức Chính	Duc Chinh	Phường Đức Chính	Duc Chinh Ward	duc_chinh	205	8
07096	Tràng An	Trang An	Phường Tràng An	Trang An Ward	trang_an	205	8
07099	Nguyễn Huệ	Nguyen Hue	Xã Nguyễn Huệ	Nguyen Hue Commune	nguyen_hue	205	10
07102	Thủy An	Thuy An	Xã Thủy An	Thuy An Commune	thuy_an	205	10
07105	Xuân Sơn	Xuan Son	Phường Xuân Sơn	Xuan Son Ward	xuan_son	205	8
07108	Hồng Thái Tây	Hong Thai Tay	Xã Hồng Thái Tây	Hong Thai Tay Commune	hong_thai_tay	205	10
07111	Hồng Thái Đông	Hong Thai Dong	Xã Hồng Thái Đông	Hong Thai Dong Commune	hong_thai_dong	205	10
07114	Hoàng Quế	Hoang Que	Phường Hoàng Quế	Hoang Que Ward	hoang_que	205	8
07117	Yên Thọ	Yen Tho	Phường Yên Thọ	Yen Tho Ward	yen_tho	205	8
07120	Hồng Phong	Hong Phong	Phường Hồng Phong	Hong Phong Ward	hong_phong	205	8
07123	Kim Sơn	Kim Son	Phường Kim Sơn	Kim Son Ward	kim_son	205	8
07126	Hưng Đạo	Hung Dao	Phường Hưng Đạo	Hung Dao Ward	hung_dao	205	8
07129	Yên Đức	Yen Duc	Xã Yên Đức	Yen Duc Commune	yen_duc	205	10
07132	Quảng Yên	Quang Yen	Phường Quảng Yên	Quang Yen Ward	quang_yen	206	8
07135	Đông Mai	Dong Mai	Phường Đông Mai	Dong Mai Ward	dong_mai	206	8
07138	Minh Thành	Minh Thanh	Phường Minh Thành	Minh Thanh Ward	minh_thanh	206	8
07144	Sông Khoai	Song Khoai	Xã Sông Khoai	Song Khoai Commune	song_khoai	206	10
07147	Hiệp Hòa	Hiep Hoa	Xã Hiệp Hòa	Hiep Hoa Commune	hiep_hoa	206	10
07150	Cộng Hòa	Cong Hoa	Phường Cộng Hòa	Cong Hoa Ward	cong_hoa	206	8
07153	Tiền An	Tien An	Xã Tiền An	Tien An Commune	tien_an	206	10
07156	Hoàng Tân	Hoang Tan	Xã Hoàng Tân	Hoang Tan Commune	hoang_tan	206	10
07159	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	206	8
07162	Yên Giang	Yen Giang	Phường Yên Giang	Yen Giang Ward	yen_giang	206	8
07165	Nam Hoà	Nam Hoa	Phường Nam Hoà	Nam Hoa Ward	nam_hoa	206	8
07168	Hà An	Ha An	Phường Hà An	Ha An Ward	ha_an	206	8
07171	Cẩm La	Cam La	Xã Cẩm La	Cam La Commune	cam_la	206	10
07174	Phong Hải	Phong Hai	Phường Phong Hải	Phong Hai Ward	phong_hai	206	8
07177	Yên Hải	Yen Hai	Phường Yên Hải	Yen Hai Ward	yen_hai	206	8
07180	Liên Hòa	Lien Hoa	Xã Liên Hòa	Lien Hoa Commune	lien_hoa	206	10
07183	Phong Cốc	Phong Coc	Phường Phong Cốc	Phong Coc Ward	phong_coc	206	8
07186	Liên Vị	Lien Vi	Xã Liên Vị	Lien Vi Commune	lien_vi	206	10
07189	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	206	10
07192	Cô Tô	Co To	Thị trấn Cô Tô	Co To Township	co_to	207	9
07195	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	207	10
07198	Thanh Lân	Thanh Lan	Xã Thanh Lân	Thanh Lan Commune	thanh_lan	207	10
07201	Thọ Xương	Tho Xuong	Phường Thọ Xương	Tho Xuong Ward	tho_xuong	213	8
07204	Trần Nguyên Hãn	Tran Nguyen Han	Phường Trần Nguyên Hãn	Tran Nguyen Han Ward	tran_nguyen_han	213	8
07207	Ngô Quyền	Ngo Quyen	Phường Ngô Quyền	Ngo Quyen Ward	ngo_quyen	213	8
07210	Hoàng Văn Thụ	Hoang Van Thu	Phường Hoàng Văn Thụ	Hoang Van Thu Ward	hoang_van_thu	213	8
07213	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	213	8
07216	Mỹ Độ	My Do	Phường Mỹ Độ	My Do Ward	my_do	213	8
07219	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	213	8
07222	Song Mai	Song Mai	Xã Song Mai	Song Mai Commune	song_mai	213	10
07225	Xương Giang	Xuong Giang	Phường Xương Giang	Xuong Giang Ward	xuong_giang	213	8
07228	Đa Mai	Da Mai	Phường Đa Mai	Da Mai Ward	da_mai	213	8
07231	Dĩnh Kế	Dinh Ke	Phường Dĩnh Kế	Dinh Ke Ward	dinh_ke	213	8
07441	Dĩnh Trì	Dinh Tri	Xã Dĩnh Trì	Dinh Tri Commune	dinh_tri	213	10
07687	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	213	10
07696	Đồng Sơn	Dong Son	Xã Đồng Sơn	Dong Son Commune	dong_son	213	10
07699	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	213	10
07705	Song Khê	Song Khe	Xã Song Khê	Song Khe Commune	song_khe	213	10
07243	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	215	10
07246	Canh Nậu	Canh Nau	Xã Canh Nậu	Canh Nau Commune	canh_nau	215	10
07249	Xuân Lương	Xuan Luong	Xã Xuân Lương	Xuan Luong Commune	xuan_luong	215	10
07252	Tam Tiến	Tam Tien	Xã Tam Tiến	Tam Tien Commune	tam_tien	215	10
07255	Đồng Vương	Dong Vuong	Xã Đồng Vương	Dong Vuong Commune	dong_vuong	215	10
07258	Đồng Hưu	Dong Huu	Xã Đồng Hưu	Dong Huu Commune	dong_huu	215	10
07260	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	215	10
07261	Tam Hiệp	Tam Hiep	Xã Tam Hiệp	Tam Hiep Commune	tam_hiep	215	10
07264	Tiến Thắng	Tien Thang	Xã Tiến Thắng	Tien Thang Commune	tien_thang	215	10
07267	Hồng Kỳ	Hong Ky	Xã Hồng Kỳ	Hong Ky Commune	hong_ky	215	10
07270	Đồng Lạc	Dong Lac	Xã Đồng Lạc	Dong Lac Commune	dong_lac	215	10
07273	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	215	10
07276	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	215	10
07279	Hương Vĩ	Huong Vi	Xã Hương Vĩ	Huong Vi Commune	huong_vi	215	10
07282	Đồng Kỳ	Dong Ky	Xã Đồng Kỳ	Dong Ky Commune	dong_ky	215	10
07285	An Thượng	An Thuong	Xã An Thượng	An Thuong Commune	an_thuong	215	10
07288	Phồn Xương	Phon Xuong	Thị trấn Phồn Xương	Phon Xuong Township	phon_xuong	215	9
07291	Tân Sỏi	Tan Soi	Xã Tân Sỏi	Tan Soi Commune	tan_soi	215	10
07294	Bố Hạ	Bo Ha	Thị trấn Bố Hạ	Bo Ha Township	bo_ha	215	9
07303	Lan Giới	Lan Gioi	Xã Lan Giới	Lan Gioi Commune	lan_gioi	216	10
07306	Nhã Nam	Nha Nam	Thị trấn Nhã Nam	Nha Nam Township	nha_nam	216	9
07309	Tân Trung	Tan Trung	Xã Tân Trung	Tan Trung Commune	tan_trung	216	10
07312	Đại Hóa	Dai Hoa	Xã Đại Hóa	Dai Hoa Commune	dai_hoa	216	10
07315	Quang Tiến	Quang Tien	Xã Quang Tiến	Quang Tien Commune	quang_tien	216	10
07318	Phúc Sơn	Phuc Son	Xã Phúc Sơn	Phuc Son Commune	phuc_son	216	10
07321	An Dương	An Duong	Xã An Dương	An Duong Commune	an_duong	216	10
07324	Phúc Hòa	Phuc Hoa	Xã Phúc Hòa	Phuc Hoa Commune	phuc_hoa	216	10
07327	Liên Sơn	Lien Son	Xã Liên Sơn	Lien Son Commune	lien_son	216	10
07330	Hợp Đức	Hop Duc	Xã Hợp Đức	Hop Duc Commune	hop_duc	216	10
07333	Lam Cốt	Lam Cot	Xã Lam Cốt	Lam Cot Commune	lam_cot	216	10
07339	Cao Thượng	Cao Thuong	Thị trấn Cao Thượng	Cao Thuong Township	cao_thuong	216	9
07342	Việt Ngọc	Viet Ngoc	Xã Việt Ngọc	Viet Ngoc Commune	viet_ngoc	216	10
07345	Song Vân	Song Van	Xã Song Vân	Song Van Commune	song_van	216	10
07348	Ngọc Châu	Ngoc Chau	Xã Ngọc Châu	Ngoc Chau Commune	ngoc_chau	216	10
07351	Ngọc Vân	Ngoc Van	Xã Ngọc Vân	Ngoc Van Commune	ngoc_van	216	10
07354	Việt Lập	Viet Lap	Xã Việt Lập	Viet Lap Commune	viet_lap	216	10
07357	Liên Chung	Lien Chung	Xã Liên Chung	Lien Chung Commune	lien_chung	216	10
07360	Ngọc Thiện	Ngoc Thien	Xã Ngọc Thiện	Ngoc Thien Commune	ngoc_thien	216	10
07363	Ngọc Lý	Ngoc Ly	Xã Ngọc Lý	Ngoc Ly Commune	ngoc_ly	216	10
07366	Quế Nham	Que Nham	Xã Quế Nham	Que Nham Commune	que_nham	216	10
07375	Vôi	Voi	Thị trấn Vôi	Voi Township	voi	217	9
07378	Nghĩa Hòa	Nghia Hoa	Xã Nghĩa Hòa	Nghia Hoa Commune	nghia_hoa	217	10
07381	Nghĩa Hưng	Nghia Hung	Xã Nghĩa Hưng	Nghia Hung Commune	nghia_hung	217	10
07384	Quang Thịnh	Quang Thinh	Xã Quang Thịnh	Quang Thinh Commune	quang_thinh	217	10
07387	Hương Sơn	Huong Son	Xã Hương Sơn	Huong Son Commune	huong_son	217	10
07390	Đào Mỹ	Dao My	Xã Đào Mỹ	Dao My Commune	dao_my	217	10
07393	Tiên Lục	Tien Luc	Xã Tiên Lục	Tien Luc Commune	tien_luc	217	10
07396	An Hà	An Ha	Xã An Hà	An Ha Commune	an_ha	217	10
07399	Kép	Kep	Thị trấn Kép	Kep Township	kep	217	9
07402	Mỹ Hà	My Ha	Xã Mỹ Hà	My Ha Commune	my_ha	217	10
07405	Hương Lạc	Huong Lac	Xã Hương Lạc	Huong Lac Commune	huong_lac	217	10
07408	Dương Đức	Duong Duc	Xã Dương Đức	Duong Duc Commune	duong_duc	217	10
07411	Tân Thanh	Tan Thanh	Xã Tân Thanh	Tan Thanh Commune	tan_thanh	217	10
07414	Yên Mỹ	Yen My	Xã Yên Mỹ	Yen My Commune	yen_my	217	10
07417	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	217	10
07420	Mỹ Thái	My Thai	Xã Mỹ Thái	My Thai Commune	my_thai	217	10
07426	Xương Lâm	Xuong Lam	Xã Xương Lâm	Xuong Lam Commune	xuong_lam	217	10
07429	Xuân Hương	Xuan Huong	Xã Xuân Hương	Xuan Huong Commune	xuan_huong	217	10
07432	Tân Dĩnh	Tan Dinh	Xã Tân Dĩnh	Tan Dinh Commune	tan_dinh	217	10
07435	Đại Lâm	Dai Lam	Xã Đại Lâm	Dai Lam Commune	dai_lam	217	10
07438	Thái Đào	Thai Dao	Xã Thái Đào	Thai Dao Commune	thai_dao	217	10
07444	Đồi Ngô	Doi Ngo	Thị trấn Đồi Ngô	Doi Ngo Township	doi_ngo	218	9
07450	Đông Hưng	Dong Hung	Xã Đông Hưng	Dong Hung Commune	dong_hung	218	10
07453	Đông Phú	Dong Phu	Xã Đông Phú	Dong Phu Commune	dong_phu	218	10
07456	Tam Dị	Tam Di	Xã Tam Dị	Tam Di Commune	tam_di	218	10
07459	Bảo Sơn	Bao Son	Xã Bảo Sơn	Bao Son Commune	bao_son	218	10
07462	Bảo Đài	Bao Dai	Xã Bảo Đài	Bao Dai Commune	bao_dai	218	10
07465	Thanh Lâm	Thanh Lam	Xã Thanh Lâm	Thanh Lam Commune	thanh_lam	218	10
07468	Tiên Nha	Tien Nha	Xã Tiên Nha	Tien Nha Commune	tien_nha	218	10
07471	Trường Giang	Truong Giang	Xã Trường Giang	Truong Giang Commune	truong_giang	218	10
07477	Phương Sơn	Phuong Son	Xã Phương Sơn	Phuong Son Commune	phuong_son	218	10
07480	Chu Điện	Chu Dien	Xã Chu Điện	Chu Dien Commune	chu_dien	218	10
07483	Cương Sơn	Cuong Son	Xã Cương Sơn	Cuong Son Commune	cuong_son	218	10
07486	Nghĩa Phương	Nghia Phuong	Xã Nghĩa Phương	Nghia Phuong Commune	nghia_phuong	218	10
07489	Vô Tranh	Vo Tranh	Xã Vô Tranh	Vo Tranh Commune	vo_tranh	218	10
07492	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	218	10
07495	Lan Mẫu	Lan Mau	Xã Lan Mẫu	Lan Mau Commune	lan_mau	218	10
07498	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	218	10
07501	Khám Lạng	Kham Lang	Xã Khám Lạng	Kham Lang Commune	kham_lang	218	10
07504	Huyền Sơn	Huyen Son	Xã Huyền Sơn	Huyen Son Commune	huyen_son	218	10
07507	Trường Sơn	Truong Son	Xã Trường Sơn	Truong Son Commune	truong_son	218	10
07510	Lục Sơn	Luc Son	Xã Lục Sơn	Luc Son Commune	luc_son	218	10
07513	Bắc Lũng	Bac Lung	Xã Bắc Lũng	Bac Lung Commune	bac_lung	218	10
07516	Vũ Xá	Vu Xa	Xã Vũ Xá	Vu Xa Commune	vu_xa	218	10
07519	Cẩm Lý	Cam Ly	Xã Cẩm Lý	Cam Ly Commune	cam_ly	218	10
07522	Đan Hội	Dan Hoi	Xã Đan Hội	Dan Hoi Commune	dan_hoi	218	10
07525	Chũ	Chu	Thị trấn Chũ	Chu Township	chu	219	9
07528	Cấm Sơn	Cam Son	Xã Cấm Sơn	Cam Son Commune	cam_son	219	10
07531	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	219	10
07534	Phong Minh	Phong Minh	Xã Phong Minh	Phong Minh Commune	phong_minh	219	10
07537	Phong Vân	Phong Van	Xã Phong Vân	Phong Van Commune	phong_van	219	10
07540	Xa Lý	Xa Ly	Xã Xa Lý	Xa Ly Commune	xa_ly	219	10
07543	Hộ Đáp	Ho Dap	Xã Hộ Đáp	Ho Dap Commune	ho_dap	219	10
07546	Sơn Hải	Son Hai	Xã Sơn Hải	Son Hai Commune	son_hai	219	10
07549	Thanh Hải	Thanh Hai	Xã Thanh Hải	Thanh Hai Commune	thanh_hai	219	10
07552	Kiên Lao	Kien Lao	Xã Kiên Lao	Kien Lao Commune	kien_lao	219	10
07555	Biên Sơn	Bien Son	Xã Biên Sơn	Bien Son Commune	bien_son	219	10
07558	Kiên Thành	Kien Thanh	Xã Kiên Thành	Kien Thanh Commune	kien_thanh	219	10
07561	Hồng Giang	Hong Giang	Xã Hồng Giang	Hong Giang Commune	hong_giang	219	10
07564	Kim Sơn	Kim Son	Xã Kim Sơn	Kim Son Commune	kim_son	219	10
07567	Tân Hoa	Tan Hoa	Xã Tân Hoa	Tan Hoa Commune	tan_hoa	219	10
07570	Giáp Sơn	Giap Son	Xã Giáp Sơn	Giap Son Commune	giap_son	219	10
07573	Biển Động	Bien Dong	Xã Biển Động	Bien Dong Commune	bien_dong	219	10
07576	Quý Sơn	Quy Son	Xã Quý Sơn	Quy Son Commune	quy_son	219	10
07579	Trù Hựu	Tru Huu	Xã Trù Hựu	Tru Huu Commune	tru_huu	219	10
07582	Phì Điền	Phi Dien	Xã Phì Điền	Phi Dien Commune	phi_dien	219	10
07588	Tân Quang	Tan Quang	Xã Tân Quang	Tan Quang Commune	tan_quang	219	10
07591	Đồng Cốc	Dong Coc	Xã Đồng Cốc	Dong Coc Commune	dong_coc	219	10
07594	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	219	10
07597	Phú Nhuận	Phu Nhuan	Xã Phú Nhuận	Phu Nhuan Commune	phu_nhuan	219	10
07600	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	219	10
07603	Nam Dương	Nam Duong	Xã Nam Dương	Nam Duong Commune	nam_duong	219	10
07606	Tân Mộc	Tan Moc	Xã Tân Mộc	Tan Moc Commune	tan_moc	219	10
07609	Đèo Gia	Deo Gia	Xã Đèo Gia	Deo Gia Commune	deo_gia	219	10
07612	Phượng Sơn	Phuong Son	Xã Phượng Sơn	Phuong Son Commune	phuong_son	219	10
07615	An Châu	An Chau	Thị trấn An Châu	An Chau Township	an_chau	220	9
27265	06	06	Phường 06	06 Ward	06	773	8
07616	Tây Yên Tử	Tay Yen Tu	Thị trấn Tây Yên Tử	Tay Yen Tu Township	tay_yen_tu	220	9
07621	Vân Sơn	Van Son	Xã Vân Sơn	Van Son Commune	van_son	220	10
07624	Hữu Sản	Huu San	Xã Hữu Sản	Huu San Commune	huu_san	220	10
07627	Đại Sơn	Dai Son	Xã Đại Sơn	Dai Son Commune	dai_son	220	10
07630	Phúc Sơn	Phuc Son	Xã Phúc Sơn	Phuc Son Commune	phuc_son	220	10
07636	Giáo Liêm	Giao Liem	Xã Giáo Liêm	Giao Liem Commune	giao_liem	220	10
07642	Cẩm Đàn	Cam Dan	Xã Cẩm Đàn	Cam Dan Commune	cam_dan	220	10
07645	An Lạc	An Lac	Xã An Lạc	An Lac Commune	an_lac	220	10
07648	Vĩnh An	Vinh An	Xã Vĩnh An	Vinh An Commune	vinh_an	220	10
07651	Yên Định	Yen Dinh	Xã Yên Định	Yen Dinh Commune	yen_dinh	220	10
07654	Lệ Viễn	Le Vien	Xã Lệ Viễn	Le Vien Commune	le_vien	220	10
07660	An Bá	An Ba	Xã An Bá	An Ba Commune	an_ba	220	10
07663	Tuấn Đạo	Tuan Dao	Xã Tuấn Đạo	Tuan Dao Commune	tuan_dao	220	10
07666	Dương Hưu	Duong Huu	Xã Dương Hưu	Duong Huu Commune	duong_huu	220	10
07672	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	220	10
07678	Thanh Luận	Thanh Luan	Xã Thanh Luận	Thanh Luan Commune	thanh_luan	220	10
07681	Nham Biền	Nham Bien	Thị trấn Nham Biền	Nham Bien Township	nham_bien	221	9
07682	Tân An	Tan An	Thị trấn Tân An	Tan An Township	tan_an	221	9
07684	Lão Hộ	Lao Ho	Xã Lão Hộ	Lao Ho Commune	lao_ho	221	10
07690	Hương Gián	Huong Gian	Xã Hương Gián	Huong Gian Commune	huong_gian	221	10
07702	Quỳnh Sơn	Quynh Son	Xã Quỳnh Sơn	Quynh Son Commune	quynh_son	221	10
07708	Nội Hoàng	Noi Hoang	Xã Nội Hoàng	Noi Hoang Commune	noi_hoang	221	10
07711	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	221	10
07714	Xuân Phú	Xuan Phu	Xã Xuân Phú	Xuan Phu Commune	xuan_phu	221	10
07717	Tân Liễu	Tan Lieu	Xã Tân Liễu	Tan Lieu Commune	tan_lieu	221	10
07720	Trí Yên	Tri Yen	Xã Trí Yên	Tri Yen Commune	tri_yen	221	10
07723	Lãng Sơn	Lang Son	Xã Lãng Sơn	Lang Son Commune	lang_son	221	10
07726	Yên Lư	Yen Lu	Xã Yên Lư	Yen Lu Commune	yen_lu	221	10
07729	Tiến Dũng	Tien Dung	Xã Tiến Dũng	Tien Dung Commune	tien_dung	221	10
07735	Đức Giang	Duc Giang	Xã Đức Giang	Duc Giang Commune	duc_giang	221	10
07738	Cảnh Thụy	Canh Thuy	Xã Cảnh Thụy	Canh Thuy Commune	canh_thuy	221	10
07741	Tư Mại	Tu Mai	Xã Tư Mại	Tu Mai Commune	tu_mai	221	10
07747	Đồng Việt	Dong Viet	Xã Đồng Việt	Dong Viet Commune	dong_viet	221	10
07750	Đồng Phúc	Dong Phuc	Xã Đồng Phúc	Dong Phuc Commune	dong_phuc	221	10
07759	Thượng Lan	Thuong Lan	Xã Thượng Lan	Thuong Lan Commune	thuong_lan	222	10
07762	Việt Tiến	Viet Tien	Xã Việt Tiến	Viet Tien Commune	viet_tien	222	10
07765	Nghĩa Trung	Nghia Trung	Xã Nghĩa Trung	Nghia Trung Commune	nghia_trung	222	10
07768	Minh Đức	Minh Duc	Xã Minh Đức	Minh Duc Commune	minh_duc	222	10
07771	Hương Mai	Huong Mai	Xã Hương Mai	Huong Mai Commune	huong_mai	222	10
07774	Tự Lạn	Tu Lan	Xã Tự Lạn	Tu Lan Commune	tu_lan	222	10
07777	Bích Động	Bich Dong	Thị trấn Bích Động	Bich Dong Township	bich_dong	222	9
07780	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	222	10
07783	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	222	10
07786	Tiên Sơn	Tien Son	Xã Tiên Sơn	Tien Son Commune	tien_son	222	10
07789	Tăng Tiến	Tang Tien	Xã Tăng Tiến	Tang Tien Commune	tang_tien	222	10
07792	Quảng Minh	Quang Minh	Xã Quảng Minh	Quang Minh Commune	quang_minh	222	10
07795	Nếnh	Nenh	Thị trấn Nếnh	Nenh Township	nenh	222	9
07798	Ninh Sơn	Ninh Son	Xã Ninh Sơn	Ninh Son Commune	ninh_son	222	10
07801	Vân Trung	Van Trung	Xã Vân Trung	Van Trung Commune	van_trung	222	10
07804	Vân Hà	Van Ha	Xã Vân Hà	Van Ha Commune	van_ha	222	10
07807	Quang Châu	Quang Chau	Xã Quang Châu	Quang Chau Commune	quang_chau	222	10
07813	Đồng Tân	Dong Tan	Xã Đồng Tân	Dong Tan Commune	dong_tan	223	10
07816	Thanh Vân	Thanh Van	Xã Thanh Vân	Thanh Van Commune	thanh_van	223	10
07819	Hoàng Lương	Hoang Luong	Xã Hoàng Lương	Hoang Luong Commune	hoang_luong	223	10
07822	Hoàng Vân	Hoang Van	Xã Hoàng Vân	Hoang Van Commune	hoang_van	223	10
07825	Hoàng Thanh	Hoang Thanh	Xã Hoàng Thanh	Hoang Thanh Commune	hoang_thanh	223	10
07828	Hoàng An	Hoang An	Xã Hoàng An	Hoang An Commune	hoang_an	223	10
07831	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	223	10
07834	Thái Sơn	Thai Son	Xã Thái Sơn	Thai Son Commune	thai_son	223	10
07837	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	223	10
07840	Thắng	Thang	Thị trấn Thắng	Thang Township	thang	223	9
07843	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	223	10
07846	Lương Phong	Luong Phong	Xã Lương Phong	Luong Phong Commune	luong_phong	223	10
07849	Hùng Sơn	Hung Son	Xã Hùng Sơn	Hung Son Commune	hung_son	223	10
07852	Đại Thành	Dai Thanh	Xã Đại Thành	Dai Thanh Commune	dai_thanh	223	10
07855	Thường Thắng	Thuong Thang	Xã Thường Thắng	Thuong Thang Commune	thuong_thang	223	10
07858	Hợp Thịnh	Hop Thinh	Xã Hợp Thịnh	Hop Thinh Commune	hop_thinh	223	10
07861	Danh Thắng	Danh Thang	Xã Danh Thắng	Danh Thang Commune	danh_thang	223	10
07864	Mai Trung	Mai Trung	Xã Mai Trung	Mai Trung Commune	mai_trung	223	10
07867	Đoan Bái	Doan Bai	Xã Đoan Bái	Doan Bai Commune	doan_bai	223	10
07870	Bắc Lý	Bac Ly	Xã Bắc Lý	Bac Ly Commune	bac_ly	223	10
07873	Xuân Cẩm	Xuan Cam	Xã Xuân Cẩm	Xuan Cam Commune	xuan_cam	223	10
07876	Hương Lâm	Huong Lam	Xã Hương Lâm	Huong Lam Commune	huong_lam	223	10
07879	Đông Lỗ	Dong Lo	Xã Đông Lỗ	Dong Lo Commune	dong_lo	223	10
07882	Châu Minh	Chau Minh	Xã Châu Minh	Chau Minh Commune	chau_minh	223	10
07885	Mai Đình	Mai Dinh	Xã Mai Đình	Mai Dinh Commune	mai_dinh	223	10
07888	Dữu Lâu	Duu Lau	Phường Dữu Lâu	Duu Lau Ward	duu_lau	227	8
07891	Vân Cơ	Van Co	Phường Vân Cơ	Van Co Ward	van_co	227	8
07894	Nông Trang	Nong Trang	Phường Nông Trang	Nong Trang Ward	nong_trang	227	8
07897	Tân Dân	Tan Dan	Phường Tân Dân	Tan Dan Ward	tan_dan	227	8
07900	Gia Cẩm	Gia Cam	Phường Gia Cẩm	Gia Cam Ward	gia_cam	227	8
07903	Tiên Cát	Tien Cat	Phường Tiên Cát	Tien Cat Ward	tien_cat	227	8
07906	Thọ Sơn	Tho Son	Phường Thọ Sơn	Tho Son Ward	tho_son	227	8
07909	Thanh Miếu	Thanh Mieu	Phường Thanh Miếu	Thanh Mieu Ward	thanh_mieu	227	8
07912	Bạch Hạc	Bach Hac	Phường Bạch Hạc	Bach Hac Ward	bach_hac	227	8
07915	Bến Gót	Ben Got	Phường Bến Gót	Ben Got Ward	ben_got	227	8
07918	Vân Phú	Van Phu	Phường Vân Phú	Van Phu Ward	van_phu	227	8
07921	Phượng Lâu	Phuong Lau	Xã Phượng Lâu	Phuong Lau Commune	phuong_lau	227	10
07924	Thụy Vân	Thuy Van	Xã Thụy Vân	Thuy Van Commune	thuy_van	227	10
07927	Minh Phương	Minh Phuong	Phường Minh Phương	Minh Phuong Ward	minh_phuong	227	8
07930	Trưng Vương	Trung Vuong	Xã Trưng Vương	Trung Vuong Commune	trung_vuong	227	10
07933	Minh Nông	Minh Nong	Phường Minh Nông	Minh Nong Ward	minh_nong	227	8
07936	Sông Lô	Song Lo	Xã Sông Lô	Song Lo Commune	song_lo	227	10
08281	Kim Đức	Kim Duc	Xã Kim Đức	Kim Duc Commune	kim_duc	227	10
08287	Hùng Lô	Hung Lo	Xã Hùng Lô	Hung Lo Commune	hung_lo	227	10
08503	Hy Cương	Hy Cuong	Xã Hy Cương	Hy Cuong Commune	hy_cuong	227	10
08506	Chu Hóa	Chu Hoa	Xã Chu Hóa	Chu Hoa Commune	chu_hoa	227	10
08515	Thanh Đình	Thanh Dinh	Xã Thanh Đình	Thanh Dinh Commune	thanh_dinh	227	10
07942	Hùng Vương	Hung Vuong	Phường Hùng Vương	Hung Vuong Ward	hung_vuong	228	8
07945	Phong Châu	Phong Chau	Phường Phong Châu	Phong Chau Ward	phong_chau	228	8
07948	Âu Cơ	Au Co	Phường Âu Cơ	Au Co Ward	au_co	228	8
07951	Hà Lộc	Ha Loc	Xã Hà Lộc	Ha Loc Commune	ha_loc	228	10
07954	Phú Hộ	Phu Ho	Xã Phú Hộ	Phu Ho Commune	phu_ho	228	10
07957	Văn Lung	Van Lung	Xã Văn Lung	Van Lung Commune	van_lung	228	10
07960	Thanh Minh	Thanh Minh	Xã Thanh Minh	Thanh Minh Commune	thanh_minh	228	10
07963	Hà Thạch	Ha Thach	Xã Hà Thạch	Ha Thach Commune	ha_thach	228	10
07966	Thanh Vinh	Thanh Vinh	Phường Thanh Vinh	Thanh Vinh Ward	thanh_vinh	228	8
07969	Đoan Hùng	Doan Hung	Thị trấn Đoan Hùng	Doan Hung Township	doan_hung	230	9
07975	Hùng Xuyên	Hung Xuyen	Xã Hùng Xuyên	Hung Xuyen Commune	hung_xuyen	230	10
07981	Bằng Luân	Bang Luan	Xã Bằng Luân	Bang Luan Commune	bang_luan	230	10
07984	Vân Du	Van Du	Xã Vân Du	Van Du Commune	van_du	230	10
07987	Phú Lâm	Phu Lam	Xã Phú Lâm	Phu Lam Commune	phu_lam	230	10
07993	Minh Lương	Minh Luong	Xã Minh Lương	Minh Luong Commune	minh_luong	230	10
07996	Bằng Doãn	Bang Doan	Xã Bằng Doãn	Bang Doan Commune	bang_doan	230	10
07999	Chí Đám	Chi Dam	Xã Chí Đám	Chi Dam Commune	chi_dam	230	10
08005	Phúc Lai	Phuc Lai	Xã Phúc Lai	Phuc Lai Commune	phuc_lai	230	10
08008	Ngọc Quan	Ngoc Quan	Xã Ngọc Quan	Ngoc Quan Commune	ngoc_quan	230	10
08014	Hợp Nhất	Hop Nhat	Xã Hợp Nhất	Hop Nhat Commune	hop_nhat	230	10
08017	Sóc Đăng	Soc Dang	Xã Sóc Đăng	Soc Dang Commune	soc_dang	230	10
08023	Tây Cốc	Tay Coc	Xã Tây Cốc	Tay Coc Commune	tay_coc	230	10
08026	Yên Kiện	Yen Kien	Xã Yên Kiện	Yen Kien Commune	yen_kien	230	10
08029	Hùng Long	Hung Long	Xã Hùng Long	Hung Long Commune	hung_long	230	10
08032	Vụ Quang	Vu Quang	Xã Vụ Quang	Vu Quang Commune	vu_quang	230	10
08035	Vân Đồn	Van Don	Xã Vân Đồn	Van Don Commune	van_don	230	10
08038	Tiêu Sơn	Tieu Son	Xã Tiêu Sơn	Tieu Son Commune	tieu_son	230	10
08041	Minh Tiến	Minh Tien	Xã Minh Tiến	Minh Tien Commune	minh_tien	230	10
08044	Minh Phú	Minh Phu	Xã Minh Phú	Minh Phu Commune	minh_phu	230	10
08047	Chân Mộng	Chan Mong	Xã Chân Mộng	Chan Mong Commune	chan_mong	230	10
08050	Ca Đình	Ca Dinh	Xã Ca Đình	Ca Dinh Commune	ca_dinh	230	10
08053	Hạ Hoà	Ha Hoa	Thị trấn Hạ Hoà	Ha Hoa Township	ha_hoa	231	9
08056	Đại Phạm	Dai Pham	Xã Đại Phạm	Dai Pham Commune	dai_pham	231	10
08062	Đan Thượng	Dan Thuong	Xã Đan Thượng	Dan Thuong Commune	dan_thuong	231	10
08065	Hà Lương	Ha Luong	Xã Hà Lương	Ha Luong Commune	ha_luong	231	10
08071	Tứ Hiệp	Tu Hiep	Xã Tứ Hiệp	Tu Hiep Commune	tu_hiep	231	10
08080	Hiền Lương	Hien Luong	Xã Hiền Lương	Hien Luong Commune	hien_luong	231	10
08701	Tu Vũ	Tu Vu	Xã Tu Vũ	Tu Vu Commune	tu_vu	239	10
08089	Phương Viên	Phuong Vien	Xã Phương Viên	Phuong Vien Commune	phuong_vien	231	10
08092	Gia Điền	Gia Dien	Xã Gia Điền	Gia Dien Commune	gia_dien	231	10
08095	Ấm Hạ	Am Ha	Xã Ấm Hạ	Am Ha Commune	am_ha	231	10
08104	Hương Xạ	Huong Xa	Xã Hương Xạ	Huong Xa Commune	huong_xa	231	10
08110	Xuân Áng	Xuan Ang	Xã Xuân Áng	Xuan Ang Commune	xuan_ang	231	10
08113	Yên Kỳ	Yen Ky	Xã Yên Kỳ	Yen Ky Commune	yen_ky	231	10
08119	Minh Hạc	Minh Hac	Xã Minh Hạc	Minh Hac Commune	minh_hac	231	10
08122	Lang Sơn	Lang Son	Xã Lang Sơn	Lang Son Commune	lang_son	231	10
08125	Bằng Giã	Bang Gia	Xã Bằng Giã	Bang Gia Commune	bang_gia	231	10
08128	Yên Luật	Yen Luat	Xã Yên Luật	Yen Luat Commune	yen_luat	231	10
08131	Vô Tranh	Vo Tranh	Xã Vô Tranh	Vo Tranh Commune	vo_tranh	231	10
08134	Văn Lang	Van Lang	Xã Văn Lang	Van Lang Commune	van_lang	231	10
08140	Minh Côi	Minh Coi	Xã Minh Côi	Minh Coi Commune	minh_coi	231	10
08143	Vĩnh Chân	Vinh Chan	Xã Vĩnh Chân	Vinh Chan Commune	vinh_chan	231	10
08152	Thanh Ba	Thanh Ba	Thị trấn Thanh Ba	Thanh Ba Township	thanh_ba	232	9
08156	Vân Lĩnh	Van Linh	Xã Vân Lĩnh	Van Linh Commune	van_linh	232	10
08158	Đông Lĩnh	Dong Linh	Xã Đông Lĩnh	Dong Linh Commune	dong_linh	232	10
08161	Đại An	Dai An	Xã Đại An	Dai An Commune	dai_an	232	10
08164	Hanh Cù	Hanh Cu	Xã Hanh Cù	Hanh Cu Commune	hanh_cu	232	10
08170	Đồng Xuân	Dong Xuan	Xã Đồng Xuân	Dong Xuan Commune	dong_xuan	232	10
08173	Quảng Yên	Quang Yen	Xã Quảng Yên	Quang Yen Commune	quang_yen	232	10
08179	Ninh Dân	Ninh Dan	Xã Ninh Dân	Ninh Dan Commune	ninh_dan	232	10
08194	Võ Lao	Vo Lao	Xã Võ Lao	Vo Lao Commune	vo_lao	232	10
08197	Khải Xuân	Khai Xuan	Xã Khải Xuân	Khai Xuan Commune	khai_xuan	232	10
08200	Mạn Lạn	Man Lan	Xã Mạn Lạn	Man Lan Commune	man_lan	232	10
08203	Hoàng Cương	Hoang Cuong	Xã Hoàng Cương	Hoang Cuong Commune	hoang_cuong	232	10
08206	Chí Tiên	Chi Tien	Xã Chí Tiên	Chi Tien Commune	chi_tien	232	10
08209	Đông Thành	Dong Thanh	Xã Đông Thành	Dong Thanh Commune	dong_thanh	232	10
08215	Sơn Cương	Son Cuong	Xã Sơn Cương	Son Cuong Commune	son_cuong	232	10
08218	Thanh Hà	Thanh Ha	Xã Thanh Hà	Thanh Ha Commune	thanh_ha	232	10
08221	Đỗ Sơn	Do Son	Xã Đỗ Sơn	Do Son Commune	do_son	232	10
08224	Đỗ Xuyên	Do Xuyen	Xã Đỗ Xuyên	Do Xuyen Commune	do_xuyen	232	10
08227	Lương Lỗ	Luong Lo	Xã Lương Lỗ	Luong Lo Commune	luong_lo	232	10
08230	Phong Châu	Phong Chau	Thị trấn Phong Châu	Phong Chau Township	phong_chau	233	9
08233	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	233	10
08234	Lệ Mỹ	Le My	Xã Lệ Mỹ	Le My Commune	le_my	233	10
08236	Liên Hoa	Lien Hoa	Xã Liên Hoa	Lien Hoa Commune	lien_hoa	233	10
08239	Trạm Thản	Tram Than	Xã Trạm Thản	Tram Than Commune	tram_than	233	10
08242	Trị Quận	Tri Quan	Xã Trị Quận	Tri Quan Commune	tri_quan	233	10
08245	Trung Giáp	Trung Giap	Xã Trung Giáp	Trung Giap Commune	trung_giap	233	10
08248	Tiên Phú	Tien Phu	Xã Tiên Phú	Tien Phu Commune	tien_phu	233	10
08251	Hạ Giáp	Ha Giap	Xã Hạ Giáp	Ha Giap Commune	ha_giap	233	10
27268	08	08	Phường 08	08 Ward	08	773	8
08254	Bảo Thanh	Bao Thanh	Xã Bảo Thanh	Bao Thanh Commune	bao_thanh	233	10
08257	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	233	10
08260	Gia Thanh	Gia Thanh	Xã Gia Thanh	Gia Thanh Commune	gia_thanh	233	10
08263	Tiên Du	Tien Du	Xã Tiên Du	Tien Du Commune	tien_du	233	10
08266	Phú Nham	Phu Nham	Xã Phú Nham	Phu Nham Commune	phu_nham	233	10
08272	An Đạo	An Dao	Xã An Đạo	An Dao Commune	an_dao	233	10
08275	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	233	10
08278	Phù Ninh	Phu Ninh	Xã Phù Ninh	Phu Ninh Commune	phu_ninh	233	10
08290	Yên Lập	Yen Lap	Thị trấn Yên Lập	Yen Lap Township	yen_lap	234	9
08293	Mỹ Lung	My Lung	Xã Mỹ Lung	My Lung Commune	my_lung	234	10
08296	Mỹ Lương	My Luong	Xã Mỹ Lương	My Luong Commune	my_luong	234	10
08299	Lương Sơn	Luong Son	Xã Lương Sơn	Luong Son Commune	luong_son	234	10
08302	Xuân An	Xuan An	Xã Xuân An	Xuan An Commune	xuan_an	234	10
08305	Xuân Viên	Xuan Vien	Xã Xuân Viên	Xuan Vien Commune	xuan_vien	234	10
08308	Xuân Thủy	Xuan Thuy	Xã Xuân Thủy	Xuan Thuy Commune	xuan_thuy	234	10
08311	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	234	10
08314	Hưng Long	Hung Long	Xã Hưng Long	Hung Long Commune	hung_long	234	10
08317	Nga Hoàng	Nga Hoang	Xã Nga Hoàng	Nga Hoang Commune	nga_hoang	234	10
08320	Đồng Lạc	Dong Lac	Xã Đồng Lạc	Dong Lac Commune	dong_lac	234	10
08323	Thượng Long	Thuong Long	Xã Thượng Long	Thuong Long Commune	thuong_long	234	10
08326	Đồng Thịnh	Dong Thinh	Xã Đồng Thịnh	Dong Thinh Commune	dong_thinh	234	10
08329	Phúc Khánh	Phuc Khanh	Xã Phúc Khánh	Phuc Khanh Commune	phuc_khanh	234	10
08332	Minh Hòa	Minh Hoa	Xã Minh Hòa	Minh Hoa Commune	minh_hoa	234	10
08335	Ngọc Lập	Ngoc Lap	Xã Ngọc Lập	Ngoc Lap Commune	ngoc_lap	234	10
08338	Ngọc Đồng	Ngoc Dong	Xã Ngọc Đồng	Ngoc Dong Commune	ngoc_dong	234	10
08341	Cẩm Khê	Cam Khe	Thị trấn Cẩm Khê	Cam Khe Township	cam_khe	235	9
08344	Tiên Lương	Tien Luong	Xã Tiên Lương	Tien Luong Commune	tien_luong	235	10
08347	Tuy Lộc	Tuy Loc	Xã Tuy Lộc	Tuy Loc Commune	tuy_loc	235	10
08350	Ngô Xá	Ngo Xa	Xã Ngô Xá	Ngo Xa Commune	ngo_xa	235	10
08353	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	235	10
08356	Phượng Vĩ	Phuong Vi	Xã Phượng Vĩ	Phuong Vi Commune	phuong_vi	235	10
08362	Thụy Liễu	Thuy Lieu	Xã Thụy Liễu	Thuy Lieu Commune	thuy_lieu	235	10
08374	Tùng Khê	Tung Khe	Xã Tùng Khê	Tung Khe Commune	tung_khe	235	10
08377	Tam Sơn	Tam Son	Xã Tam Sơn	Tam Son Commune	tam_son	235	10
08380	Văn Bán	Van Ban	Xã Văn Bán	Van Ban Commune	van_ban	235	10
08383	Cấp Dẫn	Cap Dan	Xã Cấp Dẫn	Cap Dan Commune	cap_dan	235	10
08389	Xương Thịnh	Xuong Thinh	Xã Xương Thịnh	Xuong Thinh Commune	xuong_thinh	235	10
08392	Phú Khê	Phu Khe	Xã Phú Khê	Phu Khe Commune	phu_khe	235	10
08395	Sơn Tình	Son Tinh	Xã Sơn Tình	Son Tinh Commune	son_tinh	235	10
08398	Yên Tập	Yen Tap	Xã Yên Tập	Yen Tap Commune	yen_tap	235	10
08401	Hương Lung	Huong Lung	Xã Hương Lung	Huong Lung Commune	huong_lung	235	10
08404	Tạ Xá	Ta Xa	Xã Tạ Xá	Ta Xa Commune	ta_xa	235	10
08407	Phú Lạc	Phu Lac	Xã Phú Lạc	Phu Lac Commune	phu_lac	235	10
08413	Chương Xá	Chuong Xa	Xã Chương Xá	Chuong Xa Commune	chuong_xa	235	10
08416	Hùng Việt	Hung Viet	Xã Hùng Việt	Hung Viet Commune	hung_viet	235	10
08419	Văn Khúc	Van Khuc	Xã Văn Khúc	Van Khuc Commune	van_khuc	235	10
08422	Yên Dưỡng	Yen Duong	Xã Yên Dưỡng	Yen Duong Commune	yen_duong	235	10
08428	Điêu Lương	Dieu Luong	Xã Điêu Lương	Dieu Luong Commune	dieu_luong	235	10
08431	Đồng Lương	Dong Luong	Xã Đồng Lương	Dong Luong Commune	dong_luong	235	10
08434	Hưng Hoá	Hung Hoa	Thị trấn Hưng Hoá	Hung Hoa Township	hung_hoa	236	9
08440	Hiền Quan	Hien Quan	Xã Hiền Quan	Hien Quan Commune	hien_quan	236	10
08443	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	236	10
08446	Thanh Uyên	Thanh Uyen	Xã Thanh Uyên	Thanh Uyen Commune	thanh_uyen	236	10
08461	Lam Sơn	Lam Son	Xã Lam Sơn	Lam Son Commune	lam_son	236	10
08467	Vạn Xuân	Van Xuan	Xã Vạn Xuân	Van Xuan Commune	van_xuan	236	10
08470	Quang Húc	Quang Huc	Xã Quang Húc	Quang Huc Commune	quang_huc	236	10
08473	Hương Nộn	Huong Non	Xã Hương Nộn	Huong Non Commune	huong_non	236	10
08476	Tề Lễ	Te Le	Xã Tề Lễ	Te Le Commune	te_le	236	10
08479	Thọ Văn	Tho Van	Xã Thọ Văn	Tho Van Commune	tho_van	236	10
08482	Dị Nậu	Di Nau	Xã Dị Nậu	Di Nau Commune	di_nau	236	10
08491	Dân Quyền	Dan Quyen	Xã Dân Quyền	Dan Quyen Commune	dan_quyen	236	10
08494	Lâm Thao	Lam Thao	Thị trấn Lâm Thao	Lam Thao Township	lam_thao	237	9
08497	Tiên Kiên	Tien Kien	Xã Tiên Kiên	Tien Kien Commune	tien_kien	237	10
08498	Hùng Sơn	Hung Son	Thị trấn Hùng Sơn	Hung Son Township	hung_son	237	9
08500	Xuân Lũng	Xuan Lung	Xã Xuân Lũng	Xuan Lung Commune	xuan_lung	237	10
08509	Xuân Huy	Xuan Huy	Xã Xuân Huy	Xuan Huy Commune	xuan_huy	237	10
08512	Thạch Sơn	Thach Son	Xã Thạch Sơn	Thach Son Commune	thach_son	237	10
08518	Sơn Vi	Son Vi	Xã Sơn Vi	Son Vi Commune	son_vi	237	10
08521	Phùng Nguyên	Phung Nguyen	Xã Phùng Nguyên	Phung Nguyen Commune	phung_nguyen	237	10
08527	Cao Xá	Cao Xa	Xã Cao Xá	Cao Xa Commune	cao_xa	237	10
08533	Vĩnh Lại	Vinh Lai	Xã Vĩnh Lại	Vinh Lai Commune	vinh_lai	237	10
08536	Tứ Xã	Tu Xa	Xã Tứ Xã	Tu Xa Commune	tu_xa	237	10
08539	Bản Nguyên	Ban Nguyen	Xã Bản Nguyên	Ban Nguyen Commune	ban_nguyen	237	10
08542	Thanh Sơn	Thanh Son	Thị trấn Thanh Sơn	Thanh Son Township	thanh_son	238	9
08563	Sơn Hùng	Son Hung	Xã Sơn Hùng	Son Hung Commune	son_hung	238	10
08572	Địch Quả	Dich Qua	Xã Địch Quả	Dich Qua Commune	dich_qua	238	10
08575	Giáp Lai	Giap Lai	Xã Giáp Lai	Giap Lai Commune	giap_lai	238	10
08581	Thục Luyện	Thuc Luyen	Xã Thục Luyện	Thuc Luyen Commune	thuc_luyen	238	10
08584	Võ Miếu	Vo Mieu	Xã Võ Miếu	Vo Mieu Commune	vo_mieu	238	10
08587	Thạch Khoán	Thach Khoan	Xã Thạch Khoán	Thach Khoan Commune	thach_khoan	238	10
08602	Cự Thắng	Cu Thang	Xã Cự Thắng	Cu Thang Commune	cu_thang	238	10
08605	Tất Thắng	Tat Thang	Xã Tất Thắng	Tat Thang Commune	tat_thang	238	10
08611	Văn Miếu	Van Mieu	Xã Văn Miếu	Van Mieu Commune	van_mieu	238	10
08614	Cự Đồng	Cu Dong	Xã Cự Đồng	Cu Dong Commune	cu_dong	238	10
08623	Thắng Sơn	Thang Son	Xã Thắng Sơn	Thang Son Commune	thang_son	238	10
08629	Tân Minh	Tan Minh	Xã Tân Minh	Tan Minh Commune	tan_minh	238	10
08632	Hương Cần	Huong Can	Xã Hương Cần	Huong Can Commune	huong_can	238	10
08635	Khả Cửu	Kha Cuu	Xã Khả Cửu	Kha Cuu Commune	kha_cuu	238	10
08638	Đông Cửu	Dong Cuu	Xã Đông Cửu	Dong Cuu Commune	dong_cuu	238	10
08641	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	238	10
08644	Yên Lãng	Yen Lang	Xã Yên Lãng	Yen Lang Commune	yen_lang	238	10
08647	Yên Lương	Yen Luong	Xã Yên Lương	Yen Luong Commune	yen_luong	238	10
08650	Thượng Cửu	Thuong Cuu	Xã Thượng Cửu	Thuong Cuu Commune	thuong_cuu	238	10
08653	Lương Nha	Luong Nha	Xã Lương Nha	Luong Nha Commune	luong_nha	238	10
08656	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	238	10
08659	Tinh Nhuệ	Tinh Nhue	Xã Tinh Nhuệ	Tinh Nhue Commune	tinh_nhue	238	10
08662	Đào Xá	Dao Xa	Xã Đào Xá	Dao Xa Commune	dao_xa	239	10
08665	Thạch Đồng	Thach Dong	Xã Thạch Đồng	Thach Dong Commune	thach_dong	239	10
08668	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	239	10
08671	Tân Phương	Tan Phuong	Xã Tân Phương	Tan Phuong Commune	tan_phuong	239	10
08674	Thanh Thủy	Thanh Thuy	Thị trấn Thanh Thủy	Thanh Thuy Township	thanh_thuy	239	9
08677	Sơn Thủy	Son Thuy	Xã Sơn Thủy	Son Thuy Commune	son_thuy	239	10
08680	Bảo Yên	Bao Yen	Xã Bảo Yên	Bao Yen Commune	bao_yen	239	10
08683	Đoan Hạ	Doan Ha	Xã Đoan Hạ	Doan Ha Commune	doan_ha	239	10
08686	Đồng Trung	Dong Trung	Xã Đồng Trung	Dong Trung Commune	dong_trung	239	10
08689	Hoàng Xá	Hoang Xa	Xã Hoàng Xá	Hoang Xa Commune	hoang_xa	239	10
08545	Thu Cúc	Thu Cuc	Xã Thu Cúc	Thu Cuc Commune	thu_cuc	240	10
08548	Thạch Kiệt	Thach Kiet	Xã Thạch Kiệt	Thach Kiet Commune	thach_kiet	240	10
08551	Thu Ngạc	Thu Ngac	Xã Thu Ngạc	Thu Ngac Commune	thu_ngac	240	10
08554	Kiệt Sơn	Kiet Son	Xã Kiệt Sơn	Kiet Son Commune	kiet_son	240	10
08557	Đồng Sơn	Dong Son	Xã Đồng Sơn	Dong Son Commune	dong_son	240	10
08560	Lai Đồng	Lai Dong	Xã Lai Đồng	Lai Dong Commune	lai_dong	240	10
08566	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	240	10
08569	Mỹ Thuận	My Thuan	Xã Mỹ Thuận	My Thuan Commune	my_thuan	240	10
08578	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	240	10
08590	Xuân Đài	Xuan Dai	Xã Xuân Đài	Xuan Dai Commune	xuan_dai	240	10
08593	Minh Đài	Minh Dai	Xã Minh Đài	Minh Dai Commune	minh_dai	240	10
08596	Văn Luông	Van Luong	Xã Văn Luông	Van Luong Commune	van_luong	240	10
08599	Xuân Sơn	Xuan Son	Xã Xuân Sơn	Xuan Son Commune	xuan_son	240	10
08608	Long Cốc	Long Coc	Xã Long Cốc	Long Coc Commune	long_coc	240	10
08617	Kim Thượng	Kim Thuong	Xã Kim Thượng	Kim Thuong Commune	kim_thuong	240	10
08620	Tam Thanh	Tam Thanh	Xã Tam Thanh	Tam Thanh Commune	tam_thanh	240	10
08626	Vinh Tiền	Vinh Tien	Xã Vinh Tiền	Vinh Tien Commune	vinh_tien	240	10
08707	Tích Sơn	Tich Son	Phường Tích Sơn	Tich Son Ward	tich_son	243	8
08710	Liên Bảo	Lien Bao	Phường Liên Bảo	Lien Bao Ward	lien_bao	243	8
08713	Hội Hợp	Hoi Hop	Phường Hội Hợp	Hoi Hop Ward	hoi_hop	243	8
08716	Đống Đa	Dong Da	Phường Đống Đa	Dong Da Ward	dong_da	243	8
08719	Ngô Quyền	Ngo Quyen	Phường Ngô Quyền	Ngo Quyen Ward	ngo_quyen	243	8
08722	Đồng Tâm	Dong Tam	Phường Đồng Tâm	Dong Tam Ward	dong_tam	243	8
08725	Định Trung	Dinh Trung	Xã Định Trung	Dinh Trung Commune	dinh_trung	243	10
08728	Khai Quang	Khai Quang	Phường Khai Quang	Khai Quang Ward	khai_quang	243	8
08731	Thanh Trù	Thanh Tru	Xã Thanh Trù	Thanh Tru Commune	thanh_tru	243	10
08734	Trưng Trắc	Trung Trac	Phường Trưng Trắc	Trung Trac Ward	trung_trac	244	8
08737	Hùng Vương	Hung Vuong	Phường Hùng Vương	Hung Vuong Ward	hung_vuong	244	8
08740	Trưng Nhị	Trung Nhi	Phường Trưng Nhị	Trung Nhi Ward	trung_nhi	244	8
08743	Phúc Thắng	Phuc Thang	Phường Phúc Thắng	Phuc Thang Ward	phuc_thang	244	8
08746	Xuân Hoà	Xuan Hoa	Phường Xuân Hoà	Xuan Hoa Ward	xuan_hoa	244	8
08747	Đồng Xuân	Dong Xuan	Phường Đồng Xuân	Dong Xuan Ward	dong_xuan	244	8
08749	Ngọc Thanh	Ngoc Thanh	Xã Ngọc Thanh	Ngoc Thanh Commune	ngoc_thanh	244	10
08752	Cao Minh	Cao Minh	Xã Cao Minh	Cao Minh Commune	cao_minh	244	10
08755	Nam Viêm	Nam Viem	Phường Nam Viêm	Nam Viem Ward	nam_viem	244	8
08758	Tiền Châu	Tien Chau	Phường Tiền Châu	Tien Chau Ward	tien_chau	244	8
08761	Lập Thạch	Lap Thach	Thị trấn Lập Thạch	Lap Thach Township	lap_thach	246	9
08764	Quang Sơn	Quang Son	Xã Quang Sơn	Quang Son Commune	quang_son	246	10
08767	Ngọc Mỹ	Ngoc My	Xã Ngọc Mỹ	Ngoc My Commune	ngoc_my	246	10
08770	Hợp Lý	Hop Ly	Xã Hợp Lý	Hop Ly Commune	hop_ly	246	10
08785	Bắc Bình	Bac Binh	Xã Bắc Bình	Bac Binh Commune	bac_binh	246	10
08788	Thái Hòa	Thai Hoa	Xã Thái Hòa	Thai Hoa Commune	thai_hoa	246	10
08789	Hoa Sơn	Hoa Son	Thị trấn Hoa Sơn	Hoa Son Township	hoa_son	246	9
08791	Liễn Sơn	Lien Son	Xã Liễn Sơn	Lien Son Commune	lien_son	246	10
08794	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	246	10
08797	Vân Trục	Van Truc	Xã Vân Trục	Van Truc Commune	van_truc	246	10
08812	Liên Hòa	Lien Hoa	Xã Liên Hòa	Lien Hoa Commune	lien_hoa	246	10
08815	Tử Du	Tu Du	Xã Tử Du	Tu Du Commune	tu_du	246	10
08833	Bàn Giản	Ban Gian	Xã Bàn Giản	Ban Gian Commune	ban_gian	246	10
08836	Xuân Lôi	Xuan Loi	Xã Xuân Lôi	Xuan Loi Commune	xuan_loi	246	10
08839	Đồng Ích	Dong Ich	Xã Đồng Ích	Dong Ich Commune	dong_ich	246	10
08842	Tiên Lữ	Tien Lu	Xã Tiên Lữ	Tien Lu Commune	tien_lu	246	10
08845	Văn Quán	Van Quan	Xã Văn Quán	Van Quan Commune	van_quan	246	10
08857	Đình Chu	Dinh Chu	Xã Đình Chu	Dinh Chu Commune	dinh_chu	246	10
08863	Triệu Đề	Trieu De	Xã Triệu Đề	Trieu De Commune	trieu_de	246	10
08866	Sơn Đông	Son Dong	Xã Sơn Đông	Son Dong Commune	son_dong	246	10
08869	Hợp Hòa	Hop Hoa	Thị trấn Hợp Hòa	Hop Hoa Township	hop_hoa	247	9
08872	Hoàng Hoa	Hoang Hoa	Xã Hoàng Hoa	Hoang Hoa Commune	hoang_hoa	247	10
08875	Đồng Tĩnh	Dong Tinh	Xã Đồng Tĩnh	Dong Tinh Commune	dong_tinh	247	10
08878	Kim Long	Kim Long	Xã Kim Long	Kim Long Commune	kim_long	247	10
08881	Hướng Đạo	Huong Dao	Xã Hướng Đạo	Huong Dao Commune	huong_dao	247	10
08884	Đạo Tú	Dao Tu	Xã Đạo Tú	Dao Tu Commune	dao_tu	247	10
08887	An Hòa	An Hoa	Xã An Hòa	An Hoa Commune	an_hoa	247	10
08890	Thanh Vân	Thanh Van	Xã Thanh Vân	Thanh Van Commune	thanh_van	247	10
08893	Duy Phiên	Duy Phien	Xã Duy Phiên	Duy Phien Commune	duy_phien	247	10
08896	Hoàng Đan	Hoang Dan	Xã Hoàng Đan	Hoang Dan Commune	hoang_dan	247	10
08899	Hoàng Lâu	Hoang Lau	Xã Hoàng Lâu	Hoang Lau Commune	hoang_lau	247	10
08902	Vân Hội	Van Hoi	Xã Vân Hội	Van Hoi Commune	van_hoi	247	10
08905	Hợp Thịnh	Hop Thinh	Xã Hợp Thịnh	Hop Thinh Commune	hop_thinh	247	10
27271	10	10	Phường 10	10 Ward	10	773	8
08908	Tam Đảo	Tam Dao	Thị trấn Tam Đảo	Tam Dao Township	tam_dao	248	9
08911	Hợp Châu	Hop Chau	Thị trấn Hợp Châu	Hop Chau Township	hop_chau	248	9
08914	Đạo Trù	Dao Tru	Xã Đạo Trù	Dao Tru Commune	dao_tru	248	10
08917	Yên Dương	Yen Duong	Xã Yên Dương	Yen Duong Commune	yen_duong	248	10
08920	Bồ Lý	Bo Ly	Xã Bồ Lý	Bo Ly Commune	bo_ly	248	10
08923	Đại Đình	Dai Dinh	Thị trấn Đại Đình	Dai Dinh Township	dai_dinh	248	9
08926	Tam Quan	Tam Quan	Xã Tam Quan	Tam Quan Commune	tam_quan	248	10
08929	Hồ Sơn	Ho Son	Xã Hồ Sơn	Ho Son Commune	ho_son	248	10
08932	Minh Quang	Minh Quang	Xã Minh Quang	Minh Quang Commune	minh_quang	248	10
08935	Hương Canh	Huong Canh	Thị trấn Hương Canh	Huong Canh Township	huong_canh	249	9
08936	Gia Khánh	Gia Khanh	Thị trấn Gia Khánh	Gia Khanh Township	gia_khanh	249	9
08938	Trung Mỹ	Trung My	Xã Trung Mỹ	Trung My Commune	trung_my	249	10
08944	Bá Hiến	Ba Hien	Thị trấn Bá Hiến	Ba Hien Township	ba_hien	249	9
08947	Thiện Kế	Thien Ke	Xã Thiện Kế	Thien Ke Commune	thien_ke	249	10
08950	Hương Sơn	Huong Son	Xã Hương Sơn	Huong Son Commune	huong_son	249	10
08953	Tam Hợp	Tam Hop	Xã Tam Hợp	Tam Hop Commune	tam_hop	249	10
08956	Quất Lưu	Quat Luu	Xã Quất Lưu	Quat Luu Commune	quat_luu	249	10
08959	Sơn Lôi	Son Loi	Xã Sơn Lôi	Son Loi Commune	son_loi	249	10
08962	Đạo Đức	Dao Duc	Thị trấn Đạo Đức	Dao Duc Township	dao_duc	249	9
08965	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	249	10
08968	Thanh Lãng	Thanh Lang	Thị trấn Thanh Lãng	Thanh Lang Township	thanh_lang	249	9
08971	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	249	10
08973	Chi Đông	Chi Dong	Thị trấn Chi Đông	Chi Dong Township	chi_dong	250	9
08974	Đại Thịnh	Dai Thinh	Xã Đại Thịnh	Dai Thinh Commune	dai_thinh	250	10
08977	Kim Hoa	Kim Hoa	Xã Kim Hoa	Kim Hoa Commune	kim_hoa	250	10
08980	Thạch Đà	Thach Da	Xã Thạch Đà	Thach Da Commune	thach_da	250	10
08983	Tiến Thắng	Tien Thang	Xã Tiến Thắng	Tien Thang Commune	tien_thang	250	10
08986	Tự Lập	Tu Lap	Xã Tự Lập	Tu Lap Commune	tu_lap	250	10
08989	Quang Minh	Quang Minh	Thị trấn Quang Minh	Quang Minh Township	quang_minh	250	9
08992	Thanh Lâm	Thanh Lam	Xã Thanh Lâm	Thanh Lam Commune	thanh_lam	250	10
08995	Tam Đồng	Tam Dong	Xã Tam Đồng	Tam Dong Commune	tam_dong	250	10
08998	Liên Mạc	Lien Mac	Xã Liên Mạc	Lien Mac Commune	lien_mac	250	10
09001	Vạn Yên	Van Yen	Xã Vạn Yên	Van Yen Commune	van_yen	250	10
09004	Chu Phan	Chu Phan	Xã Chu Phan	Chu Phan Commune	chu_phan	250	10
09007	Tiến Thịnh	Tien Thinh	Xã Tiến Thịnh	Tien Thinh Commune	tien_thinh	250	10
09010	Mê Linh	Me Linh	Xã Mê Linh	Me Linh Commune	me_linh	250	10
09013	Văn Khê	Van Khe	Xã Văn Khê	Van Khe Commune	van_khe	250	10
09016	Hoàng Kim	Hoang Kim	Xã Hoàng Kim	Hoang Kim Commune	hoang_kim	250	10
09019	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	250	10
09022	Tráng Việt	Trang Viet	Xã Tráng Việt	Trang Viet Commune	trang_viet	250	10
09025	Yên Lạc	Yen Lac	Thị trấn Yên Lạc	Yen Lac Township	yen_lac	251	9
09028	Đồng Cương	Dong Cuong	Xã Đồng Cương	Dong Cuong Commune	dong_cuong	251	10
09031	Đồng Văn	Dong Van	Xã Đồng Văn	Dong Van Commune	dong_van	251	10
09034	Bình Định	Binh Dinh	Xã Bình Định	Binh Dinh Commune	binh_dinh	251	10
09037	Trung Nguyên	Trung Nguyen	Xã Trung Nguyên	Trung Nguyen Commune	trung_nguyen	251	10
09040	Tề Lỗ	Te Lo	Xã Tề Lỗ	Te Lo Commune	te_lo	251	10
09043	Tam Hồng	Tam Hong	Xã Tam Hồng	Tam Hong Commune	tam_hong	251	10
09046	Yên Đồng	Yen Dong	Xã Yên Đồng	Yen Dong Commune	yen_dong	251	10
09049	Văn Tiến	Van Tien	Xã Văn Tiến	Van Tien Commune	van_tien	251	10
09052	Nguyệt Đức	Nguyet Duc	Xã Nguyệt Đức	Nguyet Duc Commune	nguyet_duc	251	10
09055	Yên Phương	Yen Phuong	Xã Yên Phương	Yen Phuong Commune	yen_phuong	251	10
09058	Hồng Phương	Hong Phuong	Xã Hồng Phương	Hong Phuong Commune	hong_phuong	251	10
09061	Trung Kiên	Trung Kien	Xã Trung Kiên	Trung Kien Commune	trung_kien	251	10
09064	Liên Châu	Lien Chau	Xã Liên Châu	Lien Chau Commune	lien_chau	251	10
09067	Đại Tự	Dai Tu	Xã Đại Tự	Dai Tu Commune	dai_tu	251	10
09070	Hồng Châu	Hong Chau	Xã Hồng Châu	Hong Chau Commune	hong_chau	251	10
09073	Trung Hà	Trung Ha	Xã Trung Hà	Trung Ha Commune	trung_ha	251	10
09076	Vĩnh Tường	Vinh Tuong	Thị trấn Vĩnh Tường	Vinh Tuong Township	vinh_tuong	252	9
09079	Kim Xá	Kim Xa	Xã Kim Xá	Kim Xa Commune	kim_xa	252	10
09082	Yên Bình	Yen Binh	Xã Yên Bình	Yen Binh Commune	yen_binh	252	10
09085	Chấn Hưng	Chan Hung	Xã Chấn Hưng	Chan Hung Commune	chan_hung	252	10
09088	Nghĩa Hưng	Nghia Hung	Xã Nghĩa Hưng	Nghia Hung Commune	nghia_hung	252	10
09091	Yên Lập	Yen Lap	Xã Yên Lập	Yen Lap Commune	yen_lap	252	10
09094	Việt Xuân	Viet Xuan	Xã Việt Xuân	Viet Xuan Commune	viet_xuan	252	10
09097	Bồ Sao	Bo Sao	Xã Bồ Sao	Bo Sao Commune	bo_sao	252	10
09100	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	252	10
09103	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	252	10
09106	Lũng Hoà	Lung Hoa	Xã Lũng Hoà	Lung Hoa Commune	lung_hoa	252	10
09109	Cao Đại	Cao Dai	Xã Cao Đại	Cao Dai Commune	cao_dai	252	10
09112	Thổ Tang	Tho Tang	Thị trấn Thổ Tang	Tho Tang Township	tho_tang	252	9
09115	Vĩnh Sơn	Vinh Son	Xã Vĩnh Sơn	Vinh Son Commune	vinh_son	252	10
09118	Bình Dương	Binh Duong	Xã Bình Dương	Binh Duong Commune	binh_duong	252	10
09124	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	252	10
09127	Thượng Trưng	Thuong Trung	Xã Thượng Trưng	Thuong Trung Commune	thuong_trung	252	10
09130	Vũ Di	Vu Di	Xã Vũ Di	Vu Di Commune	vu_di	252	10
09133	Lý Nhân	Ly Nhan	Xã Lý Nhân	Ly Nhan Commune	ly_nhan	252	10
09136	Tuân Chính	Tuan Chinh	Xã Tuân Chính	Tuan Chinh Commune	tuan_chinh	252	10
09139	Vân Xuân	Van Xuan	Xã Vân Xuân	Van Xuan Commune	van_xuan	252	10
09142	Tam Phúc	Tam Phuc	Xã Tam Phúc	Tam Phuc Commune	tam_phuc	252	10
09145	Tứ Trưng	Tu Trung	Thị trấn Tứ Trưng	Tu Trung Township	tu_trung	252	9
09148	Ngũ Kiên	Ngu Kien	Xã Ngũ Kiên	Ngu Kien Commune	ngu_kien	252	10
09151	An Tường	An Tuong	Xã An Tường	An Tuong Commune	an_tuong	252	10
09154	Vĩnh Thịnh	Vinh Thinh	Xã Vĩnh Thịnh	Vinh Thinh Commune	vinh_thinh	252	10
09157	Phú Đa	Phu Da	Xã Phú Đa	Phu Da Commune	phu_da	252	10
09160	Vĩnh Ninh	Vinh Ninh	Xã Vĩnh Ninh	Vinh Ninh Commune	vinh_ninh	252	10
08773	Lãng Công	Lang Cong	Xã Lãng Công	Lang Cong Commune	lang_cong	253	10
08776	Quang Yên	Quang Yen	Xã Quang Yên	Quang Yen Commune	quang_yen	253	10
27277	18	18	Phường 18	18 Ward	18	773	8
08779	Bạch Lưu	Bach Luu	Xã Bạch Lưu	Bach Luu Commune	bach_luu	253	10
08782	Hải Lựu	Hai Luu	Xã Hải Lựu	Hai Luu Commune	hai_luu	253	10
08800	Đồng Quế	Dong Que	Xã Đồng Quế	Dong Que Commune	dong_que	253	10
08803	Nhân Đạo	Nhan Dao	Xã Nhân Đạo	Nhan Dao Commune	nhan_dao	253	10
08806	Đôn Nhân	Don Nhan	Xã Đôn Nhân	Don Nhan Commune	don_nhan	253	10
08809	Phương Khoan	Phuong Khoan	Xã Phương Khoan	Phuong Khoan Commune	phuong_khoan	253	10
08818	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	253	10
08821	Nhạo Sơn	Nhao Son	Xã Nhạo Sơn	Nhao Son Commune	nhao_son	253	10
08824	Tam Sơn	Tam Son	Thị trấn Tam Sơn	Tam Son Township	tam_son	253	9
08827	Như Thụy	Nhu Thuy	Xã Như Thụy	Nhu Thuy Commune	nhu_thuy	253	10
08830	Yên Thạch	Yen Thach	Xã Yên Thạch	Yen Thach Commune	yen_thach	253	10
08848	Đồng Thịnh	Dong Thinh	Xã Đồng Thịnh	Dong Thinh Commune	dong_thinh	253	10
08851	Tứ Yên	Tu Yen	Xã Tứ Yên	Tu Yen Commune	tu_yen	253	10
08854	Đức Bác	Duc Bac	Xã Đức Bác	Duc Bac Commune	duc_bac	253	10
08860	Cao Phong	Cao Phong	Xã Cao Phong	Cao Phong Commune	cao_phong	253	10
09163	Vũ Ninh	Vu Ninh	Phường Vũ Ninh	Vu Ninh Ward	vu_ninh	256	8
09166	Đáp Cầu	Dap Cau	Phường Đáp Cầu	Dap Cau Ward	dap_cau	256	8
09169	Thị Cầu	Thi Cau	Phường Thị Cầu	Thi Cau Ward	thi_cau	256	8
09172	Kinh Bắc	Kinh Bac	Phường Kinh Bắc	Kinh Bac Ward	kinh_bac	256	8
09175	Vệ An	Ve An	Phường Vệ An	Ve An Ward	ve_an	256	8
09178	Tiền An	Tien An	Phường Tiền An	Tien An Ward	tien_an	256	8
09181	Đại Phúc	Dai Phuc	Phường Đại Phúc	Dai Phuc Ward	dai_phuc	256	8
09184	Ninh Xá	Ninh Xa	Phường Ninh Xá	Ninh Xa Ward	ninh_xa	256	8
09187	Suối Hoa	Suoi Hoa	Phường Suối Hoa	Suoi Hoa Ward	suoi_hoa	256	8
09190	Võ Cường	Vo Cuong	Phường Võ Cường	Vo Cuong Ward	vo_cuong	256	8
09214	Hòa Long	Hoa Long	Phường Hòa Long	Hoa Long Ward	hoa_long	256	8
09226	Vạn An	Van An	Phường Vạn An	Van An Ward	van_an	256	8
09235	Khúc Xuyên	Khuc Xuyen	Phường Khúc Xuyên	Khuc Xuyen Ward	khuc_xuyen	256	8
09244	Phong Khê	Phong Khe	Phường Phong Khê	Phong Khe Ward	phong_khe	256	8
09256	Kim Chân	Kim Chan	Phường Kim Chân	Kim Chan Ward	kim_chan	256	8
09271	Vân Dương	Van Duong	Phường Vân Dương	Van Duong Ward	van_duong	256	8
09286	Nam Sơn	Nam Son	Phường Nam Sơn	Nam Son Ward	nam_son	256	8
09325	Khắc Niệm	Khac Niem	Phường Khắc Niệm	Khac Niem Ward	khac_niem	256	8
09331	Hạp Lĩnh	Hap Linh	Phường Hạp Lĩnh	Hap Linh Ward	hap_linh	256	8
09193	Chờ	Cho	Thị trấn Chờ	Cho Township	cho	258	9
09196	Dũng Liệt	Dung Liet	Xã Dũng Liệt	Dung Liet Commune	dung_liet	258	10
09199	Tam Đa	Tam Da	Xã Tam Đa	Tam Da Commune	tam_da	258	10
09202	Tam Giang	Tam Giang	Xã Tam Giang	Tam Giang Commune	tam_giang	258	10
09205	Yên Trung	Yen Trung	Xã Yên Trung	Yen Trung Commune	yen_trung	258	10
09208	Thụy Hòa	Thuy Hoa	Xã Thụy Hòa	Thuy Hoa Commune	thuy_hoa	258	10
09211	Hòa Tiến	Hoa Tien	Xã Hòa Tiến	Hoa Tien Commune	hoa_tien	258	10
09217	Đông Tiến	Dong Tien	Xã Đông Tiến	Dong Tien Commune	dong_tien	258	10
09220	Yên Phụ	Yen Phu	Xã Yên Phụ	Yen Phu Commune	yen_phu	258	10
09223	Trung Nghĩa	Trung Nghia	Xã Trung Nghĩa	Trung Nghia Commune	trung_nghia	258	10
09229	Đông Phong	Dong Phong	Xã Đông Phong	Dong Phong Commune	dong_phong	258	10
09232	Long Châu	Long Chau	Xã Long Châu	Long Chau Commune	long_chau	258	10
09238	Văn Môn	Van Mon	Xã Văn Môn	Van Mon Commune	van_mon	258	10
09241	Đông Thọ	Dong Tho	Xã Đông Thọ	Dong Tho Commune	dong_tho	258	10
09247	Phố Mới	Pho Moi	Thị trấn Phố Mới	Pho Moi Township	pho_moi	259	9
09250	Việt Thống	Viet Thong	Xã Việt Thống	Viet Thong Commune	viet_thong	259	10
09253	Đại Xuân	Dai Xuan	Xã Đại Xuân	Dai Xuan Commune	dai_xuan	259	10
09259	Nhân Hòa	Nhan Hoa	Xã Nhân Hòa	Nhan Hoa Commune	nhan_hoa	259	10
09262	Bằng An	Bang An	Xã Bằng An	Bang An Commune	bang_an	259	10
09265	Phương Liễu	Phuong Lieu	Xã Phương Liễu	Phuong Lieu Commune	phuong_lieu	259	10
09268	Quế Tân	Que Tan	Xã Quế Tân	Que Tan Commune	que_tan	259	10
09274	Phù Lương	Phu Luong	Xã Phù Lương	Phu Luong Commune	phu_luong	259	10
09277	Phù Lãng	Phu Lang	Xã Phù Lãng	Phu Lang Commune	phu_lang	259	10
09280	Phượng Mao	Phuong Mao	Xã Phượng Mao	Phuong Mao Commune	phuong_mao	259	10
09283	Việt Hùng	Viet Hung	Xã Việt Hùng	Viet Hung Commune	viet_hung	259	10
09289	Ngọc Xá	Ngoc Xa	Xã Ngọc Xá	Ngoc Xa Commune	ngoc_xa	259	10
09292	Châu Phong	Chau Phong	Xã Châu Phong	Chau Phong Commune	chau_phong	259	10
09295	Bồng Lai	Bong Lai	Xã Bồng Lai	Bong Lai Commune	bong_lai	259	10
09298	Cách Bi	Cach Bi	Xã Cách Bi	Cach Bi Commune	cach_bi	259	10
09301	Đào Viên	Dao Vien	Xã Đào Viên	Dao Vien Commune	dao_vien	259	10
09304	Yên Giả	Yen Gia	Xã Yên Giả	Yen Gia Commune	yen_gia	259	10
09307	Mộ Đạo	Mo Dao	Xã Mộ Đạo	Mo Dao Commune	mo_dao	259	10
09310	Đức Long	Duc Long	Xã Đức Long	Duc Long Commune	duc_long	259	10
09313	Chi Lăng	Chi Lang	Xã Chi Lăng	Chi Lang Commune	chi_lang	259	10
09316	Hán Quảng	Han Quang	Xã Hán Quảng	Han Quang Commune	han_quang	259	10
09319	Lim	Lim	Thị trấn Lim	Lim Township	lim	260	9
09322	Phú Lâm	Phu Lam	Xã Phú Lâm	Phu Lam Commune	phu_lam	260	10
09328	Nội Duệ	Noi Due	Xã Nội Duệ	Noi Due Commune	noi_due	260	10
09334	Liên Bão	Lien Bao	Xã Liên Bão	Lien Bao Commune	lien_bao	260	10
09337	Hiên Vân	Hien Van	Xã Hiên Vân	Hien Van Commune	hien_van	260	10
09340	Hoàn Sơn	Hoan Son	Xã Hoàn Sơn	Hoan Son Commune	hoan_son	260	10
09343	Lạc Vệ	Lac Ve	Xã Lạc Vệ	Lac Ve Commune	lac_ve	260	10
09346	Việt Đoàn	Viet Doan	Xã Việt Đoàn	Viet Doan Commune	viet_doan	260	10
09349	Phật Tích	Phat Tich	Xã Phật Tích	Phat Tich Commune	phat_tich	260	10
09352	Tân Chi	Tan Chi	Xã Tân Chi	Tan Chi Commune	tan_chi	260	10
09355	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	260	10
09358	Tri Phương	Tri Phuong	Xã Tri Phương	Tri Phuong Commune	tri_phuong	260	10
09361	Minh Đạo	Minh Dao	Xã Minh Đạo	Minh Dao Commune	minh_dao	260	10
09364	Cảnh Hưng	Canh Hung	Xã Cảnh Hưng	Canh Hung Commune	canh_hung	260	10
09367	Đông Ngàn	Dong Ngan	Phường Đông Ngàn	Dong Ngan Ward	dong_ngan	261	8
09370	Tam Sơn	Tam Son	Phường Tam Sơn	Tam Son Ward	tam_son	261	8
09373	Hương Mạc	Huong Mac	Phường Hương Mạc	Huong Mac Ward	huong_mac	261	8
09376	Tương Giang	Tuong Giang	Phường Tương Giang	Tuong Giang Ward	tuong_giang	261	8
09379	Phù Khê	Phu Khe	Phường Phù Khê	Phu Khe Ward	phu_khe	261	8
09382	Đồng Kỵ	Dong Ky	Phường Đồng Kỵ	Dong Ky Ward	dong_ky	261	8
09383	Trang Hạ	Trang Ha	Phường Trang Hạ	Trang Ha Ward	trang_ha	261	8
09385	Đồng Nguyên	Dong Nguyen	Phường Đồng Nguyên	Dong Nguyen Ward	dong_nguyen	261	8
09388	Châu Khê	Chau Khe	Phường Châu Khê	Chau Khe Ward	chau_khe	261	8
09391	Tân Hồng	Tan Hong	Phường Tân Hồng	Tan Hong Ward	tan_hong	261	8
09394	Đình Bảng	Dinh Bang	Phường Đình Bảng	Dinh Bang Ward	dinh_bang	261	8
09397	Phù Chẩn	Phu Chan	Phường Phù Chẩn	Phu Chan Ward	phu_chan	261	8
09400	Hồ	Ho	Thị trấn Hồ	Ho Township	ho	262	9
09403	Hoài Thượng	Hoai Thuong	Xã Hoài Thượng	Hoai Thuong Commune	hoai_thuong	262	10
09406	Đại Đồng Thành	Dai Dong Thanh	Xã Đại Đồng Thành	Dai Dong Thanh Commune	dai_dong_thanh	262	10
09409	Mão Điền	Mao Dien	Xã Mão Điền	Mao Dien Commune	mao_dien	262	10
09412	Song Hồ	Song Ho	Xã Song Hồ	Song Ho Commune	song_ho	262	10
09415	Đình Tổ	Dinh To	Xã Đình Tổ	Dinh To Commune	dinh_to	262	10
09418	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	262	10
09421	Trí Quả	Tri Qua	Xã Trí Quả	Tri Qua Commune	tri_qua	262	10
09424	Gia Đông	Gia Dong	Xã Gia Đông	Gia Dong Commune	gia_dong	262	10
09427	Thanh Khương	Thanh Khuong	Xã Thanh Khương	Thanh Khuong Commune	thanh_khuong	262	10
09430	Trạm Lộ	Tram Lo	Xã Trạm Lộ	Tram Lo Commune	tram_lo	262	10
09433	Xuân Lâm	Xuan Lam	Xã Xuân Lâm	Xuan Lam Commune	xuan_lam	262	10
09436	Hà Mãn	Ha Man	Xã Hà Mãn	Ha Man Commune	ha_man	262	10
09439	Ngũ Thái	Ngu Thai	Xã Ngũ Thái	Ngu Thai Commune	ngu_thai	262	10
09442	Nguyệt Đức	Nguyet Duc	Xã Nguyệt Đức	Nguyet Duc Commune	nguyet_duc	262	10
09445	Ninh Xá	Ninh Xa	Xã Ninh Xá	Ninh Xa Commune	ninh_xa	262	10
09448	Nghĩa Đạo	Nghia Dao	Xã Nghĩa Đạo	Nghia Dao Commune	nghia_dao	262	10
09451	Song Liễu	Song Lieu	Xã Song Liễu	Song Lieu Commune	song_lieu	262	10
09454	Gia Bình	Gia Binh	Thị trấn Gia Bình	Gia Binh Township	gia_binh	263	9
09457	Vạn Ninh	Van Ninh	Xã Vạn Ninh	Van Ninh Commune	van_ninh	263	10
09460	Thái Bảo	Thai Bao	Xã Thái Bảo	Thai Bao Commune	thai_bao	263	10
09463	Giang Sơn	Giang Son	Xã Giang Sơn	Giang Son Commune	giang_son	263	10
09466	Cao Đức	Cao Duc	Xã Cao Đức	Cao Duc Commune	cao_duc	263	10
09469	Đại Lai	Dai Lai	Xã Đại Lai	Dai Lai Commune	dai_lai	263	10
09472	Song Giang	Song Giang	Xã Song Giang	Song Giang Commune	song_giang	263	10
09475	Bình Dương	Binh Duong	Xã Bình Dương	Binh Duong Commune	binh_duong	263	10
09478	Lãng Ngâm	Lang Ngam	Xã Lãng Ngâm	Lang Ngam Commune	lang_ngam	263	10
09481	Nhân Thắng	Nhan Thang	Xã Nhân Thắng	Nhan Thang Commune	nhan_thang	263	10
09484	Xuân Lai	Xuan Lai	Xã Xuân Lai	Xuan Lai Commune	xuan_lai	263	10
09487	Đông Cứu	Dong Cuu	Xã Đông Cứu	Dong Cuu Commune	dong_cuu	263	10
09490	Đại Bái	Dai Bai	Xã Đại Bái	Dai Bai Commune	dai_bai	263	10
09493	Quỳnh Phú	Quynh Phu	Xã Quỳnh Phú	Quynh Phu Commune	quynh_phu	263	10
09496	Thứa	Thua	Thị trấn Thứa	Thua Township	thua	264	9
09499	An Thịnh	An Thinh	Xã An Thịnh	An Thinh Commune	an_thinh	264	10
09502	Trung Kênh	Trung Kenh	Xã Trung Kênh	Trung Kenh Commune	trung_kenh	264	10
09505	Phú Hòa	Phu Hoa	Xã Phú Hòa	Phu Hoa Commune	phu_hoa	264	10
09508	Mỹ Hương	My Huong	Xã Mỹ Hương	My Huong Commune	my_huong	264	10
09511	Tân Lãng	Tan Lang	Xã Tân Lãng	Tan Lang Commune	tan_lang	264	10
09514	Quảng Phú	Quang Phu	Xã Quảng Phú	Quang Phu Commune	quang_phu	264	10
09517	Trừng Xá	Trung Xa	Xã Trừng Xá	Trung Xa Commune	trung_xa	264	10
09520	Lai Hạ	Lai Ha	Xã Lai Hạ	Lai Ha Commune	lai_ha	264	10
09523	Trung Chính	Trung Chinh	Xã Trung Chính	Trung Chinh Commune	trung_chinh	264	10
09526	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	264	10
09529	Bình Định	Binh Dinh	Xã Bình Định	Binh Dinh Commune	binh_dinh	264	10
09532	Phú Lương	Phu Luong	Xã Phú Lương	Phu Luong Commune	phu_luong	264	10
09535	Lâm Thao	Lam Thao	Xã Lâm Thao	Lam Thao Commune	lam_thao	264	10
09538	Nguyễn Trãi	Nguyen Trai	Phường Nguyễn Trãi	Nguyen Trai Ward	nguyen_trai	268	8
09541	Mộ Lao	Mo Lao	Phường Mộ Lao	Mo Lao Ward	mo_lao	268	8
09542	Văn Quán	Van Quan	Phường Văn Quán	Van Quan Ward	van_quan	268	8
09544	Vạn Phúc	Van Phuc	Phường Vạn Phúc	Van Phuc Ward	van_phuc	268	8
09547	Yết Kiêu	Yet Kieu	Phường Yết Kiêu	Yet Kieu Ward	yet_kieu	268	8
09550	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	268	8
09551	La Khê	La Khe	Phường La Khê	La Khe Ward	la_khe	268	8
09552	Phú La	Phu La	Phường Phú La	Phu La Ward	phu_la	268	8
09553	Phúc La	Phuc La	Phường Phúc La	Phuc La Ward	phuc_la	268	8
09556	Hà Cầu	Ha Cau	Phường Hà Cầu	Ha Cau Ward	ha_cau	268	8
09562	Yên Nghĩa	Yen Nghia	Phường Yên Nghĩa	Yen Nghia Ward	yen_nghia	268	8
09565	Kiến Hưng	Kien Hung	Phường Kiến Hưng	Kien Hung Ward	kien_hung	268	8
09568	Phú Lãm	Phu Lam	Phường Phú Lãm	Phu Lam Ward	phu_lam	268	8
09571	Phú Lương	Phu Luong	Phường Phú Lương	Phu Luong Ward	phu_luong	268	8
09886	Dương Nội	Duong Noi	Phường Dương Nội	Duong Noi Ward	duong_noi	268	8
10117	Đồng Mai	Dong Mai	Phường Đồng Mai	Dong Mai Ward	dong_mai	268	8
10123	Biên Giang	Bien Giang	Phường Biên Giang	Bien Giang Ward	bien_giang	268	8
09574	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	269	8
09577	Phú Thịnh	Phu Thinh	Phường Phú Thịnh	Phu Thinh Ward	phu_thinh	269	8
09580	Ngô Quyền	Ngo Quyen	Phường Ngô Quyền	Ngo Quyen Ward	ngo_quyen	269	8
09583	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	269	8
09586	Sơn Lộc	Son Loc	Phường Sơn Lộc	Son Loc Ward	son_loc	269	8
09589	Xuân Khanh	Xuan Khanh	Phường Xuân Khanh	Xuan Khanh Ward	xuan_khanh	269	8
09592	Đường Lâm	Duong Lam	Xã Đường Lâm	Duong Lam Commune	duong_lam	269	10
09595	Viên Sơn	Vien Son	Phường Viên Sơn	Vien Son Ward	vien_son	269	8
09598	Xuân Sơn	Xuan Son	Xã Xuân Sơn	Xuan Son Commune	xuan_son	269	10
09601	Trung Hưng	Trung Hung	Phường Trung Hưng	Trung Hung Ward	trung_hung	269	8
09604	Thanh Mỹ	Thanh My	Xã Thanh Mỹ	Thanh My Commune	thanh_my	269	10
09607	Trung Sơn Trầm	Trung Son Tram	Phường Trung Sơn Trầm	Trung Son Tram Ward	trung_son_tram	269	8
09610	Kim Sơn	Kim Son	Xã Kim Sơn	Kim Son Commune	kim_son	269	10
09613	Sơn Đông	Son Dong	Xã Sơn Đông	Son Dong Commune	son_dong	269	10
09616	Cổ Đông	Co Dong	Xã Cổ Đông	Co Dong Commune	co_dong	269	10
09619	Tây Đằng	Tay Dang	Thị trấn Tây Đằng	Tay Dang Township	tay_dang	271	9
09625	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	271	10
09628	Cổ Đô	Co Do	Xã Cổ Đô	Co Do Commune	co_do	271	10
09631	Tản Hồng	Tan Hong	Xã Tản Hồng	Tan Hong Commune	tan_hong	271	10
09634	Vạn Thắng	Van Thang	Xã Vạn Thắng	Van Thang Commune	van_thang	271	10
09637	Châu Sơn	Chau Son	Xã Châu Sơn	Chau Son Commune	chau_son	271	10
09640	Phong Vân	Phong Van	Xã Phong Vân	Phong Van Commune	phong_van	271	10
09643	Phú Đông	Phu Dong	Xã Phú Đông	Phu Dong Commune	phu_dong	271	10
09646	Phú Phương	Phu Phuong	Xã Phú Phương	Phu Phuong Commune	phu_phuong	271	10
09649	Phú Châu	Phu Chau	Xã Phú Châu	Phu Chau Commune	phu_chau	271	10
09652	Thái Hòa	Thai Hoa	Xã Thái Hòa	Thai Hoa Commune	thai_hoa	271	10
09655	Đồng Thái	Dong Thai	Xã Đồng Thái	Dong Thai Commune	dong_thai	271	10
09658	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	271	10
09661	Minh Châu	Minh Chau	Xã Minh Châu	Minh Chau Commune	minh_chau	271	10
09664	Vật Lại	Vat Lai	Xã Vật Lại	Vat Lai Commune	vat_lai	271	10
09667	Chu Minh	Chu Minh	Xã Chu Minh	Chu Minh Commune	chu_minh	271	10
09670	Tòng Bạt	Tong Bat	Xã Tòng Bạt	Tong Bat Commune	tong_bat	271	10
09673	Cẩm Lĩnh	Cam Linh	Xã Cẩm Lĩnh	Cam Linh Commune	cam_linh	271	10
09676	Sơn Đà	Son Da	Xã Sơn Đà	Son Da Commune	son_da	271	10
09679	Đông Quang	Dong Quang	Xã Đông Quang	Dong Quang Commune	dong_quang	271	10
09682	Tiên Phong	Tien Phong	Xã Tiên Phong	Tien Phong Commune	tien_phong	271	10
09685	Thụy An	Thuy An	Xã Thụy An	Thuy An Commune	thuy_an	271	10
09688	Cam Thượng	Cam Thuong	Xã Cam Thượng	Cam Thuong Commune	cam_thuong	271	10
09691	Thuần Mỹ	Thuan My	Xã Thuần Mỹ	Thuan My Commune	thuan_my	271	10
09694	Tản Lĩnh	Tan Linh	Xã Tản Lĩnh	Tan Linh Commune	tan_linh	271	10
09697	Ba Trại	Ba Trai	Xã Ba Trại	Ba Trai Commune	ba_trai	271	10
09700	Minh Quang	Minh Quang	Xã Minh Quang	Minh Quang Commune	minh_quang	271	10
09703	Ba Vì	Ba Vi	Xã Ba Vì	Ba Vi Commune	ba_vi	271	10
09706	Vân Hòa	Van Hoa	Xã Vân Hòa	Van Hoa Commune	van_hoa	271	10
09709	Yên Bài	Yen Bai	Xã Yên Bài	Yen Bai Commune	yen_bai	271	10
09712	Khánh Thượng	Khanh Thuong	Xã Khánh Thượng	Khanh Thuong Commune	khanh_thuong	271	10
09715	Phúc Thọ	Phuc Tho	Thị trấn Phúc Thọ	Phuc Tho Township	phuc_tho	272	9
09718	Vân Hà	Van Ha	Xã Vân Hà	Van Ha Commune	van_ha	272	10
09721	Vân Phúc	Van Phuc	Xã Vân Phúc	Van Phuc Commune	van_phuc	272	10
09724	Vân Nam	Van Nam	Xã Vân Nam	Van Nam Commune	van_nam	272	10
09727	Xuân Đình	Xuan Dinh	Xã Xuân Đình	Xuan Dinh Commune	xuan_dinh	272	10
09733	Sen Phương	Sen Phuong	Xã Sen Phương	Sen Phuong Commune	sen_phuong	272	10
09739	Võng Xuyên	Vong Xuyen	Xã Võng Xuyên	Vong Xuyen Commune	vong_xuyen	272	10
09742	Thọ Lộc	Tho Loc	Xã Thọ Lộc	Tho Loc Commune	tho_loc	272	10
09745	Long Xuyên	Long Xuyen	Xã Long Xuyên	Long Xuyen Commune	long_xuyen	272	10
09748	Thượng Cốc	Thuong Coc	Xã Thượng Cốc	Thuong Coc Commune	thuong_coc	272	10
09751	Hát Môn	Hat Mon	Xã Hát Môn	Hat Mon Commune	hat_mon	272	10
09754	Tích Giang	Tich Giang	Xã Tích Giang	Tich Giang Commune	tich_giang	272	10
09757	Thanh Đa	Thanh Da	Xã Thanh Đa	Thanh Da Commune	thanh_da	272	10
09760	Trạch Mỹ Lộc	Trach My Loc	Xã Trạch Mỹ Lộc	Trach My Loc Commune	trach_my_loc	272	10
09763	Phúc Hòa	Phuc Hoa	Xã Phúc Hòa	Phuc Hoa Commune	phuc_hoa	272	10
09766	Ngọc Tảo	Ngoc Tao	Xã Ngọc Tảo	Ngoc Tao Commune	ngoc_tao	272	10
09769	Phụng Thượng	Phung Thuong	Xã Phụng Thượng	Phung Thuong Commune	phung_thuong	272	10
09772	Tam Thuấn	Tam Thuan	Xã Tam Thuấn	Tam Thuan Commune	tam_thuan	272	10
09775	Tam Hiệp	Tam Hiep	Xã Tam Hiệp	Tam Hiep Commune	tam_hiep	272	10
09778	Hiệp Thuận	Hiep Thuan	Xã Hiệp Thuận	Hiep Thuan Commune	hiep_thuan	272	10
09781	Liên Hiệp	Lien Hiep	Xã Liên Hiệp	Lien Hiep Commune	lien_hiep	272	10
09784	Phùng	Phung	Thị trấn Phùng	Phung Township	phung	273	9
09787	Trung Châu	Trung Chau	Xã Trung Châu	Trung Chau Commune	trung_chau	273	10
09790	Thọ An	Tho An	Xã Thọ An	Tho An Commune	tho_an	273	10
09793	Thọ Xuân	Tho Xuan	Xã Thọ Xuân	Tho Xuan Commune	tho_xuan	273	10
09796	Hồng Hà	Hong Ha	Xã Hồng Hà	Hong Ha Commune	hong_ha	273	10
09799	Liên Hồng	Lien Hong	Xã Liên Hồng	Lien Hong Commune	lien_hong	273	10
09802	Liên Hà	Lien Ha	Xã Liên Hà	Lien Ha Commune	lien_ha	273	10
09805	Hạ Mỗ	Ha Mo	Xã Hạ Mỗ	Ha Mo Commune	ha_mo	273	10
09808	Liên Trung	Lien Trung	Xã Liên Trung	Lien Trung Commune	lien_trung	273	10
09811	Phương Đình	Phuong Dinh	Xã Phương Đình	Phuong Dinh Commune	phuong_dinh	273	10
09814	Thượng Mỗ	Thuong Mo	Xã Thượng Mỗ	Thuong Mo Commune	thuong_mo	273	10
09817	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	273	10
09820	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	273	10
09823	Đan Phượng	Dan Phuong	Xã Đan Phượng	Dan Phuong Commune	dan_phuong	273	10
09826	Đồng Tháp	Dong Thap	Xã Đồng Tháp	Dong Thap Commune	dong_thap	273	10
09829	Song Phượng	Song Phuong	Xã Song Phượng	Song Phuong Commune	song_phuong	273	10
09832	Trạm Trôi	Tram Troi	Thị trấn Trạm Trôi	Tram Troi Township	tram_troi	274	9
09835	Đức Thượng	Duc Thuong	Xã Đức Thượng	Duc Thuong Commune	duc_thuong	274	10
09838	Minh Khai	Minh Khai	Xã Minh Khai	Minh Khai Commune	minh_khai	274	10
09841	Dương Liễu	Duong Lieu	Xã Dương Liễu	Duong Lieu Commune	duong_lieu	274	10
09844	Di Trạch	Di Trach	Xã Di Trạch	Di Trach Commune	di_trach	274	10
09847	Đức Giang	Duc Giang	Xã Đức Giang	Duc Giang Commune	duc_giang	274	10
09850	Cát Quế	Cat Que	Xã Cát Quế	Cat Que Commune	cat_que	274	10
09853	Kim Chung	Kim Chung	Xã Kim Chung	Kim Chung Commune	kim_chung	274	10
09856	Yên Sở	Yen So	Xã Yên Sở	Yen So Commune	yen_so	274	10
09859	Sơn Đồng	Son Dong	Xã Sơn Đồng	Son Dong Commune	son_dong	274	10
09862	Vân Canh	Van Canh	Xã Vân Canh	Van Canh Commune	van_canh	274	10
09865	Đắc Sở	Dac So	Xã Đắc Sở	Dac So Commune	dac_so	274	10
09868	Lại Yên	Lai Yen	Xã Lại Yên	Lai Yen Commune	lai_yen	274	10
09871	Tiền Yên	Tien Yen	Xã Tiền Yên	Tien Yen Commune	tien_yen	274	10
09874	Song Phương	Song Phuong	Xã Song Phương	Song Phuong Commune	song_phuong	274	10
09877	An Khánh	An Khanh	Xã An Khánh	An Khanh Commune	an_khanh	274	10
09880	An Thượng	An Thuong	Xã An Thượng	An Thuong Commune	an_thuong	274	10
09883	Vân Côn	Van Con	Xã Vân Côn	Van Con Commune	van_con	274	10
09889	La Phù	La Phu	Xã La Phù	La Phu Commune	la_phu	274	10
09892	Đông La	Dong La	Xã Đông La	Dong La Commune	dong_la	274	10
04939	Đông Xuân	Dong Xuan	Xã Đông Xuân	Dong Xuan Commune	dong_xuan	275	10
27280	14	14	Phường 14	14 Ward	14	773	8
09895	Quốc Oai	Quoc Oai	Thị trấn Quốc Oai	Quoc Oai Township	quoc_oai	275	9
09898	Sài Sơn	Sai Son	Xã Sài Sơn	Sai Son Commune	sai_son	275	10
09901	Phượng Cách	Phuong Cach	Xã Phượng Cách	Phuong Cach Commune	phuong_cach	275	10
09904	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	275	10
09907	Ngọc Liệp	Ngoc Liep	Xã Ngọc Liệp	Ngoc Liep Commune	ngoc_liep	275	10
09910	Ngọc Mỹ	Ngoc My	Xã Ngọc Mỹ	Ngoc My Commune	ngoc_my	275	10
09913	Liệp Tuyết	Liep Tuyet	Xã Liệp Tuyết	Liep Tuyet Commune	liep_tuyet	275	10
09916	Thạch Thán	Thach Than	Xã Thạch Thán	Thach Than Commune	thach_than	275	10
09919	Đồng Quang	Dong Quang	Xã Đồng Quang	Dong Quang Commune	dong_quang	275	10
09922	Phú Cát	Phu Cat	Xã Phú Cát	Phu Cat Commune	phu_cat	275	10
09925	Tuyết Nghĩa	Tuyet Nghia	Xã Tuyết Nghĩa	Tuyet Nghia Commune	tuyet_nghia	275	10
09928	Nghĩa Hương	Nghia Huong	Xã Nghĩa Hương	Nghia Huong Commune	nghia_huong	275	10
09931	Cộng Hòa	Cong Hoa	Xã Cộng Hòa	Cong Hoa Commune	cong_hoa	275	10
09934	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	275	10
09937	Đại Thành	Dai Thanh	Xã Đại Thành	Dai Thanh Commune	dai_thanh	275	10
09940	Phú Mãn	Phu Man	Xã Phú Mãn	Phu Man Commune	phu_man	275	10
09943	Cấn Hữu	Can Huu	Xã Cấn Hữu	Can Huu Commune	can_huu	275	10
09946	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	275	10
09949	Hòa Thạch	Hoa Thach	Xã Hòa Thạch	Hoa Thach Commune	hoa_thach	275	10
09952	Đông Yên	Dong Yen	Xã Đông Yên	Dong Yen Commune	dong_yen	275	10
04927	Yên Trung	Yen Trung	Xã Yên Trung	Yen Trung Commune	yen_trung	276	10
04930	Yên Bình	Yen Binh	Xã Yên Bình	Yen Binh Commune	yen_binh	276	10
04936	Tiến Xuân	Tien Xuan	Xã Tiến Xuân	Tien Xuan Commune	tien_xuan	276	10
10402	Hòa Lâm	Hoa Lam	Xã Hòa Lâm	Hoa Lam Commune	hoa_lam	281	10
09955	Liên Quan	Lien Quan	Thị trấn Liên Quan	Lien Quan Township	lien_quan	276	9
09958	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	276	10
09961	Cẩm Yên	Cam Yen	Xã Cẩm Yên	Cam Yen Commune	cam_yen	276	10
09964	Lại Thượng	Lai Thuong	Xã Lại Thượng	Lai Thuong Commune	lai_thuong	276	10
09967	Phú Kim	Phu Kim	Xã Phú Kim	Phu Kim Commune	phu_kim	276	10
09970	Hương Ngải	Huong Ngai	Xã Hương Ngải	Huong Ngai Commune	huong_ngai	276	10
09973	Canh Nậu	Canh Nau	Xã Canh Nậu	Canh Nau Commune	canh_nau	276	10
09976	Kim Quan	Kim Quan	Xã Kim Quan	Kim Quan Commune	kim_quan	276	10
09979	Dị Nậu	Di Nau	Xã Dị Nậu	Di Nau Commune	di_nau	276	10
09982	Bình Yên	Binh Yen	Xã Bình Yên	Binh Yen Commune	binh_yen	276	10
09985	Chàng Sơn	Chang Son	Xã Chàng Sơn	Chang Son Commune	chang_son	276	10
09988	Thạch Hoà	Thach Hoa	Xã Thạch Hoà	Thach Hoa Commune	thach_hoa	276	10
09991	Cần Kiệm	Can Kiem	Xã Cần Kiệm	Can Kiem Commune	can_kiem	276	10
09994	Hữu Bằng	Huu Bang	Xã Hữu Bằng	Huu Bang Commune	huu_bang	276	10
09997	Phùng Xá	Phung Xa	Xã Phùng Xá	Phung Xa Commune	phung_xa	276	10
10000	Tân Xã	Tan Xa	Xã Tân Xã	Tan Xa Commune	tan_xa	276	10
10003	Thạch Xá	Thach Xa	Xã Thạch Xá	Thach Xa Commune	thach_xa	276	10
10006	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	276	10
10009	Hạ Bằng	Ha Bang	Xã Hạ Bằng	Ha Bang Commune	ha_bang	276	10
10012	Đồng Trúc	Dong Truc	Xã Đồng Trúc	Dong Truc Commune	dong_truc	276	10
10015	Chúc Sơn	Chuc Son	Thị trấn Chúc Sơn	Chuc Son Township	chuc_son	277	9
10018	Xuân Mai	Xuan Mai	Thị trấn Xuân Mai	Xuan Mai Township	xuan_mai	277	9
10021	Phụng Châu	Phung Chau	Xã Phụng Châu	Phung Chau Commune	phung_chau	277	10
10024	Tiên Phương	Tien Phuong	Xã Tiên Phương	Tien Phuong Commune	tien_phuong	277	10
10027	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	277	10
10030	Đông Phương Yên	Dong Phuong Yen	Xã Đông Phương Yên	Dong Phuong Yen Commune	dong_phuong_yen	277	10
10033	Phú Nghĩa	Phu Nghia	Xã Phú Nghĩa	Phu Nghia Commune	phu_nghia	277	10
10039	Trường Yên	Truong Yen	Xã Trường Yên	Truong Yen Commune	truong_yen	277	10
10042	Ngọc Hòa	Ngoc Hoa	Xã Ngọc Hòa	Ngoc Hoa Commune	ngoc_hoa	277	10
10045	Thủy Xuân Tiên	Thuy Xuan Tien	Xã Thủy Xuân Tiên	Thuy Xuan Tien Commune	thuy_xuan_tien	277	10
10048	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	277	10
10051	Trung Hòa	Trung Hoa	Xã Trung Hòa	Trung Hoa Commune	trung_hoa	277	10
10054	Đại Yên	Dai Yen	Xã Đại Yên	Dai Yen Commune	dai_yen	277	10
10057	Thụy Hương	Thuy Huong	Xã Thụy Hương	Thuy Huong Commune	thuy_huong	277	10
10060	Tốt Động	Tot Dong	Xã Tốt Động	Tot Dong Commune	tot_dong	277	10
10063	Lam Điền	Lam Dien	Xã Lam Điền	Lam Dien Commune	lam_dien	277	10
10066	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	277	10
10069	Nam Phương Tiến	Nam Phuong Tien	Xã Nam Phương Tiến	Nam Phuong Tien Commune	nam_phuong_tien	277	10
10072	Hợp Đồng	Hop Dong	Xã Hợp Đồng	Hop Dong Commune	hop_dong	277	10
10075	Hoàng Văn Thụ	Hoang Van Thu	Xã Hoàng Văn Thụ	Hoang Van Thu Commune	hoang_van_thu	277	10
10078	Hoàng Diệu	Hoang Dieu	Xã Hoàng Diệu	Hoang Dieu Commune	hoang_dieu	277	10
10081	Hữu Văn	Huu Van	Xã Hữu Văn	Huu Van Commune	huu_van	277	10
10084	Quảng Bị	Quang Bi	Xã Quảng Bị	Quang Bi Commune	quang_bi	277	10
10087	Mỹ Lương	My Luong	Xã Mỹ Lương	My Luong Commune	my_luong	277	10
10090	Thượng Vực	Thuong Vuc	Xã Thượng Vực	Thuong Vuc Commune	thuong_vuc	277	10
10093	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	277	10
10096	Đồng Phú	Dong Phu	Xã Đồng Phú	Dong Phu Commune	dong_phu	277	10
10099	Trần Phú	Tran Phu	Xã Trần Phú	Tran Phu Commune	tran_phu	277	10
10102	Văn Võ	Van Vo	Xã Văn Võ	Van Vo Commune	van_vo	277	10
10105	Đồng Lạc	Dong Lac	Xã Đồng Lạc	Dong Lac Commune	dong_lac	277	10
10108	Hòa Chính	Hoa Chinh	Xã Hòa Chính	Hoa Chinh Commune	hoa_chinh	277	10
10111	Phú Nam An	Phu Nam An	Xã Phú Nam An	Phu Nam An Commune	phu_nam_an	277	10
10114	Kim Bài	Kim Bai	Thị trấn Kim Bài	Kim Bai Township	kim_bai	278	9
10120	Cự Khê	Cu Khe	Xã Cự Khê	Cu Khe Commune	cu_khe	278	10
10126	Bích Hòa	Bich Hoa	Xã Bích Hòa	Bich Hoa Commune	bich_hoa	278	10
10129	Mỹ Hưng	My Hung	Xã Mỹ Hưng	My Hung Commune	my_hung	278	10
10132	Cao Viên	Cao Vien	Xã Cao Viên	Cao Vien Commune	cao_vien	278	10
10135	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	278	10
10138	Tam Hưng	Tam Hung	Xã Tam Hưng	Tam Hung Commune	tam_hung	278	10
10141	Thanh Cao	Thanh Cao	Xã Thanh Cao	Thanh Cao Commune	thanh_cao	278	10
10144	Thanh Thùy	Thanh Thuy	Xã Thanh Thùy	Thanh Thuy Commune	thanh_thuy	278	10
10147	Thanh Mai	Thanh Mai	Xã Thanh Mai	Thanh Mai Commune	thanh_mai	278	10
10150	Thanh Văn	Thanh Van	Xã Thanh Văn	Thanh Van Commune	thanh_van	278	10
27283	04	04	Phường 04	04 Ward	04	773	8
10153	Đỗ Động	Do Dong	Xã Đỗ Động	Do Dong Commune	do_dong	278	10
10156	Kim An	Kim An	Xã Kim An	Kim An Commune	kim_an	278	10
10159	Kim Thư	Kim Thu	Xã Kim Thư	Kim Thu Commune	kim_thu	278	10
10162	Phương Trung	Phuong Trung	Xã Phương Trung	Phuong Trung Commune	phuong_trung	278	10
10165	Tân Ước	Tan Uoc	Xã Tân Ước	Tan Uoc Commune	tan_uoc	278	10
10168	Dân Hòa	Dan Hoa	Xã Dân Hòa	Dan Hoa Commune	dan_hoa	278	10
10171	Liên Châu	Lien Chau	Xã Liên Châu	Lien Chau Commune	lien_chau	278	10
10174	Cao Dương	Cao Duong	Xã Cao Dương	Cao Duong Commune	cao_duong	278	10
10177	Xuân Dương	Xuan Duong	Xã Xuân Dương	Xuan Duong Commune	xuan_duong	278	10
10180	Hồng Dương	Hong Duong	Xã Hồng Dương	Hong Duong Commune	hong_duong	278	10
10183	Thường Tín	Thuong Tin	Thị trấn Thường Tín	Thuong Tin Township	thuong_tin	279	9
10186	Ninh Sở	Ninh So	Xã Ninh Sở	Ninh So Commune	ninh_so	279	10
10189	Nhị Khê	Nhi Khe	Xã Nhị Khê	Nhi Khe Commune	nhi_khe	279	10
10192	Duyên Thái	Duyen Thai	Xã Duyên Thái	Duyen Thai Commune	duyen_thai	279	10
10195	Khánh Hà	Khanh Ha	Xã Khánh Hà	Khanh Ha Commune	khanh_ha	279	10
10198	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	279	10
10201	Văn Bình	Van Binh	Xã Văn Bình	Van Binh Commune	van_binh	279	10
10204	Hiền Giang	Hien Giang	Xã Hiền Giang	Hien Giang Commune	hien_giang	279	10
10207	Hồng Vân	Hong Van	Xã Hồng Vân	Hong Van Commune	hong_van	279	10
10210	Vân Tảo	Van Tao	Xã Vân Tảo	Van Tao Commune	van_tao	279	10
10213	Liên Phương	Lien Phuong	Xã Liên Phương	Lien Phuong Commune	lien_phuong	279	10
10216	Văn Phú	Van Phu	Xã Văn Phú	Van Phu Commune	van_phu	279	10
10219	Tự Nhiên	Tu Nhien	Xã Tự Nhiên	Tu Nhien Commune	tu_nhien	279	10
10222	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	279	10
10225	Hà Hồi	Ha Hoi	Xã Hà Hồi	Ha Hoi Commune	ha_hoi	279	10
10228	Thư Phú	Thu Phu	Xã Thư Phú	Thu Phu Commune	thu_phu	279	10
10231	Nguyễn Trãi	Nguyen Trai	Xã Nguyễn Trãi	Nguyen Trai Commune	nguyen_trai	279	10
10234	Quất Động	Quat Dong	Xã Quất Động	Quat Dong Commune	quat_dong	279	10
10237	Chương Dương	Chuong Duong	Xã Chương Dương	Chuong Duong Commune	chuong_duong	279	10
10240	Tân Minh	Tan Minh	Xã Tân Minh	Tan Minh Commune	tan_minh	279	10
10243	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	279	10
10246	Thắng Lợi	Thang Loi	Xã Thắng Lợi	Thang Loi Commune	thang_loi	279	10
10249	Dũng Tiến	Dung Tien	Xã Dũng Tiến	Dung Tien Commune	dung_tien	279	10
10252	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	279	10
10255	Nghiêm Xuyên	Nghiem Xuyen	Xã Nghiêm Xuyên	Nghiem Xuyen Commune	nghiem_xuyen	279	10
10258	Tô Hiệu	To Hieu	Xã Tô Hiệu	To Hieu Commune	to_hieu	279	10
10261	Văn Tự	Van Tu	Xã Văn Tự	Van Tu Commune	van_tu	279	10
10264	Vạn Điểm	Van Diem	Xã Vạn Điểm	Van Diem Commune	van_diem	279	10
10267	Minh Cường	Minh Cuong	Xã Minh Cường	Minh Cuong Commune	minh_cuong	279	10
10270	Phú Minh	Phu Minh	Thị trấn Phú Minh	Phu Minh Township	phu_minh	280	9
10273	Phú Xuyên	Phu Xuyen	Thị trấn Phú Xuyên	Phu Xuyen Township	phu_xuyen	280	9
10276	Hồng Minh	Hong Minh	Xã Hồng Minh	Hong Minh Commune	hong_minh	280	10
10279	Phượng Dực	Phuong Duc	Xã Phượng Dực	Phuong Duc Commune	phuong_duc	280	10
10282	Nam Tiến	Nam Tien	Xã Nam Tiến	Nam Tien Commune	nam_tien	280	10
10288	Tri Trung	Tri Trung	Xã Tri Trung	Tri Trung Commune	tri_trung	280	10
10291	Đại Thắng	Dai Thang	Xã Đại Thắng	Dai Thang Commune	dai_thang	280	10
10294	Phú Túc	Phu Tuc	Xã Phú Túc	Phu Tuc Commune	phu_tuc	280	10
10297	Văn Hoàng	Van Hoang	Xã Văn Hoàng	Van Hoang Commune	van_hoang	280	10
10300	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	280	10
10303	Hoàng Long	Hoang Long	Xã Hoàng Long	Hoang Long Commune	hoang_long	280	10
10306	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	280	10
10309	Nam Phong	Nam Phong	Xã Nam Phong	Nam Phong Commune	nam_phong	280	10
10312	Nam Triều	Nam Trieu	Xã Nam Triều	Nam Trieu Commune	nam_trieu	280	10
10315	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	280	10
10318	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	280	10
10321	Chuyên Mỹ	Chuyen My	Xã Chuyên Mỹ	Chuyen My Commune	chuyen_my	280	10
10324	Khai Thái	Khai Thai	Xã Khai Thái	Khai Thai Commune	khai_thai	280	10
10327	Phúc Tiến	Phuc Tien	Xã Phúc Tiến	Phuc Tien Commune	phuc_tien	280	10
10330	Vân Từ	Van Tu	Xã Vân Từ	Van Tu Commune	van_tu	280	10
10333	Tri Thủy	Tri Thuy	Xã Tri Thủy	Tri Thuy Commune	tri_thuy	280	10
10336	Đại Xuyên	Dai Xuyen	Xã Đại Xuyên	Dai Xuyen Commune	dai_xuyen	280	10
10339	Phú Yên	Phu Yen	Xã Phú Yên	Phu Yen Commune	phu_yen	280	10
10342	Bạch Hạ	Bach Ha	Xã Bạch Hạ	Bach Ha Commune	bach_ha	280	10
10345	Quang Lãng	Quang Lang	Xã Quang Lãng	Quang Lang Commune	quang_lang	280	10
10348	Châu Can	Chau Can	Xã Châu Can	Chau Can Commune	chau_can	280	10
10351	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	280	10
10354	Vân Đình	Van Dinh	Thị trấn Vân Đình	Van Dinh Township	van_dinh	281	9
10357	Viên An	Vien An	Xã Viên An	Vien An Commune	vien_an	281	10
10360	Viên Nội	Vien Noi	Xã Viên Nội	Vien Noi Commune	vien_noi	281	10
10363	Hoa Sơn	Hoa Son	Xã Hoa Sơn	Hoa Son Commune	hoa_son	281	10
10366	Quảng Phú Cầu	Quang Phu Cau	Xã Quảng Phú Cầu	Quang Phu Cau Commune	quang_phu_cau	281	10
10369	Trường Thịnh	Truong Thinh	Xã Trường Thịnh	Truong Thinh Commune	truong_thinh	281	10
10372	Cao Thành	Cao Thanh	Xã Cao Thành	Cao Thanh Commune	cao_thanh	281	10
10375	Liên Bạt	Lien Bat	Xã Liên Bạt	Lien Bat Commune	lien_bat	281	10
10378	Sơn Công	Son Cong	Xã Sơn Công	Son Cong Commune	son_cong	281	10
10381	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	281	10
10384	Phương Tú	Phuong Tu	Xã Phương Tú	Phuong Tu Commune	phuong_tu	281	10
10387	Trung Tú	Trung Tu	Xã Trung Tú	Trung Tu Commune	trung_tu	281	10
10390	Đồng Tân	Dong Tan	Xã Đồng Tân	Dong Tan Commune	dong_tan	281	10
10393	Tảo Dương Văn	Tao Duong Van	Xã Tảo Dương Văn	Tao Duong Van Commune	tao_duong_van	281	10
10396	Vạn Thái	Van Thai	Xã Vạn Thái	Van Thai Commune	van_thai	281	10
10399	Minh Đức	Minh Duc	Xã Minh Đức	Minh Duc Commune	minh_duc	281	10
10405	Hòa Xá	Hoa Xa	Xã Hòa Xá	Hoa Xa Commune	hoa_xa	281	10
10408	Trầm Lộng	Tram Long	Xã Trầm Lộng	Tram Long Commune	tram_long	281	10
10411	Kim Đường	Kim Duong	Xã Kim Đường	Kim Duong Commune	kim_duong	281	10
10414	Hòa Nam	Hoa Nam	Xã Hòa Nam	Hoa Nam Commune	hoa_nam	281	10
10417	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	281	10
10420	Đội Bình	Doi Binh	Xã Đội Bình	Doi Binh Commune	doi_binh	281	10
10423	Đại Hùng	Dai Hung	Xã Đại Hùng	Dai Hung Commune	dai_hung	281	10
10426	Đông Lỗ	Dong Lo	Xã Đông Lỗ	Dong Lo Commune	dong_lo	281	10
10429	Phù Lưu	Phu Luu	Xã Phù Lưu	Phu Luu Commune	phu_luu	281	10
10432	Đại Cường	Dai Cuong	Xã Đại Cường	Dai Cuong Commune	dai_cuong	281	10
10435	Lưu Hoàng	Luu Hoang	Xã Lưu Hoàng	Luu Hoang Commune	luu_hoang	281	10
10438	Hồng Quang	Hong Quang	Xã Hồng Quang	Hong Quang Commune	hong_quang	281	10
10441	Đại Nghĩa	Dai Nghia	Thị trấn Đại Nghĩa	Dai Nghia Township	dai_nghia	282	9
10444	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	282	10
10447	Thượng Lâm	Thuong Lam	Xã Thượng Lâm	Thuong Lam Commune	thuong_lam	282	10
10450	Tuy Lai	Tuy Lai	Xã Tuy Lai	Tuy Lai Commune	tuy_lai	282	10
10453	Phúc Lâm	Phuc Lam	Xã Phúc Lâm	Phuc Lam Commune	phuc_lam	282	10
10456	Mỹ Thành	My Thanh	Xã Mỹ Thành	My Thanh Commune	my_thanh	282	10
10459	Bột Xuyên	Bot Xuyen	Xã Bột Xuyên	Bot Xuyen Commune	bot_xuyen	282	10
10462	An Mỹ	An My	Xã An Mỹ	An My Commune	an_my	282	10
10465	Hồng Sơn	Hong Son	Xã Hồng Sơn	Hong Son Commune	hong_son	282	10
10468	Lê Thanh	Le Thanh	Xã Lê Thanh	Le Thanh Commune	le_thanh	282	10
10471	Xuy Xá	Xuy Xa	Xã Xuy Xá	Xuy Xa Commune	xuy_xa	282	10
10474	Phùng Xá	Phung Xa	Xã Phùng Xá	Phung Xa Commune	phung_xa	282	10
10477	Phù Lưu Tế	Phu Luu Te	Xã Phù Lưu Tế	Phu Luu Te Commune	phu_luu_te	282	10
10480	Đại Hưng	Dai Hung	Xã Đại Hưng	Dai Hung Commune	dai_hung	282	10
10483	Vạn Kim	Van Kim	Xã Vạn Kim	Van Kim Commune	van_kim	282	10
10486	Đốc Tín	Doc Tin	Xã Đốc Tín	Doc Tin Commune	doc_tin	282	10
10489	Hương Sơn	Huong Son	Xã Hương Sơn	Huong Son Commune	huong_son	282	10
10492	Hùng Tiến	Hung Tien	Xã Hùng Tiến	Hung Tien Commune	hung_tien	282	10
10495	An Tiến	An Tien	Xã An Tiến	An Tien Commune	an_tien	282	10
10498	Hợp Tiến	Hop Tien	Xã Hợp Tiến	Hop Tien Commune	hop_tien	282	10
10501	Hợp Thanh	Hop Thanh	Xã Hợp Thanh	Hop Thanh Commune	hop_thanh	282	10
10504	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	282	10
10507	Cẩm Thượng	Cam Thuong	Phường Cẩm Thượng	Cam Thuong Ward	cam_thuong	288	8
10510	Bình Hàn	Binh Han	Phường Bình Hàn	Binh Han Ward	binh_han	288	8
10513	Ngọc Châu	Ngoc Chau	Phường Ngọc Châu	Ngoc Chau Ward	ngoc_chau	288	8
10514	Nhị Châu	Nhi Chau	Phường Nhị Châu	Nhi Chau Ward	nhi_chau	288	8
10516	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	288	8
10519	Nguyễn Trãi	Nguyen Trai	Phường Nguyễn Trãi	Nguyen Trai Ward	nguyen_trai	288	8
10522	Phạm Ngũ Lão	Pham Ngu Lao	Phường Phạm Ngũ Lão	Pham Ngu Lao Ward	pham_ngu_lao	288	8
10525	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	288	8
10528	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	288	8
10531	Thanh Bình	Thanh Binh	Phường Thanh Bình	Thanh Binh Ward	thanh_binh	288	8
10532	Tân Bình	Tan Binh	Phường Tân Bình	Tan Binh Ward	tan_binh	288	8
10534	Lê Thanh Nghị	Le Thanh Nghi	Phường Lê Thanh Nghị	Le Thanh Nghi Ward	le_thanh_nghi	288	8
10537	Hải Tân	Hai Tan	Phường Hải Tân	Hai Tan Ward	hai_tan	288	8
10540	Tứ Minh	Tu Minh	Phường Tứ Minh	Tu Minh Ward	tu_minh	288	8
10543	Việt Hoà	Viet Hoa	Phường Việt Hoà	Viet Hoa Ward	viet_hoa	288	8
10660	Ái Quốc	Ai Quoc	Phường Ái Quốc	Ai Quoc Ward	ai_quoc	288	8
10663	An Thượng	An Thuong	Xã An Thượng	An Thuong Commune	an_thuong	288	10
10672	Nam Đồng	Nam Dong	Phường Nam Đồng	Nam Dong Ward	nam_dong	288	8
10822	Quyết Thắng	Quyet Thang	Xã Quyết Thắng	Quyet Thang Commune	quyet_thang	288	10
10837	Tiền Tiến	Tien Tien	Xã Tiền Tiến	Tien Tien Commune	tien_tien	288	10
11002	Thạch Khôi	Thach Khoi	Phường Thạch Khôi	Thach Khoi Ward	thach_khoi	288	8
11005	Liên Hồng	Lien Hong	Xã Liên Hồng	Lien Hong Commune	lien_hong	288	10
11011	Tân Hưng	Tan Hung	Phường Tân Hưng	Tan Hung Ward	tan_hung	288	8
11017	Gia Xuyên	Gia Xuyen	Xã Gia Xuyên	Gia Xuyen Commune	gia_xuyen	288	10
11077	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	288	10
10546	Phả Lại	Pha Lai	Phường Phả Lại	Pha Lai Ward	pha_lai	290	8
10549	Sao Đỏ	Sao Do	Phường Sao Đỏ	Sao Do Ward	sao_do	290	8
10552	Bến Tắm	Ben Tam	Phường Bến Tắm	Ben Tam Ward	ben_tam	290	8
10555	Hoàng Hoa Thám	Hoang Hoa Tham	Xã Hoàng Hoa Thám	Hoang Hoa Tham Commune	hoang_hoa_tham	290	10
10558	Bắc An	Bac An	Xã Bắc An	Bac An Commune	bac_an	290	10
10561	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	290	10
10564	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	290	10
10567	Hoàng Tiến	Hoang Tien	Phường Hoàng Tiến	Hoang Tien Ward	hoang_tien	290	8
10570	Cộng Hoà	Cong Hoa	Phường Cộng Hoà	Cong Hoa Ward	cong_hoa	290	8
10573	Hoàng Tân	Hoang Tan	Phường Hoàng Tân	Hoang Tan Ward	hoang_tan	290	8
10576	Cổ Thành	Co Thanh	Phường Cổ Thành	Co Thanh Ward	co_thanh	290	8
10579	Văn An	Van An	Phường Văn An	Van An Ward	van_an	290	8
10582	Chí Minh	Chi Minh	Phường Chí Minh	Chi Minh Ward	chi_minh	290	8
10585	Văn Đức	Van Duc	Phường Văn Đức	Van Duc Ward	van_duc	290	8
10588	Thái Học	Thai Hoc	Phường Thái Học	Thai Hoc Ward	thai_hoc	290	8
10591	Nhân Huệ	Nhan Hue	Xã Nhân Huệ	Nhan Hue Commune	nhan_hue	290	10
10594	An Lạc	An Lac	Phường An Lạc	An Lac Ward	an_lac	290	8
10600	Đồng Lạc	Dong Lac	Phường Đồng Lạc	Dong Lac Ward	dong_lac	290	8
10603	Tân Dân	Tan Dan	Phường Tân Dân	Tan Dan Ward	tan_dan	290	8
10606	Nam Sách	Nam Sach	Thị trấn Nam Sách	Nam Sach Township	nam_sach	291	9
10609	Nam Hưng	Nam Hung	Xã Nam Hưng	Nam Hung Commune	nam_hung	291	10
10612	Nam Tân	Nam Tan	Xã Nam Tân	Nam Tan Commune	nam_tan	291	10
10615	Hợp Tiến	Hop Tien	Xã Hợp Tiến	Hop Tien Commune	hop_tien	291	10
10618	Hiệp Cát	Hiep Cat	Xã Hiệp Cát	Hiep Cat Commune	hiep_cat	291	10
10621	Thanh Quang	Thanh Quang	Xã Thanh Quang	Thanh Quang Commune	thanh_quang	291	10
10624	Quốc Tuấn	Quoc Tuan	Xã Quốc Tuấn	Quoc Tuan Commune	quoc_tuan	291	10
10627	Nam Chính	Nam Chinh	Xã Nam Chính	Nam Chinh Commune	nam_chinh	291	10
10630	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	291	10
10633	Nam Trung	Nam Trung	Xã Nam Trung	Nam Trung Commune	nam_trung	291	10
10636	An Sơn	An Son	Xã An Sơn	An Son Commune	an_son	291	10
10639	Cộng Hòa	Cong Hoa	Xã Cộng Hòa	Cong Hoa Commune	cong_hoa	291	10
10642	Thái Tân	Thai Tan	Xã Thái Tân	Thai Tan Commune	thai_tan	291	10
10645	An Lâm	An Lam	Xã An Lâm	An Lam Commune	an_lam	291	10
10648	Phú Điền	Phu Dien	Xã Phú Điền	Phu Dien Commune	phu_dien	291	10
10651	Nam Hồng	Nam Hong	Xã Nam Hồng	Nam Hong Commune	nam_hong	291	10
10654	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	291	10
10657	Đồng Lạc	Dong Lac	Xã Đồng Lạc	Dong Lac Commune	dong_lac	291	10
10666	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	291	10
10675	An Lưu	An Luu	Phường An Lưu	An Luu Ward	an_luu	292	8
10678	Bạch Đằng	Bach Dang	Xã Bạch Đằng	Bach Dang Commune	bach_dang	292	10
10681	Thất Hùng	That Hung	Phường Thất Hùng	That Hung Ward	that_hung	292	8
10684	Lê Ninh	Le Ninh	Xã Lê Ninh	Le Ninh Commune	le_ninh	292	10
10687	Hoành Sơn	Hoanh Son	Xã Hoành Sơn	Hoanh Son Commune	hoanh_son	292	10
10693	Phạm Thái	Pham Thai	Phường Phạm Thái	Pham Thai Ward	pham_thai	292	8
10696	Duy Tân	Duy Tan	Phường Duy Tân	Duy Tan Ward	duy_tan	292	8
10699	Tân Dân	Tan Dan	Phường Tân Dân	Tan Dan Ward	tan_dan	292	8
10702	Minh Tân	Minh Tan	Phường Minh Tân	Minh Tan Ward	minh_tan	292	8
10705	Quang Thành	Quang Thanh	Xã Quang Thành	Quang Thanh Commune	quang_thanh	292	10
10708	Hiệp Hòa	Hiep Hoa	Xã Hiệp Hòa	Hiep Hoa Commune	hiep_hoa	292	10
10714	Phú Thứ	Phu Thu	Phường Phú Thứ	Phu Thu Ward	phu_thu	292	8
10717	Thăng Long	Thang Long	Xã Thăng Long	Thang Long Commune	thang_long	292	10
10720	Lạc Long	Lac Long	Xã Lạc Long	Lac Long Commune	lac_long	292	10
10723	An Sinh	An Sinh	Phường An Sinh	An Sinh Ward	an_sinh	292	8
10726	Hiệp Sơn	Hiep Son	Phường Hiệp Sơn	Hiep Son Ward	hiep_son	292	8
10729	Thượng Quận	Thuong Quan	Xã Thượng Quận	Thuong Quan Commune	thuong_quan	292	10
10732	An Phụ	An Phu	Phường An Phụ	An Phu Ward	an_phu	292	8
10735	Hiệp An	Hiep An	Phường Hiệp An	Hiep An Ward	hiep_an	292	8
10738	Long Xuyên	Long Xuyen	Phường Long Xuyên	Long Xuyen Ward	long_xuyen	292	8
10741	Thái Thịnh	Thai Thinh	Phường Thái Thịnh	Thai Thinh Ward	thai_thinh	292	8
10744	Hiến Thành	Hien Thanh	Phường Hiến Thành	Hien Thanh Ward	hien_thanh	292	8
10747	Minh Hòa	Minh Hoa	Xã Minh Hòa	Minh Hoa Commune	minh_hoa	292	10
10750	Phú Thái	Phu Thai	Thị trấn Phú Thái	Phu Thai Township	phu_thai	293	9
10753	Lai Vu	Lai Vu	Xã Lai Vu	Lai Vu Commune	lai_vu	293	10
10756	Cộng Hòa	Cong Hoa	Xã Cộng Hòa	Cong Hoa Commune	cong_hoa	293	10
10759	Thượng Vũ	Thuong Vu	Xã Thượng Vũ	Thuong Vu Commune	thuong_vu	293	10
10762	Cổ Dũng	Co Dung	Xã Cổ Dũng	Co Dung Commune	co_dung	293	10
10768	Tuấn Việt	Tuan Viet	Xã Tuấn Việt	Tuan Viet Commune	tuan_viet	293	10
10771	Kim Xuyên	Kim Xuyen	Xã Kim Xuyên	Kim Xuyen Commune	kim_xuyen	293	10
10774	Phúc Thành A	Phuc Thanh A	Xã Phúc Thành A	Phuc Thanh A Commune	phuc_thanh_a	293	10
10777	Ngũ Phúc	Ngu Phuc	Xã Ngũ Phúc	Ngu Phuc Commune	ngu_phuc	293	10
10780	Kim Anh	Kim Anh	Xã Kim Anh	Kim Anh Commune	kim_anh	293	10
10783	Kim Liên	Kim Lien	Xã Kim Liên	Kim Lien Commune	kim_lien	293	10
10786	Kim Tân	Kim Tan	Xã Kim Tân	Kim Tan Commune	kim_tan	293	10
10792	Kim Đính	Kim Dinh	Xã Kim Đính	Kim Dinh Commune	kim_dinh	293	10
10798	Bình Dân	Binh Dan	Xã Bình Dân	Binh Dan Commune	binh_dan	293	10
10801	Tam Kỳ	Tam Ky	Xã Tam Kỳ	Tam Ky Commune	tam_ky	293	10
10804	Đồng Cẩm	Dong Cam	Xã Đồng Cẩm	Dong Cam Commune	dong_cam	293	10
10807	Liên Hòa	Lien Hoa	Xã Liên Hòa	Lien Hoa Commune	lien_hoa	293	10
10810	Đại Đức	Dai Duc	Xã Đại Đức	Dai Duc Commune	dai_duc	293	10
10813	Thanh Hà	Thanh Ha	Thị trấn Thanh Hà	Thanh Ha Township	thanh_ha	294	9
10816	Hồng Lạc	Hong Lac	Xã Hồng Lạc	Hong Lac Commune	hong_lac	294	10
10819	Việt Hồng	Viet Hong	Xã Việt Hồng	Viet Hong Commune	viet_hong	294	10
10825	Tân Việt	Tan Viet	Xã Tân Việt	Tan Viet Commune	tan_viet	294	10
10828	Cẩm Chế	Cam Che	Xã Cẩm Chế	Cam Che Commune	cam_che	294	10
10831	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	294	10
10834	Thanh Lang	Thanh Lang	Xã Thanh Lang	Thanh Lang Commune	thanh_lang	294	10
10840	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	294	10
10843	Liên Mạc	Lien Mac	Xã Liên Mạc	Lien Mac Commune	lien_mac	294	10
10846	Thanh Hải	Thanh Hai	Xã Thanh Hải	Thanh Hai Commune	thanh_hai	294	10
10849	Thanh Khê	Thanh Khe	Xã Thanh Khê	Thanh Khe Commune	thanh_khe	294	10
10852	Thanh Xá	Thanh Xa	Xã Thanh Xá	Thanh Xa Commune	thanh_xa	294	10
10855	Thanh Xuân	Thanh Xuan	Xã Thanh Xuân	Thanh Xuan Commune	thanh_xuan	294	10
10861	Thanh Thủy	Thanh Thuy	Xã Thanh Thủy	Thanh Thuy Commune	thanh_thuy	294	10
10864	An Phượng	An Phuong	Xã An Phượng	An Phuong Commune	an_phuong	294	10
10867	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	294	10
10876	Thanh Quang	Thanh Quang	Xã Thanh Quang	Thanh Quang Commune	thanh_quang	294	10
10879	Thanh Hồng	Thanh Hong	Xã Thanh Hồng	Thanh Hong Commune	thanh_hong	294	10
10882	Thanh Cường	Thanh Cuong	Xã Thanh Cường	Thanh Cuong Commune	thanh_cuong	294	10
10885	Vĩnh Lập	Vinh Lap	Xã Vĩnh Lập	Vinh Lap Commune	vinh_lap	294	10
10888	Cẩm Giang	Cam Giang	Thị trấn Cẩm Giang	Cam Giang Township	cam_giang	295	9
10891	Lai Cách	Lai Cach	Thị trấn Lai Cách	Lai Cach Township	lai_cach	295	9
10894	Cẩm Hưng	Cam Hung	Xã Cẩm Hưng	Cam Hung Commune	cam_hung	295	10
10897	Cẩm Hoàng	Cam Hoang	Xã Cẩm Hoàng	Cam Hoang Commune	cam_hoang	295	10
10900	Cẩm Văn	Cam Van	Xã Cẩm Văn	Cam Van Commune	cam_van	295	10
10903	Ngọc Liên	Ngoc Lien	Xã Ngọc Liên	Ngoc Lien Commune	ngoc_lien	295	10
10906	Thạch Lỗi	Thach Loi	Xã Thạch Lỗi	Thach Loi Commune	thach_loi	295	10
10909	Cẩm Vũ	Cam Vu	Xã Cẩm Vũ	Cam Vu Commune	cam_vu	295	10
10912	Đức Chính	Duc Chinh	Xã Đức Chính	Duc Chinh Commune	duc_chinh	295	10
10918	Định Sơn	Dinh Son	Xã Định Sơn	Dinh Son Commune	dinh_son	295	10
10924	Lương Điền	Luong Dien	Xã Lương Điền	Luong Dien Commune	luong_dien	295	10
10927	Cao An	Cao An	Xã Cao An	Cao An Commune	cao_an	295	10
10930	Tân Trường	Tan Truong	Xã Tân Trường	Tan Truong Commune	tan_truong	295	10
10933	Cẩm Phúc	Cam Phuc	Xã Cẩm Phúc	Cam Phuc Commune	cam_phuc	295	10
10936	Cẩm Điền	Cam Dien	Xã Cẩm Điền	Cam Dien Commune	cam_dien	295	10
10939	Cẩm Đông	Cam Dong	Xã Cẩm Đông	Cam Dong Commune	cam_dong	295	10
10942	Cẩm Đoài	Cam Doai	Xã Cẩm Đoài	Cam Doai Commune	cam_doai	295	10
10945	Kẻ Sặt	Ke Sat	Thị trấn Kẻ Sặt	Ke Sat Township	ke_sat	296	9
10951	Vĩnh Hưng	Vinh Hung	Xã Vĩnh Hưng	Vinh Hung Commune	vinh_hung	296	10
10954	Hùng Thắng	Hung Thang	Xã Hùng Thắng	Hung Thang Commune	hung_thang	296	10
10960	Vĩnh Hồng	Vinh Hong	Xã Vĩnh Hồng	Vinh Hong Commune	vinh_hong	296	10
10963	Long Xuyên	Long Xuyen	Xã Long Xuyên	Long Xuyen Commune	long_xuyen	296	10
10966	Tân Việt	Tan Viet	Xã Tân Việt	Tan Viet Commune	tan_viet	296	10
10969	Thúc Kháng	Thuc Khang	Xã Thúc Kháng	Thuc Khang Commune	thuc_khang	296	10
10972	Tân Hồng	Tan Hong	Xã Tân Hồng	Tan Hong Commune	tan_hong	296	10
10975	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	296	10
10978	Hồng Khê	Hong Khe	Xã Hồng Khê	Hong Khe Commune	hong_khe	296	10
10981	Thái Học	Thai Hoc	Xã Thái Học	Thai Hoc Commune	thai_hoc	296	10
10984	Cổ Bì	Co Bi	Xã Cổ Bì	Co Bi Commune	co_bi	296	10
10987	Nhân Quyền	Nhan Quyen	Xã Nhân Quyền	Nhan Quyen Commune	nhan_quyen	296	10
10990	Thái Dương	Thai Duong	Xã Thái Dương	Thai Duong Commune	thai_duong	296	10
10993	Thái Hòa	Thai Hoa	Xã Thái Hòa	Thai Hoa Commune	thai_hoa	296	10
10996	Bình Xuyên	Binh Xuyen	Xã Bình Xuyên	Binh Xuyen Commune	binh_xuyen	296	10
10999	Gia Lộc	Gia Loc	Thị trấn Gia Lộc	Gia Loc Township	gia_loc	297	9
11008	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	297	10
11020	Yết Kiêu	Yet Kieu	Xã Yết Kiêu	Yet Kieu Commune	yet_kieu	297	10
11029	Gia Tân	Gia Tan	Xã Gia Tân	Gia Tan Commune	gia_tan	297	10
11032	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	297	10
11035	Gia Khánh	Gia Khanh	Xã Gia Khánh	Gia Khanh Commune	gia_khanh	297	10
11038	Gia Lương	Gia Luong	Xã Gia Lương	Gia Luong Commune	gia_luong	297	10
11041	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	297	10
11044	Toàn Thắng	Toan Thang	Xã Toàn Thắng	Toan Thang Commune	toan_thang	297	10
11047	Hoàng Diệu	Hoang Dieu	Xã Hoàng Diệu	Hoang Dieu Commune	hoang_dieu	297	10
11050	Hồng Hưng	Hong Hung	Xã Hồng Hưng	Hong Hung Commune	hong_hung	297	10
11053	Phạm Trấn	Pham Tran	Xã Phạm Trấn	Pham Tran Commune	pham_tran	297	10
11056	Đoàn Thượng	Doan Thuong	Xã Đoàn Thượng	Doan Thuong Commune	doan_thuong	297	10
11059	Thống Kênh	Thong Kenh	Xã Thống Kênh	Thong Kenh Commune	thong_kenh	297	10
11062	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	297	10
11065	Đồng Quang	Dong Quang	Xã Đồng Quang	Dong Quang Commune	dong_quang	297	10
11068	Nhật Tân	Nhat Tan	Xã Nhật Tân	Nhat Tan Commune	nhat_tan	297	10
11071	Đức Xương	Duc Xuong	Xã Đức Xương	Duc Xuong Commune	duc_xuong	297	10
11074	Tứ Kỳ	Tu Ky	Thị trấn Tứ Kỳ	Tu Ky Township	tu_ky	298	9
11083	Đại Sơn	Dai Son	Xã Đại Sơn	Dai Son Commune	dai_son	298	10
11086	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	298	10
11089	Ngọc Kỳ	Ngoc Ky	Xã Ngọc Kỳ	Ngoc Ky Commune	ngoc_ky	298	10
11092	Bình Lăng	Binh Lang	Xã Bình Lăng	Binh Lang Commune	binh_lang	298	10
11095	Chí Minh	Chi Minh	Xã Chí Minh	Chi Minh Commune	chi_minh	298	10
11098	Tái Sơn	Tai Son	Xã Tái Sơn	Tai Son Commune	tai_son	298	10
11101	Quang Phục	Quang Phuc	Xã Quang Phục	Quang Phuc Commune	quang_phuc	298	10
11110	Dân Chủ	Dan Chu	Xã Dân Chủ	Dan Chu Commune	dan_chu	298	10
11113	Tân Kỳ	Tan Ky	Xã Tân Kỳ	Tan Ky Commune	tan_ky	298	10
11116	Quang Khải	Quang Khai	Xã Quang Khải	Quang Khai Commune	quang_khai	298	10
11119	Đại Hợp	Dai Hop	Xã Đại Hợp	Dai Hop Commune	dai_hop	298	10
11122	Quảng Nghiệp	Quang Nghiep	Xã Quảng Nghiệp	Quang Nghiep Commune	quang_nghiep	298	10
11125	An Thanh	An Thanh	Xã An Thanh	An Thanh Commune	an_thanh	298	10
11128	Minh Đức	Minh Duc	Xã Minh Đức	Minh Duc Commune	minh_duc	298	10
11131	Văn Tố	Van To	Xã Văn Tố	Van To Commune	van_to	298	10
11134	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	298	10
11137	Phượng Kỳ	Phuong Ky	Xã Phượng Kỳ	Phuong Ky Commune	phuong_ky	298	10
11140	Cộng Lạc	Cong Lac	Xã Cộng Lạc	Cong Lac Commune	cong_lac	298	10
11143	Tiên Động	Tien Dong	Xã Tiên Động	Tien Dong Commune	tien_dong	298	10
11146	Nguyên Giáp	Nguyen Giap	Xã Nguyên Giáp	Nguyen Giap Commune	nguyen_giap	298	10
11149	Hà Kỳ	Ha Ky	Xã Hà Kỳ	Ha Ky Commune	ha_ky	298	10
11152	Hà Thanh	Ha Thanh	Xã Hà Thanh	Ha Thanh Commune	ha_thanh	298	10
11155	Ninh Giang	Ninh Giang	Thị trấn Ninh Giang	Ninh Giang Township	ninh_giang	299	9
11161	Ứng Hoè	Ung Hoe	Xã Ứng Hoè	Ung Hoe Commune	ung_hoe	299	10
11164	Nghĩa An	Nghia An	Xã Nghĩa An	Nghia An Commune	nghia_an	299	10
11167	Hồng Đức	Hong Duc	Xã Hồng Đức	Hong Duc Commune	hong_duc	299	10
11173	An Đức	An Duc	Xã An Đức	An Duc Commune	an_duc	299	10
11176	Vạn Phúc	Van Phuc	Xã Vạn Phúc	Van Phuc Commune	van_phuc	299	10
11179	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	299	10
11185	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	299	10
11188	Đông Xuyên	Dong Xuyen	Xã Đông Xuyên	Dong Xuyen Commune	dong_xuyen	299	10
11197	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	299	10
11200	Ninh Hải	Ninh Hai	Xã Ninh Hải	Ninh Hai Commune	ninh_hai	299	10
11203	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	299	10
11206	Tân Quang	Tan Quang	Xã Tân Quang	Tan Quang Commune	tan_quang	299	10
11209	Kiến Quốc	Kien Quoc	Xã Kiến Quốc	Kien Quoc Commune	kien_quoc	299	10
11215	Hồng Dụ	Hong Du	Xã Hồng Dụ	Hong Du Commune	hong_du	299	10
11218	Văn Hội	Van Hoi	Xã Văn Hội	Van Hoi Commune	van_hoi	299	10
11224	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	299	10
11227	Hiệp Lực	Hiep Luc	Xã Hiệp Lực	Hiep Luc Commune	hiep_luc	299	10
11230	Hồng Phúc	Hong Phuc	Xã Hồng Phúc	Hong Phuc Commune	hong_phuc	299	10
11233	Hưng Long	Hung Long	Xã Hưng Long	Hung Long Commune	hung_long	299	10
11239	Thanh Miện	Thanh Mien	Thị trấn Thanh Miện	Thanh Mien Township	thanh_mien	300	9
11242	Thanh Tùng	Thanh Tung	Xã Thanh Tùng	Thanh Tung Commune	thanh_tung	300	10
11245	Phạm Kha	Pham Kha	Xã Phạm Kha	Pham Kha Commune	pham_kha	300	10
11248	Ngô Quyền	Ngo Quyen	Xã Ngô Quyền	Ngo Quyen Commune	ngo_quyen	300	10
11251	Đoàn Tùng	Doan Tung	Xã Đoàn Tùng	Doan Tung Commune	doan_tung	300	10
11254	Hồng Quang	Hong Quang	Xã Hồng Quang	Hong Quang Commune	hong_quang	300	10
11257	Tân Trào	Tan Trao	Xã Tân Trào	Tan Trao Commune	tan_trao	300	10
11260	Lam Sơn	Lam Son	Xã Lam Sơn	Lam Son Commune	lam_son	300	10
11263	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	300	10
11266	Lê Hồng	Le Hong	Xã Lê Hồng	Le Hong Commune	le_hong	300	10
11269	Tứ Cường	Tu Cuong	Xã Tứ Cường	Tu Cuong Commune	tu_cuong	300	10
11275	Ngũ Hùng	Ngu Hung	Xã Ngũ Hùng	Ngu Hung Commune	ngu_hung	300	10
11278	Cao Thắng	Cao Thang	Xã Cao Thắng	Cao Thang Commune	cao_thang	300	10
11281	Chi Lăng Bắc	Chi Lang Bac	Xã Chi Lăng Bắc	Chi Lang Bac Commune	chi_lang_bac	300	10
27286	03	03	Phường 03	03 Ward	03	773	8
11284	Chi Lăng Nam	Chi Lang Nam	Xã Chi Lăng Nam	Chi Lang Nam Commune	chi_lang_nam	300	10
11287	Thanh Giang	Thanh Giang	Xã Thanh Giang	Thanh Giang Commune	thanh_giang	300	10
11293	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	300	10
11296	Quán Toan	Quan Toan	Phường Quán Toan	Quan Toan Ward	quan_toan	303	8
11299	Hùng Vương	Hung Vuong	Phường Hùng Vương	Hung Vuong Ward	hung_vuong	303	8
11302	Sở Dầu	So Dau	Phường Sở Dầu	So Dau Ward	so_dau	303	8
11305	Thượng Lý	Thuong Ly	Phường Thượng Lý	Thuong Ly Ward	thuong_ly	303	8
11308	Hạ Lý	Ha Ly	Phường Hạ Lý	Ha Ly Ward	ha_ly	303	8
11311	Minh Khai	Minh Khai	Phường Minh Khai	Minh Khai Ward	minh_khai	303	8
11314	Trại Chuối	Trai Chuoi	Phường Trại Chuối	Trai Chuoi Ward	trai_chuoi	303	8
11320	Hoàng Văn Thụ	Hoang Van Thu	Phường Hoàng Văn Thụ	Hoang Van Thu Ward	hoang_van_thu	303	8
11323	Phan Bội Châu	Phan Boi Chau	Phường Phan Bội Châu	Phan Boi Chau Ward	phan_boi_chau	303	8
11329	Máy Chai	May Chai	Phường Máy Chai	May Chai Ward	may_chai	304	8
11332	Máy Tơ	May To	Phường Máy Tơ	May To Ward	may_to	304	8
11335	Vạn Mỹ	Van My	Phường Vạn Mỹ	Van My Ward	van_my	304	8
11338	Cầu Tre	Cau Tre	Phường Cầu Tre	Cau Tre Ward	cau_tre	304	8
11341	Lạc Viên	Lac Vien	Phường Lạc Viên	Lac Vien Ward	lac_vien	304	8
11347	Gia Viên	Gia Vien	Phường Gia Viên	Gia Vien Ward	gia_vien	304	8
11350	Đông Khê	Dong Khe	Phường Đông Khê	Dong Khe Ward	dong_khe	304	8
11353	Cầu Đất	Cau Dat	Phường Cầu Đất	Cau Dat Ward	cau_dat	304	8
11356	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	304	8
11359	Đằng Giang	Dang Giang	Phường Đằng Giang	Dang Giang Ward	dang_giang	304	8
11362	Lạch Tray	Lach Tray	Phường Lạch Tray	Lach Tray Ward	lach_tray	304	8
11365	Đổng Quốc Bình	Dong Quoc Binh	Phường Đổng Quốc Bình	Dong Quoc Binh Ward	dong_quoc_binh	304	8
11368	Cát Dài	Cat Dai	Phường Cát Dài	Cat Dai Ward	cat_dai	305	8
11371	An Biên	An Bien	Phường An Biên	An Bien Ward	an_bien	305	8
11374	Lam Sơn	Lam Son	Phường Lam Sơn	Lam Son Ward	lam_son	305	8
11377	An Dương	An Duong	Phường An Dương	An Duong Ward	an_duong	305	8
11380	Trần Nguyên Hãn	Tran Nguyen Han	Phường Trần Nguyên Hãn	Tran Nguyen Han Ward	tran_nguyen_han	305	8
11383	Hồ Nam	Ho Nam	Phường Hồ Nam	Ho Nam Ward	ho_nam	305	8
11386	Trại Cau	Trai Cau	Phường Trại Cau	Trai Cau Ward	trai_cau	305	8
11389	Dư Hàng	Du Hang	Phường Dư Hàng	Du Hang Ward	du_hang	305	8
11392	Hàng Kênh	Hang Kenh	Phường Hàng Kênh	Hang Kenh Ward	hang_kenh	305	8
11395	Đông Hải	Dong Hai	Phường Đông Hải	Dong Hai Ward	dong_hai	305	8
11398	Niệm Nghĩa	Niem Nghia	Phường Niệm Nghĩa	Niem Nghia Ward	niem_nghia	305	8
11401	Nghĩa Xá	Nghia Xa	Phường Nghĩa Xá	Nghia Xa Ward	nghia_xa	305	8
11404	Dư Hàng Kênh	Du Hang Kenh	Phường Dư Hàng Kênh	Du Hang Kenh Ward	du_hang_kenh	305	8
11405	Kênh Dương	Kenh Duong	Phường Kênh Dương	Kenh Duong Ward	kenh_duong	305	8
11407	Vĩnh Niệm	Vinh Niem	Phường Vĩnh Niệm	Vinh Niem Ward	vinh_niem	305	8
11410	Đông Hải 1	Dong Hai 1	Phường Đông Hải 1	Dong Hai 1 Ward	dong_hai_1	306	8
11411	Đông Hải 2	Dong Hai 2	Phường Đông Hải 2	Dong Hai 2 Ward	dong_hai_2	306	8
11413	Đằng Lâm	Dang Lam	Phường Đằng Lâm	Dang Lam Ward	dang_lam	306	8
11414	Thành Tô	Thanh To	Phường Thành Tô	Thanh To Ward	thanh_to	306	8
11416	Đằng Hải	Dang Hai	Phường Đằng Hải	Dang Hai Ward	dang_hai	306	8
11419	Nam Hải	Nam Hai	Phường Nam Hải	Nam Hai Ward	nam_hai	306	8
11422	Cát Bi	Cat Bi	Phường Cát Bi	Cat Bi Ward	cat_bi	306	8
11425	Tràng Cát	Trang Cat	Phường Tràng Cát	Trang Cat Ward	trang_cat	306	8
11428	Quán Trữ	Quan Tru	Phường Quán Trữ	Quan Tru Ward	quan_tru	307	8
11429	Lãm Hà	Lam Ha	Phường Lãm Hà	Lam Ha Ward	lam_ha	307	8
11431	Đồng Hoà	Dong Hoa	Phường Đồng Hoà	Dong Hoa Ward	dong_hoa	307	8
11434	Bắc Sơn	Bac Son	Phường Bắc Sơn	Bac Son Ward	bac_son	307	8
11437	Nam Sơn	Nam Son	Phường Nam Sơn	Nam Son Ward	nam_son	307	8
11440	Ngọc Sơn	Ngoc Son	Phường Ngọc Sơn	Ngoc Son Ward	ngoc_son	307	8
11443	Trần Thành Ngọ	Tran Thanh Ngo	Phường Trần Thành Ngọ	Tran Thanh Ngo Ward	tran_thanh_ngo	307	8
11446	Văn Đẩu	Van Dau	Phường Văn Đẩu	Van Dau Ward	van_dau	307	8
11449	Phù Liễn	Phu Lien	Phường Phù Liễn	Phu Lien Ward	phu_lien	307	8
11452	Tràng Minh	Trang Minh	Phường Tràng Minh	Trang Minh Ward	trang_minh	307	8
11455	Ngọc Xuyên	Ngoc Xuyen	Phường Ngọc Xuyên	Ngoc Xuyen Ward	ngoc_xuyen	308	8
11458	Hải Sơn	Hai Son	Phường Hải Sơn	Hai Son Ward	hai_son	308	8
11461	Vạn Hương	Van Huong	Phường Vạn Hương	Van Huong Ward	van_huong	308	8
11465	Minh Đức	Minh Duc	Phường Minh Đức	Minh Duc Ward	minh_duc	308	8
11467	Bàng La	Bang La	Phường Bàng La	Bang La Ward	bang_la	308	8
11737	Hợp Đức	Hop Duc	Phường Hợp Đức	Hop Duc Ward	hop_duc	308	8
11683	Đa Phúc	Da Phuc	Phường Đa Phúc	Da Phuc Ward	da_phuc	309	8
11686	Hưng Đạo	Hung Dao	Phường Hưng Đạo	Hung Dao Ward	hung_dao	309	8
11689	Anh Dũng	Anh Dung	Phường Anh Dũng	Anh Dung Ward	anh_dung	309	8
11692	Hải Thành	Hai Thanh	Phường Hải Thành	Hai Thanh Ward	hai_thanh	309	8
11707	Hoà Nghĩa	Hoa Nghia	Phường Hoà Nghĩa	Hoa Nghia Ward	hoa_nghia	309	8
11740	Tân Thành	Tan Thanh	Phường Tân Thành	Tan Thanh Ward	tan_thanh	309	8
11470	Núi Đèo	Nui Deo	Thị trấn Núi Đèo	Nui Deo Township	nui_deo	311	9
11473	Minh Đức	Minh Duc	Thị trấn Minh Đức	Minh Duc Township	minh_duc	311	9
11476	Lại Xuân	Lai Xuan	Xã Lại Xuân	Lai Xuan Commune	lai_xuan	311	10
11479	An Sơn	An Son	Xã An Sơn	An Son Commune	an_son	311	10
11482	Kỳ Sơn	Ky Son	Xã Kỳ Sơn	Ky Son Commune	ky_son	311	10
11485	Liên Khê	Lien Khe	Xã Liên Khê	Lien Khe Commune	lien_khe	311	10
11488	Lưu Kiếm	Luu Kiem	Xã Lưu Kiếm	Luu Kiem Commune	luu_kiem	311	10
11491	Lưu Kỳ	Luu Ky	Xã Lưu Kỳ	Luu Ky Commune	luu_ky	311	10
11494	Gia Minh	Gia Minh	Xã Gia Minh	Gia Minh Commune	gia_minh	311	10
11497	Gia Đức	Gia Duc	Xã Gia Đức	Gia Duc Commune	gia_duc	311	10
11500	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	311	10
11503	Phù Ninh	Phu Ninh	Xã Phù Ninh	Phu Ninh Commune	phu_ninh	311	10
11506	Quảng Thanh	Quang Thanh	Xã Quảng Thanh	Quang Thanh Commune	quang_thanh	311	10
11509	Chính Mỹ	Chinh My	Xã Chính Mỹ	Chinh My Commune	chinh_my	311	10
11512	Kênh Giang	Kenh Giang	Xã Kênh Giang	Kenh Giang Commune	kenh_giang	311	10
11515	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	311	10
11518	Cao Nhân	Cao Nhan	Xã Cao Nhân	Cao Nhan Commune	cao_nhan	311	10
11521	Mỹ Đồng	My Dong	Xã Mỹ Đồng	My Dong Commune	my_dong	311	10
11524	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	311	10
11527	Hoà Bình	Hoa Binh	Xã Hoà Bình	Hoa Binh Commune	hoa_binh	311	10
11530	Trung Hà	Trung Ha	Xã Trung Hà	Trung Ha Commune	trung_ha	311	10
11533	An Lư	An Lu	Xã An Lư	An Lu Commune	an_lu	311	10
11536	Thuỷ Triều	Thuy Trieu	Xã Thuỷ Triều	Thuy Trieu Commune	thuy_trieu	311	10
11539	Ngũ Lão	Ngu Lao	Xã Ngũ Lão	Ngu Lao Commune	ngu_lao	311	10
11542	Phục Lễ	Phuc Le	Xã Phục Lễ	Phuc Le Commune	phuc_le	311	10
11545	Tam Hưng	Tam Hung	Xã Tam Hưng	Tam Hung Commune	tam_hung	311	10
11548	Phả Lễ	Pha Le	Xã Phả Lễ	Pha Le Commune	pha_le	311	10
11551	Lập Lễ	Lap Le	Xã Lập Lễ	Lap Le Commune	lap_le	311	10
11554	Kiền Bái	Kien Bai	Xã Kiền Bái	Kien Bai Commune	kien_bai	311	10
11557	Thiên Hương	Thien Huong	Xã Thiên Hương	Thien Huong Commune	thien_huong	311	10
11560	Thuỷ Sơn	Thuy Son	Xã Thuỷ Sơn	Thuy Son Commune	thuy_son	311	10
11563	Thuỷ Đường	Thuy Duong	Xã Thuỷ Đường	Thuy Duong Commune	thuy_duong	311	10
11566	Hoàng Động	Hoang Dong	Xã Hoàng Động	Hoang Dong Commune	hoang_dong	311	10
11569	Lâm Động	Lam Dong	Xã Lâm Động	Lam Dong Commune	lam_dong	311	10
11572	Hoa Động	Hoa Dong	Xã Hoa Động	Hoa Dong Commune	hoa_dong	311	10
11575	Tân Dương	Tan Duong	Xã Tân Dương	Tan Duong Commune	tan_duong	311	10
11578	Dương Quan	Duong Quan	Xã Dương Quan	Duong Quan Commune	duong_quan	311	10
11581	An Dương	An Duong	Thị trấn An Dương	An Duong Township	an_duong	312	9
11584	Lê Thiện	Le Thien	Xã Lê Thiện	Le Thien Commune	le_thien	312	10
11587	Đại Bản	Dai Ban	Xã Đại Bản	Dai Ban Commune	dai_ban	312	10
11590	An Hoà	An Hoa	Xã An Hoà	An Hoa Commune	an_hoa	312	10
11593	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	312	10
11596	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	312	10
11599	An Hưng	An Hung	Xã An Hưng	An Hung Commune	an_hung	312	10
11602	An Hồng	An Hong	Xã An Hồng	An Hong Commune	an_hong	312	10
11605	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	312	10
11608	Nam Sơn	Nam Son	Xã Nam Sơn	Nam Son Commune	nam_son	312	10
11611	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	312	10
11614	Đặng Cương	Dang Cuong	Xã Đặng Cương	Dang Cuong Commune	dang_cuong	312	10
11617	Đồng Thái	Dong Thai	Xã Đồng Thái	Dong Thai Commune	dong_thai	312	10
11620	Quốc Tuấn	Quoc Tuan	Xã Quốc Tuấn	Quoc Tuan Commune	quoc_tuan	312	10
11623	An Đồng	An Dong	Xã An Đồng	An Dong Commune	an_dong	312	10
11626	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	312	10
11629	An Lão	An Lao	Thị trấn An Lão	An Lao Township	an_lao	313	9
11632	Bát Trang	Bat Trang	Xã Bát Trang	Bat Trang Commune	bat_trang	313	10
11635	Trường Thọ	Truong Tho	Xã Trường Thọ	Truong Tho Commune	truong_tho	313	10
11638	Trường Thành	Truong Thanh	Xã Trường Thành	Truong Thanh Commune	truong_thanh	313	10
11641	An Tiến	An Tien	Xã An Tiến	An Tien Commune	an_tien	313	10
11644	Quang Hưng	Quang Hung	Xã Quang Hưng	Quang Hung Commune	quang_hung	313	10
11647	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	313	10
11650	Quốc Tuấn	Quoc Tuan	Xã Quốc Tuấn	Quoc Tuan Commune	quoc_tuan	313	10
11653	An Thắng	An Thang	Xã An Thắng	An Thang Commune	an_thang	313	10
11656	Trường Sơn	Truong Son	Thị trấn Trường Sơn	Truong Son Township	truong_son	313	9
11659	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	313	10
11662	Thái Sơn	Thai Son	Xã Thái Sơn	Thai Son Commune	thai_son	313	10
11665	Tân Viên	Tan Vien	Xã Tân Viên	Tan Vien Commune	tan_vien	313	10
11668	Mỹ Đức	My Duc	Xã Mỹ Đức	My Duc Commune	my_duc	313	10
11671	Chiến Thắng	Chien Thang	Xã Chiến Thắng	Chien Thang Commune	chien_thang	313	10
11674	An Thọ	An Tho	Xã An Thọ	An Tho Commune	an_tho	313	10
11677	An Thái	An Thai	Xã An Thái	An Thai Commune	an_thai	313	10
11680	Núi Đối	Nui Doi	Thị trấn Núi Đối	Nui Doi Township	nui_doi	314	9
11695	Đông Phương	Dong Phuong	Xã Đông Phương	Dong Phuong Commune	dong_phuong	314	10
11698	Thuận Thiên	Thuan Thien	Xã Thuận Thiên	Thuan Thien Commune	thuan_thien	314	10
11701	Hữu Bằng	Huu Bang	Xã Hữu Bằng	Huu Bang Commune	huu_bang	314	10
11704	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	314	10
11710	Ngũ Phúc	Ngu Phuc	Xã Ngũ Phúc	Ngu Phuc Commune	ngu_phuc	314	10
11713	Kiến Quốc	Kien Quoc	Xã Kiến Quốc	Kien Quoc Commune	kien_quoc	314	10
11716	Du Lễ	Du Le	Xã Du Lễ	Du Le Commune	du_le	314	10
11719	Thuỵ Hương	Thuy Huong	Xã Thuỵ Hương	Thuy Huong Commune	thuy_huong	314	10
11722	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	314	10
11725	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	314	10
11728	Đại Hà	Dai Ha	Xã Đại Hà	Dai Ha Commune	dai_ha	314	10
11731	Ngũ Đoan	Ngu Doan	Xã Ngũ Đoan	Ngu Doan Commune	ngu_doan	314	10
11734	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	314	10
11743	Tân Trào	Tan Trao	Xã Tân Trào	Tan Trao Commune	tan_trao	314	10
11746	Đoàn Xá	Doan Xa	Xã Đoàn Xá	Doan Xa Commune	doan_xa	314	10
11749	Tú Sơn	Tu Son	Xã Tú Sơn	Tu Son Commune	tu_son	314	10
11752	Đại Hợp	Dai Hop	Xã Đại Hợp	Dai Hop Commune	dai_hop	314	10
11755	Tiên Lãng	Tien Lang	Thị trấn Tiên Lãng	Tien Lang Township	tien_lang	315	9
11758	Đại Thắng	Dai Thang	Xã Đại Thắng	Dai Thang Commune	dai_thang	315	10
11761	Tiên Cường	Tien Cuong	Xã Tiên Cường	Tien Cuong Commune	tien_cuong	315	10
11764	Tự Cường	Tu Cuong	Xã Tự Cường	Tu Cuong Commune	tu_cuong	315	10
11770	Quyết Tiến	Quyet Tien	Xã Quyết Tiến	Quyet Tien Commune	quyet_tien	315	10
11773	Khởi Nghĩa	Khoi Nghia	Xã Khởi Nghĩa	Khoi Nghia Commune	khoi_nghia	315	10
11776	Tiên Thanh	Tien Thanh	Xã Tiên Thanh	Tien Thanh Commune	tien_thanh	315	10
11779	Cấp Tiến	Cap Tien	Xã Cấp Tiến	Cap Tien Commune	cap_tien	315	10
11782	Kiến Thiết	Kien Thiet	Xã Kiến Thiết	Kien Thiet Commune	kien_thiet	315	10
11785	Đoàn Lập	Doan Lap	Xã Đoàn Lập	Doan Lap Commune	doan_lap	315	10
11788	Bạch Đằng	Bach Dang	Xã Bạch Đằng	Bach Dang Commune	bach_dang	315	10
11791	Quang Phục	Quang Phuc	Xã Quang Phục	Quang Phuc Commune	quang_phuc	315	10
11794	Toàn Thắng	Toan Thang	Xã Toàn Thắng	Toan Thang Commune	toan_thang	315	10
11797	Tiên Thắng	Tien Thang	Xã Tiên Thắng	Tien Thang Commune	tien_thang	315	10
27289	16	16	Phường 16	16 Ward	16	773	8
11800	Tiên Minh	Tien Minh	Xã Tiên Minh	Tien Minh Commune	tien_minh	315	10
11803	Bắc Hưng	Bac Hung	Xã Bắc Hưng	Bac Hung Commune	bac_hung	315	10
11806	Nam Hưng	Nam Hung	Xã Nam Hưng	Nam Hung Commune	nam_hung	315	10
11809	Hùng Thắng	Hung Thang	Xã Hùng Thắng	Hung Thang Commune	hung_thang	315	10
11812	Tây Hưng	Tay Hung	Xã Tây Hưng	Tay Hung Commune	tay_hung	315	10
11815	Đông Hưng	Dong Hung	Xã Đông Hưng	Dong Hung Commune	dong_hung	315	10
11821	Vinh Quang	Vinh Quang	Xã Vinh Quang	Vinh Quang Commune	vinh_quang	315	10
11824	Vĩnh Bảo	Vinh Bao	Thị trấn Vĩnh Bảo	Vinh Bao Township	vinh_bao	316	9
11827	Dũng Tiến	Dung Tien	Xã Dũng Tiến	Dung Tien Commune	dung_tien	316	10
11830	Giang Biên	Giang Bien	Xã Giang Biên	Giang Bien Commune	giang_bien	316	10
11833	Thắng Thuỷ	Thang Thuy	Xã Thắng Thuỷ	Thang Thuy Commune	thang_thuy	316	10
11836	Trung Lập	Trung Lap	Xã Trung Lập	Trung Lap Commune	trung_lap	316	10
11839	Việt Tiến	Viet Tien	Xã Việt Tiến	Viet Tien Commune	viet_tien	316	10
11842	Vĩnh An	Vinh An	Xã Vĩnh An	Vinh An Commune	vinh_an	316	10
11845	Vĩnh Long	Vinh Long	Xã Vĩnh Long	Vinh Long Commune	vinh_long	316	10
11848	Hiệp Hoà	Hiep Hoa	Xã Hiệp Hoà	Hiep Hoa Commune	hiep_hoa	316	10
11851	Hùng Tiến	Hung Tien	Xã Hùng Tiến	Hung Tien Commune	hung_tien	316	10
11854	An Hoà	An Hoa	Xã An Hoà	An Hoa Commune	an_hoa	316	10
11857	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	316	10
11860	Tân Liên	Tan Lien	Xã Tân Liên	Tan Lien Commune	tan_lien	316	10
11863	Nhân Hoà	Nhan Hoa	Xã Nhân Hoà	Nhan Hoa Commune	nhan_hoa	316	10
11866	Tam Đa	Tam Da	Xã Tam Đa	Tam Da Commune	tam_da	316	10
11869	Hưng Nhân	Hung Nhan	Xã Hưng Nhân	Hung Nhan Commune	hung_nhan	316	10
11872	Vinh Quang	Vinh Quang	Xã Vinh Quang	Vinh Quang Commune	vinh_quang	316	10
11875	Đồng Minh	Dong Minh	Xã Đồng Minh	Dong Minh Commune	dong_minh	316	10
11878	Thanh Lương	Thanh Luong	Xã Thanh Lương	Thanh Luong Commune	thanh_luong	316	10
11881	Liên Am	Lien Am	Xã Liên Am	Lien Am Commune	lien_am	316	10
11884	Lý Học	Ly Hoc	Xã Lý Học	Ly Hoc Commune	ly_hoc	316	10
11887	Tam Cường	Tam Cuong	Xã Tam Cường	Tam Cuong Commune	tam_cuong	316	10
11890	Hoà Bình	Hoa Binh	Xã Hoà Bình	Hoa Binh Commune	hoa_binh	316	10
11893	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	316	10
11896	Vĩnh Phong	Vinh Phong	Xã Vĩnh Phong	Vinh Phong Commune	vinh_phong	316	10
11899	Cộng Hiền	Cong Hien	Xã Cộng Hiền	Cong Hien Commune	cong_hien	316	10
11902	Cao Minh	Cao Minh	Xã Cao Minh	Cao Minh Commune	cao_minh	316	10
11905	Cổ Am	Co Am	Xã Cổ Am	Co Am Commune	co_am	316	10
11908	Vĩnh Tiến	Vinh Tien	Xã Vĩnh Tiến	Vinh Tien Commune	vinh_tien	316	10
11911	Trấn Dương	Tran Duong	Xã Trấn Dương	Tran Duong Commune	tran_duong	316	10
11914	Cát Bà	Cat Ba	Thị trấn Cát Bà	Cat Ba Township	cat_ba	317	9
11917	Cát Hải	Cat Hai	Thị trấn Cát Hải	Cat Hai Township	cat_hai	317	9
11920	Nghĩa Lộ	Nghia Lo	Xã Nghĩa Lộ	Nghia Lo Commune	nghia_lo	317	10
11923	Đồng Bài	Dong Bai	Xã Đồng Bài	Dong Bai Commune	dong_bai	317	10
11926	Hoàng Châu	Hoang Chau	Xã Hoàng Châu	Hoang Chau Commune	hoang_chau	317	10
11929	Văn Phong	Van Phong	Xã Văn Phong	Van Phong Commune	van_phong	317	10
11932	Phù Long	Phu Long	Xã Phù Long	Phu Long Commune	phu_long	317	10
11935	Gia Luận	Gia Luan	Xã Gia Luận	Gia Luan Commune	gia_luan	317	10
11938	Hiền Hào	Hien Hao	Xã Hiền Hào	Hien Hao Commune	hien_hao	317	10
11941	Trân Châu	Tran Chau	Xã Trân Châu	Tran Chau Commune	tran_chau	317	10
11944	Việt Hải	Viet Hai	Xã Việt Hải	Viet Hai Commune	viet_hai	317	10
11947	Xuân Đám	Xuan Dam	Xã Xuân Đám	Xuan Dam Commune	xuan_dam	317	10
11950	Lam Sơn	Lam Son	Phường Lam Sơn	Lam Son Ward	lam_son	323	8
11953	Hiến Nam	Hien Nam	Phường Hiến Nam	Hien Nam Ward	hien_nam	323	8
11956	An Tảo	An Tao	Phường An Tảo	An Tao Ward	an_tao	323	8
11959	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	323	8
11962	Minh Khai	Minh Khai	Phường Minh Khai	Minh Khai Ward	minh_khai	323	8
11965	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	323	8
11968	Hồng Châu	Hong Chau	Phường Hồng Châu	Hong Chau Ward	hong_chau	323	8
11971	Trung Nghĩa	Trung Nghia	Xã Trung Nghĩa	Trung Nghia Commune	trung_nghia	323	10
11974	Liên Phương	Lien Phuong	Xã Liên Phương	Lien Phuong Commune	lien_phuong	323	10
11977	Hồng Nam	Hong Nam	Xã Hồng Nam	Hong Nam Commune	hong_nam	323	10
11980	Quảng Châu	Quang Chau	Xã Quảng Châu	Quang Chau Commune	quang_chau	323	10
11983	Bảo Khê	Bao Khe	Xã Bảo Khê	Bao Khe Commune	bao_khe	323	10
12331	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	323	10
12334	Hùng Cường	Hung Cuong	Xã Hùng Cường	Hung Cuong Commune	hung_cuong	323	10
12382	Phương Chiểu	Phuong Chieu	Xã Phương Chiểu	Phuong Chieu Commune	phuong_chieu	323	10
12385	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	323	10
12388	Hoàng Hanh	Hoang Hanh	Xã Hoàng Hanh	Hoang Hanh Commune	hoang_hanh	323	10
11986	Như Quỳnh	Nhu Quynh	Thị trấn Như Quỳnh	Nhu Quynh Township	nhu_quynh	325	9
11989	Lạc Đạo	Lac Dao	Xã Lạc Đạo	Lac Dao Commune	lac_dao	325	10
11992	Chỉ Đạo	Chi Dao	Xã Chỉ Đạo	Chi Dao Commune	chi_dao	325	10
11995	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	325	10
11998	Việt Hưng	Viet Hung	Xã Việt Hưng	Viet Hung Commune	viet_hung	325	10
12001	Tân Quang	Tan Quang	Xã Tân Quang	Tan Quang Commune	tan_quang	325	10
12004	Đình Dù	Dinh Du	Xã Đình Dù	Dinh Du Commune	dinh_du	325	10
12007	Minh Hải	Minh Hai	Xã Minh Hải	Minh Hai Commune	minh_hai	325	10
12010	Lương Tài	Luong Tai	Xã Lương Tài	Luong Tai Commune	luong_tai	325	10
12013	Trưng Trắc	Trung Trac	Xã Trưng Trắc	Trung Trac Commune	trung_trac	325	10
12016	Lạc Hồng	Lac Hong	Xã Lạc Hồng	Lac Hong Commune	lac_hong	325	10
12019	Văn Giang	Van Giang	Thị trấn Văn Giang	Van Giang Township	van_giang	326	9
12022	Xuân Quan	Xuan Quan	Xã Xuân Quan	Xuan Quan Commune	xuan_quan	326	10
12025	Cửu Cao	Cuu Cao	Xã Cửu Cao	Cuu Cao Commune	cuu_cao	326	10
12028	Phụng Công	Phung Cong	Xã Phụng Công	Phung Cong Commune	phung_cong	326	10
12031	Nghĩa Trụ	Nghia Tru	Xã Nghĩa Trụ	Nghia Tru Commune	nghia_tru	326	10
12034	Long Hưng	Long Hung	Xã Long Hưng	Long Hung Commune	long_hung	326	10
12037	Vĩnh Khúc	Vinh Khuc	Xã Vĩnh Khúc	Vinh Khuc Commune	vinh_khuc	326	10
12040	Liên Nghĩa	Lien Nghia	Xã Liên Nghĩa	Lien Nghia Commune	lien_nghia	326	10
12043	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	326	10
12046	Thắng Lợi	Thang Loi	Xã Thắng Lợi	Thang Loi Commune	thang_loi	326	10
27292	02	02	Phường 02	02 Ward	02	773	8
12049	Mễ Sở	Me So	Xã Mễ Sở	Me So Commune	me_so	326	10
12052	Yên Mỹ	Yen My	Thị trấn Yên Mỹ	Yen My Township	yen_my	327	9
12055	Giai Phạm	Giai Pham	Xã Giai Phạm	Giai Pham Commune	giai_pham	327	10
12058	Nghĩa Hiệp	Nghia Hiep	Xã Nghĩa Hiệp	Nghia Hiep Commune	nghia_hiep	327	10
12061	Đồng Than	Dong Than	Xã Đồng Than	Dong Than Commune	dong_than	327	10
12064	Ngọc Long	Ngoc Long	Xã Ngọc Long	Ngoc Long Commune	ngoc_long	327	10
12067	Liêu Xá	Lieu Xa	Xã Liêu Xá	Lieu Xa Commune	lieu_xa	327	10
12070	Hoàn Long	Hoan Long	Xã Hoàn Long	Hoan Long Commune	hoan_long	327	10
12073	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	327	10
12076	Thanh Long	Thanh Long	Xã Thanh Long	Thanh Long Commune	thanh_long	327	10
12079	Yên Phú	Yen Phu	Xã Yên Phú	Yen Phu Commune	yen_phu	327	10
12082	Việt Cường	Viet Cuong	Xã Việt Cường	Viet Cuong Commune	viet_cuong	327	10
12085	Trung Hòa	Trung Hoa	Xã Trung Hòa	Trung Hoa Commune	trung_hoa	327	10
12088	Yên Hòa	Yen Hoa	Xã Yên Hòa	Yen Hoa Commune	yen_hoa	327	10
12091	Minh Châu	Minh Chau	Xã Minh Châu	Minh Chau Commune	minh_chau	327	10
12094	Trung Hưng	Trung Hung	Xã Trung Hưng	Trung Hung Commune	trung_hung	327	10
12097	Lý Thường Kiệt	Ly Thuong Kiet	Xã Lý Thường Kiệt	Ly Thuong Kiet Commune	ly_thuong_kiet	327	10
12100	Tân Việt	Tan Viet	Xã Tân Việt	Tan Viet Commune	tan_viet	327	10
12103	Bần Yên Nhân	Ban Yen Nhan	Phường Bần Yên Nhân	Ban Yen Nhan Ward	ban_yen_nhan	328	8
12106	Phan Đình Phùng	Phan Dinh Phung	Phường Phan Đình Phùng	Phan Dinh Phung Ward	phan_dinh_phung	328	8
12109	Cẩm Xá	Cam Xa	Xã Cẩm Xá	Cam Xa Commune	cam_xa	328	10
12112	Dương Quang	Duong Quang	Xã Dương Quang	Duong Quang Commune	duong_quang	328	10
12115	Hòa Phong	Hoa Phong	Xã Hòa Phong	Hoa Phong Commune	hoa_phong	328	10
12118	Nhân Hòa	Nhan Hoa	Phường Nhân Hòa	Nhan Hoa Ward	nhan_hoa	328	8
12121	Dị Sử	Di Su	Phường Dị Sử	Di Su Ward	di_su	328	8
12124	Bạch Sam	Bach Sam	Phường Bạch Sam	Bach Sam Ward	bach_sam	328	8
12127	Minh Đức	Minh Duc	Phường Minh Đức	Minh Duc Ward	minh_duc	328	8
12130	Phùng Chí Kiên	Phung Chi Kien	Phường Phùng Chí Kiên	Phung Chi Kien Ward	phung_chi_kien	328	8
12133	Xuân Dục	Xuan Duc	Xã Xuân Dục	Xuan Duc Commune	xuan_duc	328	10
12136	Ngọc Lâm	Ngoc Lam	Xã Ngọc Lâm	Ngoc Lam Commune	ngoc_lam	328	10
12139	Hưng Long	Hung Long	Xã Hưng Long	Hung Long Commune	hung_long	328	10
12142	Ân Thi	An Thi	Thị trấn Ân Thi	An Thi Township	an_thi	329	9
12145	Phù Ủng	Phu Ung	Xã Phù Ủng	Phu Ung Commune	phu_ung	329	10
12148	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	329	10
12151	Bãi Sậy	Bai Say	Xã Bãi Sậy	Bai Say Commune	bai_say	329	10
12154	Đào Dương	Dao Duong	Xã Đào Dương	Dao Duong Commune	dao_duong	329	10
12157	Tân Phúc	Tan Phuc	Xã Tân Phúc	Tan Phuc Commune	tan_phuc	329	10
12160	Vân Du	Van Du	Xã Vân Du	Van Du Commune	van_du	329	10
12163	Quang Vinh	Quang Vinh	Xã Quang Vinh	Quang Vinh Commune	quang_vinh	329	10
12166	Xuân Trúc	Xuan Truc	Xã Xuân Trúc	Xuan Truc Commune	xuan_truc	329	10
12169	Hoàng Hoa Thám	Hoang Hoa Tham	Xã Hoàng Hoa Thám	Hoang Hoa Tham Commune	hoang_hoa_tham	329	10
12172	Quảng Lãng	Quang Lang	Xã Quảng Lãng	Quang Lang Commune	quang_lang	329	10
12175	Văn Nhuệ	Van Nhue	Xã Văn Nhuệ	Van Nhue Commune	van_nhue	329	10
12178	Đặng Lễ	Dang Le	Xã Đặng Lễ	Dang Le Commune	dang_le	329	10
12181	Cẩm Ninh	Cam Ninh	Xã Cẩm Ninh	Cam Ninh Commune	cam_ninh	329	10
12184	Nguyễn Trãi	Nguyen Trai	Xã Nguyễn Trãi	Nguyen Trai Commune	nguyen_trai	329	10
12187	Đa Lộc	Da Loc	Xã Đa Lộc	Da Loc Commune	da_loc	329	10
12190	Hồ Tùng Mậu	Ho Tung Mau	Xã Hồ Tùng Mậu	Ho Tung Mau Commune	ho_tung_mau	329	10
12193	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	329	10
12196	Hồng Vân	Hong Van	Xã Hồng Vân	Hong Van Commune	hong_van	329	10
12199	Hồng Quang	Hong Quang	Xã Hồng Quang	Hong Quang Commune	hong_quang	329	10
12202	Hạ Lễ	Ha Le	Xã Hạ Lễ	Ha Le Commune	ha_le	329	10
12205	Khoái Châu	Khoai Chau	Thị trấn Khoái Châu	Khoai Chau Township	khoai_chau	330	9
12208	Đông Tảo	Dong Tao	Xã Đông Tảo	Dong Tao Commune	dong_tao	330	10
12211	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	330	10
12214	Dạ Trạch	Da Trach	Xã Dạ Trạch	Da Trach Commune	da_trach	330	10
12217	Hàm Tử	Ham Tu	Xã Hàm Tử	Ham Tu Commune	ham_tu	330	10
12220	Ông Đình	Ong Dinh	Xã Ông Đình	Ong Dinh Commune	ong_dinh	330	10
12223	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	330	10
12226	Tứ Dân	Tu Dan	Xã Tứ Dân	Tu Dan Commune	tu_dan	330	10
12229	An Vĩ	An Vi	Xã An Vĩ	An Vi Commune	an_vi	330	10
12232	Đông Kết	Dong Ket	Xã Đông Kết	Dong Ket Commune	dong_ket	330	10
12235	Bình Kiều	Binh Kieu	Xã Bình Kiều	Binh Kieu Commune	binh_kieu	330	10
12238	Dân Tiến	Dan Tien	Xã Dân Tiến	Dan Tien Commune	dan_tien	330	10
12241	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	330	10
12244	Hồng Tiến	Hong Tien	Xã Hồng Tiến	Hong Tien Commune	hong_tien	330	10
12247	Tân Châu	Tan Chau	Xã Tân Châu	Tan Chau Commune	tan_chau	330	10
12250	Liên Khê	Lien Khe	Xã Liên Khê	Lien Khe Commune	lien_khe	330	10
12253	Phùng Hưng	Phung Hung	Xã Phùng Hưng	Phung Hung Commune	phung_hung	330	10
12256	Việt Hòa	Viet Hoa	Xã Việt Hòa	Viet Hoa Commune	viet_hoa	330	10
12259	Đông Ninh	Dong Ninh	Xã Đông Ninh	Dong Ninh Commune	dong_ninh	330	10
12262	Đại Tập	Dai Tap	Xã Đại Tập	Dai Tap Commune	dai_tap	330	10
12265	Chí Tân	Chi Tan	Xã Chí Tân	Chi Tan Commune	chi_tan	330	10
12268	Đại Hưng	Dai Hung	Xã Đại Hưng	Dai Hung Commune	dai_hung	330	10
12271	Thuần Hưng	Thuan Hung	Xã Thuần Hưng	Thuan Hung Commune	thuan_hung	330	10
12274	Thành Công	Thanh Cong	Xã Thành Công	Thanh Cong Commune	thanh_cong	330	10
12277	Nhuế Dương	Nhue Duong	Xã Nhuế Dương	Nhue Duong Commune	nhue_duong	330	10
12280	Lương Bằng	Luong Bang	Thị trấn Lương Bằng	Luong Bang Township	luong_bang	331	9
12283	Nghĩa Dân	Nghia Dan	Xã Nghĩa Dân	Nghia Dan Commune	nghia_dan	331	10
12286	Toàn Thắng	Toan Thang	Xã Toàn Thắng	Toan Thang Commune	toan_thang	331	10
12289	Vĩnh Xá	Vinh Xa	Xã Vĩnh Xá	Vinh Xa Commune	vinh_xa	331	10
12292	Phạm Ngũ Lão	Pham Ngu Lao	Xã Phạm Ngũ Lão	Pham Ngu Lao Commune	pham_ngu_lao	331	10
12295	Thọ Vinh	Tho Vinh	Xã Thọ Vinh	Tho Vinh Commune	tho_vinh	331	10
12298	Đồng Thanh	Dong Thanh	Xã Đồng Thanh	Dong Thanh Commune	dong_thanh	331	10
12301	Song Mai	Song Mai	Xã Song Mai	Song Mai Commune	song_mai	331	10
12304	Chính Nghĩa	Chinh Nghia	Xã Chính Nghĩa	Chinh Nghia Commune	chinh_nghia	331	10
27295	15	15	Phường 15	15 Ward	15	773	8
12307	Nhân La	Nhan La	Xã Nhân La	Nhan La Commune	nhan_la	331	10
12310	Phú Thịnh	Phu Thinh	Xã Phú Thịnh	Phu Thinh Commune	phu_thinh	331	10
12313	Mai Động	Mai Dong	Xã Mai Động	Mai Dong Commune	mai_dong	331	10
12316	Đức Hợp	Duc Hop	Xã Đức Hợp	Duc Hop Commune	duc_hop	331	10
12319	Hùng An	Hung An	Xã Hùng An	Hung An Commune	hung_an	331	10
12322	Ngọc Thanh	Ngoc Thanh	Xã Ngọc Thanh	Ngoc Thanh Commune	ngoc_thanh	331	10
12325	Vũ Xá	Vu Xa	Xã Vũ Xá	Vu Xa Commune	vu_xa	331	10
12328	Hiệp Cường	Hiep Cuong	Xã Hiệp Cường	Hiep Cuong Commune	hiep_cuong	331	10
12337	Vương	Vuong	Thị trấn Vương	Vuong Township	vuong	332	9
12340	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	332	10
12343	Ngô Quyền	Ngo Quyen	Xã Ngô Quyền	Ngo Quyen Commune	ngo_quyen	332	10
12346	Nhật Tân	Nhat Tan	Xã Nhật Tân	Nhat Tan Commune	nhat_tan	332	10
12349	Dị Chế	Di Che	Xã Dị Chế	Di Che Commune	di_che	332	10
12352	Lệ Xá	Le Xa	Xã Lệ Xá	Le Xa Commune	le_xa	332	10
12355	An Viên	An Vien	Xã An Viên	An Vien Commune	an_vien	332	10
12358	Đức Thắng	Duc Thang	Xã Đức Thắng	Duc Thang Commune	duc_thang	332	10
12361	Trung Dũng	Trung Dung	Xã Trung Dũng	Trung Dung Commune	trung_dung	332	10
12364	Hải Triều	Hai Trieu	Xã Hải Triều	Hai Trieu Commune	hai_trieu	332	10
12367	Thủ Sỹ	Thu Sy	Xã Thủ Sỹ	Thu Sy Commune	thu_sy	332	10
12370	Thiện Phiến	Thien Phien	Xã Thiện Phiến	Thien Phien Commune	thien_phien	332	10
12373	Thụy Lôi	Thuy Loi	Xã Thụy Lôi	Thuy Loi Commune	thuy_loi	332	10
12376	Cương Chính	Cuong Chinh	Xã Cương Chính	Cuong Chinh Commune	cuong_chinh	332	10
12379	Minh Phượng	Minh Phuong	Xã Minh Phượng	Minh Phuong Commune	minh_phuong	332	10
12391	Trần Cao	Tran Cao	Thị trấn Trần Cao	Tran Cao Township	tran_cao	333	9
12394	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	333	10
12397	Phan Sào Nam	Phan Sao Nam	Xã Phan Sào Nam	Phan Sao Nam Commune	phan_sao_nam	333	10
12400	Quang Hưng	Quang Hung	Xã Quang Hưng	Quang Hung Commune	quang_hung	333	10
12403	Minh Hoàng	Minh Hoang	Xã Minh Hoàng	Minh Hoang Commune	minh_hoang	333	10
12406	Đoàn Đào	Doan Dao	Xã Đoàn Đào	Doan Dao Commune	doan_dao	333	10
12409	Tống Phan	Tong Phan	Xã Tống Phan	Tong Phan Commune	tong_phan	333	10
12412	Đình Cao	Dinh Cao	Xã Đình Cao	Dinh Cao Commune	dinh_cao	333	10
12415	Nhật Quang	Nhat Quang	Xã Nhật Quang	Nhat Quang Commune	nhat_quang	333	10
12418	Tiền Tiến	Tien Tien	Xã Tiền Tiến	Tien Tien Commune	tien_tien	333	10
12421	Tam Đa	Tam Da	Xã Tam Đa	Tam Da Commune	tam_da	333	10
12424	Minh Tiến	Minh Tien	Xã Minh Tiến	Minh Tien Commune	minh_tien	333	10
12427	Nguyên Hòa	Nguyen Hoa	Xã Nguyên Hòa	Nguyen Hoa Commune	nguyen_hoa	333	10
12430	Tống Trân	Tong Tran	Xã Tống Trân	Tong Tran Commune	tong_tran	333	10
12433	Lê Hồng Phong	Le Hong Phong	Phường Lê Hồng Phong	Le Hong Phong Ward	le_hong_phong	336	8
12436	Bồ Xuyên	Bo Xuyen	Phường Bồ Xuyên	Bo Xuyen Ward	bo_xuyen	336	8
12439	Đề Thám	De Tham	Phường Đề Thám	De Tham Ward	de_tham	336	8
12442	Kỳ Bá	Ky Ba	Phường Kỳ Bá	Ky Ba Ward	ky_ba	336	8
12445	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	336	8
12448	Phú Khánh	Phu Khanh	Phường Phú Khánh	Phu Khanh Ward	phu_khanh	336	8
12451	Tiền Phong	Tien Phong	Phường Tiền Phong	Tien Phong Ward	tien_phong	336	8
12452	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	336	8
12454	Trần Lãm	Tran Lam	Phường Trần Lãm	Tran Lam Ward	tran_lam	336	8
12457	Đông Hòa	Dong Hoa	Xã Đông Hòa	Dong Hoa Commune	dong_hoa	336	10
12460	Hoàng Diệu	Hoang Dieu	Phường Hoàng Diệu	Hoang Dieu Ward	hoang_dieu	336	8
12463	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	336	10
12466	Vũ Phúc	Vu Phuc	Xã Vũ Phúc	Vu Phuc Commune	vu_phuc	336	10
12469	Vũ Chính	Vu Chinh	Xã Vũ Chính	Vu Chinh Commune	vu_chinh	336	10
12817	Đông Mỹ	Dong My	Xã Đông Mỹ	Dong My Commune	dong_my	336	10
12820	Đông Thọ	Dong Tho	Xã Đông Thọ	Dong Tho Commune	dong_tho	336	10
13084	Vũ Đông	Vu Dong	Xã Vũ Đông	Vu Dong Commune	vu_dong	336	10
13108	Vũ Lạc	Vu Lac	Xã Vũ Lạc	Vu Lac Commune	vu_lac	336	10
13225	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	336	10
12472	Quỳnh Côi	Quynh Coi	Thị trấn Quỳnh Côi	Quynh Coi Township	quynh_coi	338	9
12475	An Khê	An Khe	Xã An Khê	An Khe Commune	an_khe	338	10
12478	An Đồng	An Dong	Xã An Đồng	An Dong Commune	an_dong	338	10
12481	Quỳnh Hoa	Quynh Hoa	Xã Quỳnh Hoa	Quynh Hoa Commune	quynh_hoa	338	10
12484	Quỳnh Lâm	Quynh Lam	Xã Quỳnh Lâm	Quynh Lam Commune	quynh_lam	338	10
12487	Quỳnh Thọ	Quynh Tho	Xã Quỳnh Thọ	Quynh Tho Commune	quynh_tho	338	10
12490	An Hiệp	An Hiep	Xã An Hiệp	An Hiep Commune	an_hiep	338	10
12493	Quỳnh Hoàng	Quynh Hoang	Xã Quỳnh Hoàng	Quynh Hoang Commune	quynh_hoang	338	10
12496	Quỳnh Giao	Quynh Giao	Xã Quỳnh Giao	Quynh Giao Commune	quynh_giao	338	10
12499	An Thái	An Thai	Xã An Thái	An Thai Commune	an_thai	338	10
12502	An Cầu	An Cau	Xã An Cầu	An Cau Commune	an_cau	338	10
12505	Quỳnh Hồng	Quynh Hong	Xã Quỳnh Hồng	Quynh Hong Commune	quynh_hong	338	10
12508	Quỳnh Khê	Quynh Khe	Xã Quỳnh Khê	Quynh Khe Commune	quynh_khe	338	10
12511	Quỳnh Minh	Quynh Minh	Xã Quỳnh Minh	Quynh Minh Commune	quynh_minh	338	10
12514	An Ninh	An Ninh	Xã An Ninh	An Ninh Commune	an_ninh	338	10
12517	Quỳnh Ngọc	Quynh Ngoc	Xã Quỳnh Ngọc	Quynh Ngoc Commune	quynh_ngoc	338	10
12520	Quỳnh Hải	Quynh Hai	Xã Quỳnh Hải	Quynh Hai Commune	quynh_hai	338	10
12523	An Bài	An Bai	Thị trấn An Bài	An Bai Township	an_bai	338	9
12526	An Ấp	An Ap	Xã An Ấp	An Ap Commune	an_ap	338	10
12529	Quỳnh Hội	Quynh Hoi	Xã Quỳnh Hội	Quynh Hoi Commune	quynh_hoi	338	10
12532	Châu Sơn	Chau Son	Xã Châu Sơn	Chau Son Commune	chau_son	338	10
12535	Quỳnh Mỹ	Quynh My	Xã Quỳnh Mỹ	Quynh My Commune	quynh_my	338	10
12538	An Quí	An Qui	Xã An Quí	An Qui Commune	an_qui	338	10
12541	An Thanh	An Thanh	Xã An Thanh	An Thanh Commune	an_thanh	338	10
12547	An Vũ	An Vu	Xã An Vũ	An Vu Commune	an_vu	338	10
12550	An Lễ	An Le	Xã An Lễ	An Le Commune	an_le	338	10
12553	Quỳnh Hưng	Quynh Hung	Xã Quỳnh Hưng	Quynh Hung Commune	quynh_hung	338	10
12556	Quỳnh Bảo	Quynh Bao	Xã Quỳnh Bảo	Quynh Bao Commune	quynh_bao	338	10
12559	An Mỹ	An My	Xã An Mỹ	An My Commune	an_my	338	10
12562	Quỳnh Nguyên	Quynh Nguyen	Xã Quỳnh Nguyên	Quynh Nguyen Commune	quynh_nguyen	338	10
12565	An Vinh	An Vinh	Xã An Vinh	An Vinh Commune	an_vinh	338	10
12568	Quỳnh Xá	Quynh Xa	Xã Quỳnh Xá	Quynh Xa Commune	quynh_xa	338	10
12571	An Dục	An Duc	Xã An Dục	An Duc Commune	an_duc	338	10
12574	Đông Hải	Dong Hai	Xã Đông Hải	Dong Hai Commune	dong_hai	338	10
12577	Quỳnh Trang	Quynh Trang	Xã Quỳnh Trang	Quynh Trang Commune	quynh_trang	338	10
12580	An Tràng	An Trang	Xã An Tràng	An Trang Commune	an_trang	338	10
12583	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	338	10
12586	Hưng Hà	Hung Ha	Thị trấn Hưng Hà	Hung Ha Township	hung_ha	339	9
12589	Điệp Nông	Diep Nong	Xã Điệp Nông	Diep Nong Commune	diep_nong	339	10
12592	Tân Lễ	Tan Le	Xã Tân Lễ	Tan Le Commune	tan_le	339	10
12595	Cộng Hòa	Cong Hoa	Xã Cộng Hòa	Cong Hoa Commune	cong_hoa	339	10
12598	Dân Chủ	Dan Chu	Xã Dân Chủ	Dan Chu Commune	dan_chu	339	10
12601	Canh Tân	Canh Tan	Xã Canh Tân	Canh Tan Commune	canh_tan	339	10
12604	Hòa Tiến	Hoa Tien	Xã Hòa Tiến	Hoa Tien Commune	hoa_tien	339	10
12607	Hùng Dũng	Hung Dung	Xã Hùng Dũng	Hung Dung Commune	hung_dung	339	10
12610	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	339	10
12613	Hưng Nhân	Hung Nhan	Thị trấn Hưng Nhân	Hung Nhan Township	hung_nhan	339	9
12616	Đoan Hùng	Doan Hung	Xã Đoan Hùng	Doan Hung Commune	doan_hung	339	10
12619	Duyên Hải	Duyen Hai	Xã Duyên Hải	Duyen Hai Commune	duyen_hai	339	10
12622	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	339	10
12625	Văn Cẩm	Van Cam	Xã Văn Cẩm	Van Cam Commune	van_cam	339	10
12628	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	339	10
12631	Đông Đô	Dong Do	Xã Đông Đô	Dong Do Commune	dong_do	339	10
12634	Phúc Khánh	Phuc Khanh	Xã Phúc Khánh	Phuc Khanh Commune	phuc_khanh	339	10
12637	Liên Hiệp	Lien Hiep	Xã Liên Hiệp	Lien Hiep Commune	lien_hiep	339	10
12640	Tây Đô	Tay Do	Xã Tây Đô	Tay Do Commune	tay_do	339	10
12643	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	339	10
12646	Tiến Đức	Tien Duc	Xã Tiến Đức	Tien Duc Commune	tien_duc	339	10
12649	Thái Hưng	Thai Hung	Xã Thái Hưng	Thai Hung Commune	thai_hung	339	10
12652	Thái Phương	Thai Phuong	Xã Thái Phương	Thai Phuong Commune	thai_phuong	339	10
12655	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	339	10
12656	Chi Lăng	Chi Lang	Xã Chi Lăng	Chi Lang Commune	chi_lang	339	10
12658	Minh Khai	Minh Khai	Xã Minh Khai	Minh Khai Commune	minh_khai	339	10
12661	Hồng An	Hong An	Xã Hồng An	Hong An Commune	hong_an	339	10
12664	Kim Chung	Kim Chung	Xã Kim Chung	Kim Chung Commune	kim_chung	339	10
12667	Hồng Lĩnh	Hong Linh	Xã Hồng Lĩnh	Hong Linh Commune	hong_linh	339	10
12670	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	339	10
12673	Văn Lang	Van Lang	Xã Văn Lang	Van Lang Commune	van_lang	339	10
12676	Độc Lập	Doc Lap	Xã Độc Lập	Doc Lap Commune	doc_lap	339	10
12679	Chí Hòa	Chi Hoa	Xã Chí Hòa	Chi Hoa Commune	chi_hoa	339	10
12682	Minh Hòa	Minh Hoa	Xã Minh Hòa	Minh Hoa Commune	minh_hoa	339	10
12685	Hồng Minh	Hong Minh	Xã Hồng Minh	Hong Minh Commune	hong_minh	339	10
12688	Đông Hưng	Dong Hung	Thị trấn Đông Hưng	Dong Hung Township	dong_hung	340	9
12691	Đô Lương	Do Luong	Xã Đô Lương	Do Luong Commune	do_luong	340	10
12694	Đông Phương	Dong Phuong	Xã Đông Phương	Dong Phuong Commune	dong_phuong	340	10
12697	Liên Giang	Lien Giang	Xã Liên Giang	Lien Giang Commune	lien_giang	340	10
12700	An Châu	An Chau	Xã An Châu	An Chau Commune	an_chau	340	10
12703	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	340	10
12706	Đông Cường	Dong Cuong	Xã Đông Cường	Dong Cuong Commune	dong_cuong	340	10
12709	Phú Lương	Phu Luong	Xã Phú Lương	Phu Luong Commune	phu_luong	340	10
12712	Mê Linh	Me Linh	Xã Mê Linh	Me Linh Commune	me_linh	340	10
12715	Lô Giang	Lo Giang	Xã Lô Giang	Lo Giang Commune	lo_giang	340	10
12718	Đông La	Dong La	Xã Đông La	Dong La Commune	dong_la	340	10
12721	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	340	10
12724	Đông Xá	Dong Xa	Xã Đông Xá	Dong Xa Commune	dong_xa	340	10
12727	Chương Dương	Chuong Duong	Xã Chương Dương	Chuong Duong Commune	chuong_duong	340	10
12730	Nguyên Xá	Nguyen Xa	Xã Nguyên Xá	Nguyen Xa Commune	nguyen_xa	340	10
12733	Phong Châu	Phong Chau	Xã Phong Châu	Phong Chau Commune	phong_chau	340	10
12736	Hợp Tiến	Hop Tien	Xã Hợp Tiến	Hop Tien Commune	hop_tien	340	10
12739	Hồng Việt	Hong Viet	Xã Hồng Việt	Hong Viet Commune	hong_viet	340	10
12745	Hà Giang	Ha Giang	Xã Hà Giang	Ha Giang Commune	ha_giang	340	10
12748	Đông Kinh	Dong Kinh	Xã Đông Kinh	Dong Kinh Commune	dong_kinh	340	10
12751	Đông Hợp	Dong Hop	Xã Đông Hợp	Dong Hop Commune	dong_hop	340	10
12754	Thăng Long	Thang Long	Xã Thăng Long	Thang Long Commune	thang_long	340	10
12757	Đông Các	Dong Cac	Xã Đông Các	Dong Cac Commune	dong_cac	340	10
12760	Phú Châu	Phu Chau	Xã Phú Châu	Phu Chau Commune	phu_chau	340	10
12763	Liên Hoa	Lien Hoa	Xã Liên Hoa	Lien Hoa Commune	lien_hoa	340	10
12769	Đông Tân	Dong Tan	Xã Đông Tân	Dong Tan Commune	dong_tan	340	10
12772	Đông Vinh	Dong Vinh	Xã Đông Vinh	Dong Vinh Commune	dong_vinh	340	10
12775	Đông Động	Dong Dong	Xã Đông Động	Dong Dong Commune	dong_dong	340	10
12778	Hồng Bạch	Hong Bach	Xã Hồng Bạch	Hong Bach Commune	hong_bach	340	10
12784	Trọng Quan	Trong Quan	Xã Trọng Quan	Trong Quan Commune	trong_quan	340	10
12790	Hồng Giang	Hong Giang	Xã Hồng Giang	Hong Giang Commune	hong_giang	340	10
12793	Đông Quan	Dong Quan	Xã Đông Quan	Dong Quan Commune	dong_quan	340	10
12796	Đông Quang	Dong Quang	Xã Đông Quang	Dong Quang Commune	dong_quang	340	10
12799	Đông Xuân	Dong Xuan	Xã Đông Xuân	Dong Xuan Commune	dong_xuan	340	10
12802	Đông Á	Dong A	Xã Đông Á	Dong A Commune	dong_a	340	10
12808	Đông Hoàng	Dong Hoang	Xã Đông Hoàng	Dong Hoang Commune	dong_hoang	340	10
12811	Đông Dương	Dong Duong	Xã Đông Dương	Dong Duong Commune	dong_duong	340	10
12823	Minh Phú	Minh Phu	Xã Minh Phú	Minh Phu Commune	minh_phu	340	10
12826	Diêm Điền	Diem Dien	Thị trấn Diêm Điền	Diem Dien Township	diem_dien	341	9
12832	Thụy Trường	Thuy Truong	Xã Thụy Trường	Thuy Truong Commune	thuy_truong	341	10
12841	Hồng Dũng	Hong Dung	Xã Hồng Dũng	Hong Dung Commune	hong_dung	341	10
12844	Thụy Quỳnh	Thuy Quynh	Xã Thụy Quỳnh	Thuy Quynh Commune	thuy_quynh	341	10
12847	An Tân	An Tan	Xã An Tân	An Tan Commune	an_tan	341	10
12850	Thụy Ninh	Thuy Ninh	Xã Thụy Ninh	Thuy Ninh Commune	thuy_ninh	341	10
12853	Thụy Hưng	Thuy Hung	Xã Thụy Hưng	Thuy Hung Commune	thuy_hung	341	10
12856	Thụy Việt	Thuy Viet	Xã Thụy Việt	Thuy Viet Commune	thuy_viet	341	10
12859	Thụy Văn	Thuy Van	Xã Thụy Văn	Thuy Van Commune	thuy_van	341	10
12862	Thụy Xuân	Thuy Xuan	Xã Thụy Xuân	Thuy Xuan Commune	thuy_xuan	341	10
12865	Dương Phúc	Duong Phuc	Xã Dương Phúc	Duong Phuc Commune	duong_phuc	341	10
12868	Thụy Trình	Thuy Trinh	Xã Thụy Trình	Thuy Trinh Commune	thuy_trinh	341	10
12871	Thụy Bình	Thuy Binh	Xã Thụy Bình	Thuy Binh Commune	thuy_binh	341	10
12874	Thụy Chính	Thuy Chinh	Xã Thụy Chính	Thuy Chinh Commune	thuy_chinh	341	10
12877	Thụy Dân	Thuy Dan	Xã Thụy Dân	Thuy Dan Commune	thuy_dan	341	10
12880	Thụy Hải	Thuy Hai	Xã Thụy Hải	Thuy Hai Commune	thuy_hai	341	10
12889	Thụy Liên	Thuy Lien	Xã Thụy Liên	Thuy Lien Commune	thuy_lien	341	10
12892	Thụy Duyên	Thuy Duyen	Xã Thụy Duyên	Thuy Duyen Commune	thuy_duyen	341	10
12898	Thụy Thanh	Thuy Thanh	Xã Thụy Thanh	Thuy Thanh Commune	thuy_thanh	341	10
12901	Thụy Sơn	Thuy Son	Xã Thụy Sơn	Thuy Son Commune	thuy_son	341	10
12904	Thụy Phong	Thuy Phong	Xã Thụy Phong	Thuy Phong Commune	thuy_phong	341	10
12907	Thái Thượng	Thai Thuong	Xã Thái Thượng	Thai Thuong Commune	thai_thuong	341	10
12910	Thái Nguyên	Thai Nguyen	Xã Thái Nguyên	Thai Nguyen Commune	thai_nguyen	341	10
12916	Dương Hồng  Thủy	Duong Hong  Thuy	Xã Dương Hồng  Thủy	Duong Hong  Thuy Commune	duong_hong__thuy	341	10
12919	Thái Giang	Thai Giang	Xã Thái Giang	Thai Giang Commune	thai_giang	341	10
12922	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	341	10
12925	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	341	10
12934	Thái Phúc	Thai Phuc	Xã Thái Phúc	Thai Phuc Commune	thai_phuc	341	10
12937	Thái Hưng	Thai Hung	Xã Thái Hưng	Thai Hung Commune	thai_hung	341	10
12940	Thái Đô	Thai Do	Xã Thái Đô	Thai Do Commune	thai_do	341	10
12943	Thái Xuyên	Thai Xuyen	Xã Thái Xuyên	Thai Xuyen Commune	thai_xuyen	341	10
12949	 Mỹ Lộc	 My Loc	Xã  Mỹ Lộc	 My Loc Commune	_my_loc	341	10
12958	Tân Học	Tan Hoc	Xã Tân Học	Tan Hoc Commune	tan_hoc	341	10
12961	Thái Thịnh	Thai Thinh	Xã Thái Thịnh	Thai Thinh Commune	thai_thinh	341	10
12964	Thuần Thành	Thuan Thanh	Xã Thuần Thành	Thuan Thanh Commune	thuan_thanh	341	10
12967	Thái Thọ	Thai Tho	Xã Thái Thọ	Thai Tho Commune	thai_tho	341	10
12970	Tiền Hải	Tien Hai	Thị trấn Tiền Hải	Tien Hai Township	tien_hai	342	9
12976	Đông Trà	Dong Tra	Xã Đông Trà	Dong Tra Commune	dong_tra	342	10
12979	Đông Long	Dong Long	Xã Đông Long	Dong Long Commune	dong_long	342	10
12982	Đông Quí	Dong Qui	Xã Đông Quí	Dong Qui Commune	dong_qui	342	10
12985	Vũ Lăng	Vu Lang	Xã Vũ Lăng	Vu Lang Commune	vu_lang	342	10
12988	Đông Xuyên	Dong Xuyen	Xã Đông Xuyên	Dong Xuyen Commune	dong_xuyen	342	10
12991	Tây Lương	Tay Luong	Xã Tây Lương	Tay Luong Commune	tay_luong	342	10
12994	Tây Ninh	Tay Ninh	Xã Tây Ninh	Tay Ninh Commune	tay_ninh	342	10
12997	Đông Trung	Dong Trung	Xã Đông Trung	Dong Trung Commune	dong_trung	342	10
13000	Đông Hoàng	Dong Hoang	Xã Đông Hoàng	Dong Hoang Commune	dong_hoang	342	10
13003	Đông Minh	Dong Minh	Xã Đông Minh	Dong Minh Commune	dong_minh	342	10
13009	Đông Phong	Dong Phong	Xã Đông Phong	Dong Phong Commune	dong_phong	342	10
13012	An Ninh	An Ninh	Xã An Ninh	An Ninh Commune	an_ninh	342	10
13018	Đông Cơ	Dong Co	Xã Đông Cơ	Dong Co Commune	dong_co	342	10
13021	Tây Giang	Tay Giang	Xã Tây Giang	Tay Giang Commune	tay_giang	342	10
13024	Đông Lâm	Dong Lam	Xã Đông Lâm	Dong Lam Commune	dong_lam	342	10
13027	Phương Công	Phuong Cong	Xã Phương Công	Phuong Cong Commune	phuong_cong	342	10
13030	Tây Phong	Tay Phong	Xã Tây Phong	Tay Phong Commune	tay_phong	342	10
13033	Tây Tiến	Tay Tien	Xã Tây Tiến	Tay Tien Commune	tay_tien	342	10
13036	Nam Cường	Nam Cuong	Xã Nam Cường	Nam Cuong Commune	nam_cuong	342	10
13039	Vân Trường	Van Truong	Xã Vân Trường	Van Truong Commune	van_truong	342	10
13042	Nam Thắng	Nam Thang	Xã Nam Thắng	Nam Thang Commune	nam_thang	342	10
13045	Nam Chính	Nam Chinh	Xã Nam Chính	Nam Chinh Commune	nam_chinh	342	10
13048	Bắc Hải	Bac Hai	Xã Bắc Hải	Bac Hai Commune	bac_hai	342	10
13051	Nam Thịnh	Nam Thinh	Xã Nam Thịnh	Nam Thinh Commune	nam_thinh	342	10
13054	Nam Hà	Nam Ha	Xã Nam Hà	Nam Ha Commune	nam_ha	342	10
13057	Nam Thanh	Nam Thanh	Xã Nam Thanh	Nam Thanh Commune	nam_thanh	342	10
13060	Nam Trung	Nam Trung	Xã Nam Trung	Nam Trung Commune	nam_trung	342	10
13063	Nam Hồng	Nam Hong	Xã Nam Hồng	Nam Hong Commune	nam_hong	342	10
13066	Nam Hưng	Nam Hung	Xã Nam Hưng	Nam Hung Commune	nam_hung	342	10
13069	Nam Hải	Nam Hai	Xã Nam Hải	Nam Hai Commune	nam_hai	342	10
13072	Nam Phú	Nam Phu	Xã Nam Phú	Nam Phu Commune	nam_phu	342	10
13075	Kiến Xương	Kien Xuong	Thị trấn Kiến Xương	Kien Xuong Township	kien_xuong	343	9
13078	Trà Giang	Tra Giang	Xã Trà Giang	Tra Giang Commune	tra_giang	343	10
13081	Quốc Tuấn	Quoc Tuan	Xã Quốc Tuấn	Quoc Tuan Commune	quoc_tuan	343	10
13087	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	343	10
13090	Tây Sơn	Tay Son	Xã Tây Sơn	Tay Son Commune	tay_son	343	10
13093	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	343	10
13096	Bình Nguyên	Binh Nguyen	Xã Bình Nguyên	Binh Nguyen Commune	binh_nguyen	343	10
13102	Lê Lợi	Le Loi	Xã Lê Lợi	Le Loi Commune	le_loi	343	10
13111	Vũ Lễ	Vu Le	Xã Vũ Lễ	Vu Le Commune	vu_le	343	10
13114	Thanh Tân	Thanh Tan	Xã Thanh Tân	Thanh Tan Commune	thanh_tan	343	10
13117	Thượng Hiền	Thuong Hien	Xã Thượng Hiền	Thuong Hien Commune	thuong_hien	343	10
13120	Nam Cao	Nam Cao	Xã Nam Cao	Nam Cao Commune	nam_cao	343	10
13123	Đình Phùng	Dinh Phung	Xã Đình Phùng	Dinh Phung Commune	dinh_phung	343	10
13126	Vũ Ninh	Vu Ninh	Xã Vũ Ninh	Vu Ninh Commune	vu_ninh	343	10
13129	Vũ An	Vu An	Xã Vũ An	Vu An Commune	vu_an	343	10
13132	Quang Lịch	Quang Lich	Xã Quang Lịch	Quang Lich Commune	quang_lich	343	10
13135	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	343	10
13138	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	343	10
13141	Vũ Quí	Vu Qui	Xã Vũ Quí	Vu Qui Commune	vu_qui	343	10
13144	Quang Bình	Quang Binh	Xã Quang Bình	Quang Binh Commune	quang_binh	343	10
13150	Vũ Trung	Vu Trung	Xã Vũ Trung	Vu Trung Commune	vu_trung	343	10
13153	Vũ Thắng	Vu Thang	Xã Vũ Thắng	Vu Thang Commune	vu_thang	343	10
13156	Vũ Công	Vu Cong	Xã Vũ Công	Vu Cong Commune	vu_cong	343	10
13159	Vũ Hòa	Vu Hoa	Xã Vũ Hòa	Vu Hoa Commune	vu_hoa	343	10
13162	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	343	10
13165	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	343	10
13171	Minh Quang	Minh Quang	Xã Minh Quang	Minh Quang Commune	minh_quang	343	10
13174	Vũ Bình	Vu Binh	Xã Vũ Bình	Vu Binh Commune	vu_binh	343	10
13177	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	343	10
13180	Nam Bình	Nam Binh	Xã Nam Bình	Nam Binh Commune	nam_binh	343	10
13183	Bình Thanh	Binh Thanh	Xã Bình Thanh	Binh Thanh Commune	binh_thanh	343	10
13186	Bình Định	Binh Dinh	Xã Bình Định	Binh Dinh Commune	binh_dinh	343	10
13189	Hồng Tiến	Hong Tien	Xã Hồng Tiến	Hong Tien Commune	hong_tien	343	10
13192	Vũ Thư	Vu Thu	Thị trấn Vũ Thư	Vu Thu Township	vu_thu	344	9
13195	Hồng Lý	Hong Ly	Xã Hồng Lý	Hong Ly Commune	hong_ly	344	10
13198	Đồng Thanh	Dong Thanh	Xã Đồng Thanh	Dong Thanh Commune	dong_thanh	344	10
13201	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	344	10
13204	Hiệp Hòa	Hiep Hoa	Xã Hiệp Hòa	Hiep Hoa Commune	hiep_hoa	344	10
13207	Phúc Thành	Phuc Thanh	Xã Phúc Thành	Phuc Thanh Commune	phuc_thanh	344	10
13210	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	344	10
13213	Song Lãng	Song Lang	Xã Song Lãng	Song Lang Commune	song_lang	344	10
13216	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	344	10
13219	Việt Hùng	Viet Hung	Xã Việt Hùng	Viet Hung Commune	viet_hung	344	10
13222	Minh Lãng	Minh Lang	Xã Minh Lãng	Minh Lang Commune	minh_lang	344	10
13228	Minh Khai	Minh Khai	Xã Minh Khai	Minh Khai Commune	minh_khai	344	10
13231	Dũng Nghĩa	Dung Nghia	Xã Dũng Nghĩa	Dung Nghia Commune	dung_nghia	344	10
13234	Minh Quang	Minh Quang	Xã Minh Quang	Minh Quang Commune	minh_quang	344	10
13237	Tam Quang	Tam Quang	Xã Tam Quang	Tam Quang Commune	tam_quang	344	10
13240	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	344	10
13243	Bách Thuận	Bach Thuan	Xã Bách Thuận	Bach Thuan Commune	bach_thuan	344	10
13246	Tự Tân	Tu Tan	Xã Tự Tân	Tu Tan Commune	tu_tan	344	10
13249	Song An	Song An	Xã Song An	Song An Commune	song_an	344	10
13252	Trung An	Trung An	Xã Trung An	Trung An Commune	trung_an	344	10
13255	Vũ Hội	Vu Hoi	Xã Vũ Hội	Vu Hoi Commune	vu_hoi	344	10
13258	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	344	10
13261	Nguyên Xá	Nguyen Xa	Xã Nguyên Xá	Nguyen Xa Commune	nguyen_xa	344	10
13264	Việt Thuận	Viet Thuan	Xã Việt Thuận	Viet Thuan Commune	viet_thuan	344	10
13267	Vũ Vinh	Vu Vinh	Xã Vũ Vinh	Vu Vinh Commune	vu_vinh	344	10
13270	Vũ Đoài	Vu Doai	Xã Vũ Đoài	Vu Doai Commune	vu_doai	344	10
13273	Vũ Tiến	Vu Tien	Xã Vũ Tiến	Vu Tien Commune	vu_tien	344	10
13276	Vũ Vân	Vu Van	Xã Vũ Vân	Vu Van Commune	vu_van	344	10
13279	Duy Nhất	Duy Nhat	Xã Duy Nhất	Duy Nhat Commune	duy_nhat	344	10
13282	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	344	10
13285	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	347	8
13288	Lương Khánh Thiện	Luong Khanh Thien	Phường Lương Khánh Thiện	Luong Khanh Thien Ward	luong_khanh_thien	347	8
13291	Lê Hồng Phong	Le Hong Phong	Phường Lê Hồng Phong	Le Hong Phong Ward	le_hong_phong	347	8
13294	Minh Khai	Minh Khai	Phường Minh Khai	Minh Khai Ward	minh_khai	347	8
13297	Hai Bà Trưng	Hai Ba Trung	Phường Hai Bà Trưng	Hai Ba Trung Ward	hai_ba_trung	347	8
13300	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	347	8
13303	Lam Hạ	Lam Ha	Phường Lam Hạ	Lam Ha Ward	lam_ha	347	8
13306	Phù Vân	Phu Van	Xã Phù Vân	Phu Van Commune	phu_van	347	10
13309	Liêm Chính	Liem Chinh	Phường Liêm Chính	Liem Chinh Ward	liem_chinh	347	8
13312	Liêm Chung	Liem Chung	Xã Liêm Chung	Liem Chung Commune	liem_chung	347	10
13315	Thanh Châu	Thanh Chau	Phường Thanh Châu	Thanh Chau Ward	thanh_chau	347	8
13318	Châu Sơn	Chau Son	Phường Châu Sơn	Chau Son Ward	chau_son	347	8
13366	Tiên Tân	Tien Tan	Xã Tiên Tân	Tien Tan Commune	tien_tan	347	10
13372	Tiên Hiệp	Tien Hiep	Xã Tiên Hiệp	Tien Hiep Commune	tien_hiep	347	10
13381	Tiên Hải	Tien Hai	Xã Tiên Hải	Tien Hai Commune	tien_hai	347	10
13426	Kim Bình	Kim Binh	Xã Kim Bình	Kim Binh Commune	kim_binh	347	10
13444	Liêm Tuyền	Liem Tuyen	Xã Liêm Tuyền	Liem Tuyen Commune	liem_tuyen	347	10
13447	Liêm Tiết	Liem Tiet	Xã Liêm Tiết	Liem Tiet Commune	liem_tiet	347	10
13459	Thanh Tuyền	Thanh Tuyen	Phường Thanh Tuyền	Thanh Tuyen Ward	thanh_tuyen	347	8
13507	Đinh Xá	Dinh Xa	Xã Đinh Xá	Dinh Xa Commune	dinh_xa	347	10
13513	Trịnh Xá	Trinh Xa	Xã Trịnh Xá	Trinh Xa Commune	trinh_xa	347	10
13321	Đồng Văn	Dong Van	Phường Đồng Văn	Dong Van Ward	dong_van	349	8
13324	Hòa Mạc	Hoa Mac	Phường Hòa Mạc	Hoa Mac Ward	hoa_mac	349	8
13327	Mộc Bắc	Moc Bac	Xã Mộc Bắc	Moc Bac Commune	moc_bac	349	10
13330	Châu Giang	Chau Giang	Phường Châu Giang	Chau Giang Ward	chau_giang	349	8
13333	Bạch Thượng	Bach Thuong	Phường Bạch Thượng	Bach Thuong Ward	bach_thuong	349	8
13336	Duy Minh	Duy Minh	Phường Duy Minh	Duy Minh Ward	duy_minh	349	8
13339	Mộc Nam	Moc Nam	Xã Mộc Nam	Moc Nam Commune	moc_nam	349	10
13342	Duy Hải	Duy Hai	Phường Duy Hải	Duy Hai Ward	duy_hai	349	8
13345	Chuyên Ngoại	Chuyen Ngoai	Xã Chuyên Ngoại	Chuyen Ngoai Commune	chuyen_ngoai	349	10
13348	Yên Bắc	Yen Bac	Phường Yên Bắc	Yen Bac Ward	yen_bac	349	8
13351	Trác Văn	Trac Van	Xã Trác Văn	Trac Van Commune	trac_van	349	10
13354	Tiên Nội	Tien Noi	Phường Tiên Nội	Tien Noi Ward	tien_noi	349	8
13357	Hoàng Đông	Hoang Dong	Phường Hoàng Đông	Hoang Dong Ward	hoang_dong	349	8
13360	Yên Nam	Yen Nam	Xã Yên Nam	Yen Nam Commune	yen_nam	349	10
13363	Tiên Ngoại	Tien Ngoai	Xã Tiên Ngoại	Tien Ngoai Commune	tien_ngoai	349	10
13369	Tiên Sơn	Tien Son	Xã Tiên Sơn	Tien Son Commune	tien_son	349	10
13384	Quế	Que	Thị trấn Quế	Que Township	que	350	9
13387	Nguyễn Úy	Nguyen Uy	Xã Nguyễn Úy	Nguyen Uy Commune	nguyen_uy	350	10
13390	Đại Cương	Dai Cuong	Xã Đại Cương	Dai Cuong Commune	dai_cuong	350	10
13393	Lê Hồ	Le Ho	Xã Lê Hồ	Le Ho Commune	le_ho	350	10
13396	Tượng Lĩnh	Tuong Linh	Xã Tượng Lĩnh	Tuong Linh Commune	tuong_linh	350	10
13399	Nhật Tựu	Nhat Tuu	Xã Nhật Tựu	Nhat Tuu Commune	nhat_tuu	350	10
13402	Nhật Tân	Nhat Tan	Xã Nhật Tân	Nhat Tan Commune	nhat_tan	350	10
13405	Đồng Hóa	Dong Hoa	Xã Đồng Hóa	Dong Hoa Commune	dong_hoa	350	10
13408	Hoàng Tây	Hoang Tay	Xã Hoàng Tây	Hoang Tay Commune	hoang_tay	350	10
13411	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	350	10
13414	Thụy Lôi	Thuy Loi	Xã Thụy Lôi	Thuy Loi Commune	thuy_loi	350	10
13417	Văn Xá	Van Xa	Xã Văn Xá	Van Xa Commune	van_xa	350	10
13420	Khả Phong	Kha Phong	Xã Khả Phong	Kha Phong Commune	kha_phong	350	10
13423	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	350	10
13429	Ba Sao	Ba Sao	Thị trấn Ba Sao	Ba Sao Township	ba_sao	350	9
13432	Liên Sơn	Lien Son	Xã Liên Sơn	Lien Son Commune	lien_son	350	10
13435	Thi Sơn	Thi Son	Xã Thi Sơn	Thi Son Commune	thi_son	350	10
13438	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	350	10
13441	Kiện Khê	Kien Khe	Thị trấn Kiện Khê	Kien Khe Township	kien_khe	351	9
13450	Liêm Phong	Liem Phong	Xã Liêm Phong	Liem Phong Commune	liem_phong	351	10
13453	Thanh Hà	Thanh Ha	Xã Thanh Hà	Thanh Ha Commune	thanh_ha	351	10
13456	Liêm Cần	Liem Can	Xã Liêm Cần	Liem Can Commune	liem_can	351	10
13465	Liêm Thuận	Liem Thuan	Xã Liêm Thuận	Liem Thuan Commune	liem_thuan	351	10
13468	Thanh Thủy	Thanh Thuy	Xã Thanh Thủy	Thanh Thuy Commune	thanh_thuy	351	10
13471	Thanh Phong	Thanh Phong	Xã Thanh Phong	Thanh Phong Commune	thanh_phong	351	10
13474	Tân Thanh	Tan Thanh	Thị trấn Tân Thanh	Tan Thanh Township	tan_thanh	351	9
13477	Thanh Tân	Thanh Tan	Xã Thanh Tân	Thanh Tan Commune	thanh_tan	351	10
13480	Liêm Túc	Liem Tuc	Xã Liêm Túc	Liem Tuc Commune	liem_tuc	351	10
13483	Liêm Sơn	Liem Son	Xã Liêm Sơn	Liem Son Commune	liem_son	351	10
13486	Thanh Hương	Thanh Huong	Xã Thanh Hương	Thanh Huong Commune	thanh_huong	351	10
13489	Thanh Nghị	Thanh Nghi	Xã Thanh Nghị	Thanh Nghi Commune	thanh_nghi	351	10
13492	Thanh Tâm	Thanh Tam	Xã Thanh Tâm	Thanh Tam Commune	thanh_tam	351	10
13495	Thanh Nguyên	Thanh Nguyen	Xã Thanh Nguyên	Thanh Nguyen Commune	thanh_nguyen	351	10
13498	Thanh Hải	Thanh Hai	Xã Thanh Hải	Thanh Hai Commune	thanh_hai	351	10
13501	Bình Mỹ	Binh My	Thị trấn Bình Mỹ	Binh My Township	binh_my	352	9
13504	Bình Nghĩa	Binh Nghia	Xã Bình Nghĩa	Binh Nghia Commune	binh_nghia	352	10
13510	Tràng An	Trang An	Xã Tràng An	Trang An Commune	trang_an	352	10
13516	Đồng Du	Dong Du	Xã Đồng Du	Dong Du Commune	dong_du	352	10
13519	Ngọc Lũ	Ngoc Lu	Xã Ngọc Lũ	Ngoc Lu Commune	ngoc_lu	352	10
13522	Hưng Công	Hung Cong	Xã Hưng Công	Hung Cong Commune	hung_cong	352	10
13525	Đồn Xá	Don Xa	Xã Đồn Xá	Don Xa Commune	don_xa	352	10
13528	An Ninh	An Ninh	Xã An Ninh	An Ninh Commune	an_ninh	352	10
13531	Bồ Đề	Bo De	Xã Bồ Đề	Bo De Commune	bo_de	352	10
13534	Bối Cầu	Boi Cau	Xã Bối Cầu	Boi Cau Commune	boi_cau	352	10
13540	An Nội	An Noi	Xã An Nội	An Noi Commune	an_noi	352	10
13543	Vũ Bản	Vu Ban	Xã Vũ Bản	Vu Ban Commune	vu_ban	352	10
13546	Trung Lương	Trung Luong	Xã Trung Lương	Trung Luong Commune	trung_luong	352	10
13552	An Đổ	An Do	Xã An Đổ	An Do Commune	an_do	352	10
13555	La Sơn	La Son	Xã La Sơn	La Son Commune	la_son	352	10
13558	Tiêu Động	Tieu Dong	Xã Tiêu Động	Tieu Dong Commune	tieu_dong	352	10
13561	An Lão	An Lao	Xã An Lão	An Lao Commune	an_lao	352	10
13567	Hợp Lý	Hop Ly	Xã Hợp Lý	Hop Ly Commune	hop_ly	353	10
13570	Nguyên Lý	Nguyen Ly	Xã Nguyên Lý	Nguyen Ly Commune	nguyen_ly	353	10
13573	Chính Lý	Chinh Ly	Xã Chính Lý	Chinh Ly Commune	chinh_ly	353	10
13576	Chân Lý	Chan Ly	Xã Chân Lý	Chan Ly Commune	chan_ly	353	10
13579	Đạo Lý	Dao Ly	Xã Đạo Lý	Dao Ly Commune	dao_ly	353	10
13582	Công Lý	Cong Ly	Xã Công Lý	Cong Ly Commune	cong_ly	353	10
13585	Văn Lý	Van Ly	Xã Văn Lý	Van Ly Commune	van_ly	353	10
13588	Bắc Lý	Bac Ly	Xã Bắc Lý	Bac Ly Commune	bac_ly	353	10
13591	Đức Lý	Duc Ly	Xã Đức Lý	Duc Ly Commune	duc_ly	353	10
13594	Trần Hưng Đạo	Tran Hung Dao	Xã Trần Hưng Đạo	Tran Hung Dao Commune	tran_hung_dao	353	10
13597	Vĩnh Trụ	Vinh Tru	Thị trấn Vĩnh Trụ	Vinh Tru Township	vinh_tru	353	9
13600	Nhân Thịnh	Nhan Thinh	Xã Nhân Thịnh	Nhan Thinh Commune	nhan_thinh	353	10
13606	Nhân Khang	Nhan Khang	Xã Nhân Khang	Nhan Khang Commune	nhan_khang	353	10
13609	Nhân Mỹ	Nhan My	Xã Nhân Mỹ	Nhan My Commune	nhan_my	353	10
13612	Nhân Nghĩa	Nhan Nghia	Xã Nhân Nghĩa	Nhan Nghia Commune	nhan_nghia	353	10
13615	Nhân Chính	Nhan Chinh	Xã Nhân Chính	Nhan Chinh Commune	nhan_chinh	353	10
13618	Nhân Bình	Nhan Binh	Xã Nhân Bình	Nhan Binh Commune	nhan_binh	353	10
13621	Phú Phúc	Phu Phuc	Xã Phú Phúc	Phu Phuc Commune	phu_phuc	353	10
13624	Xuân Khê	Xuan Khe	Xã Xuân Khê	Xuan Khe Commune	xuan_khe	353	10
13627	Tiến Thắng	Tien Thang	Xã Tiến Thắng	Tien Thang Commune	tien_thang	353	10
13630	Hòa Hậu	Hoa Hau	Xã Hòa Hậu	Hoa Hau Commune	hoa_hau	353	10
13633	Hạ Long	Ha Long	Phường Hạ Long	Ha Long Ward	ha_long	356	8
13636	Trần Tế Xương	Tran Te Xuong	Phường Trần Tế Xương	Tran Te Xuong Ward	tran_te_xuong	356	8
13639	Vị Hoàng	Vi Hoang	Phường Vị Hoàng	Vi Hoang Ward	vi_hoang	356	8
13642	Vị Xuyên	Vi Xuyen	Phường Vị Xuyên	Vi Xuyen Ward	vi_xuyen	356	8
13645	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	356	8
13648	Cửa Bắc	Cua Bac	Phường Cửa Bắc	Cua Bac Ward	cua_bac	356	8
13651	Nguyễn Du	Nguyen Du	Phường Nguyễn Du	Nguyen Du Ward	nguyen_du	356	8
13654	Bà Triệu	Ba Trieu	Phường Bà Triệu	Ba Trieu Ward	ba_trieu	356	8
13657	Trường Thi	Truong Thi	Phường Trường Thi	Truong Thi Ward	truong_thi	356	8
13660	Phan Đình Phùng	Phan Dinh Phung	Phường Phan Đình Phùng	Phan Dinh Phung Ward	phan_dinh_phung	356	8
13663	Ngô Quyền	Ngo Quyen	Phường Ngô Quyền	Ngo Quyen Ward	ngo_quyen	356	8
13666	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	356	8
13669	Trần Đăng Ninh	Tran Dang Ninh	Phường Trần Đăng Ninh	Tran Dang Ninh Ward	tran_dang_ninh	356	8
13672	Năng Tĩnh	Nang Tinh	Phường Năng Tĩnh	Nang Tinh Ward	nang_tinh	356	8
13675	Văn Miếu	Van Mieu	Phường Văn Miếu	Van Mieu Ward	van_mieu	356	8
13678	Trần Quang Khải	Tran Quang Khai	Phường Trần Quang Khải	Tran Quang Khai Ward	tran_quang_khai	356	8
13681	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	356	8
13684	Lộc Hạ	Loc Ha	Phường Lộc Hạ	Loc Ha Ward	loc_ha	356	8
13687	Lộc Vượng	Loc Vuong	Phường Lộc Vượng	Loc Vuong Ward	loc_vuong	356	8
13690	Cửa Nam	Cua Nam	Phường Cửa Nam	Cua Nam Ward	cua_nam	356	8
13693	Lộc Hòa	Loc Hoa	Phường Lộc Hòa	Loc Hoa Ward	loc_hoa	356	8
13696	Nam Phong	Nam Phong	Xã Nam Phong	Nam Phong Commune	nam_phong	356	10
13699	Mỹ Xá	My Xa	Phường Mỹ Xá	My Xa Ward	my_xa	356	8
13702	Lộc An	Loc An	Xã Lộc An	Loc An Commune	loc_an	356	10
13705	Nam Vân	Nam Van	Xã Nam Vân	Nam Van Commune	nam_van	356	10
13708	Mỹ Lộc	My Loc	Thị trấn Mỹ Lộc	My Loc Township	my_loc	358	9
13711	Mỹ Hà	My Ha	Xã Mỹ Hà	My Ha Commune	my_ha	358	10
13714	Mỹ Tiến	My Tien	Xã Mỹ Tiến	My Tien Commune	my_tien	358	10
13717	Mỹ Thắng	My Thang	Xã Mỹ Thắng	My Thang Commune	my_thang	358	10
13720	Mỹ Trung	My Trung	Xã Mỹ Trung	My Trung Commune	my_trung	358	10
13723	Mỹ Tân	My Tan	Xã Mỹ Tân	My Tan Commune	my_tan	358	10
13726	Mỹ Phúc	My Phuc	Xã Mỹ Phúc	My Phuc Commune	my_phuc	358	10
13729	Mỹ Hưng	My Hung	Xã Mỹ Hưng	My Hung Commune	my_hung	358	10
13732	Mỹ Thuận	My Thuan	Xã Mỹ Thuận	My Thuan Commune	my_thuan	358	10
13735	Mỹ Thịnh	My Thinh	Xã Mỹ Thịnh	My Thinh Commune	my_thinh	358	10
13738	Mỹ Thành	My Thanh	Xã Mỹ Thành	My Thanh Commune	my_thanh	358	10
13741	Gôi	Goi	Thị trấn Gôi	Goi Township	goi	359	9
13744	Minh Thuận	Minh Thuan	Xã Minh Thuận	Minh Thuan Commune	minh_thuan	359	10
13747	Hiển Khánh	Hien Khanh	Xã Hiển Khánh	Hien Khanh Commune	hien_khanh	359	10
13750	Tân Khánh	Tan Khanh	Xã Tân Khánh	Tan Khanh Commune	tan_khanh	359	10
13753	Hợp Hưng	Hop Hung	Xã Hợp Hưng	Hop Hung Commune	hop_hung	359	10
13756	Đại An	Dai An	Xã Đại An	Dai An Commune	dai_an	359	10
13759	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	359	10
13762	Cộng Hòa	Cong Hoa	Xã Cộng Hòa	Cong Hoa Commune	cong_hoa	359	10
13765	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	359	10
13768	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	359	10
13771	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	359	10
13774	Liên Bảo	Lien Bao	Xã Liên Bảo	Lien Bao Commune	lien_bao	359	10
13777	Thành Lợi	Thanh Loi	Xã Thành Lợi	Thanh Loi Commune	thanh_loi	359	10
13780	Kim Thái	Kim Thai	Xã Kim Thái	Kim Thai Commune	kim_thai	359	10
13783	Liên Minh	Lien Minh	Xã Liên Minh	Lien Minh Commune	lien_minh	359	10
13786	Đại Thắng	Dai Thang	Xã Đại Thắng	Dai Thang Commune	dai_thang	359	10
13789	Tam Thanh	Tam Thanh	Xã Tam Thanh	Tam Thanh Commune	tam_thanh	359	10
13792	Vĩnh Hào	Vinh Hao	Xã Vĩnh Hào	Vinh Hao Commune	vinh_hao	359	10
13795	Lâm	Lam	Thị trấn Lâm	Lam Township	lam	360	9
13798	Yên Trung	Yen Trung	Xã Yên Trung	Yen Trung Commune	yen_trung	360	10
13801	Yên Thành	Yen Thanh	Xã Yên Thành	Yen Thanh Commune	yen_thanh	360	10
13804	Yên Tân	Yen Tan	Xã Yên Tân	Yen Tan Commune	yen_tan	360	10
13807	Yên Lợi	Yen Loi	Xã Yên Lợi	Yen Loi Commune	yen_loi	360	10
13810	Yên Thọ	Yen Tho	Xã Yên Thọ	Yen Tho Commune	yen_tho	360	10
13813	Yên Nghĩa	Yen Nghia	Xã Yên Nghĩa	Yen Nghia Commune	yen_nghia	360	10
13816	Yên Minh	Yen Minh	Xã Yên Minh	Yen Minh Commune	yen_minh	360	10
13819	Yên Phương	Yen Phuong	Xã Yên Phương	Yen Phuong Commune	yen_phuong	360	10
13822	Yên Chính	Yen Chinh	Xã Yên Chính	Yen Chinh Commune	yen_chinh	360	10
13825	Yên Bình	Yen Binh	Xã Yên Bình	Yen Binh Commune	yen_binh	360	10
13828	Yên Phú	Yen Phu	Xã Yên Phú	Yen Phu Commune	yen_phu	360	10
13831	Yên Mỹ	Yen My	Xã Yên Mỹ	Yen My Commune	yen_my	360	10
13834	Yên Dương	Yen Duong	Xã Yên Dương	Yen Duong Commune	yen_duong	360	10
13840	Yên Hưng	Yen Hung	Xã Yên Hưng	Yen Hung Commune	yen_hung	360	10
13843	Yên Khánh	Yen Khanh	Xã Yên Khánh	Yen Khanh Commune	yen_khanh	360	10
13846	Yên Phong	Yen Phong	Xã Yên Phong	Yen Phong Commune	yen_phong	360	10
13849	Yên Ninh	Yen Ninh	Xã Yên Ninh	Yen Ninh Commune	yen_ninh	360	10
13852	Yên Lương	Yen Luong	Xã Yên Lương	Yen Luong Commune	yen_luong	360	10
13855	Yên Hồng	Yen Hong	Xã Yên Hồng	Yen Hong Commune	yen_hong	360	10
13858	Yên Quang	Yen Quang	Xã Yên Quang	Yen Quang Commune	yen_quang	360	10
13861	Yên Tiến	Yen Tien	Xã Yên Tiến	Yen Tien Commune	yen_tien	360	10
13864	Yên Thắng	Yen Thang	Xã Yên Thắng	Yen Thang Commune	yen_thang	360	10
13867	Yên Phúc	Yen Phuc	Xã Yên Phúc	Yen Phuc Commune	yen_phuc	360	10
13870	Yên Cường	Yen Cuong	Xã Yên Cường	Yen Cuong Commune	yen_cuong	360	10
13873	Yên Lộc	Yen Loc	Xã Yên Lộc	Yen Loc Commune	yen_loc	360	10
13876	Yên Bằng	Yen Bang	Xã Yên Bằng	Yen Bang Commune	yen_bang	360	10
13879	Yên Đồng	Yen Dong	Xã Yên Đồng	Yen Dong Commune	yen_dong	360	10
13882	Yên Khang	Yen Khang	Xã Yên Khang	Yen Khang Commune	yen_khang	360	10
13885	Yên Nhân	Yen Nhan	Xã Yên Nhân	Yen Nhan Commune	yen_nhan	360	10
13888	Yên Trị	Yen Tri	Xã Yên Trị	Yen Tri Commune	yen_tri	360	10
13891	Liễu Đề	Lieu De	Thị trấn Liễu Đề	Lieu De Township	lieu_de	361	9
13894	Rạng Đông	Rang Dong	Thị trấn Rạng Đông	Rang Dong Township	rang_dong	361	9
13897	Nghĩa Đồng	Nghia Dong	Xã Nghĩa Đồng	Nghia Dong Commune	nghia_dong	361	10
13900	Nghĩa Thịnh	Nghia Thinh	Xã Nghĩa Thịnh	Nghia Thinh Commune	nghia_thinh	361	10
13903	Nghĩa Minh	Nghia Minh	Xã Nghĩa Minh	Nghia Minh Commune	nghia_minh	361	10
13906	Nghĩa Thái	Nghia Thai	Xã Nghĩa Thái	Nghia Thai Commune	nghia_thai	361	10
13909	Hoàng Nam	Hoang Nam	Xã Hoàng Nam	Hoang Nam Commune	hoang_nam	361	10
13912	Nghĩa Châu	Nghia Chau	Xã Nghĩa Châu	Nghia Chau Commune	nghia_chau	361	10
13915	Nghĩa Trung	Nghia Trung	Xã Nghĩa Trung	Nghia Trung Commune	nghia_trung	361	10
13918	Nghĩa Sơn	Nghia Son	Xã Nghĩa Sơn	Nghia Son Commune	nghia_son	361	10
13921	Nghĩa Lạc	Nghia Lac	Xã Nghĩa Lạc	Nghia Lac Commune	nghia_lac	361	10
13924	Nghĩa Hồng	Nghia Hong	Xã Nghĩa Hồng	Nghia Hong Commune	nghia_hong	361	10
13927	Nghĩa Phong	Nghia Phong	Xã Nghĩa Phong	Nghia Phong Commune	nghia_phong	361	10
13930	Nghĩa Phú	Nghia Phu	Xã Nghĩa Phú	Nghia Phu Commune	nghia_phu	361	10
13933	Nghĩa Bình	Nghia Binh	Xã Nghĩa Bình	Nghia Binh Commune	nghia_binh	361	10
13936	Quỹ Nhất	Quy Nhat	Thị trấn Quỹ Nhất	Quy Nhat Township	quy_nhat	361	9
13939	Nghĩa Tân	Nghia Tan	Xã Nghĩa Tân	Nghia Tan Commune	nghia_tan	361	10
13942	Nghĩa Hùng	Nghia Hung	Xã Nghĩa Hùng	Nghia Hung Commune	nghia_hung	361	10
13945	Nghĩa Lâm	Nghia Lam	Xã Nghĩa Lâm	Nghia Lam Commune	nghia_lam	361	10
13948	Nghĩa Thành	Nghia Thanh	Xã Nghĩa Thành	Nghia Thanh Commune	nghia_thanh	361	10
13951	Phúc Thắng	Phuc Thang	Xã Phúc Thắng	Phuc Thang Commune	phuc_thang	361	10
13954	Nghĩa Lợi	Nghia Loi	Xã Nghĩa Lợi	Nghia Loi Commune	nghia_loi	361	10
13957	Nghĩa Hải	Nghia Hai	Xã Nghĩa Hải	Nghia Hai Commune	nghia_hai	361	10
13963	Nam Điền	Nam Dien	Xã Nam Điền	Nam Dien Commune	nam_dien	361	10
13966	Nam Giang	Nam Giang	Thị trấn Nam Giang	Nam Giang Township	nam_giang	362	9
13969	Nam Mỹ	Nam My	Xã Nam Mỹ	Nam My Commune	nam_my	362	10
13972	Điền Xá	Dien Xa	Xã Điền Xá	Dien Xa Commune	dien_xa	362	10
13975	Nghĩa An	Nghia An	Xã Nghĩa An	Nghia An Commune	nghia_an	362	10
13978	Nam Thắng	Nam Thang	Xã Nam Thắng	Nam Thang Commune	nam_thang	362	10
13981	Nam Toàn	Nam Toan	Xã Nam Toàn	Nam Toan Commune	nam_toan	362	10
13984	Hồng Quang	Hong Quang	Xã Hồng Quang	Hong Quang Commune	hong_quang	362	10
13987	Tân Thịnh	Tan Thinh	Xã Tân Thịnh	Tan Thinh Commune	tan_thinh	362	10
13990	Nam Cường	Nam Cuong	Xã Nam Cường	Nam Cuong Commune	nam_cuong	362	10
13993	Nam Hồng	Nam Hong	Xã Nam Hồng	Nam Hong Commune	nam_hong	362	10
13996	Nam Hùng	Nam Hung	Xã Nam Hùng	Nam Hung Commune	nam_hung	362	10
13999	Nam Hoa	Nam Hoa	Xã Nam Hoa	Nam Hoa Commune	nam_hoa	362	10
14002	Nam Dương	Nam Duong	Xã Nam Dương	Nam Duong Commune	nam_duong	362	10
14005	Nam Thanh	Nam Thanh	Xã Nam Thanh	Nam Thanh Commune	nam_thanh	362	10
14008	Nam Lợi	Nam Loi	Xã Nam Lợi	Nam Loi Commune	nam_loi	362	10
14011	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	362	10
14014	Đồng Sơn	Dong Son	Xã Đồng Sơn	Dong Son Commune	dong_son	362	10
14017	Nam Tiến	Nam Tien	Xã Nam Tiến	Nam Tien Commune	nam_tien	362	10
14020	Nam Hải	Nam Hai	Xã Nam Hải	Nam Hai Commune	nam_hai	362	10
14023	Nam Thái	Nam Thai	Xã Nam Thái	Nam Thai Commune	nam_thai	362	10
14026	Cổ Lễ	Co Le	Thị trấn Cổ Lễ	Co Le Township	co_le	363	9
14029	Phương Định	Phuong Dinh	Xã Phương Định	Phuong Dinh Commune	phuong_dinh	363	10
14032	Trực Chính	Truc Chinh	Xã Trực Chính	Truc Chinh Commune	truc_chinh	363	10
14035	Trung Đông	Trung Dong	Xã Trung Đông	Trung Dong Commune	trung_dong	363	10
14038	Liêm Hải	Liem Hai	Xã Liêm Hải	Liem Hai Commune	liem_hai	363	10
14041	Trực Tuấn	Truc Tuan	Xã Trực Tuấn	Truc Tuan Commune	truc_tuan	363	10
14044	Việt Hùng	Viet Hung	Xã Việt Hùng	Viet Hung Commune	viet_hung	363	10
14047	Trực Đạo	Truc Dao	Xã Trực Đạo	Truc Dao Commune	truc_dao	363	10
14050	Trực Hưng	Truc Hung	Xã Trực Hưng	Truc Hung Commune	truc_hung	363	10
14053	Trực Nội	Truc Noi	Xã Trực Nội	Truc Noi Commune	truc_noi	363	10
14056	Cát Thành	Cat Thanh	Thị trấn Cát Thành	Cat Thanh Township	cat_thanh	363	9
14059	Trực Thanh	Truc Thanh	Xã Trực Thanh	Truc Thanh Commune	truc_thanh	363	10
14062	Trực Khang	Truc Khang	Xã Trực Khang	Truc Khang Commune	truc_khang	363	10
14065	Trực Thuận	Truc Thuan	Xã Trực Thuận	Truc Thuan Commune	truc_thuan	363	10
14068	Trực Mỹ	Truc My	Xã Trực Mỹ	Truc My Commune	truc_my	363	10
14071	Trực Đại	Truc Dai	Xã Trực Đại	Truc Dai Commune	truc_dai	363	10
14074	Trực Cường	Truc Cuong	Xã Trực Cường	Truc Cuong Commune	truc_cuong	363	10
14077	Ninh Cường	Ninh Cuong	Thị trấn Ninh Cường	Ninh Cuong Township	ninh_cuong	363	9
14080	Trực Thái	Truc Thai	Xã Trực Thái	Truc Thai Commune	truc_thai	363	10
14083	Trực Hùng	Truc Hung	Xã Trực Hùng	Truc Hung Commune	truc_hung	363	10
14086	Trực Thắng	Truc Thang	Xã Trực Thắng	Truc Thang Commune	truc_thang	363	10
14089	Xuân Trường	Xuan Truong	Thị trấn Xuân Trường	Xuan Truong Township	xuan_truong	364	9
14092	Xuân Châu	Xuan Chau	Xã Xuân Châu	Xuan Chau Commune	xuan_chau	364	10
14095	Xuân Hồng	Xuan Hong	Xã Xuân Hồng	Xuan Hong Commune	xuan_hong	364	10
14773	Lam Sơn	Lam Son	Phường Lam Sơn	Lam Son Ward	lam_son	380	8
14098	Xuân Thành	Xuan Thanh	Xã Xuân Thành	Xuan Thanh Commune	xuan_thanh	364	10
14101	Xuân Thượng	Xuan Thuong	Xã Xuân Thượng	Xuan Thuong Commune	xuan_thuong	364	10
14104	Xuân Phong	Xuan Phong	Xã Xuân Phong	Xuan Phong Commune	xuan_phong	364	10
14107	Xuân Đài	Xuan Dai	Xã Xuân Đài	Xuan Dai Commune	xuan_dai	364	10
14110	Xuân Tân	Xuan Tan	Xã Xuân Tân	Xuan Tan Commune	xuan_tan	364	10
14113	Xuân Thủy	Xuan Thuy	Xã Xuân Thủy	Xuan Thuy Commune	xuan_thuy	364	10
14116	Xuân Ngọc	Xuan Ngoc	Xã Xuân Ngọc	Xuan Ngoc Commune	xuan_ngoc	364	10
14119	Xuân Bắc	Xuan Bac	Xã Xuân Bắc	Xuan Bac Commune	xuan_bac	364	10
14122	Xuân Phương	Xuan Phuong	Xã Xuân Phương	Xuan Phuong Commune	xuan_phuong	364	10
14125	Thọ Nghiệp	Tho Nghiep	Xã Thọ Nghiệp	Tho Nghiep Commune	tho_nghiep	364	10
14128	Xuân Phú	Xuan Phu	Xã Xuân Phú	Xuan Phu Commune	xuan_phu	364	10
14131	Xuân Trung	Xuan Trung	Xã Xuân Trung	Xuan Trung Commune	xuan_trung	364	10
14134	Xuân Vinh	Xuan Vinh	Xã Xuân Vinh	Xuan Vinh Commune	xuan_vinh	364	10
14137	Xuân Kiên	Xuan Kien	Xã Xuân Kiên	Xuan Kien Commune	xuan_kien	364	10
14140	Xuân Tiến	Xuan Tien	Xã Xuân Tiến	Xuan Tien Commune	xuan_tien	364	10
14143	Xuân Ninh	Xuan Ninh	Xã Xuân Ninh	Xuan Ninh Commune	xuan_ninh	364	10
14146	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	364	10
14149	Ngô Đồng	Ngo Dong	Thị trấn Ngô Đồng	Ngo Dong Township	ngo_dong	365	9
14152	Quất Lâm	Quat Lam	Thị trấn Quất Lâm	Quat Lam Township	quat_lam	365	9
14155	Giao Hương	Giao Huong	Xã Giao Hương	Giao Huong Commune	giao_huong	365	10
14158	Hồng Thuận	Hong Thuan	Xã Hồng Thuận	Hong Thuan Commune	hong_thuan	365	10
14161	Giao Thiện	Giao Thien	Xã Giao Thiện	Giao Thien Commune	giao_thien	365	10
14164	Giao Thanh	Giao Thanh	Xã Giao Thanh	Giao Thanh Commune	giao_thanh	365	10
14167	Hoành Sơn	Hoanh Son	Xã Hoành Sơn	Hoanh Son Commune	hoanh_son	365	10
14170	Bình Hòa	Binh Hoa	Xã Bình Hòa	Binh Hoa Commune	binh_hoa	365	10
14173	Giao Tiến	Giao Tien	Xã Giao Tiến	Giao Tien Commune	giao_tien	365	10
14176	Giao Hà	Giao Ha	Xã Giao Hà	Giao Ha Commune	giao_ha	365	10
14179	Giao Nhân	Giao Nhan	Xã Giao Nhân	Giao Nhan Commune	giao_nhan	365	10
14182	Giao An	Giao An	Xã Giao An	Giao An Commune	giao_an	365	10
14185	Giao Lạc	Giao Lac	Xã Giao Lạc	Giao Lac Commune	giao_lac	365	10
14188	Giao Châu	Giao Chau	Xã Giao Châu	Giao Chau Commune	giao_chau	365	10
14191	Giao Tân	Giao Tan	Xã Giao Tân	Giao Tan Commune	giao_tan	365	10
14194	Giao Yến	Giao Yen	Xã Giao Yến	Giao Yen Commune	giao_yen	365	10
14197	Giao Xuân	Giao Xuan	Xã Giao Xuân	Giao Xuan Commune	giao_xuan	365	10
14200	Giao Thịnh	Giao Thinh	Xã Giao Thịnh	Giao Thinh Commune	giao_thinh	365	10
14203	Giao Hải	Giao Hai	Xã Giao Hải	Giao Hai Commune	giao_hai	365	10
14206	Bạch Long	Bach Long	Xã Bạch Long	Bach Long Commune	bach_long	365	10
14209	Giao Long	Giao Long	Xã Giao Long	Giao Long Commune	giao_long	365	10
14212	Giao Phong	Giao Phong	Xã Giao Phong	Giao Phong Commune	giao_phong	365	10
14215	Yên Định	Yen Dinh	Thị trấn Yên Định	Yen Dinh Township	yen_dinh	366	9
14218	Cồn	Con	Thị trấn Cồn	Con Township	con	366	9
14221	Thịnh Long	Thinh Long	Thị trấn Thịnh Long	Thinh Long Township	thinh_long	366	9
14224	Hải Nam	Hai Nam	Xã Hải Nam	Hai Nam Commune	hai_nam	366	10
14227	Hải Trung	Hai Trung	Xã Hải Trung	Hai Trung Commune	hai_trung	366	10
14230	Hải Vân	Hai Van	Xã Hải Vân	Hai Van Commune	hai_van	366	10
14233	Hải Minh	Hai Minh	Xã Hải Minh	Hai Minh Commune	hai_minh	366	10
14236	Hải Anh	Hai Anh	Xã Hải Anh	Hai Anh Commune	hai_anh	366	10
14239	Hải Hưng	Hai Hung	Xã Hải Hưng	Hai Hung Commune	hai_hung	366	10
14242	Hải Bắc	Hai Bac	Xã Hải Bắc	Hai Bac Commune	hai_bac	366	10
14245	Hải Phúc	Hai Phuc	Xã Hải Phúc	Hai Phuc Commune	hai_phuc	366	10
14248	Hải Thanh	Hai Thanh	Xã Hải Thanh	Hai Thanh Commune	hai_thanh	366	10
14251	Hải Hà	Hai Ha	Xã Hải Hà	Hai Ha Commune	hai_ha	366	10
14254	Hải Long	Hai Long	Xã Hải Long	Hai Long Commune	hai_long	366	10
14257	Hải Phương	Hai Phuong	Xã Hải Phương	Hai Phuong Commune	hai_phuong	366	10
14260	Hải Đường	Hai Duong	Xã Hải Đường	Hai Duong Commune	hai_duong	366	10
14263	Hải Lộc	Hai Loc	Xã Hải Lộc	Hai Loc Commune	hai_loc	366	10
14266	Hải Quang	Hai Quang	Xã Hải Quang	Hai Quang Commune	hai_quang	366	10
14269	Hải Đông	Hai Dong	Xã Hải Đông	Hai Dong Commune	hai_dong	366	10
14272	Hải Sơn	Hai Son	Xã Hải Sơn	Hai Son Commune	hai_son	366	10
14275	Hải Tân	Hai Tan	Xã Hải Tân	Hai Tan Commune	hai_tan	366	10
14281	Hải Phong	Hai Phong	Xã Hải Phong	Hai Phong Commune	hai_phong	366	10
14284	Hải An	Hai An	Xã Hải An	Hai An Commune	hai_an	366	10
14287	Hải Tây	Hai Tay	Xã Hải Tây	Hai Tay Commune	hai_tay	366	10
14290	Hải Lý	Hai Ly	Xã Hải Lý	Hai Ly Commune	hai_ly	366	10
14293	Hải Phú	Hai Phu	Xã Hải Phú	Hai Phu Commune	hai_phu	366	10
14296	Hải Giang	Hai Giang	Xã Hải Giang	Hai Giang Commune	hai_giang	366	10
14299	Hải Cường	Hai Cuong	Xã Hải Cường	Hai Cuong Commune	hai_cuong	366	10
14302	Hải Ninh	Hai Ninh	Xã Hải Ninh	Hai Ninh Commune	hai_ninh	366	10
14305	Hải Chính	Hai Chinh	Xã Hải Chính	Hai Chinh Commune	hai_chinh	366	10
14308	Hải Xuân	Hai Xuan	Xã Hải Xuân	Hai Xuan Commune	hai_xuan	366	10
14311	Hải Châu	Hai Chau	Xã Hải Châu	Hai Chau Commune	hai_chau	366	10
14314	Hải Triều	Hai Trieu	Xã Hải Triều	Hai Trieu Commune	hai_trieu	366	10
14317	Hải Hòa	Hai Hoa	Xã Hải Hòa	Hai Hoa Commune	hai_hoa	366	10
14320	Đông Thành	Dong Thanh	Phường Đông Thành	Dong Thanh Ward	dong_thanh	369	8
14323	Tân Thành	Tan Thanh	Phường Tân Thành	Tan Thanh Ward	tan_thanh	369	8
14326	Thanh Bình	Thanh Binh	Phường Thanh Bình	Thanh Binh Ward	thanh_binh	369	8
14329	Vân Giang	Van Giang	Phường Vân Giang	Van Giang Ward	van_giang	369	8
14332	Bích Đào	Bich Dao	Phường Bích Đào	Bich Dao Ward	bich_dao	369	8
14335	Phúc Thành	Phuc Thanh	Phường Phúc Thành	Phuc Thanh Ward	phuc_thanh	369	8
14338	Nam Bình	Nam Binh	Phường Nam Bình	Nam Binh Ward	nam_binh	369	8
14341	Nam Thành	Nam Thanh	Phường Nam Thành	Nam Thanh Ward	nam_thanh	369	8
14344	Ninh Khánh	Ninh Khanh	Phường Ninh Khánh	Ninh Khanh Ward	ninh_khanh	369	8
14347	Ninh Nhất	Ninh Nhat	Xã Ninh Nhất	Ninh Nhat Commune	ninh_nhat	369	10
14350	Ninh Tiến	Ninh Tien	Xã Ninh Tiến	Ninh Tien Commune	ninh_tien	369	10
14353	Ninh Phúc	Ninh Phuc	Xã Ninh Phúc	Ninh Phuc Commune	ninh_phuc	369	10
14356	Ninh Sơn	Ninh Son	Phường Ninh Sơn	Ninh Son Ward	ninh_son	369	8
14359	Ninh Phong	Ninh Phong	Phường Ninh Phong	Ninh Phong Ward	ninh_phong	369	8
14362	Bắc Sơn	Bac Son	Phường Bắc Sơn	Bac Son Ward	bac_son	370	8
14365	Trung Sơn	Trung Son	Phường Trung Sơn	Trung Son Ward	trung_son	370	8
14368	Nam Sơn	Nam Son	Phường Nam Sơn	Nam Son Ward	nam_son	370	8
14369	Tây Sơn	Tay Son	Phường Tây Sơn	Tay Son Ward	tay_son	370	8
14371	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	370	10
14374	Yên Bình	Yen Binh	Phường Yên Bình	Yen Binh Ward	yen_binh	370	8
14375	Tân Bình	Tan Binh	Phường Tân Bình	Tan Binh Ward	tan_binh	370	8
14377	Quang Sơn	Quang Son	Xã Quang Sơn	Quang Son Commune	quang_son	370	10
14380	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	370	10
14383	Nho Quan	Nho Quan	Thị trấn Nho Quan	Nho Quan Township	nho_quan	372	9
14386	Xích Thổ	Xich Tho	Xã Xích Thổ	Xich Tho Commune	xich_tho	372	10
14389	Gia Lâm	Gia Lam	Xã Gia Lâm	Gia Lam Commune	gia_lam	372	10
14392	Gia Sơn	Gia Son	Xã Gia Sơn	Gia Son Commune	gia_son	372	10
14395	Thạch Bình	Thach Binh	Xã Thạch Bình	Thach Binh Commune	thach_binh	372	10
14398	Gia Thủy	Gia Thuy	Xã Gia Thủy	Gia Thuy Commune	gia_thuy	372	10
14401	Gia Tường	Gia Tuong	Xã Gia Tường	Gia Tuong Commune	gia_tuong	372	10
14404	Cúc Phương	Cuc Phuong	Xã Cúc Phương	Cuc Phuong Commune	cuc_phuong	372	10
14407	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	372	10
14410	Đức Long	Duc Long	Xã Đức Long	Duc Long Commune	duc_long	372	10
14413	Lạc Vân	Lac Van	Xã Lạc Vân	Lac Van Commune	lac_van	372	10
14416	Đồng Phong	Dong Phong	Xã Đồng Phong	Dong Phong Commune	dong_phong	372	10
14419	Yên Quang	Yen Quang	Xã Yên Quang	Yen Quang Commune	yen_quang	372	10
14422	Lạng Phong	Lang Phong	Xã Lạng Phong	Lang Phong Commune	lang_phong	372	10
14425	Thượng Hòa	Thuong Hoa	Xã Thượng Hòa	Thuong Hoa Commune	thuong_hoa	372	10
14428	Văn Phong	Van Phong	Xã Văn Phong	Van Phong Commune	van_phong	372	10
14431	Văn Phương	Van Phuong	Xã Văn Phương	Van Phuong Commune	van_phuong	372	10
14434	Thanh Lạc	Thanh Lac	Xã Thanh Lạc	Thanh Lac Commune	thanh_lac	372	10
14437	Sơn Lai	Son Lai	Xã Sơn Lai	Son Lai Commune	son_lai	372	10
14440	Sơn Thành	Son Thanh	Xã Sơn Thành	Son Thanh Commune	son_thanh	372	10
14443	Văn Phú	Van Phu	Xã Văn Phú	Van Phu Commune	van_phu	372	10
14446	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	372	10
14449	Kỳ Phú	Ky Phu	Xã Kỳ Phú	Ky Phu Commune	ky_phu	372	10
14452	Quỳnh Lưu	Quynh Luu	Xã Quỳnh Lưu	Quynh Luu Commune	quynh_luu	372	10
14455	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	372	10
14458	Phú Long	Phu Long	Xã Phú Long	Phu Long Commune	phu_long	372	10
14461	Quảng Lạc	Quang Lac	Xã Quảng Lạc	Quang Lac Commune	quang_lac	372	10
14464	Me	Me	Thị trấn Me	Me Township	me	373	9
14467	Gia Hòa	Gia Hoa	Xã Gia Hòa	Gia Hoa Commune	gia_hoa	373	10
14470	Gia Hưng	Gia Hung	Xã Gia Hưng	Gia Hung Commune	gia_hung	373	10
14473	Liên Sơn	Lien Son	Xã Liên Sơn	Lien Son Commune	lien_son	373	10
14476	Gia Thanh	Gia Thanh	Xã Gia Thanh	Gia Thanh Commune	gia_thanh	373	10
14479	Gia Vân	Gia Van	Xã Gia Vân	Gia Van Commune	gia_van	373	10
14482	Gia Phú	Gia Phu	Xã Gia Phú	Gia Phu Commune	gia_phu	373	10
14485	Gia Xuân	Gia Xuan	Xã Gia Xuân	Gia Xuan Commune	gia_xuan	373	10
14488	Gia Lập	Gia Lap	Xã Gia Lập	Gia Lap Commune	gia_lap	373	10
14491	Gia Vượng	Gia Vuong	Xã Gia Vượng	Gia Vuong Commune	gia_vuong	373	10
14494	Gia Trấn	Gia Tran	Xã Gia Trấn	Gia Tran Commune	gia_tran	373	10
14497	Gia Thịnh	Gia Thinh	Xã Gia Thịnh	Gia Thinh Commune	gia_thinh	373	10
14500	Gia Phương	Gia Phuong	Xã Gia Phương	Gia Phuong Commune	gia_phuong	373	10
14503	Gia Tân	Gia Tan	Xã Gia Tân	Gia Tan Commune	gia_tan	373	10
14506	Gia Thắng	Gia Thang	Xã Gia Thắng	Gia Thang Commune	gia_thang	373	10
14509	Gia Trung	Gia Trung	Xã Gia Trung	Gia Trung Commune	gia_trung	373	10
14512	Gia Minh	Gia Minh	Xã Gia Minh	Gia Minh Commune	gia_minh	373	10
14515	Gia Lạc	Gia Lac	Xã Gia Lạc	Gia Lac Commune	gia_lac	373	10
14518	Gia Tiến	Gia Tien	Xã Gia Tiến	Gia Tien Commune	gia_tien	373	10
14521	Gia Sinh	Gia Sinh	Xã Gia Sinh	Gia Sinh Commune	gia_sinh	373	10
14524	Gia Phong	Gia Phong	Xã Gia Phong	Gia Phong Commune	gia_phong	373	10
14527	Thiên Tôn	Thien Ton	Thị trấn Thiên Tôn	Thien Ton Township	thien_ton	374	9
14530	Ninh Giang	Ninh Giang	Xã Ninh Giang	Ninh Giang Commune	ninh_giang	374	10
14533	Trường Yên	Truong Yen	Xã Trường Yên	Truong Yen Commune	truong_yen	374	10
14536	Ninh Khang	Ninh Khang	Xã Ninh Khang	Ninh Khang Commune	ninh_khang	374	10
14539	Ninh Mỹ	Ninh My	Xã Ninh Mỹ	Ninh My Commune	ninh_my	374	10
14542	Ninh Hòa	Ninh Hoa	Xã Ninh Hòa	Ninh Hoa Commune	ninh_hoa	374	10
14545	Ninh Xuân	Ninh Xuan	Xã Ninh Xuân	Ninh Xuan Commune	ninh_xuan	374	10
14548	Ninh Hải	Ninh Hai	Xã Ninh Hải	Ninh Hai Commune	ninh_hai	374	10
14551	Ninh Thắng	Ninh Thang	Xã Ninh Thắng	Ninh Thang Commune	ninh_thang	374	10
14554	Ninh Vân	Ninh Van	Xã Ninh Vân	Ninh Van Commune	ninh_van	374	10
14557	Ninh An	Ninh An	Xã Ninh An	Ninh An Commune	ninh_an	374	10
14560	Yên Ninh	Yen Ninh	Thị trấn Yên Ninh	Yen Ninh Township	yen_ninh	375	9
14563	Khánh Tiên	Khanh Tien	Xã Khánh Tiên	Khanh Tien Commune	khanh_tien	375	10
14566	Khánh Phú	Khanh Phu	Xã Khánh Phú	Khanh Phu Commune	khanh_phu	375	10
14569	Khánh Hòa	Khanh Hoa	Xã Khánh Hòa	Khanh Hoa Commune	khanh_hoa	375	10
14572	Khánh Lợi	Khanh Loi	Xã Khánh Lợi	Khanh Loi Commune	khanh_loi	375	10
14575	Khánh An	Khanh An	Xã Khánh An	Khanh An Commune	khanh_an	375	10
14578	Khánh Cường	Khanh Cuong	Xã Khánh Cường	Khanh Cuong Commune	khanh_cuong	375	10
14581	Khánh Cư	Khanh Cu	Xã Khánh Cư	Khanh Cu Commune	khanh_cu	375	10
14584	Khánh Thiện	Khanh Thien	Xã Khánh Thiện	Khanh Thien Commune	khanh_thien	375	10
14587	Khánh Hải	Khanh Hai	Xã Khánh Hải	Khanh Hai Commune	khanh_hai	375	10
14590	Khánh Trung	Khanh Trung	Xã Khánh Trung	Khanh Trung Commune	khanh_trung	375	10
14593	Khánh Mậu	Khanh Mau	Xã Khánh Mậu	Khanh Mau Commune	khanh_mau	375	10
14596	Khánh Vân	Khanh Van	Xã Khánh Vân	Khanh Van Commune	khanh_van	375	10
14599	Khánh Hội	Khanh Hoi	Xã Khánh Hội	Khanh Hoi Commune	khanh_hoi	375	10
14602	Khánh Công	Khanh Cong	Xã Khánh Công	Khanh Cong Commune	khanh_cong	375	10
14608	Khánh Thành	Khanh Thanh	Xã Khánh Thành	Khanh Thanh Commune	khanh_thanh	375	10
14611	Khánh Nhạc	Khanh Nhac	Xã Khánh Nhạc	Khanh Nhac Commune	khanh_nhac	375	10
14614	Khánh Thủy	Khanh Thuy	Xã Khánh Thủy	Khanh Thuy Commune	khanh_thuy	375	10
14617	Khánh Hồng	Khanh Hong	Xã Khánh Hồng	Khanh Hong Commune	khanh_hong	375	10
14620	Phát Diệm	Phat Diem	Thị trấn Phát Diệm	Phat Diem Township	phat_diem	376	9
14623	Bình Minh	Binh Minh	Thị trấn Bình Minh	Binh Minh Township	binh_minh	376	9
14629	Hồi Ninh	Hoi Ninh	Xã Hồi Ninh	Hoi Ninh Commune	hoi_ninh	376	10
14632	Xuân Chính	Xuan Chinh	Xã Xuân Chính	Xuan Chinh Commune	xuan_chinh	376	10
14635	Kim Định	Kim Dinh	Xã Kim Định	Kim Dinh Commune	kim_dinh	376	10
14638	Ân Hòa	An Hoa	Xã Ân Hòa	An Hoa Commune	an_hoa	376	10
14641	Hùng Tiến	Hung Tien	Xã Hùng Tiến	Hung Tien Commune	hung_tien	376	10
14647	Quang Thiện	Quang Thien	Xã Quang Thiện	Quang Thien Commune	quang_thien	376	10
14650	Như Hòa	Nhu Hoa	Xã Như Hòa	Nhu Hoa Commune	nhu_hoa	376	10
14653	Chất Bình	Chat Binh	Xã Chất Bình	Chat Binh Commune	chat_binh	376	10
14656	Đồng Hướng	Dong Huong	Xã Đồng Hướng	Dong Huong Commune	dong_huong	376	10
14659	Kim Chính	Kim Chinh	Xã Kim Chính	Kim Chinh Commune	kim_chinh	376	10
14662	Thượng Kiệm	Thuong Kiem	Xã Thượng Kiệm	Thuong Kiem Commune	thuong_kiem	376	10
14665	Lưu Phương	Luu Phuong	Xã Lưu Phương	Luu Phuong Commune	luu_phuong	376	10
14668	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	376	10
14671	Yên Lộc	Yen Loc	Xã Yên Lộc	Yen Loc Commune	yen_loc	376	10
14674	Lai Thành	Lai Thanh	Xã Lai Thành	Lai Thanh Commune	lai_thanh	376	10
14677	Định Hóa	Dinh Hoa	Xã Định Hóa	Dinh Hoa Commune	dinh_hoa	376	10
14680	Văn Hải	Van Hai	Xã Văn Hải	Van Hai Commune	van_hai	376	10
14683	Kim Tân	Kim Tan	Xã Kim Tân	Kim Tan Commune	kim_tan	376	10
14686	Kim Mỹ	Kim My	Xã Kim Mỹ	Kim My Commune	kim_my	376	10
14689	Cồn Thoi	Con Thoi	Xã Cồn Thoi	Con Thoi Commune	con_thoi	376	10
14692	Kim Hải	Kim Hai	Xã Kim Hải	Kim Hai Commune	kim_hai	376	10
14695	Kim Trung	Kim Trung	Xã Kim Trung	Kim Trung Commune	kim_trung	376	10
14698	Kim Đông	Kim Dong	Xã Kim Đông	Kim Dong Commune	kim_dong	376	10
14701	Yên Thịnh	Yen Thinh	Thị trấn Yên Thịnh	Yen Thinh Township	yen_thinh	377	9
14704	Khánh Thượng	Khanh Thuong	Xã Khánh Thượng	Khanh Thuong Commune	khanh_thuong	377	10
14707	Khánh Dương	Khanh Duong	Xã Khánh Dương	Khanh Duong Commune	khanh_duong	377	10
14710	Mai Sơn	Mai Son	Xã Mai Sơn	Mai Son Commune	mai_son	377	10
14713	Khánh Thịnh	Khanh Thinh	Xã Khánh Thịnh	Khanh Thinh Commune	khanh_thinh	377	10
14719	Yên Phong	Yen Phong	Xã Yên Phong	Yen Phong Commune	yen_phong	377	10
14722	Yên Hòa	Yen Hoa	Xã Yên Hòa	Yen Hoa Commune	yen_hoa	377	10
14725	Yên Thắng	Yen Thang	Xã Yên Thắng	Yen Thang Commune	yen_thang	377	10
14728	Yên Từ	Yen Tu	Xã Yên Từ	Yen Tu Commune	yen_tu	377	10
14731	Yên Hưng	Yen Hung	Xã Yên Hưng	Yen Hung Commune	yen_hung	377	10
14734	Yên Thành	Yen Thanh	Xã Yên Thành	Yen Thanh Commune	yen_thanh	377	10
14737	Yên Nhân	Yen Nhan	Xã Yên Nhân	Yen Nhan Commune	yen_nhan	377	10
14740	Yên Mỹ	Yen My	Xã Yên Mỹ	Yen My Commune	yen_my	377	10
14743	Yên Mạc	Yen Mac	Xã Yên Mạc	Yen Mac Commune	yen_mac	377	10
14746	Yên Đồng	Yen Dong	Xã Yên Đồng	Yen Dong Commune	yen_dong	377	10
14749	Yên Thái	Yen Thai	Xã Yên Thái	Yen Thai Commune	yen_thai	377	10
14752	Yên Lâm	Yen Lam	Xã Yên Lâm	Yen Lam Commune	yen_lam	377	10
14755	Hàm Rồng	Ham Rong	Phường Hàm Rồng	Ham Rong Ward	ham_rong	380	8
14758	Đông Thọ	Dong Tho	Phường Đông Thọ	Dong Tho Ward	dong_tho	380	8
14761	Nam Ngạn	Nam Ngan	Phường Nam Ngạn	Nam Ngan Ward	nam_ngan	380	8
14764	Trường Thi	Truong Thi	Phường Trường Thi	Truong Thi Ward	truong_thi	380	8
14767	Điện Biên	Dien Bien	Phường Điện Biên	Dien Bien Ward	dien_bien	380	8
14770	Phú Sơn	Phu Son	Phường Phú Sơn	Phu Son Ward	phu_son	380	8
14776	Ba Đình	Ba Dinh	Phường Ba Đình	Ba Dinh Ward	ba_dinh	380	8
14779	Ngọc Trạo	Ngoc Trao	Phường Ngọc Trạo	Ngoc Trao Ward	ngoc_trao	380	8
14782	Đông Vệ	Dong Ve	Phường Đông Vệ	Dong Ve Ward	dong_ve	380	8
14785	Đông Sơn	Dong Son	Phường Đông Sơn	Dong Son Ward	dong_son	380	8
14788	Tân Sơn	Tan Son	Phường Tân Sơn	Tan Son Ward	tan_son	380	8
14791	Đông Cương	Dong Cuong	Phường Đông Cương	Dong Cuong Ward	dong_cuong	380	8
14794	Đông Hương	Dong Huong	Phường Đông Hương	Dong Huong Ward	dong_huong	380	8
14797	Đông Hải	Dong Hai	Phường Đông Hải	Dong Hai Ward	dong_hai	380	8
14800	Quảng Hưng	Quang Hung	Phường Quảng Hưng	Quang Hung Ward	quang_hung	380	8
14803	Quảng Thắng	Quang Thang	Phường Quảng Thắng	Quang Thang Ward	quang_thang	380	8
14806	Quảng Thành	Quang Thanh	Phường Quảng Thành	Quang Thanh Ward	quang_thanh	380	8
15850	Thiệu Vân	Thieu Van	Xã Thiệu Vân	Thieu Van Commune	thieu_van	380	10
15856	Thiệu Khánh	Thieu Khanh	Phường Thiệu Khánh	Thieu Khanh Ward	thieu_khanh	380	8
15859	Thiệu Dương	Thieu Duong	Phường Thiệu Dương	Thieu Duong Ward	thieu_duong	380	8
15913	Tào Xuyên	Tao Xuyen	Phường Tào Xuyên	Tao Xuyen Ward	tao_xuyen	380	8
15922	Long Anh	Long Anh	Phường Long Anh	Long Anh Ward	long_anh	380	8
15925	Hoằng Quang	Hoang Quang	Xã Hoằng Quang	Hoang Quang Commune	hoang_quang	380	10
15970	Hoằng Đại	Hoang Dai	Xã Hoằng Đại	Hoang Dai Commune	hoang_dai	380	10
16396	Đông Lĩnh	Dong Linh	Phường Đông Lĩnh	Dong Linh Ward	dong_linh	380	8
16429	Đông Vinh	Dong Vinh	Xã Đông Vinh	Dong Vinh Commune	dong_vinh	380	10
16432	Đông Tân	Dong Tan	Phường Đông Tân	Dong Tan Ward	dong_tan	380	8
16435	An Hưng	An Hung	Phường An Hưng	An Hung Ward	an_hung	380	8
16441	Quảng Thịnh	Quang Thinh	Phường Quảng Thịnh	Quang Thinh Ward	quang_thinh	380	8
16459	Quảng Đông	Quang Dong	Phường Quảng Đông	Quang Dong Ward	quang_dong	380	8
16507	Quảng Cát	Quang Cat	Phường Quảng Cát	Quang Cat Ward	quang_cat	380	8
16522	Quảng Phú	Quang Phu	Phường Quảng Phú	Quang Phu Ward	quang_phu	380	8
16525	Quảng Tâm	Quang Tam	Phường Quảng Tâm	Quang Tam Ward	quang_tam	380	8
14809	Bắc Sơn	Bac Son	Phường Bắc Sơn	Bac Son Ward	bac_son	381	8
14812	Ba Đình	Ba Dinh	Phường Ba Đình	Ba Dinh Ward	ba_dinh	381	8
14815	Lam Sơn	Lam Son	Phường Lam Sơn	Lam Son Ward	lam_son	381	8
14818	Ngọc Trạo	Ngoc Trao	Phường Ngọc Trạo	Ngoc Trao Ward	ngoc_trao	381	8
14821	Đông Sơn	Dong Son	Phường Đông Sơn	Dong Son Ward	dong_son	381	8
14823	Phú Sơn	Phu Son	Phường Phú Sơn	Phu Son Ward	phu_son	381	8
14824	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	381	10
14830	Trung Sơn	Trung Son	Phường Trung Sơn	Trung Son Ward	trung_son	382	8
14833	Bắc Sơn	Bac Son	Phường Bắc Sơn	Bac Son Ward	bac_son	382	8
14836	Trường Sơn	Truong Son	Phường Trường Sơn	Truong Son Ward	truong_son	382	8
14839	Quảng Cư	Quang Cu	Phường Quảng Cư	Quang Cu Ward	quang_cu	382	8
14842	Quảng Tiến	Quang Tien	Phường Quảng Tiến	Quang Tien Ward	quang_tien	382	8
16513	Quảng Minh	Quang Minh	Xã Quảng Minh	Quang Minh Commune	quang_minh	382	10
16516	Quảng Hùng	Quang Hung	Xã Quảng Hùng	Quang Hung Commune	quang_hung	382	10
16528	Quảng Thọ	Quang Tho	Phường Quảng Thọ	Quang Tho Ward	quang_tho	382	8
16531	Quảng Châu	Quang Chau	Phường Quảng Châu	Quang Chau Ward	quang_chau	382	8
16534	Quảng Vinh	Quang Vinh	Phường Quảng Vinh	Quang Vinh Ward	quang_vinh	382	8
16537	Quảng Đại	Quang Dai	Xã Quảng Đại	Quang Dai Commune	quang_dai	382	10
14845	Mường Lát	Muong Lat	Thị trấn Mường Lát	Muong Lat Township	muong_lat	384	9
14848	Tam Chung	Tam Chung	Xã Tam Chung	Tam Chung Commune	tam_chung	384	10
14854	Mường Lý	Muong Ly	Xã Mường Lý	Muong Ly Commune	muong_ly	384	10
14857	Trung Lý	Trung Ly	Xã Trung Lý	Trung Ly Commune	trung_ly	384	10
14860	Quang Chiểu	Quang Chieu	Xã Quang Chiểu	Quang Chieu Commune	quang_chieu	384	10
14863	Pù Nhi	Pu Nhi	Xã Pù Nhi	Pu Nhi Commune	pu_nhi	384	10
14864	Nhi Sơn	Nhi Son	Xã Nhi Sơn	Nhi Son Commune	nhi_son	384	10
14866	Mường Chanh	Muong Chanh	Xã Mường Chanh	Muong Chanh Commune	muong_chanh	384	10
14869	Hồi Xuân	Hoi Xuan	Thị trấn Hồi Xuân	Hoi Xuan Township	hoi_xuan	385	9
14872	Thành Sơn	Thanh Son	Xã Thành Sơn	Thanh Son Commune	thanh_son	385	10
14875	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	385	10
14878	Phú Thanh	Phu Thanh	Xã Phú Thanh	Phu Thanh Commune	phu_thanh	385	10
14881	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	385	10
14884	Phú Lệ	Phu Le	Xã Phú Lệ	Phu Le Commune	phu_le	385	10
14887	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	385	10
14890	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	385	10
14896	Hiền Chung	Hien Chung	Xã Hiền Chung	Hien Chung Commune	hien_chung	385	10
14899	Hiền Kiệt	Hien Kiet	Xã Hiền Kiệt	Hien Kiet Commune	hien_kiet	385	10
14902	Nam Tiến	Nam Tien	Xã Nam Tiến	Nam Tien Commune	nam_tien	385	10
14908	Thiên Phủ	Thien Phu	Xã Thiên Phủ	Thien Phu Commune	thien_phu	385	10
14911	Phú Nghiêm	Phu Nghiem	Xã Phú Nghiêm	Phu Nghiem Commune	phu_nghiem	385	10
14914	Nam Xuân	Nam Xuan	Xã Nam Xuân	Nam Xuan Commune	nam_xuan	385	10
14917	Nam Động	Nam Dong	Xã Nam Động	Nam Dong Commune	nam_dong	385	10
14923	Cành Nàng	Canh Nang	Thị trấn Cành Nàng	Canh Nang Township	canh_nang	386	9
14926	Điền Thượng	Dien Thuong	Xã Điền Thượng	Dien Thuong Commune	dien_thuong	386	10
14929	Điền Hạ	Dien Ha	Xã Điền Hạ	Dien Ha Commune	dien_ha	386	10
14932	Điền Quang	Dien Quang	Xã Điền Quang	Dien Quang Commune	dien_quang	386	10
14935	Điền Trung	Dien Trung	Xã Điền Trung	Dien Trung Commune	dien_trung	386	10
14938	Thành Sơn	Thanh Son	Xã Thành Sơn	Thanh Son Commune	thanh_son	386	10
14941	Lương Ngoại	Luong Ngoai	Xã Lương Ngoại	Luong Ngoai Commune	luong_ngoai	386	10
14944	Ái Thượng	Ai Thuong	Xã Ái Thượng	Ai Thuong Commune	ai_thuong	386	10
14947	Lương Nội	Luong Noi	Xã Lương Nội	Luong Noi Commune	luong_noi	386	10
14950	Điền Lư	Dien Lu	Xã Điền Lư	Dien Lu Commune	dien_lu	386	10
14953	Lương Trung	Luong Trung	Xã Lương Trung	Luong Trung Commune	luong_trung	386	10
14956	Lũng Niêm	Lung Niem	Xã Lũng Niêm	Lung Niem Commune	lung_niem	386	10
14959	Lũng Cao	Lung Cao	Xã Lũng Cao	Lung Cao Commune	lung_cao	386	10
14962	Hạ Trung	Ha Trung	Xã Hạ Trung	Ha Trung Commune	ha_trung	386	10
14965	Cổ Lũng	Co Lung	Xã Cổ Lũng	Co Lung Commune	co_lung	386	10
14968	Thành Lâm	Thanh Lam	Xã Thành Lâm	Thanh Lam Commune	thanh_lam	386	10
14971	Ban Công	Ban Cong	Xã Ban Công	Ban Cong Commune	ban_cong	386	10
14974	Kỳ Tân	Ky Tan	Xã Kỳ Tân	Ky Tan Commune	ky_tan	386	10
14977	Văn Nho	Van Nho	Xã Văn Nho	Van Nho Commune	van_nho	386	10
14980	Thiết Ống	Thiet Ong	Xã Thiết Ống	Thiet Ong Commune	thiet_ong	386	10
14986	Thiết Kế	Thiet Ke	Xã Thiết Kế	Thiet Ke Commune	thiet_ke	386	10
14995	Trung Xuân	Trung Xuan	Xã Trung Xuân	Trung Xuan Commune	trung_xuan	387	10
14998	Trung Thượng	Trung Thuong	Xã Trung Thượng	Trung Thuong Commune	trung_thuong	387	10
14999	Trung Tiến	Trung Tien	Xã Trung Tiến	Trung Tien Commune	trung_tien	387	10
15001	Trung Hạ	Trung Ha	Xã Trung Hạ	Trung Ha Commune	trung_ha	387	10
15004	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	387	10
15007	Tam Thanh	Tam Thanh	Xã Tam Thanh	Tam Thanh Commune	tam_thanh	387	10
15010	Sơn Thủy	Son Thuy	Xã Sơn Thủy	Son Thuy Commune	son_thuy	387	10
15013	Na Mèo	Na Meo	Xã Na Mèo	Na Meo Commune	na_meo	387	10
15016	Sơn Lư	Son Lu	Thị trấn Sơn Lư	Son Lu Township	son_lu	387	9
15019	Tam Lư	Tam Lu	Xã Tam Lư	Tam Lu Commune	tam_lu	387	10
15022	Sơn Điện	Son Dien	Xã Sơn Điện	Son Dien Commune	son_dien	387	10
15025	Mường Mìn	Muong Min	Xã Mường Mìn	Muong Min Commune	muong_min	387	10
15031	Yên Khương	Yen Khuong	Xã Yên Khương	Yen Khuong Commune	yen_khuong	388	10
15034	Yên Thắng	Yen Thang	Xã Yên Thắng	Yen Thang Commune	yen_thang	388	10
15037	Trí Nang	Tri Nang	Xã Trí Nang	Tri Nang Commune	tri_nang	388	10
15040	Giao An	Giao An	Xã Giao An	Giao An Commune	giao_an	388	10
15043	Giao Thiện	Giao Thien	Xã Giao Thiện	Giao Thien Commune	giao_thien	388	10
15046	Tân Phúc	Tan Phuc	Xã Tân Phúc	Tan Phuc Commune	tan_phuc	388	10
15049	Tam Văn	Tam Van	Xã Tam Văn	Tam Van Commune	tam_van	388	10
15052	Lâm Phú	Lam Phu	Xã Lâm Phú	Lam Phu Commune	lam_phu	388	10
15055	Lang Chánh	Lang Chanh	Thị trấn Lang Chánh	Lang Chanh Township	lang_chanh	388	9
15058	Đồng Lương	Dong Luong	Xã Đồng Lương	Dong Luong Commune	dong_luong	388	10
15061	Ngọc Lặc	Ngoc Lac	Thị trấn Ngọc Lặc	Ngoc Lac Township	ngoc_lac	389	9
15064	Lam Sơn	Lam Son	Xã Lam Sơn	Lam Son Commune	lam_son	389	10
15067	Mỹ Tân	My Tan	Xã Mỹ Tân	My Tan Commune	my_tan	389	10
15070	Thúy Sơn	Thuy Son	Xã Thúy Sơn	Thuy Son Commune	thuy_son	389	10
15073	Thạch Lập	Thach Lap	Xã Thạch Lập	Thach Lap Commune	thach_lap	389	10
15076	Vân Âm	Van Am	Xã Vân Âm	Van Am Commune	van_am	389	10
15079	Cao Ngọc	Cao Ngoc	Xã Cao Ngọc	Cao Ngoc Commune	cao_ngoc	389	10
15085	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	389	10
15088	Đồng Thịnh	Dong Thinh	Xã Đồng Thịnh	Dong Thinh Commune	dong_thinh	389	10
15091	Ngọc Liên	Ngoc Lien	Xã Ngọc Liên	Ngoc Lien Commune	ngoc_lien	389	10
15094	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	389	10
15097	Lộc Thịnh	Loc Thinh	Xã Lộc Thịnh	Loc Thinh Commune	loc_thinh	389	10
15100	Cao Thịnh	Cao Thinh	Xã Cao Thịnh	Cao Thinh Commune	cao_thinh	389	10
15103	Ngọc Trung	Ngoc Trung	Xã Ngọc Trung	Ngoc Trung Commune	ngoc_trung	389	10
15106	Phùng Giáo	Phung Giao	Xã Phùng Giáo	Phung Giao Commune	phung_giao	389	10
15109	Phùng Minh	Phung Minh	Xã Phùng Minh	Phung Minh Commune	phung_minh	389	10
15112	Phúc Thịnh	Phuc Thinh	Xã Phúc Thịnh	Phuc Thinh Commune	phuc_thinh	389	10
15115	Nguyệt Ấn	Nguyet An	Xã Nguyệt Ấn	Nguyet An Commune	nguyet_an	389	10
15118	Kiên Thọ	Kien Tho	Xã Kiên Thọ	Kien Tho Commune	kien_tho	389	10
15121	Minh Tiến	Minh Tien	Xã Minh Tiến	Minh Tien Commune	minh_tien	389	10
15124	Minh Sơn	Minh Son	Xã Minh Sơn	Minh Son Commune	minh_son	389	10
15127	Phong Sơn	Phong Son	Thị trấn Phong Sơn	Phong Son Township	phong_son	390	9
15133	Cẩm Thành	Cam Thanh	Xã Cẩm Thành	Cam Thanh Commune	cam_thanh	390	10
15136	Cẩm Quý	Cam Quy	Xã Cẩm Quý	Cam Quy Commune	cam_quy	390	10
15139	Cẩm Lương	Cam Luong	Xã Cẩm Lương	Cam Luong Commune	cam_luong	390	10
15142	Cẩm Thạch	Cam Thach	Xã Cẩm Thạch	Cam Thach Commune	cam_thach	390	10
15145	Cẩm Liên	Cam Lien	Xã Cẩm Liên	Cam Lien Commune	cam_lien	390	10
15148	Cẩm Giang	Cam Giang	Xã Cẩm Giang	Cam Giang Commune	cam_giang	390	10
15151	Cẩm Bình	Cam Binh	Xã Cẩm Bình	Cam Binh Commune	cam_binh	390	10
15154	Cẩm Tú	Cam Tu	Xã Cẩm Tú	Cam Tu Commune	cam_tu	390	10
15160	Cẩm Châu	Cam Chau	Xã Cẩm Châu	Cam Chau Commune	cam_chau	390	10
15163	Cẩm Tâm	Cam Tam	Xã Cẩm Tâm	Cam Tam Commune	cam_tam	390	10
15169	Cẩm Ngọc	Cam Ngoc	Xã Cẩm Ngọc	Cam Ngoc Commune	cam_ngoc	390	10
15172	Cẩm Long	Cam Long	Xã Cẩm Long	Cam Long Commune	cam_long	390	10
15175	Cẩm Yên	Cam Yen	Xã Cẩm Yên	Cam Yen Commune	cam_yen	390	10
15178	Cẩm Tân	Cam Tan	Xã Cẩm Tân	Cam Tan Commune	cam_tan	390	10
15181	Cẩm Phú	Cam Phu	Xã Cẩm Phú	Cam Phu Commune	cam_phu	390	10
15184	Cẩm Vân	Cam Van	Xã Cẩm Vân	Cam Van Commune	cam_van	390	10
15187	Kim Tân	Kim Tan	Thị trấn Kim Tân	Kim Tan Township	kim_tan	391	9
15190	Vân Du	Van Du	Thị trấn Vân Du	Van Du Township	van_du	391	9
15196	Thạch Lâm	Thach Lam	Xã Thạch Lâm	Thach Lam Commune	thach_lam	391	10
15199	Thạch Quảng	Thach Quang	Xã Thạch Quảng	Thach Quang Commune	thach_quang	391	10
15202	Thạch Tượng	Thach Tuong	Xã Thạch Tượng	Thach Tuong Commune	thach_tuong	391	10
15205	Thạch Cẩm	Thach Cam	Xã Thạch Cẩm	Thach Cam Commune	thach_cam	391	10
15208	Thạch Sơn	Thach Son	Xã Thạch Sơn	Thach Son Commune	thach_son	391	10
15211	Thạch Bình	Thach Binh	Xã Thạch Bình	Thach Binh Commune	thach_binh	391	10
15214	Thạch Định	Thach Dinh	Xã Thạch Định	Thach Dinh Commune	thach_dinh	391	10
15217	Thạch Đồng	Thach Dong	Xã Thạch Đồng	Thach Dong Commune	thach_dong	391	10
15220	Thạch Long	Thach Long	Xã Thạch Long	Thach Long Commune	thach_long	391	10
15223	Thành Mỹ	Thanh My	Xã Thành Mỹ	Thanh My Commune	thanh_my	391	10
15226	Thành Yên	Thanh Yen	Xã Thành Yên	Thanh Yen Commune	thanh_yen	391	10
15229	Thành Vinh	Thanh Vinh	Xã Thành Vinh	Thanh Vinh Commune	thanh_vinh	391	10
15232	Thành Minh	Thanh Minh	Xã Thành Minh	Thanh Minh Commune	thanh_minh	391	10
15235	Thành Công	Thanh Cong	Xã Thành Công	Thanh Cong Commune	thanh_cong	391	10
15238	Thành Tân	Thanh Tan	Xã Thành Tân	Thanh Tan Commune	thanh_tan	391	10
15241	Thành Trực	Thanh Truc	Xã Thành Trực	Thanh Truc Commune	thanh_truc	391	10
15247	Thành Tâm	Thanh Tam	Xã Thành Tâm	Thanh Tam Commune	thanh_tam	391	10
15250	Thành An	Thanh An	Xã Thành An	Thanh An Commune	thanh_an	391	10
15253	Thành Thọ	Thanh Tho	Xã Thành Thọ	Thanh Tho Commune	thanh_tho	391	10
15256	Thành Tiến	Thanh Tien	Xã Thành Tiến	Thanh Tien Commune	thanh_tien	391	10
15259	Thành Long	Thanh Long	Xã Thành Long	Thanh Long Commune	thanh_long	391	10
15265	Thành Hưng	Thanh Hung	Xã Thành Hưng	Thanh Hung Commune	thanh_hung	391	10
15268	Ngọc Trạo	Ngoc Trao	Xã Ngọc Trạo	Ngoc Trao Commune	ngoc_trao	391	10
15271	Hà Trung	Ha Trung	Thị trấn Hà Trung	Ha Trung Township	ha_trung	392	9
15274	Hà Long	Ha Long	Xã Hà Long	Ha Long Commune	ha_long	392	10
15277	Hà Vinh	Ha Vinh	Xã Hà Vinh	Ha Vinh Commune	ha_vinh	392	10
15280	Hà Bắc	Ha Bac	Xã Hà Bắc	Ha Bac Commune	ha_bac	392	10
15283	Hoạt Giang	Hoat Giang	Xã Hoạt Giang	Hoat Giang Commune	hoat_giang	392	10
15286	Yên Dương	Yen Duong	Xã Yên Dương	Yen Duong Commune	yen_duong	392	10
15292	Hà Giang	Ha Giang	Xã Hà Giang	Ha Giang Commune	ha_giang	392	10
15298	Lĩnh Toại	Linh Toai	Xã Lĩnh Toại	Linh Toai Commune	linh_toai	392	10
15304	Hà Ngọc	Ha Ngoc	Xã Hà Ngọc	Ha Ngoc Commune	ha_ngoc	392	10
15307	Yến Sơn	Yen Son	Xã Yến Sơn	Yen Son Commune	yen_son	392	10
15313	Hà Sơn	Ha Son	Xã Hà Sơn	Ha Son Commune	ha_son	392	10
15316	Hà Lĩnh	Ha Linh	Xã Hà Lĩnh	Ha Linh Commune	ha_linh	392	10
15319	Hà Đông	Ha Dong	Xã Hà Đông	Ha Dong Commune	ha_dong	392	10
15322	Hà Tân	Ha Tan	Xã Hà Tân	Ha Tan Commune	ha_tan	392	10
15325	Hà Tiến	Ha Tien	Xã Hà Tiến	Ha Tien Commune	ha_tien	392	10
15328	Hà Bình	Ha Binh	Xã Hà Bình	Ha Binh Commune	ha_binh	392	10
15331	Hà Lai	Ha Lai	Xã Hà Lai	Ha Lai Commune	ha_lai	392	10
15334	Hà Châu	Ha Chau	Xã Hà Châu	Ha Chau Commune	ha_chau	392	10
15340	Hà Thái	Ha Thai	Xã Hà Thái	Ha Thai Commune	ha_thai	392	10
15343	Hà Hải	Ha Hai	Xã Hà Hải	Ha Hai Commune	ha_hai	392	10
15349	Vĩnh Lộc	Vinh Loc	Thị trấn Vĩnh Lộc	Vinh Loc Township	vinh_loc	393	9
15352	Vĩnh Quang	Vinh Quang	Xã Vĩnh Quang	Vinh Quang Commune	vinh_quang	393	10
15355	Vĩnh Yên	Vinh Yen	Xã Vĩnh Yên	Vinh Yen Commune	vinh_yen	393	10
15358	Vĩnh Tiến	Vinh Tien	Xã Vĩnh Tiến	Vinh Tien Commune	vinh_tien	393	10
15361	Vĩnh Long	Vinh Long	Xã Vĩnh Long	Vinh Long Commune	vinh_long	393	10
15364	Vĩnh Phúc	Vinh Phuc	Xã Vĩnh Phúc	Vinh Phuc Commune	vinh_phuc	393	10
15367	Vĩnh Hưng	Vinh Hung	Xã Vĩnh Hưng	Vinh Hung Commune	vinh_hung	393	10
15376	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	393	10
15379	Vĩnh Hùng	Vinh Hung	Xã Vĩnh Hùng	Vinh Hung Commune	vinh_hung	393	10
15382	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	393	10
15385	Ninh Khang	Ninh Khang	Xã Ninh Khang	Ninh Khang Commune	ninh_khang	393	10
15388	Vĩnh Thịnh	Vinh Thinh	Xã Vĩnh Thịnh	Vinh Thinh Commune	vinh_thinh	393	10
15391	Vĩnh An	Vinh An	Xã Vĩnh An	Vinh An Commune	vinh_an	393	10
15397	Thống Nhất	Thong Nhat	Thị trấn Thống Nhất	Thong Nhat Township	thong_nhat	394	9
15403	Yên Lâm	Yen Lam	Thị trấn Yên Lâm	Yen Lam Township	yen_lam	394	9
15406	Yên Tâm	Yen Tam	Xã Yên Tâm	Yen Tam Commune	yen_tam	394	10
15409	Yên Phú	Yen Phu	Xã Yên Phú	Yen Phu Commune	yen_phu	394	10
15412	Quý Lộc	Quy Loc	Thị trấn Quý Lộc	Quy Loc Township	quy_loc	394	9
15415	Yên Thọ	Yen Tho	Xã Yên Thọ	Yen Tho Commune	yen_tho	394	10
15418	Yên Trung	Yen Trung	Xã Yên Trung	Yen Trung Commune	yen_trung	394	10
15421	Yên Trường	Yen Truong	Xã Yên Trường	Yen Truong Commune	yen_truong	394	10
15427	Yên Phong	Yen Phong	Xã Yên Phong	Yen Phong Commune	yen_phong	394	10
15430	Yên Thái	Yen Thai	Xã Yên Thái	Yen Thai Commune	yen_thai	394	10
15433	Yên Hùng	Yen Hung	Xã Yên Hùng	Yen Hung Commune	yen_hung	394	10
15436	Yên Thịnh	Yen Thinh	Xã Yên Thịnh	Yen Thinh Commune	yen_thinh	394	10
15439	Yên Ninh	Yen Ninh	Xã Yên Ninh	Yen Ninh Commune	yen_ninh	394	10
15442	Yên Lạc	Yen Lac	Xã Yên Lạc	Yen Lac Commune	yen_lac	394	10
15445	Định Tăng	Dinh Tang	Xã Định Tăng	Dinh Tang Commune	dinh_tang	394	10
15448	Định Hòa	Dinh Hoa	Xã Định Hòa	Dinh Hoa Commune	dinh_hoa	394	10
15451	Định Thành	Dinh Thanh	Xã Định Thành	Dinh Thanh Commune	dinh_thanh	394	10
15454	Định Công	Dinh Cong	Xã Định Công	Dinh Cong Commune	dinh_cong	394	10
15457	Định Tân	Dinh Tan	Xã Định Tân	Dinh Tan Commune	dinh_tan	394	10
15460	Định Tiến	Dinh Tien	Xã Định Tiến	Dinh Tien Commune	dinh_tien	394	10
15463	Định Long	Dinh Long	Xã Định Long	Dinh Long Commune	dinh_long	394	10
15466	Định Liên	Dinh Lien	Xã Định Liên	Dinh Lien Commune	dinh_lien	394	10
15469	Quán Lào	Quan Lao	Thị trấn Quán Lào	Quan Lao Township	quan_lao	394	9
15472	Định Hưng	Dinh Hung	Xã Định Hưng	Dinh Hung Commune	dinh_hung	394	10
15475	Định Hải	Dinh Hai	Xã Định Hải	Dinh Hai Commune	dinh_hai	394	10
15478	Định Bình	Dinh Binh	Xã Định Bình	Dinh Binh Commune	dinh_binh	394	10
15493	Xuân Hồng	Xuan Hong	Xã Xuân Hồng	Xuan Hong Commune	xuan_hong	395	10
15499	Thọ Xuân	Tho Xuan	Thị trấn Thọ Xuân	Tho Xuan Township	tho_xuan	395	9
15502	Bắc Lương	Bac Luong	Xã Bắc Lương	Bac Luong Commune	bac_luong	395	10
15505	Nam Giang	Nam Giang	Xã Nam Giang	Nam Giang Commune	nam_giang	395	10
15508	Xuân Phong	Xuan Phong	Xã Xuân Phong	Xuan Phong Commune	xuan_phong	395	10
15511	Thọ Lộc	Tho Loc	Xã Thọ Lộc	Tho Loc Commune	tho_loc	395	10
15514	Xuân Trường	Xuan Truong	Xã Xuân Trường	Xuan Truong Commune	xuan_truong	395	10
15517	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	395	10
15520	Thọ Hải	Tho Hai	Xã Thọ Hải	Tho Hai Commune	tho_hai	395	10
15523	Tây Hồ	Tay Ho	Xã Tây Hồ	Tay Ho Commune	tay_ho	395	10
15526	Xuân Giang	Xuan Giang	Xã Xuân Giang	Xuan Giang Commune	xuan_giang	395	10
15532	Xuân Sinh	Xuan Sinh	Xã Xuân Sinh	Xuan Sinh Commune	xuan_sinh	395	10
15535	Xuân Hưng	Xuan Hung	Xã Xuân Hưng	Xuan Hung Commune	xuan_hung	395	10
15538	Thọ Diên	Tho Dien	Xã Thọ Diên	Tho Dien Commune	tho_dien	395	10
15541	Thọ Lâm	Tho Lam	Xã Thọ Lâm	Tho Lam Commune	tho_lam	395	10
15544	Thọ Xương	Tho Xuong	Xã Thọ Xương	Tho Xuong Commune	tho_xuong	395	10
15547	Xuân Bái	Xuan Bai	Xã Xuân Bái	Xuan Bai Commune	xuan_bai	395	10
15550	Xuân Phú	Xuan Phu	Xã Xuân Phú	Xuan Phu Commune	xuan_phu	395	10
15553	Sao Vàng	Sao Vang	Thị trấn Sao Vàng	Sao Vang Township	sao_vang	395	9
15556	Lam Sơn	Lam Son	Thị trấn Lam Sơn	Lam Son Township	lam_son	395	9
15559	Xuân Thiên	Xuan Thien	Xã Xuân Thiên	Xuan Thien Commune	xuan_thien	395	10
15565	Thuận Minh	Thuan Minh	Xã Thuận Minh	Thuan Minh Commune	thuan_minh	395	10
15568	Thọ Lập	Tho Lap	Xã Thọ Lập	Tho Lap Commune	tho_lap	395	10
15571	Quảng Phú	Quang Phu	Xã Quảng Phú	Quang Phu Commune	quang_phu	395	10
15574	Xuân Tín	Xuan Tin	Xã Xuân Tín	Xuan Tin Commune	xuan_tin	395	10
15577	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	395	10
15583	Xuân Lai	Xuan Lai	Xã Xuân Lai	Xuan Lai Commune	xuan_lai	395	10
15586	Xuân Lập	Xuan Lap	Xã Xuân Lập	Xuan Lap Commune	xuan_lap	395	10
15592	Xuân Minh	Xuan Minh	Xã Xuân Minh	Xuan Minh Commune	xuan_minh	395	10
15598	Trường Xuân	Truong Xuan	Xã Trường Xuân	Truong Xuan Commune	truong_xuan	395	10
15607	Bát Mọt	Bat Mot	Xã Bát Mọt	Bat Mot Commune	bat_mot	396	10
15610	Yên Nhân	Yen Nhan	Xã Yên Nhân	Yen Nhan Commune	yen_nhan	396	10
27298	01	01	Phường 01	01 Ward	01	773	8
15619	Xuân Lẹ	Xuan Le	Xã Xuân Lẹ	Xuan Le Commune	xuan_le	396	10
15622	Vạn Xuân	Van Xuan	Xã Vạn Xuân	Van Xuan Commune	van_xuan	396	10
15628	Lương Sơn	Luong Son	Xã Lương Sơn	Luong Son Commune	luong_son	396	10
15631	Xuân Cao	Xuan Cao	Xã Xuân Cao	Xuan Cao Commune	xuan_cao	396	10
15634	Luận Thành	Luan Thanh	Xã Luận Thành	Luan Thanh Commune	luan_thanh	396	10
15637	Luận Khê	Luan Khe	Xã Luận Khê	Luan Khe Commune	luan_khe	396	10
15640	Xuân Thắng	Xuan Thang	Xã Xuân Thắng	Xuan Thang Commune	xuan_thang	396	10
15643	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	396	10
15646	Thường Xuân	Thuong Xuan	Thị trấn Thường Xuân	Thuong Xuan Township	thuong_xuan	396	9
15649	Xuân Dương	Xuan Duong	Xã Xuân Dương	Xuan Duong Commune	xuan_duong	396	10
15652	Thọ Thanh	Tho Thanh	Xã Thọ Thanh	Tho Thanh Commune	tho_thanh	396	10
15655	Ngọc Phụng	Ngoc Phung	Xã Ngọc Phụng	Ngoc Phung Commune	ngoc_phung	396	10
15658	Xuân Chinh	Xuan Chinh	Xã Xuân Chinh	Xuan Chinh Commune	xuan_chinh	396	10
15661	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	396	10
15664	Triệu Sơn	Trieu Son	Thị trấn Triệu Sơn	Trieu Son Township	trieu_son	397	9
15667	Thọ Sơn	Tho Son	Xã Thọ Sơn	Tho Son Commune	tho_son	397	10
15670	Thọ Bình	Tho Binh	Xã Thọ Bình	Tho Binh Commune	tho_binh	397	10
15673	Thọ Tiến	Tho Tien	Xã Thọ Tiến	Tho Tien Commune	tho_tien	397	10
15676	Hợp Lý	Hop Ly	Xã Hợp Lý	Hop Ly Commune	hop_ly	397	10
15679	Hợp Tiến	Hop Tien	Xã Hợp Tiến	Hop Tien Commune	hop_tien	397	10
15682	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	397	10
15685	Triệu Thành	Trieu Thanh	Xã Triệu Thành	Trieu Thanh Commune	trieu_thanh	397	10
15688	Hợp Thắng	Hop Thang	Xã Hợp Thắng	Hop Thang Commune	hop_thang	397	10
15691	Minh Sơn	Minh Son	Xã Minh Sơn	Minh Son Commune	minh_son	397	10
15700	Dân Lực	Dan Luc	Xã Dân Lực	Dan Luc Commune	dan_luc	397	10
15703	Dân Lý	Dan Ly	Xã Dân Lý	Dan Ly Commune	dan_ly	397	10
15706	Dân Quyền	Dan Quyen	Xã Dân Quyền	Dan Quyen Commune	dan_quyen	397	10
15709	An Nông	An Nong	Xã An Nông	An Nong Commune	an_nong	397	10
15712	Văn Sơn	Van Son	Xã Văn Sơn	Van Son Commune	van_son	397	10
15715	Thái Hòa	Thai Hoa	Xã Thái Hòa	Thai Hoa Commune	thai_hoa	397	10
15718	Nưa	Nua	Thị trấn Nưa	Nua Township	nua	397	9
15721	Đồng Lợi	Dong Loi	Xã Đồng Lợi	Dong Loi Commune	dong_loi	397	10
15724	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	397	10
15727	Đồng Thắng	Dong Thang	Xã Đồng Thắng	Dong Thang Commune	dong_thang	397	10
15730	Tiến Nông	Tien Nong	Xã Tiến Nông	Tien Nong Commune	tien_nong	397	10
15733	Khuyến Nông	Khuyen Nong	Xã Khuyến Nông	Khuyen Nong Commune	khuyen_nong	397	10
15736	Xuân Thịnh	Xuan Thinh	Xã Xuân Thịnh	Xuan Thinh Commune	xuan_thinh	397	10
15739	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	397	10
15742	Thọ Dân	Tho Dan	Xã Thọ Dân	Tho Dan Commune	tho_dan	397	10
15745	Xuân Thọ	Xuan Tho	Xã Xuân Thọ	Xuan Tho Commune	xuan_tho	397	10
15748	Thọ Tân	Tho Tan	Xã Thọ Tân	Tho Tan Commune	tho_tan	397	10
15751	Thọ Ngọc	Tho Ngoc	Xã Thọ Ngọc	Tho Ngoc Commune	tho_ngoc	397	10
15754	Thọ Cường	Tho Cuong	Xã Thọ Cường	Tho Cuong Commune	tho_cuong	397	10
15757	Thọ Phú	Tho Phu	Xã Thọ Phú	Tho Phu Commune	tho_phu	397	10
15760	Thọ Vực	Tho Vuc	Xã Thọ Vực	Tho Vuc Commune	tho_vuc	397	10
15763	Thọ Thế	Tho The	Xã Thọ Thế	Tho The Commune	tho_the	397	10
15766	Nông Trường	Nong Truong	Xã Nông Trường	Nong Truong Commune	nong_truong	397	10
15769	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	397	10
15772	Thiệu Hóa	Thieu Hoa	Thị trấn Thiệu Hóa	Thieu Hoa Township	thieu_hoa	398	9
15775	Thiệu Ngọc	Thieu Ngoc	Xã Thiệu Ngọc	Thieu Ngoc Commune	thieu_ngoc	398	10
15778	Thiệu Vũ	Thieu Vu	Xã Thiệu Vũ	Thieu Vu Commune	thieu_vu	398	10
15781	Thiệu Phúc	Thieu Phuc	Xã Thiệu Phúc	Thieu Phuc Commune	thieu_phuc	398	10
15784	Thiệu Tiến	Thieu Tien	Xã Thiệu Tiến	Thieu Tien Commune	thieu_tien	398	10
15787	Thiệu Công	Thieu Cong	Xã Thiệu Công	Thieu Cong Commune	thieu_cong	398	10
15790	Thiệu Phú	Thieu Phu	Xã Thiệu Phú	Thieu Phu Commune	thieu_phu	398	10
15793	Thiệu Long	Thieu Long	Xã Thiệu Long	Thieu Long Commune	thieu_long	398	10
15796	Thiệu Giang	Thieu Giang	Xã Thiệu Giang	Thieu Giang Commune	thieu_giang	398	10
15799	Thiệu Duy	Thieu Duy	Xã Thiệu Duy	Thieu Duy Commune	thieu_duy	398	10
15802	Thiệu Nguyên	Thieu Nguyen	Xã Thiệu Nguyên	Thieu Nguyen Commune	thieu_nguyen	398	10
15805	Thiệu Hợp	Thieu Hop	Xã Thiệu Hợp	Thieu Hop Commune	thieu_hop	398	10
15808	Thiệu Thịnh	Thieu Thinh	Xã Thiệu Thịnh	Thieu Thinh Commune	thieu_thinh	398	10
15811	Thiệu Quang	Thieu Quang	Xã Thiệu Quang	Thieu Quang Commune	thieu_quang	398	10
15814	Thiệu Thành	Thieu Thanh	Xã Thiệu Thành	Thieu Thanh Commune	thieu_thanh	398	10
15817	Thiệu Toán	Thieu Toan	Xã Thiệu Toán	Thieu Toan Commune	thieu_toan	398	10
15820	Thiệu Chính	Thieu Chinh	Xã Thiệu Chính	Thieu Chinh Commune	thieu_chinh	398	10
15823	Thiệu Hòa	Thieu Hoa	Xã Thiệu Hòa	Thieu Hoa Commune	thieu_hoa	398	10
15829	Minh Tâm	Minh Tam	Xã Minh Tâm	Minh Tam Commune	minh_tam	398	10
15832	Thiệu Viên	Thieu Vien	Xã Thiệu Viên	Thieu Vien Commune	thieu_vien	398	10
15835	Thiệu Lý	Thieu Ly	Xã Thiệu Lý	Thieu Ly Commune	thieu_ly	398	10
15838	Thiệu Vận	Thieu Van	Xã Thiệu Vận	Thieu Van Commune	thieu_van	398	10
15841	Thiệu Trung	Thieu Trung	Xã Thiệu Trung	Thieu Trung Commune	thieu_trung	398	10
15847	Tân Châu	Tan Chau	Xã Tân Châu	Tan Chau Commune	tan_chau	398	10
15853	Thiệu Giao	Thieu Giao	Xã Thiệu Giao	Thieu Giao Commune	thieu_giao	398	10
15865	Bút Sơn	But Son	Thị trấn Bút Sơn	But Son Township	but_son	399	9
15871	Hoằng Giang	Hoang Giang	Xã Hoằng Giang	Hoang Giang Commune	hoang_giang	399	10
15877	Hoằng Xuân	Hoang Xuan	Xã Hoằng Xuân	Hoang Xuan Commune	hoang_xuan	399	10
15880	Hoằng Phượng	Hoang Phuong	Xã Hoằng Phượng	Hoang Phuong Commune	hoang_phuong	399	10
15883	Hoằng Phú	Hoang Phu	Xã Hoằng Phú	Hoang Phu Commune	hoang_phu	399	10
15886	Hoằng Quỳ	Hoang Quy	Xã Hoằng Quỳ	Hoang Quy Commune	hoang_quy	399	10
15889	Hoằng Kim	Hoang Kim	Xã Hoằng Kim	Hoang Kim Commune	hoang_kim	399	10
15892	Hoằng Trung	Hoang Trung	Xã Hoằng Trung	Hoang Trung Commune	hoang_trung	399	10
15895	Hoằng Trinh	Hoang Trinh	Xã Hoằng Trinh	Hoang Trinh Commune	hoang_trinh	399	10
15901	Hoằng Sơn	Hoang Son	Xã Hoằng Sơn	Hoang Son Commune	hoang_son	399	10
15907	Hoằng Cát	Hoang Cat	Xã Hoằng Cát	Hoang Cat Commune	hoang_cat	399	10
15910	Hoằng Xuyên	Hoang Xuyen	Xã Hoằng Xuyên	Hoang Xuyen Commune	hoang_xuyen	399	10
15916	Hoằng Quý	Hoang Quy	Xã Hoằng Quý	Hoang Quy Commune	hoang_quy	399	10
15919	Hoằng Hợp	Hoang Hop	Xã Hoằng Hợp	Hoang Hop Commune	hoang_hop	399	10
15928	Hoằng Đức	Hoang Duc	Xã Hoằng Đức	Hoang Duc Commune	hoang_duc	399	10
15937	Hoằng Hà	Hoang Ha	Xã Hoằng Hà	Hoang Ha Commune	hoang_ha	399	10
15940	Hoằng Đạt	Hoang Dat	Xã Hoằng Đạt	Hoang Dat Commune	hoang_dat	399	10
15946	Hoằng Đạo	Hoang Dao	Xã Hoằng Đạo	Hoang Dao Commune	hoang_dao	399	10
15949	Hoằng Thắng	Hoang Thang	Xã Hoằng Thắng	Hoang Thang Commune	hoang_thang	399	10
15952	Hoằng Đồng	Hoang Dong	Xã Hoằng Đồng	Hoang Dong Commune	hoang_dong	399	10
15955	Hoằng Thái	Hoang Thai	Xã Hoằng Thái	Hoang Thai Commune	hoang_thai	399	10
15958	Hoằng Thịnh	Hoang Thinh	Xã Hoằng Thịnh	Hoang Thinh Commune	hoang_thinh	399	10
15961	Hoằng Thành	Hoang Thanh	Xã Hoằng Thành	Hoang Thanh Commune	hoang_thanh	399	10
15964	Hoằng Lộc	Hoang Loc	Xã Hoằng Lộc	Hoang Loc Commune	hoang_loc	399	10
15967	Hoằng Trạch	Hoang Trach	Xã Hoằng Trạch	Hoang Trach Commune	hoang_trach	399	10
15973	Hoằng Phong	Hoang Phong	Xã Hoằng Phong	Hoang Phong Commune	hoang_phong	399	10
15976	Hoằng Lưu	Hoang Luu	Xã Hoằng Lưu	Hoang Luu Commune	hoang_luu	399	10
15979	Hoằng Châu	Hoang Chau	Xã Hoằng Châu	Hoang Chau Commune	hoang_chau	399	10
15982	Hoằng Tân	Hoang Tan	Xã Hoằng Tân	Hoang Tan Commune	hoang_tan	399	10
15985	Hoằng Yến	Hoang Yen	Xã Hoằng Yến	Hoang Yen Commune	hoang_yen	399	10
15988	Hoằng Tiến	Hoang Tien	Xã Hoằng Tiến	Hoang Tien Commune	hoang_tien	399	10
15991	Hoằng Hải	Hoang Hai	Xã Hoằng Hải	Hoang Hai Commune	hoang_hai	399	10
15994	Hoằng Ngọc	Hoang Ngoc	Xã Hoằng Ngọc	Hoang Ngoc Commune	hoang_ngoc	399	10
15997	Hoằng Đông	Hoang Dong	Xã Hoằng Đông	Hoang Dong Commune	hoang_dong	399	10
16000	Hoằng Thanh	Hoang Thanh	Xã Hoằng Thanh	Hoang Thanh Commune	hoang_thanh	399	10
16003	Hoằng Phụ	Hoang Phu	Xã Hoằng Phụ	Hoang Phu Commune	hoang_phu	399	10
16006	Hoằng Trường	Hoang Truong	Xã Hoằng Trường	Hoang Truong Commune	hoang_truong	399	10
16012	Hậu Lộc	Hau Loc	Thị trấn Hậu Lộc	Hau Loc Township	hau_loc	400	9
16015	Đồng Lộc	Dong Loc	Xã Đồng Lộc	Dong Loc Commune	dong_loc	400	10
16018	Đại Lộc	Dai Loc	Xã Đại Lộc	Dai Loc Commune	dai_loc	400	10
16021	Triệu Lộc	Trieu Loc	Xã Triệu Lộc	Trieu Loc Commune	trieu_loc	400	10
16027	Tiến Lộc	Tien Loc	Xã Tiến Lộc	Tien Loc Commune	tien_loc	400	10
16030	Lộc Sơn	Loc Son	Xã Lộc Sơn	Loc Son Commune	loc_son	400	10
16033	Cầu Lộc	Cau Loc	Xã Cầu Lộc	Cau Loc Commune	cau_loc	400	10
16036	Thành Lộc	Thanh Loc	Xã Thành Lộc	Thanh Loc Commune	thanh_loc	400	10
16039	Tuy Lộc	Tuy Loc	Xã Tuy Lộc	Tuy Loc Commune	tuy_loc	400	10
16042	Phong Lộc	Phong Loc	Xã Phong Lộc	Phong Loc Commune	phong_loc	400	10
16045	Mỹ Lộc	My Loc	Xã Mỹ Lộc	My Loc Commune	my_loc	400	10
16048	Thuần Lộc	Thuan Loc	Xã Thuần Lộc	Thuan Loc Commune	thuan_loc	400	10
16057	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	400	10
16063	Hoa Lộc	Hoa Loc	Xã Hoa Lộc	Hoa Loc Commune	hoa_loc	400	10
16066	Liên Lộc	Lien Loc	Xã Liên Lộc	Lien Loc Commune	lien_loc	400	10
16069	Quang Lộc	Quang Loc	Xã Quang Lộc	Quang Loc Commune	quang_loc	400	10
16072	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	400	10
16075	Hòa Lộc	Hoa Loc	Xã Hòa Lộc	Hoa Loc Commune	hoa_loc	400	10
16078	Minh Lộc	Minh Loc	Xã Minh Lộc	Minh Loc Commune	minh_loc	400	10
16081	Hưng Lộc	Hung Loc	Xã Hưng Lộc	Hung Loc Commune	hung_loc	400	10
16084	Hải Lộc	Hai Loc	Xã Hải Lộc	Hai Loc Commune	hai_loc	400	10
16087	Đa Lộc	Da Loc	Xã Đa Lộc	Da Loc Commune	da_loc	400	10
16090	Ngư Lộc	Ngu Loc	Xã Ngư Lộc	Ngu Loc Commune	ngu_loc	400	10
16093	Nga Sơn	Nga Son	Thị trấn Nga Sơn	Nga Son Township	nga_son	401	9
16096	Ba Đình	Ba Dinh	Xã Ba Đình	Ba Dinh Commune	ba_dinh	401	10
16099	Nga Vịnh	Nga Vinh	Xã Nga Vịnh	Nga Vinh Commune	nga_vinh	401	10
16102	Nga Văn	Nga Van	Xã Nga Văn	Nga Van Commune	nga_van	401	10
16105	Nga Thiện	Nga Thien	Xã Nga Thiện	Nga Thien Commune	nga_thien	401	10
16108	Nga Tiến	Nga Tien	Xã Nga Tiến	Nga Tien Commune	nga_tien	401	10
16114	Nga Phượng	Nga Phuong	Xã Nga Phượng	Nga Phuong Commune	nga_phuong	401	10
16117	Nga Trung	Nga Trung	Xã Nga Trung	Nga Trung Commune	nga_trung	401	10
16120	Nga Bạch	Nga Bach	Xã Nga Bạch	Nga Bach Commune	nga_bach	401	10
16123	Nga Thanh	Nga Thanh	Xã Nga Thanh	Nga Thanh Commune	nga_thanh	401	10
16132	Nga Yên	Nga Yen	Xã Nga Yên	Nga Yen Commune	nga_yen	401	10
16135	Nga Giáp	Nga Giap	Xã Nga Giáp	Nga Giap Commune	nga_giap	401	10
16138	Nga Hải	Nga Hai	Xã Nga Hải	Nga Hai Commune	nga_hai	401	10
16141	Nga Thành	Nga Thanh	Xã Nga Thành	Nga Thanh Commune	nga_thanh	401	10
16144	Nga An	Nga An	Xã Nga An	Nga An Commune	nga_an	401	10
16147	Nga Phú	Nga Phu	Xã Nga Phú	Nga Phu Commune	nga_phu	401	10
16150	Nga Điền	Nga Dien	Xã Nga Điền	Nga Dien Commune	nga_dien	401	10
16153	Nga Tân	Nga Tan	Xã Nga Tân	Nga Tan Commune	nga_tan	401	10
16156	Nga Thủy	Nga Thuy	Xã Nga Thủy	Nga Thuy Commune	nga_thuy	401	10
16159	Nga Liên	Nga Lien	Xã Nga Liên	Nga Lien Commune	nga_lien	401	10
16162	Nga Thái	Nga Thai	Xã Nga Thái	Nga Thai Commune	nga_thai	401	10
16165	Nga Thạch	Nga Thach	Xã Nga Thạch	Nga Thach Commune	nga_thach	401	10
16168	Nga Thắng	Nga Thang	Xã Nga Thắng	Nga Thang Commune	nga_thang	401	10
16171	Nga Trường	Nga Truong	Xã Nga Trường	Nga Truong Commune	nga_truong	401	10
16174	Yên Cát	Yen Cat	Thị trấn Yên Cát	Yen Cat Township	yen_cat	402	9
16177	Bãi Trành	Bai Tranh	Xã Bãi Trành	Bai Tranh Commune	bai_tranh	402	10
16180	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	402	10
16183	Xuân Bình	Xuan Binh	Xã Xuân Bình	Xuan Binh Commune	xuan_binh	402	10
16186	Hóa Quỳ	Hoa Quy	Xã Hóa Quỳ	Hoa Quy Commune	hoa_quy	402	10
16195	Cát Vân	Cat Van	Xã Cát Vân	Cat Van Commune	cat_van	402	10
16198	Cát Tân	Cat Tan	Xã Cát Tân	Cat Tan Commune	cat_tan	402	10
16201	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	402	10
16204	Bình Lương	Binh Luong	Xã Bình Lương	Binh Luong Commune	binh_luong	402	10
16207	Thanh Quân	Thanh Quan	Xã Thanh Quân	Thanh Quan Commune	thanh_quan	402	10
16210	Thanh Xuân	Thanh Xuan	Xã Thanh Xuân	Thanh Xuan Commune	thanh_xuan	402	10
16213	Thanh Hòa	Thanh Hoa	Xã Thanh Hòa	Thanh Hoa Commune	thanh_hoa	402	10
16216	Thanh Phong	Thanh Phong	Xã Thanh Phong	Thanh Phong Commune	thanh_phong	402	10
16219	Thanh Lâm	Thanh Lam	Xã Thanh Lâm	Thanh Lam Commune	thanh_lam	402	10
16222	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	402	10
16225	Thượng Ninh	Thuong Ninh	Xã Thượng Ninh	Thuong Ninh Commune	thuong_ninh	402	10
27301	04	04	Phường 04	04 Ward	04	774	8
16228	Bến Sung	Ben Sung	Thị trấn Bến Sung	Ben Sung Township	ben_sung	403	9
16231	Cán Khê	Can Khe	Xã Cán Khê	Can Khe Commune	can_khe	403	10
16234	Xuân Du	Xuan Du	Xã Xuân Du	Xuan Du Commune	xuan_du	403	10
16240	Phượng Nghi	Phuong Nghi	Xã Phượng Nghi	Phuong Nghi Commune	phuong_nghi	403	10
16243	Mậu Lâm	Mau Lam	Xã Mậu Lâm	Mau Lam Commune	mau_lam	403	10
16246	Xuân Khang	Xuan Khang	Xã Xuân Khang	Xuan Khang Commune	xuan_khang	403	10
16249	Phú Nhuận	Phu Nhuan	Xã Phú Nhuận	Phu Nhuan Commune	phu_nhuan	403	10
16252	Hải Long	Hai Long	Xã Hải Long	Hai Long Commune	hai_long	403	10
16258	Xuân Thái	Xuan Thai	Xã Xuân Thái	Xuan Thai Commune	xuan_thai	403	10
16261	Xuân Phúc	Xuan Phuc	Xã Xuân Phúc	Xuan Phuc Commune	xuan_phuc	403	10
16264	Yên Thọ	Yen Tho	Xã Yên Thọ	Yen Tho Commune	yen_tho	403	10
16267	Yên Lạc	Yen Lac	Xã Yên Lạc	Yen Lac Commune	yen_lac	403	10
16273	Thanh Tân	Thanh Tan	Xã Thanh Tân	Thanh Tan Commune	thanh_tan	403	10
16276	Thanh Kỳ	Thanh Ky	Xã Thanh Kỳ	Thanh Ky Commune	thanh_ky	403	10
16279	Nông Cống	Nong Cong	Thị trấn Nông Cống	Nong Cong Township	nong_cong	404	9
16282	Tân Phúc	Tan Phuc	Xã Tân Phúc	Tan Phuc Commune	tan_phuc	404	10
16285	Tân Thọ	Tan Tho	Xã Tân Thọ	Tan Tho Commune	tan_tho	404	10
16288	Hoàng Sơn	Hoang Son	Xã Hoàng Sơn	Hoang Son Commune	hoang_son	404	10
16291	Tân Khang	Tan Khang	Xã Tân Khang	Tan Khang Commune	tan_khang	404	10
16294	Hoàng Giang	Hoang Giang	Xã Hoàng Giang	Hoang Giang Commune	hoang_giang	404	10
16297	Trung Chính	Trung Chinh	Xã Trung Chính	Trung Chinh Commune	trung_chinh	404	10
16303	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	404	10
16309	Tế Thắng	Te Thang	Xã Tế Thắng	Te Thang Commune	te_thang	404	10
16315	Tế Lợi	Te Loi	Xã Tế Lợi	Te Loi Commune	te_loi	404	10
16318	Tế Nông	Te Nong	Xã Tế Nông	Te Nong Commune	te_nong	404	10
16321	Minh Nghĩa	Minh Nghia	Xã Minh Nghĩa	Minh Nghia Commune	minh_nghia	404	10
16324	Minh Khôi	Minh Khoi	Xã Minh Khôi	Minh Khoi Commune	minh_khoi	404	10
16327	Vạn Hòa	Van Hoa	Xã Vạn Hòa	Van Hoa Commune	van_hoa	404	10
16330	Trường Trung	Truong Trung	Xã Trường Trung	Truong Trung Commune	truong_trung	404	10
16333	Vạn Thắng	Van Thang	Xã Vạn Thắng	Van Thang Commune	van_thang	404	10
16336	Trường Giang	Truong Giang	Xã Trường Giang	Truong Giang Commune	truong_giang	404	10
16339	Vạn Thiện	Van Thien	Xã Vạn Thiện	Van Thien Commune	van_thien	404	10
16342	Thăng Long	Thang Long	Xã Thăng Long	Thang Long Commune	thang_long	404	10
16345	Trường Minh	Truong Minh	Xã Trường Minh	Truong Minh Commune	truong_minh	404	10
16348	Trường Sơn	Truong Son	Xã Trường Sơn	Truong Son Commune	truong_son	404	10
16351	Thăng Bình	Thang Binh	Xã Thăng Bình	Thang Binh Commune	thang_binh	404	10
16354	Công Liêm	Cong Liem	Xã Công Liêm	Cong Liem Commune	cong_liem	404	10
16357	Tượng Văn	Tuong Van	Xã Tượng Văn	Tuong Van Commune	tuong_van	404	10
16360	Thăng Thọ	Thang Tho	Xã Thăng Thọ	Thang Tho Commune	thang_tho	404	10
16363	Tượng Lĩnh	Tuong Linh	Xã Tượng Lĩnh	Tuong Linh Commune	tuong_linh	404	10
16366	Tượng Sơn	Tuong Son	Xã Tượng Sơn	Tuong Son Commune	tuong_son	404	10
16369	Công Chính	Cong Chinh	Xã Công Chính	Cong Chinh Commune	cong_chinh	404	10
16375	Yên Mỹ	Yen My	Xã Yên Mỹ	Yen My Commune	yen_my	404	10
16378	Rừng Thông	Rung Thong	Thị trấn Rừng Thông	Rung Thong Township	rung_thong	405	9
16381	Đông Hoàng	Dong Hoang	Xã Đông Hoàng	Dong Hoang Commune	dong_hoang	405	10
16384	Đông Ninh	Dong Ninh	Xã Đông Ninh	Dong Ninh Commune	dong_ninh	405	10
16390	Đông Hòa	Dong Hoa	Xã Đông Hòa	Dong Hoa Commune	dong_hoa	405	10
16393	Đông Yên	Dong Yen	Xã Đông Yên	Dong Yen Commune	dong_yen	405	10
16399	Đông Minh	Dong Minh	Xã Đông Minh	Dong Minh Commune	dong_minh	405	10
16402	Đông Thanh	Dong Thanh	Xã Đông Thanh	Dong Thanh Commune	dong_thanh	405	10
16405	Đông Tiến	Dong Tien	Xã Đông Tiến	Dong Tien Commune	dong_tien	405	10
16408	Đông Khê	Dong Khe	Xã Đông Khê	Dong Khe Commune	dong_khe	405	10
16414	Đông Thịnh	Dong Thinh	Xã Đông Thịnh	Dong Thinh Commune	dong_thinh	405	10
16417	Đông Văn	Dong Van	Xã Đông Văn	Dong Van Commune	dong_van	405	10
16420	Đông Phú	Dong Phu	Xã Đông Phú	Dong Phu Commune	dong_phu	405	10
16423	Đông Nam	Dong Nam	Xã Đông Nam	Dong Nam Commune	dong_nam	405	10
16426	Đông Quang	Dong Quang	Xã Đông Quang	Dong Quang Commune	dong_quang	405	10
16438	Tân Phong	Tan Phong	Thị trấn Tân Phong	Tan Phong Township	tan_phong	406	9
16447	Quảng Trạch	Quang Trach	Xã Quảng Trạch	Quang Trach Commune	quang_trach	406	10
16453	Quảng Đức	Quang Duc	Xã Quảng Đức	Quang Duc Commune	quang_duc	406	10
16456	Quảng Định	Quang Dinh	Xã Quảng Định	Quang Dinh Commune	quang_dinh	406	10
16462	Quảng Nhân	Quang Nhan	Xã Quảng Nhân	Quang Nhan Commune	quang_nhan	406	10
16465	Quảng Ninh	Quang Ninh	Xã Quảng Ninh	Quang Ninh Commune	quang_ninh	406	10
16468	Quảng Bình	Quang Binh	Xã Quảng Bình	Quang Binh Commune	quang_binh	406	10
16471	Quảng Hợp	Quang Hop	Xã Quảng Hợp	Quang Hop Commune	quang_hop	406	10
16474	Quảng Văn	Quang Van	Xã Quảng Văn	Quang Van Commune	quang_van	406	10
16477	Quảng Long	Quang Long	Xã Quảng Long	Quang Long Commune	quang_long	406	10
16480	Quảng Yên	Quang Yen	Xã Quảng Yên	Quang Yen Commune	quang_yen	406	10
16483	Quảng Hòa	Quang Hoa	Xã Quảng Hòa	Quang Hoa Commune	quang_hoa	406	10
16489	Quảng Khê	Quang Khe	Xã Quảng Khê	Quang Khe Commune	quang_khe	406	10
16492	Quảng Trung	Quang Trung	Xã Quảng Trung	Quang Trung Commune	quang_trung	406	10
16495	Quảng Chính	Quang Chinh	Xã Quảng Chính	Quang Chinh Commune	quang_chinh	406	10
16498	Quảng Ngọc	Quang Ngoc	Xã Quảng Ngọc	Quang Ngoc Commune	quang_ngoc	406	10
16501	Quảng Trường	Quang Truong	Xã Quảng Trường	Quang Truong Commune	quang_truong	406	10
16510	Quảng Phúc	Quang Phuc	Xã Quảng Phúc	Quang Phuc Commune	quang_phuc	406	10
16519	Quảng Giao	Quang Giao	Xã Quảng Giao	Quang Giao Commune	quang_giao	406	10
16540	Quảng Hải	Quang Hai	Xã Quảng Hải	Quang Hai Commune	quang_hai	406	10
16543	Quảng Lưu	Quang Luu	Xã Quảng Lưu	Quang Luu Commune	quang_luu	406	10
16546	Quảng Lộc	Quang Loc	Xã Quảng Lộc	Quang Loc Commune	quang_loc	406	10
16549	Tiên Trang	Tien Trang	Xã Tiên Trang	Tien Trang Commune	tien_trang	406	10
16552	Quảng Nham	Quang Nham	Xã Quảng Nham	Quang Nham Commune	quang_nham	406	10
16555	Quảng Thạch	Quang Thach	Xã Quảng Thạch	Quang Thach Commune	quang_thach	406	10
16558	Quảng Thái	Quang Thai	Xã Quảng Thái	Quang Thai Commune	quang_thai	406	10
16561	Hải Hòa	Hai Hoa	Phường Hải Hòa	Hai Hoa Ward	hai_hoa	407	8
16564	Hải Châu	Hai Chau	Phường Hải Châu	Hai Chau Ward	hai_chau	407	8
16567	Thanh Thủy	Thanh Thuy	Xã Thanh Thủy	Thanh Thuy Commune	thanh_thuy	407	10
16570	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	407	10
16576	Hải Ninh	Hai Ninh	Phường Hải Ninh	Hai Ninh Ward	hai_ninh	407	8
16579	Anh Sơn	Anh Son	Xã Anh Sơn	Anh Son Commune	anh_son	407	10
16582	Ngọc Lĩnh	Ngoc Linh	Xã Ngọc Lĩnh	Ngoc Linh Commune	ngoc_linh	407	10
16585	Hải An	Hai An	Phường Hải An	Hai An Ward	hai_an	407	8
16591	Các Sơn	Cac Son	Xã Các Sơn	Cac Son Commune	cac_son	407	10
16594	Tân Dân	Tan Dan	Phường Tân Dân	Tan Dan Ward	tan_dan	407	8
16597	Hải Lĩnh	Hai Linh	Phường Hải Lĩnh	Hai Linh Ward	hai_linh	407	8
16600	Định Hải	Dinh Hai	Xã Định Hải	Dinh Hai Commune	dinh_hai	407	10
16603	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	407	10
16606	Ninh Hải	Ninh Hai	Phường Ninh Hải	Ninh Hai Ward	ninh_hai	407	8
16609	Nguyên Bình	Nguyen Binh	Phường Nguyên Bình	Nguyen Binh Ward	nguyen_binh	407	8
16612	Hải Nhân	Hai Nhan	Xã Hải Nhân	Hai Nhan Commune	hai_nhan	407	10
16618	Bình Minh	Binh Minh	Phường Bình Minh	Binh Minh Ward	binh_minh	407	8
16621	Hải Thanh	Hai Thanh	Phường Hải Thanh	Hai Thanh Ward	hai_thanh	407	8
16624	Phú Lâm	Phu Lam	Xã Phú Lâm	Phu Lam Commune	phu_lam	407	10
16627	Xuân Lâm	Xuan Lam	Phường Xuân Lâm	Xuan Lam Ward	xuan_lam	407	8
16630	Trúc Lâm	Truc Lam	Phường Trúc Lâm	Truc Lam Ward	truc_lam	407	8
16633	Hải Bình	Hai Binh	Phường Hải Bình	Hai Binh Ward	hai_binh	407	8
16636	Tân Trường	Tan Truong	Xã Tân Trường	Tan Truong Commune	tan_truong	407	10
16639	Tùng Lâm	Tung Lam	Xã Tùng Lâm	Tung Lam Commune	tung_lam	407	10
16642	Tĩnh Hải	Tinh Hai	Phường Tĩnh Hải	Tinh Hai Ward	tinh_hai	407	8
16645	Mai Lâm	Mai Lam	Phường Mai Lâm	Mai Lam Ward	mai_lam	407	8
16648	Trường Lâm	Truong Lam	Xã Trường Lâm	Truong Lam Commune	truong_lam	407	10
16651	Hải Yến	Hai Yen	Xã Hải Yến	Hai Yen Commune	hai_yen	407	10
16654	Hải Thượng	Hai Thuong	Phường Hải Thượng	Hai Thuong Ward	hai_thuong	407	8
16657	Nghi Sơn	Nghi Son	Xã Nghi Sơn	Nghi Son Commune	nghi_son	407	10
16660	Hải Hà	Hai Ha	Xã Hải Hà	Hai Ha Commune	hai_ha	407	10
16663	Đông Vĩnh	Dong Vinh	Phường Đông Vĩnh	Dong Vinh Ward	dong_vinh	412	8
16666	Hà Huy Tập	Ha Huy Tap	Phường Hà Huy Tập	Ha Huy Tap Ward	ha_huy_tap	412	8
16669	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	412	8
16670	Quán Bàu	Quan Bau	Phường Quán Bàu	Quan Bau Ward	quan_bau	412	8
16672	Hưng Bình	Hung Binh	Phường Hưng Bình	Hung Binh Ward	hung_binh	412	8
16673	Hưng Phúc	Hung Phuc	Phường Hưng Phúc	Hung Phuc Ward	hung_phuc	412	8
16675	Hưng Dũng	Hung Dung	Phường Hưng Dũng	Hung Dung Ward	hung_dung	412	8
16678	Cửa Nam	Cua Nam	Phường Cửa Nam	Cua Nam Ward	cua_nam	412	8
16681	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	412	8
16684	Đội Cung	Doi Cung	Phường Đội Cung	Doi Cung Ward	doi_cung	412	8
16687	Lê Mao	Le Mao	Phường Lê Mao	Le Mao Ward	le_mao	412	8
16690	Trường Thi	Truong Thi	Phường Trường Thi	Truong Thi Ward	truong_thi	412	8
16693	Bến Thủy	Ben Thuy	Phường Bến Thủy	Ben Thuy Ward	ben_thuy	412	8
16696	Hồng Sơn	Hong Son	Phường Hồng Sơn	Hong Son Ward	hong_son	412	8
16699	Trung Đô	Trung Do	Phường Trung Đô	Trung Do Ward	trung_do	412	8
16702	Nghi Phú	Nghi Phu	Xã Nghi Phú	Nghi Phu Commune	nghi_phu	412	10
16705	Hưng Đông	Hung Dong	Xã Hưng Đông	Hung Dong Commune	hung_dong	412	10
16708	Hưng Lộc	Hung Loc	Xã Hưng Lộc	Hung Loc Commune	hung_loc	412	10
16711	Hưng Hòa	Hung Hoa	Xã Hưng Hòa	Hung Hoa Commune	hung_hoa	412	10
16714	Vinh Tân	Vinh Tan	Phường Vinh Tân	Vinh Tan Ward	vinh_tan	412	8
17908	Nghi Liên	Nghi Lien	Xã Nghi Liên	Nghi Lien Commune	nghi_lien	412	10
17914	Nghi Ân	Nghi An	Xã Nghi Ân	Nghi An Commune	nghi_an	412	10
17920	Nghi Kim	Nghi Kim	Xã Nghi Kim	Nghi Kim Commune	nghi_kim	412	10
17923	Nghi Đức	Nghi Duc	Xã Nghi Đức	Nghi Duc Commune	nghi_duc	412	10
18013	Hưng Chính	Hung Chinh	Xã Hưng Chính	Hung Chinh Commune	hung_chinh	412	10
16717	Nghi Thuỷ	Nghi Thuy	Phường Nghi Thuỷ	Nghi Thuy Ward	nghi_thuy	413	8
16720	Nghi Tân	Nghi Tan	Phường Nghi Tân	Nghi Tan Ward	nghi_tan	413	8
16723	Thu Thuỷ	Thu Thuy	Phường Thu Thuỷ	Thu Thuy Ward	thu_thuy	413	8
16726	Nghi Hòa	Nghi Hoa	Phường Nghi Hòa	Nghi Hoa Ward	nghi_hoa	413	8
16729	Nghi Hải	Nghi Hai	Phường Nghi Hải	Nghi Hai Ward	nghi_hai	413	8
16732	Nghi Hương	Nghi Huong	Phường Nghi Hương	Nghi Huong Ward	nghi_huong	413	8
16735	Nghi Thu	Nghi Thu	Phường Nghi Thu	Nghi Thu Ward	nghi_thu	413	8
16939	Hoà Hiếu	Hoa Hieu	Phường Hoà Hiếu	Hoa Hieu Ward	hoa_hieu	414	8
16993	Quang Phong	Quang Phong	Phường Quang Phong	Quang Phong Ward	quang_phong	414	8
16994	Quang Tiến	Quang Tien	Phường Quang Tiến	Quang Tien Ward	quang_tien	414	8
17003	Long Sơn	Long Son	Phường Long Sơn	Long Son Ward	long_son	414	8
17005	Nghĩa Tiến	Nghia Tien	Xã Nghĩa Tiến	Nghia Tien Commune	nghia_tien	414	10
17008	Nghĩa Mỹ	Nghia My	Xã Nghĩa Mỹ	Nghia My Commune	nghia_my	414	10
17011	Tây Hiếu	Tay Hieu	Xã Tây Hiếu	Tay Hieu Commune	tay_hieu	414	10
17014	Nghĩa Thuận	Nghia Thuan	Xã Nghĩa Thuận	Nghia Thuan Commune	nghia_thuan	414	10
17017	Đông Hiếu	Dong Hieu	Xã Đông Hiếu	Dong Hieu Commune	dong_hieu	414	10
16738	Kim Sơn	Kim Son	Thị trấn Kim Sơn	Kim Son Township	kim_son	415	9
16741	Thông Thụ	Thong Thu	Xã Thông Thụ	Thong Thu Commune	thong_thu	415	10
16744	Đồng Văn	Dong Van	Xã Đồng Văn	Dong Van Commune	dong_van	415	10
16747	Hạnh Dịch	Hanh Dich	Xã Hạnh Dịch	Hanh Dich Commune	hanh_dich	415	10
16750	Tiền Phong	Tien Phong	Xã Tiền Phong	Tien Phong Commune	tien_phong	415	10
16753	Nậm Giải	Nam Giai	Xã Nậm Giải	Nam Giai Commune	nam_giai	415	10
16756	Tri Lễ	Tri Le	Xã Tri Lễ	Tri Le Commune	tri_le	415	10
16759	Châu Kim	Chau Kim	Xã Châu Kim	Chau Kim Commune	chau_kim	415	10
16763	Mường Nọc	Muong Noc	Xã Mường Nọc	Muong Noc Commune	muong_noc	415	10
16765	Châu Thôn	Chau Thon	Xã Châu Thôn	Chau Thon Commune	chau_thon	415	10
16768	Nậm Nhoóng	Nam Nhoong	Xã Nậm Nhoóng	Nam Nhoong Commune	nam_nhoong	415	10
16771	Quang Phong	Quang Phong	Xã Quang Phong	Quang Phong Commune	quang_phong	415	10
16774	Căm Muộn	Cam Muon	Xã Căm Muộn	Cam Muon Commune	cam_muon	415	10
16777	Tân Lạc	Tan Lac	Thị trấn Tân Lạc	Tan Lac Township	tan_lac	416	9
16780	Châu Bính	Chau Binh	Xã Châu Bính	Chau Binh Commune	chau_binh	416	10
16783	Châu Thuận	Chau Thuan	Xã Châu Thuận	Chau Thuan Commune	chau_thuan	416	10
16786	Châu Hội	Chau Hoi	Xã Châu Hội	Chau Hoi Commune	chau_hoi	416	10
16789	Châu Nga	Chau Nga	Xã Châu Nga	Chau Nga Commune	chau_nga	416	10
16792	Châu Tiến	Chau Tien	Xã Châu Tiến	Chau Tien Commune	chau_tien	416	10
16795	Châu Hạnh	Chau Hanh	Xã Châu Hạnh	Chau Hanh Commune	chau_hanh	416	10
16798	Châu Thắng	Chau Thang	Xã Châu Thắng	Chau Thang Commune	chau_thang	416	10
16801	Châu Phong	Chau Phong	Xã Châu Phong	Chau Phong Commune	chau_phong	416	10
16804	Châu Bình	Chau Binh	Xã Châu Bình	Chau Binh Commune	chau_binh	416	10
16807	Châu Hoàn	Chau Hoan	Xã Châu Hoàn	Chau Hoan Commune	chau_hoan	416	10
16810	Diên Lãm	Dien Lam	Xã Diên Lãm	Dien Lam Commune	dien_lam	416	10
16813	Mường Xén	Muong Xen	Thị trấn Mường Xén	Muong Xen Township	muong_xen	417	9
16816	Mỹ Lý	My Ly	Xã Mỹ Lý	My Ly Commune	my_ly	417	10
16819	Bắc Lý	Bac Ly	Xã Bắc Lý	Bac Ly Commune	bac_ly	417	10
16822	Keng Đu	Keng Du	Xã Keng Đu	Keng Du Commune	keng_du	417	10
16825	Đoọc Mạy	Dooc May	Xã Đoọc Mạy	Dooc May Commune	dooc_may	417	10
16828	Huồi Tụ	Huoi Tu	Xã Huồi Tụ	Huoi Tu Commune	huoi_tu	417	10
16831	Mường Lống	Muong Long	Xã Mường Lống	Muong Long Commune	muong_long	417	10
16834	Na Loi	Na Loi	Xã Na Loi	Na Loi Commune	na_loi	417	10
16837	Nậm Cắn	Nam Can	Xã Nậm Cắn	Nam Can Commune	nam_can	417	10
16840	Bảo Nam	Bao Nam	Xã Bảo Nam	Bao Nam Commune	bao_nam	417	10
16843	Phà Đánh	Pha Danh	Xã Phà Đánh	Pha Danh Commune	pha_danh	417	10
16846	Bảo Thắng	Bao Thang	Xã Bảo Thắng	Bao Thang Commune	bao_thang	417	10
16849	Hữu Lập	Huu Lap	Xã Hữu Lập	Huu Lap Commune	huu_lap	417	10
16852	Tà Cạ	Ta Ca	Xã Tà Cạ	Ta Ca Commune	ta_ca	417	10
16855	Chiêu Lưu	Chieu Luu	Xã Chiêu Lưu	Chieu Luu Commune	chieu_luu	417	10
16858	Mường Típ	Muong Tip	Xã Mường Típ	Muong Tip Commune	muong_tip	417	10
16861	Hữu Kiệm	Huu Kiem	Xã Hữu Kiệm	Huu Kiem Commune	huu_kiem	417	10
16864	Tây Sơn	Tay Son	Xã Tây Sơn	Tay Son Commune	tay_son	417	10
16867	Mường Ải	Muong Ai	Xã Mường Ải	Muong Ai Commune	muong_ai	417	10
16870	Na Ngoi	Na Ngoi	Xã Na Ngoi	Na Ngoi Commune	na_ngoi	417	10
16873	Nậm Càn	Nam Can	Xã Nậm Càn	Nam Can Commune	nam_can	417	10
16876	Thạch Giám	Thach Giam	Thị trấn Thạch Giám	Thach Giam Township	thach_giam	418	9
16879	Mai Sơn	Mai Son	Xã Mai Sơn	Mai Son Commune	mai_son	418	10
16882	Nhôn Mai	Nhon Mai	Xã Nhôn Mai	Nhon Mai Commune	nhon_mai	418	10
16885	Hữu Khuông	Huu Khuong	Xã Hữu Khuông	Huu Khuong Commune	huu_khuong	418	10
16900	Yên Tĩnh	Yen Tinh	Xã Yên Tĩnh	Yen Tinh Commune	yen_tinh	418	10
16903	Nga My	Nga My	Xã Nga My	Nga My Commune	nga_my	418	10
16904	Xiêng My	Xieng My	Xã Xiêng My	Xieng My Commune	xieng_my	418	10
16906	Lưỡng Minh	Luong Minh	Xã Lưỡng Minh	Luong Minh Commune	luong_minh	418	10
16909	Yên Hòa	Yen Hoa	Xã Yên Hòa	Yen Hoa Commune	yen_hoa	418	10
16912	Yên Na	Yen Na	Xã Yên Na	Yen Na Commune	yen_na	418	10
16915	Lưu Kiền	Luu Kien	Xã Lưu Kiền	Luu Kien Commune	luu_kien	418	10
16921	Xá Lượng	Xa Luong	Xã Xá Lượng	Xa Luong Commune	xa_luong	418	10
16924	Tam Thái	Tam Thai	Xã Tam Thái	Tam Thai Commune	tam_thai	418	10
16927	Tam Đình	Tam Dinh	Xã Tam Đình	Tam Dinh Commune	tam_dinh	418	10
16930	Yên Thắng	Yen Thang	Xã Yên Thắng	Yen Thang Commune	yen_thang	418	10
16933	Tam Quang	Tam Quang	Xã Tam Quang	Tam Quang Commune	tam_quang	418	10
16936	Tam Hợp	Tam Hop	Xã Tam Hợp	Tam Hop Commune	tam_hop	418	10
16941	Nghĩa Đàn	Nghia Dan	Thị trấn Nghĩa Đàn	Nghia Dan Township	nghia_dan	419	9
16942	Nghĩa Mai	Nghia Mai	Xã Nghĩa Mai	Nghia Mai Commune	nghia_mai	419	10
16945	Nghĩa Yên	Nghia Yen	Xã Nghĩa Yên	Nghia Yen Commune	nghia_yen	419	10
16948	Nghĩa Lạc	Nghia Lac	Xã Nghĩa Lạc	Nghia Lac Commune	nghia_lac	419	10
16951	Nghĩa Lâm	Nghia Lam	Xã Nghĩa Lâm	Nghia Lam Commune	nghia_lam	419	10
16954	Nghĩa Sơn	Nghia Son	Xã Nghĩa Sơn	Nghia Son Commune	nghia_son	419	10
16957	Nghĩa Lợi	Nghia Loi	Xã Nghĩa Lợi	Nghia Loi Commune	nghia_loi	419	10
16960	Nghĩa Bình	Nghia Binh	Xã Nghĩa Bình	Nghia Binh Commune	nghia_binh	419	10
16963	Nghĩa Thọ	Nghia Tho	Xã Nghĩa Thọ	Nghia Tho Commune	nghia_tho	419	10
16966	Nghĩa Minh	Nghia Minh	Xã Nghĩa Minh	Nghia Minh Commune	nghia_minh	419	10
16969	Nghĩa Phú	Nghia Phu	Xã Nghĩa Phú	Nghia Phu Commune	nghia_phu	419	10
16972	Nghĩa Hưng	Nghia Hung	Xã Nghĩa Hưng	Nghia Hung Commune	nghia_hung	419	10
16975	Nghĩa Hồng	Nghia Hong	Xã Nghĩa Hồng	Nghia Hong Commune	nghia_hong	419	10
16978	Nghĩa Thịnh	Nghia Thinh	Xã Nghĩa Thịnh	Nghia Thinh Commune	nghia_thinh	419	10
16981	Nghĩa Trung	Nghia Trung	Xã Nghĩa Trung	Nghia Trung Commune	nghia_trung	419	10
16984	Nghĩa Hội	Nghia Hoi	Xã Nghĩa Hội	Nghia Hoi Commune	nghia_hoi	419	10
16987	Nghĩa Thành	Nghia Thanh	Xã Nghĩa Thành	Nghia Thanh Commune	nghia_thanh	419	10
16996	Nghĩa Hiếu	Nghia Hieu	Xã Nghĩa Hiếu	Nghia Hieu Commune	nghia_hieu	419	10
17020	Nghĩa Đức	Nghia Duc	Xã Nghĩa Đức	Nghia Duc Commune	nghia_duc	419	10
17023	Nghĩa An	Nghia An	Xã Nghĩa An	Nghia An Commune	nghia_an	419	10
17026	Nghĩa Long	Nghia Long	Xã Nghĩa Long	Nghia Long Commune	nghia_long	419	10
17029	Nghĩa Lộc	Nghia Loc	Xã Nghĩa Lộc	Nghia Loc Commune	nghia_loc	419	10
17032	Nghĩa Khánh	Nghia Khanh	Xã Nghĩa Khánh	Nghia Khanh Commune	nghia_khanh	419	10
17035	Quỳ Hợp	Quy Hop	Thị trấn Quỳ Hợp	Quy Hop Township	quy_hop	420	9
17038	Yên Hợp	Yen Hop	Xã Yên Hợp	Yen Hop Commune	yen_hop	420	10
17041	Châu Tiến	Chau Tien	Xã Châu Tiến	Chau Tien Commune	chau_tien	420	10
17044	Châu Hồng	Chau Hong	Xã Châu Hồng	Chau Hong Commune	chau_hong	420	10
17047	Đồng Hợp	Dong Hop	Xã Đồng Hợp	Dong Hop Commune	dong_hop	420	10
17050	Châu Thành	Chau Thanh	Xã Châu Thành	Chau Thanh Commune	chau_thanh	420	10
17053	Liên Hợp	Lien Hop	Xã Liên Hợp	Lien Hop Commune	lien_hop	420	10
17056	Châu Lộc	Chau Loc	Xã Châu Lộc	Chau Loc Commune	chau_loc	420	10
17059	Tam Hợp	Tam Hop	Xã Tam Hợp	Tam Hop Commune	tam_hop	420	10
17062	Châu Cường	Chau Cuong	Xã Châu Cường	Chau Cuong Commune	chau_cuong	420	10
17065	Châu Quang	Chau Quang	Xã Châu Quang	Chau Quang Commune	chau_quang	420	10
17068	Thọ Hợp	Tho Hop	Xã Thọ Hợp	Tho Hop Commune	tho_hop	420	10
17071	Minh Hợp	Minh Hop	Xã Minh Hợp	Minh Hop Commune	minh_hop	420	10
17074	Nghĩa Xuân	Nghia Xuan	Xã Nghĩa Xuân	Nghia Xuan Commune	nghia_xuan	420	10
17077	Châu Thái	Chau Thai	Xã Châu Thái	Chau Thai Commune	chau_thai	420	10
17080	Châu Đình	Chau Dinh	Xã Châu Đình	Chau Dinh Commune	chau_dinh	420	10
17083	Văn Lợi	Van Loi	Xã Văn Lợi	Van Loi Commune	van_loi	420	10
17086	Nam Sơn	Nam Son	Xã Nam Sơn	Nam Son Commune	nam_son	420	10
17089	Châu Lý	Chau Ly	Xã Châu Lý	Chau Ly Commune	chau_ly	420	10
17092	Hạ Sơn	Ha Son	Xã Hạ Sơn	Ha Son Commune	ha_son	420	10
17095	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	420	10
17098	Cầu Giát	Cau Giat	Thị trấn Cầu Giát	Cau Giat Township	cau_giat	421	9
17101	Quỳnh Thắng	Quynh Thang	Xã Quỳnh Thắng	Quynh Thang Commune	quynh_thang	421	10
17119	Quỳnh Tân	Quynh Tan	Xã Quỳnh Tân	Quynh Tan Commune	quynh_tan	421	10
17122	Quỳnh Châu	Quynh Chau	Xã Quỳnh Châu	Quynh Chau Commune	quynh_chau	421	10
17140	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	421	10
17143	Quỳnh Văn	Quynh Van	Xã Quỳnh Văn	Quynh Van Commune	quynh_van	421	10
17146	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	421	10
17149	Quỳnh Tam	Quynh Tam	Xã Quỳnh Tam	Quynh Tam Commune	quynh_tam	421	10
17152	Quỳnh Hoa	Quynh Hoa	Xã Quỳnh Hoa	Quynh Hoa Commune	quynh_hoa	421	10
17155	Quỳnh Thạch	Quynh Thach	Xã Quỳnh Thạch	Quynh Thach Commune	quynh_thach	421	10
17158	Quỳnh Bảng	Quynh Bang	Xã Quỳnh Bảng	Quynh Bang Commune	quynh_bang	421	10
17161	Quỳnh Mỹ	Quynh My	Xã Quỳnh Mỹ	Quynh My Commune	quynh_my	421	10
17164	Quỳnh Thanh	Quynh Thanh	Xã Quỳnh Thanh	Quynh Thanh Commune	quynh_thanh	421	10
17167	Quỳnh Hậu	Quynh Hau	Xã Quỳnh Hậu	Quynh Hau Commune	quynh_hau	421	10
17170	Quỳnh Lâm	Quynh Lam	Xã Quỳnh Lâm	Quynh Lam Commune	quynh_lam	421	10
17173	Quỳnh Đôi	Quynh Doi	Xã Quỳnh Đôi	Quynh Doi Commune	quynh_doi	421	10
17176	Quỳnh Lương	Quynh Luong	Xã Quỳnh Lương	Quynh Luong Commune	quynh_luong	421	10
17179	Quỳnh Hồng	Quynh Hong	Xã Quỳnh Hồng	Quynh Hong Commune	quynh_hong	421	10
17182	Quỳnh Yên	Quynh Yen	Xã Quỳnh Yên	Quynh Yen Commune	quynh_yen	421	10
17185	Quỳnh Bá	Quynh Ba	Xã Quỳnh Bá	Quynh Ba Commune	quynh_ba	421	10
17188	Quỳnh Minh	Quynh Minh	Xã Quỳnh Minh	Quynh Minh Commune	quynh_minh	421	10
17191	Quỳnh Diễn	Quynh Dien	Xã Quỳnh Diễn	Quynh Dien Commune	quynh_dien	421	10
17194	Quỳnh Hưng	Quynh Hung	Xã Quỳnh Hưng	Quynh Hung Commune	quynh_hung	421	10
17197	Quỳnh Giang	Quynh Giang	Xã Quỳnh Giang	Quynh Giang Commune	quynh_giang	421	10
17200	Quỳnh Ngọc	Quynh Ngoc	Xã Quỳnh Ngọc	Quynh Ngoc Commune	quynh_ngoc	421	10
17203	Quỳnh Nghĩa	Quynh Nghia	Xã Quỳnh Nghĩa	Quynh Nghia Commune	quynh_nghia	421	10
17206	An Hòa	An Hoa	Xã An Hòa	An Hoa Commune	an_hoa	421	10
17209	Tiến Thủy	Tien Thuy	Xã Tiến Thủy	Tien Thuy Commune	tien_thuy	421	10
17212	Sơn Hải	Son Hai	Xã Sơn Hải	Son Hai Commune	son_hai	421	10
17215	Quỳnh Thọ	Quynh Tho	Xã Quỳnh Thọ	Quynh Tho Commune	quynh_tho	421	10
17218	Quỳnh Thuận	Quynh Thuan	Xã Quỳnh Thuận	Quynh Thuan Commune	quynh_thuan	421	10
17221	Quỳnh Long	Quynh Long	Xã Quỳnh Long	Quynh Long Commune	quynh_long	421	10
17224	Tân Thắng	Tan Thang	Xã Tân Thắng	Tan Thang Commune	tan_thang	421	10
17227	Con Cuông	Con Cuong	Thị trấn Con Cuông	Con Cuong Township	con_cuong	422	9
17230	Bình Chuẩn	Binh Chuan	Xã Bình Chuẩn	Binh Chuan Commune	binh_chuan	422	10
17233	Lạng Khê	Lang Khe	Xã Lạng Khê	Lang Khe Commune	lang_khe	422	10
17236	Cam Lâm	Cam Lam	Xã Cam Lâm	Cam Lam Commune	cam_lam	422	10
17239	Thạch Ngàn	Thach Ngan	Xã Thạch Ngàn	Thach Ngan Commune	thach_ngan	422	10
17242	Đôn Phục	Don Phuc	Xã Đôn Phục	Don Phuc Commune	don_phuc	422	10
17245	Mậu Đức	Mau Duc	Xã Mậu Đức	Mau Duc Commune	mau_duc	422	10
17248	Châu Khê	Chau Khe	Xã Châu Khê	Chau Khe Commune	chau_khe	422	10
17251	Chi Khê	Chi Khe	Xã Chi Khê	Chi Khe Commune	chi_khe	422	10
17254	Bồng Khê	Bong Khe	Xã Bồng Khê	Bong Khe Commune	bong_khe	422	10
17257	Yên Khê	Yen Khe	Xã Yên Khê	Yen Khe Commune	yen_khe	422	10
17260	Lục Dạ	Luc Da	Xã Lục Dạ	Luc Da Commune	luc_da	422	10
17263	Môn Sơn	Mon Son	Xã Môn Sơn	Mon Son Commune	mon_son	422	10
17266	Tân Kỳ	Tan Ky	Thị trấn Tân Kỳ	Tan Ky Township	tan_ky	423	9
17269	Tân Hợp	Tan Hop	Xã Tân Hợp	Tan Hop Commune	tan_hop	423	10
17272	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	423	10
17275	Tân Xuân	Tan Xuan	Xã Tân Xuân	Tan Xuan Commune	tan_xuan	423	10
17278	Giai Xuân	Giai Xuan	Xã Giai Xuân	Giai Xuan Commune	giai_xuan	423	10
17281	Nghĩa Bình	Nghia Binh	Xã Nghĩa Bình	Nghia Binh Commune	nghia_binh	423	10
17284	Nghĩa Đồng	Nghia Dong	Xã Nghĩa Đồng	Nghia Dong Commune	nghia_dong	423	10
17287	Đồng Văn	Dong Van	Xã Đồng Văn	Dong Van Commune	dong_van	423	10
17290	Nghĩa Thái	Nghia Thai	Xã Nghĩa Thái	Nghia Thai Commune	nghia_thai	423	10
17293	Nghĩa Hợp	Nghia Hop	Xã Nghĩa Hợp	Nghia Hop Commune	nghia_hop	423	10
17296	Nghĩa Hoàn	Nghia Hoan	Xã Nghĩa Hoàn	Nghia Hoan Commune	nghia_hoan	423	10
17299	Nghĩa Phúc	Nghia Phuc	Xã Nghĩa Phúc	Nghia Phuc Commune	nghia_phuc	423	10
17302	Tiên Kỳ	Tien Ky	Xã Tiên Kỳ	Tien Ky Commune	tien_ky	423	10
17305	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	423	10
17308	Nghĩa Dũng	Nghia Dung	Xã Nghĩa Dũng	Nghia Dung Commune	nghia_dung	423	10
17311	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	423	10
17314	Kỳ Sơn	Ky Son	Xã Kỳ Sơn	Ky Son Commune	ky_son	423	10
17317	Hương Sơn	Huong Son	Xã Hương Sơn	Huong Son Commune	huong_son	423	10
17320	Kỳ Tân	Ky Tan	Xã Kỳ Tân	Ky Tan Commune	ky_tan	423	10
17323	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	423	10
17325	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	423	10
17326	Nghĩa Hành	Nghia Hanh	Xã Nghĩa Hành	Nghia Hanh Commune	nghia_hanh	423	10
17329	Anh Sơn	Anh Son	Thị trấn Anh Sơn	Anh Son Township	anh_son	424	9
17332	Thọ Sơn	Tho Son	Xã Thọ Sơn	Tho Son Commune	tho_son	424	10
17335	Thành Sơn	Thanh Son	Xã Thành Sơn	Thanh Son Commune	thanh_son	424	10
17338	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	424	10
17341	Tam Sơn	Tam Son	Xã Tam Sơn	Tam Son Commune	tam_son	424	10
17344	Đỉnh Sơn	Dinh Son	Xã Đỉnh Sơn	Dinh Son Commune	dinh_son	424	10
17347	Hùng Sơn	Hung Son	Xã Hùng Sơn	Hung Son Commune	hung_son	424	10
17350	Cẩm Sơn	Cam Son	Xã Cẩm Sơn	Cam Son Commune	cam_son	424	10
17353	Đức Sơn	Duc Son	Xã Đức Sơn	Duc Son Commune	duc_son	424	10
17356	Tường Sơn	Tuong Son	Xã Tường Sơn	Tuong Son Commune	tuong_son	424	10
17357	Hoa Sơn	Hoa Son	Xã Hoa Sơn	Hoa Son Commune	hoa_son	424	10
17359	Tào Sơn	Tao Son	Xã Tào Sơn	Tao Son Commune	tao_son	424	10
17362	Vĩnh Sơn	Vinh Son	Xã Vĩnh Sơn	Vinh Son Commune	vinh_son	424	10
17365	Lạng Sơn	Lang Son	Xã Lạng Sơn	Lang Son Commune	lang_son	424	10
17368	Hội Sơn	Hoi Son	Xã Hội Sơn	Hoi Son Commune	hoi_son	424	10
17371	Thạch Sơn	Thach Son	Xã Thạch Sơn	Thach Son Commune	thach_son	424	10
17374	Phúc Sơn	Phuc Son	Xã Phúc Sơn	Phuc Son Commune	phuc_son	424	10
17377	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	424	10
17380	Khai Sơn	Khai Son	Xã Khai Sơn	Khai Son Commune	khai_son	424	10
17383	Lĩnh Sơn	Linh Son	Xã Lĩnh Sơn	Linh Son Commune	linh_son	424	10
17386	Cao Sơn	Cao Son	Xã Cao Sơn	Cao Son Commune	cao_son	424	10
17389	Diễn Châu	Dien Chau	Thị trấn Diễn Châu	Dien Chau Township	dien_chau	425	9
17392	Diễn Lâm	Dien Lam	Xã Diễn Lâm	Dien Lam Commune	dien_lam	425	10
17395	Diễn Đoài	Dien Doai	Xã Diễn Đoài	Dien Doai Commune	dien_doai	425	10
17398	Diễn Trường	Dien Truong	Xã Diễn Trường	Dien Truong Commune	dien_truong	425	10
17401	Diễn Yên	Dien Yen	Xã Diễn Yên	Dien Yen Commune	dien_yen	425	10
17404	Diễn Hoàng	Dien Hoang	Xã Diễn Hoàng	Dien Hoang Commune	dien_hoang	425	10
17407	Diễn Hùng	Dien Hung	Xã Diễn Hùng	Dien Hung Commune	dien_hung	425	10
17410	Diễn Mỹ	Dien My	Xã Diễn Mỹ	Dien My Commune	dien_my	425	10
17413	Diễn Hồng	Dien Hong	Xã Diễn Hồng	Dien Hong Commune	dien_hong	425	10
17416	Diễn Phong	Dien Phong	Xã Diễn Phong	Dien Phong Commune	dien_phong	425	10
17419	Diễn Hải	Dien Hai	Xã Diễn Hải	Dien Hai Commune	dien_hai	425	10
17422	Diễn Tháp	Dien Thap	Xã Diễn Tháp	Dien Thap Commune	dien_thap	425	10
17425	Diễn Liên	Dien Lien	Xã Diễn Liên	Dien Lien Commune	dien_lien	425	10
17428	Diễn Vạn	Dien Van	Xã Diễn Vạn	Dien Van Commune	dien_van	425	10
17431	Diễn Kim	Dien Kim	Xã Diễn Kim	Dien Kim Commune	dien_kim	425	10
17434	Diễn Kỷ	Dien Ky	Xã Diễn Kỷ	Dien Ky Commune	dien_ky	425	10
17437	Diễn Xuân	Dien Xuan	Xã Diễn Xuân	Dien Xuan Commune	dien_xuan	425	10
17440	Diễn Thái	Dien Thai	Xã Diễn Thái	Dien Thai Commune	dien_thai	425	10
17443	Diễn Đồng	Dien Dong	Xã Diễn Đồng	Dien Dong Commune	dien_dong	425	10
17446	Diễn Bích	Dien Bich	Xã Diễn Bích	Dien Bich Commune	dien_bich	425	10
17449	Diễn Hạnh	Dien Hanh	Xã Diễn Hạnh	Dien Hanh Commune	dien_hanh	425	10
17452	Diễn Ngọc	Dien Ngoc	Xã Diễn Ngọc	Dien Ngoc Commune	dien_ngoc	425	10
17455	Diễn Quảng	Dien Quang	Xã Diễn Quảng	Dien Quang Commune	dien_quang	425	10
17458	Diễn Nguyên	Dien Nguyen	Xã Diễn Nguyên	Dien Nguyen Commune	dien_nguyen	425	10
17461	Diễn Hoa	Dien Hoa	Xã Diễn Hoa	Dien Hoa Commune	dien_hoa	425	10
17464	Diễn Thành	Dien Thanh	Xã Diễn Thành	Dien Thanh Commune	dien_thanh	425	10
17467	Diễn Phúc	Dien Phuc	Xã Diễn Phúc	Dien Phuc Commune	dien_phuc	425	10
17476	Diễn Cát	Dien Cat	Xã Diễn Cát	Dien Cat Commune	dien_cat	425	10
17479	Diễn Thịnh	Dien Thinh	Xã Diễn Thịnh	Dien Thinh Commune	dien_thinh	425	10
17482	Diễn Tân	Dien Tan	Xã Diễn Tân	Dien Tan Commune	dien_tan	425	10
17485	Minh Châu	Minh Chau	Xã Minh Châu	Minh Chau Commune	minh_chau	425	10
17488	Diễn Thọ	Dien Tho	Xã Diễn Thọ	Dien Tho Commune	dien_tho	425	10
17491	Diễn Lợi	Dien Loi	Xã Diễn Lợi	Dien Loi Commune	dien_loi	425	10
17494	Diễn Lộc	Dien Loc	Xã Diễn Lộc	Dien Loc Commune	dien_loc	425	10
17497	Diễn Trung	Dien Trung	Xã Diễn Trung	Dien Trung Commune	dien_trung	425	10
17500	Diễn An	Dien An	Xã Diễn An	Dien An Commune	dien_an	425	10
17503	Diễn Phú	Dien Phu	Xã Diễn Phú	Dien Phu Commune	dien_phu	425	10
17506	Yên Thành	Yen Thanh	Thị trấn Yên Thành	Yen Thanh Township	yen_thanh	426	9
17509	Mã Thành	Ma Thanh	Xã Mã Thành	Ma Thanh Commune	ma_thanh	426	10
17510	Tiến Thành	Tien Thanh	Xã Tiến Thành	Tien Thanh Commune	tien_thanh	426	10
17512	Lăng Thành	Lang Thanh	Xã Lăng Thành	Lang Thanh Commune	lang_thanh	426	10
17515	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	426	10
17518	Đức Thành	Duc Thanh	Xã Đức Thành	Duc Thanh Commune	duc_thanh	426	10
17521	Kim Thành	Kim Thanh	Xã Kim Thành	Kim Thanh Commune	kim_thanh	426	10
17524	Hậu Thành	Hau Thanh	Xã Hậu Thành	Hau Thanh Commune	hau_thanh	426	10
17525	Hùng Thành	Hung Thanh	Xã Hùng Thành	Hung Thanh Commune	hung_thanh	426	10
17527	Đô Thành	Do Thanh	Xã Đô Thành	Do Thanh Commune	do_thanh	426	10
17530	Thọ Thành	Tho Thanh	Xã Thọ Thành	Tho Thanh Commune	tho_thanh	426	10
17533	Quang Thành	Quang Thanh	Xã Quang Thành	Quang Thanh Commune	quang_thanh	426	10
17536	Tây Thành	Tay Thanh	Xã Tây Thành	Tay Thanh Commune	tay_thanh	426	10
17539	Phúc Thành	Phuc Thanh	Xã Phúc Thành	Phuc Thanh Commune	phuc_thanh	426	10
17542	Hồng Thành	Hong Thanh	Xã Hồng Thành	Hong Thanh Commune	hong_thanh	426	10
17545	Đồng Thành	Dong Thanh	Xã Đồng Thành	Dong Thanh Commune	dong_thanh	426	10
17548	Phú Thành	Phu Thanh	Xã Phú Thành	Phu Thanh Commune	phu_thanh	426	10
17551	Hoa Thành	Hoa Thanh	Xã Hoa Thành	Hoa Thanh Commune	hoa_thanh	426	10
17554	Tăng Thành	Tang Thanh	Xã Tăng Thành	Tang Thanh Commune	tang_thanh	426	10
17557	Văn Thành	Van Thanh	Xã Văn Thành	Van Thanh Commune	van_thanh	426	10
17560	Thịnh Thành	Thinh Thanh	Xã Thịnh Thành	Thinh Thanh Commune	thinh_thanh	426	10
17563	Hợp Thành	Hop Thanh	Xã Hợp Thành	Hop Thanh Commune	hop_thanh	426	10
17566	Xuân Thành	Xuan Thanh	Xã Xuân Thành	Xuan Thanh Commune	xuan_thanh	426	10
17569	Bắc Thành	Bac Thanh	Xã Bắc Thành	Bac Thanh Commune	bac_thanh	426	10
17572	Nhân Thành	Nhan Thanh	Xã Nhân Thành	Nhan Thanh Commune	nhan_thanh	426	10
17575	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	426	10
17578	Long Thành	Long Thanh	Xã Long Thành	Long Thanh Commune	long_thanh	426	10
17581	Minh Thành	Minh Thanh	Xã Minh Thành	Minh Thanh Commune	minh_thanh	426	10
17584	Nam Thành	Nam Thanh	Xã Nam Thành	Nam Thanh Commune	nam_thanh	426	10
17587	Vĩnh Thành	Vinh Thanh	Xã Vĩnh Thành	Vinh Thanh Commune	vinh_thanh	426	10
17590	Lý Thành	Ly Thanh	Xã Lý Thành	Ly Thanh Commune	ly_thanh	426	10
17593	Khánh Thành	Khanh Thanh	Xã Khánh Thành	Khanh Thanh Commune	khanh_thanh	426	10
17596	Viên Thành	Vien Thanh	Xã Viên Thành	Vien Thanh Commune	vien_thanh	426	10
17599	Đại Thành	Dai Thanh	Xã Đại Thành	Dai Thanh Commune	dai_thanh	426	10
17602	Liên Thành	Lien Thanh	Xã Liên Thành	Lien Thanh Commune	lien_thanh	426	10
17605	Bảo Thành	Bao Thanh	Xã Bảo Thành	Bao Thanh Commune	bao_thanh	426	10
17608	Mỹ Thành	My Thanh	Xã Mỹ Thành	My Thanh Commune	my_thanh	426	10
17611	Công Thành	Cong Thanh	Xã Công Thành	Cong Thanh Commune	cong_thanh	426	10
17614	Sơn Thành	Son Thanh	Xã Sơn Thành	Son Thanh Commune	son_thanh	426	10
17617	Đô Lương	Do Luong	Thị trấn Đô Lương	Do Luong Township	do_luong	427	9
17619	Giang Sơn Đông	Giang Son Dong	Xã Giang Sơn Đông	Giang Son Dong Commune	giang_son_dong	427	10
17620	Giang Sơn Tây	Giang Son Tay	Xã Giang Sơn Tây	Giang Son Tay Commune	giang_son_tay	427	10
17623	Lam Sơn	Lam Son	Xã Lam Sơn	Lam Son Commune	lam_son	427	10
17626	Bồi Sơn	Boi Son	Xã Bồi Sơn	Boi Son Commune	boi_son	427	10
17629	Hồng Sơn	Hong Son	Xã Hồng Sơn	Hong Son Commune	hong_son	427	10
17632	Bài Sơn	Bai Son	Xã Bài Sơn	Bai Son Commune	bai_son	427	10
17635	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	427	10
17638	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	427	10
17641	Tràng Sơn	Trang Son	Xã Tràng Sơn	Trang Son Commune	trang_son	427	10
17644	Thượng Sơn	Thuong Son	Xã Thượng Sơn	Thuong Son Commune	thuong_son	427	10
17647	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	427	10
17650	Đặng Sơn	Dang Son	Xã Đặng Sơn	Dang Son Commune	dang_son	427	10
17653	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	427	10
17656	Nam Sơn	Nam Son	Xã Nam Sơn	Nam Son Commune	nam_son	427	10
17659	Lưu Sơn	Luu Son	Xã Lưu Sơn	Luu Son Commune	luu_son	427	10
17662	Yên Sơn	Yen Son	Xã Yên Sơn	Yen Son Commune	yen_son	427	10
17665	Văn Sơn	Van Son	Xã Văn Sơn	Van Son Commune	van_son	427	10
17668	Đà Sơn	Da Son	Xã Đà Sơn	Da Son Commune	da_son	427	10
17671	Lạc Sơn	Lac Son	Xã Lạc Sơn	Lac Son Commune	lac_son	427	10
17674	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	427	10
17677	Thái Sơn	Thai Son	Xã Thái Sơn	Thai Son Commune	thai_son	427	10
17680	Quang Sơn	Quang Son	Xã Quang Sơn	Quang Son Commune	quang_son	427	10
17683	Thịnh Sơn	Thinh Son	Xã Thịnh Sơn	Thinh Son Commune	thinh_son	427	10
17686	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	427	10
17689	Xuân Sơn	Xuan Son	Xã Xuân Sơn	Xuan Son Commune	xuan_son	427	10
17692	Minh Sơn	Minh Son	Xã Minh Sơn	Minh Son Commune	minh_son	427	10
17695	Thuận Sơn	Thuan Son	Xã Thuận Sơn	Thuan Son Commune	thuan_son	427	10
17698	Nhân Sơn	Nhan Son	Xã Nhân Sơn	Nhan Son Commune	nhan_son	427	10
17701	Hiến Sơn	Hien Son	Xã Hiến Sơn	Hien Son Commune	hien_son	427	10
17704	Mỹ Sơn	My Son	Xã Mỹ Sơn	My Son Commune	my_son	427	10
17707	Trù Sơn	Tru Son	Xã Trù Sơn	Tru Son Commune	tru_son	427	10
17710	Đại Sơn	Dai Son	Xã Đại Sơn	Dai Son Commune	dai_son	427	10
17713	Thanh Chương	Thanh Chuong	Thị trấn Thanh Chương	Thanh Chuong Township	thanh_chuong	428	9
17716	Cát Văn	Cat Van	Xã Cát Văn	Cat Van Commune	cat_van	428	10
17719	Thanh Nho	Thanh Nho	Xã Thanh Nho	Thanh Nho Commune	thanh_nho	428	10
17722	Hạnh Lâm	Hanh Lam	Xã Hạnh Lâm	Hanh Lam Commune	hanh_lam	428	10
17723	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	428	10
17725	Thanh Hòa	Thanh Hoa	Xã Thanh Hòa	Thanh Hoa Commune	thanh_hoa	428	10
17728	Phong Thịnh	Phong Thinh	Xã Phong Thịnh	Phong Thinh Commune	phong_thinh	428	10
17731	Thanh Phong	Thanh Phong	Xã Thanh Phong	Thanh Phong Commune	thanh_phong	428	10
17734	Thanh Mỹ	Thanh My	Xã Thanh Mỹ	Thanh My Commune	thanh_my	428	10
17737	Thanh Tiên	Thanh Tien	Xã Thanh Tiên	Thanh Tien Commune	thanh_tien	428	10
17743	Thanh Liên	Thanh Lien	Xã Thanh Liên	Thanh Lien Commune	thanh_lien	428	10
17749	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	428	10
17752	Thanh Đồng	Thanh Dong	Xã Thanh Đồng	Thanh Dong Commune	thanh_dong	428	10
17755	Thanh Ngọc	Thanh Ngoc	Xã Thanh Ngọc	Thanh Ngoc Commune	thanh_ngoc	428	10
17758	Thanh Hương	Thanh Huong	Xã Thanh Hương	Thanh Huong Commune	thanh_huong	428	10
17759	Ngọc Lâm	Ngoc Lam	Xã Ngọc Lâm	Ngoc Lam Commune	ngoc_lam	428	10
17761	Thanh Lĩnh	Thanh Linh	Xã Thanh Lĩnh	Thanh Linh Commune	thanh_linh	428	10
17764	Đồng Văn	Dong Van	Xã Đồng Văn	Dong Van Commune	dong_van	428	10
17767	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	428	10
17770	Thanh Thịnh	Thanh Thinh	Xã Thanh Thịnh	Thanh Thinh Commune	thanh_thinh	428	10
17773	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	428	10
17776	Thanh Chi	Thanh Chi	Xã Thanh Chi	Thanh Chi Commune	thanh_chi	428	10
17779	Xuân Tường	Xuan Tuong	Xã Xuân Tường	Xuan Tuong Commune	xuan_tuong	428	10
17782	Thanh Dương	Thanh Duong	Xã Thanh Dương	Thanh Duong Commune	thanh_duong	428	10
17785	Thanh Lương	Thanh Luong	Xã Thanh Lương	Thanh Luong Commune	thanh_luong	428	10
17788	Thanh Khê	Thanh Khe	Xã Thanh Khê	Thanh Khe Commune	thanh_khe	428	10
17791	Võ Liệt	Vo Liet	Xã Võ Liệt	Vo Liet Commune	vo_liet	428	10
17794	Thanh Long	Thanh Long	Xã Thanh Long	Thanh Long Commune	thanh_long	428	10
17797	Thanh Thủy	Thanh Thuy	Xã Thanh Thủy	Thanh Thuy Commune	thanh_thuy	428	10
17800	Thanh Khai	Thanh Khai	Xã Thanh Khai	Thanh Khai Commune	thanh_khai	428	10
17803	Thanh Yên	Thanh Yen	Xã Thanh Yên	Thanh Yen Commune	thanh_yen	428	10
17806	Thanh Hà	Thanh Ha	Xã Thanh Hà	Thanh Ha Commune	thanh_ha	428	10
17809	Thanh Giang	Thanh Giang	Xã Thanh Giang	Thanh Giang Commune	thanh_giang	428	10
17812	Thanh Tùng	Thanh Tung	Xã Thanh Tùng	Thanh Tung Commune	thanh_tung	428	10
17815	Thanh Lâm	Thanh Lam	Xã Thanh Lâm	Thanh Lam Commune	thanh_lam	428	10
17818	Thanh Mai	Thanh Mai	Xã Thanh Mai	Thanh Mai Commune	thanh_mai	428	10
17821	Thanh Xuân	Thanh Xuan	Xã Thanh Xuân	Thanh Xuan Commune	thanh_xuan	428	10
17824	Thanh Đức	Thanh Duc	Xã Thanh Đức	Thanh Duc Commune	thanh_duc	428	10
17827	Quán Hành	Quan Hanh	Thị trấn Quán Hành	Quan Hanh Township	quan_hanh	429	9
17830	Nghi Văn	Nghi Van	Xã Nghi Văn	Nghi Van Commune	nghi_van	429	10
17833	Nghi Yên	Nghi Yen	Xã Nghi Yên	Nghi Yen Commune	nghi_yen	429	10
17836	Nghi Tiến	Nghi Tien	Xã Nghi Tiến	Nghi Tien Commune	nghi_tien	429	10
17839	Nghi Hưng	Nghi Hung	Xã Nghi Hưng	Nghi Hung Commune	nghi_hung	429	10
17842	Nghi Đồng	Nghi Dong	Xã Nghi Đồng	Nghi Dong Commune	nghi_dong	429	10
17845	Nghi Thiết	Nghi Thiet	Xã Nghi Thiết	Nghi Thiet Commune	nghi_thiet	429	10
17848	Nghi Lâm	Nghi Lam	Xã Nghi Lâm	Nghi Lam Commune	nghi_lam	429	10
17851	Nghi Quang	Nghi Quang	Xã Nghi Quang	Nghi Quang Commune	nghi_quang	429	10
17854	Nghi Kiều	Nghi Kieu	Xã Nghi Kiều	Nghi Kieu Commune	nghi_kieu	429	10
17857	Nghi Mỹ	Nghi My	Xã Nghi Mỹ	Nghi My Commune	nghi_my	429	10
17860	Nghi Phương	Nghi Phuong	Xã Nghi Phương	Nghi Phuong Commune	nghi_phuong	429	10
17863	Nghi Thuận	Nghi Thuan	Xã Nghi Thuận	Nghi Thuan Commune	nghi_thuan	429	10
17866	Nghi Long	Nghi Long	Xã Nghi Long	Nghi Long Commune	nghi_long	429	10
17869	Nghi Xá	Nghi Xa	Xã Nghi Xá	Nghi Xa Commune	nghi_xa	429	10
17875	Nghi Hoa	Nghi Hoa	Xã Nghi Hoa	Nghi Hoa Commune	nghi_hoa	429	10
17878	Khánh Hợp	Khanh Hop	Xã Khánh Hợp	Khanh Hop Commune	khanh_hop	429	10
17881	Nghi Thịnh	Nghi Thinh	Xã Nghi Thịnh	Nghi Thinh Commune	nghi_thinh	429	10
17884	Nghi Công Bắc	Nghi Cong Bac	Xã Nghi Công Bắc	Nghi Cong Bac Commune	nghi_cong_bac	429	10
17887	Nghi Công Nam	Nghi Cong Nam	Xã Nghi Công Nam	Nghi Cong Nam Commune	nghi_cong_nam	429	10
17890	Nghi Thạch	Nghi Thach	Xã Nghi Thạch	Nghi Thach Commune	nghi_thach	429	10
17893	Nghi Trung	Nghi Trung	Xã Nghi Trung	Nghi Trung Commune	nghi_trung	429	10
17896	Nghi Trường	Nghi Truong	Xã Nghi Trường	Nghi Truong Commune	nghi_truong	429	10
17899	Nghi Diên	Nghi Dien	Xã Nghi Diên	Nghi Dien Commune	nghi_dien	429	10
17902	Nghi Phong	Nghi Phong	Xã Nghi Phong	Nghi Phong Commune	nghi_phong	429	10
17905	Nghi Xuân	Nghi Xuan	Xã Nghi Xuân	Nghi Xuan Commune	nghi_xuan	429	10
17911	Nghi Vạn	Nghi Van	Xã Nghi Vạn	Nghi Van Commune	nghi_van	429	10
17917	Phúc Thọ	Phuc Tho	Xã Phúc Thọ	Phuc Tho Commune	phuc_tho	429	10
17926	Nghi Thái	Nghi Thai	Xã Nghi Thái	Nghi Thai Commune	nghi_thai	429	10
17932	Nam Hưng	Nam Hung	Xã Nam Hưng	Nam Hung Commune	nam_hung	430	10
17935	Nam Nghĩa	Nam Nghia	Xã Nam Nghĩa	Nam Nghia Commune	nam_nghia	430	10
17938	Nam Thanh	Nam Thanh	Xã Nam Thanh	Nam Thanh Commune	nam_thanh	430	10
17941	Nam Anh	Nam Anh	Xã Nam Anh	Nam Anh Commune	nam_anh	430	10
17944	Nam Xuân	Nam Xuan	Xã Nam Xuân	Nam Xuan Commune	nam_xuan	430	10
17947	Nam Thái	Nam Thai	Xã Nam Thái	Nam Thai Commune	nam_thai	430	10
17950	Nam Đàn	Nam Dan	Thị trấn Nam Đàn	Nam Dan Township	nam_dan	430	9
17953	Nam Lĩnh	Nam Linh	Xã Nam Lĩnh	Nam Linh Commune	nam_linh	430	10
17956	Nam Giang	Nam Giang	Xã Nam Giang	Nam Giang Commune	nam_giang	430	10
17959	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	430	10
17962	Hùng Tiến	Hung Tien	Xã Hùng Tiến	Hung Tien Commune	hung_tien	430	10
17968	Thượng Tân Lộc	Thuong Tan Loc	Xã Thượng Tân Lộc	Thuong Tan Loc Commune	thuong_tan_loc	430	10
17971	Kim Liên	Kim Lien	Xã Kim Liên	Kim Lien Commune	kim_lien	430	10
17977	Hồng Long	Hong Long	Xã Hồng Long	Hong Long Commune	hong_long	430	10
17980	Xuân Lâm	Xuan Lam	Xã Xuân Lâm	Xuan Lam Commune	xuan_lam	430	10
17983	Nam Cát	Nam Cat	Xã Nam Cát	Nam Cat Commune	nam_cat	430	10
17986	Khánh Sơn	Khanh Son	Xã Khánh Sơn	Khanh Son Commune	khanh_son	430	10
17989	Trung Phúc Cường	Trung Phuc Cuong	Xã Trung Phúc Cường	Trung Phuc Cuong Commune	trung_phuc_cuong	430	10
17998	Nam Kim	Nam Kim	Xã Nam Kim	Nam Kim Commune	nam_kim	430	10
18001	Hưng Nguyên	Hung Nguyen	Thị trấn Hưng Nguyên	Hung Nguyen Township	hung_nguyen	431	9
18004	Hưng Trung	Hung Trung	Xã Hưng Trung	Hung Trung Commune	hung_trung	431	10
18007	Hưng Yên	Hung Yen	Xã Hưng Yên	Hung Yen Commune	hung_yen	431	10
18008	Hưng Yên Bắc	Hung Yen Bac	Xã Hưng Yên Bắc	Hung Yen Bac Commune	hung_yen_bac	431	10
18010	Hưng Tây	Hung Tay	Xã Hưng Tây	Hung Tay Commune	hung_tay	431	10
18016	Hưng Đạo	Hung Dao	Xã Hưng Đạo	Hung Dao Commune	hung_dao	431	10
18019	Hưng Mỹ	Hung My	Xã Hưng Mỹ	Hung My Commune	hung_my	431	10
18022	Hưng Thịnh	Hung Thinh	Xã Hưng Thịnh	Hung Thinh Commune	hung_thinh	431	10
18025	Hưng Lĩnh	Hung Linh	Xã Hưng Lĩnh	Hung Linh Commune	hung_linh	431	10
18028	Hưng Thông	Hung Thong	Xã Hưng Thông	Hung Thong Commune	hung_thong	431	10
18031	Hưng Tân	Hung Tan	Xã Hưng Tân	Hung Tan Commune	hung_tan	431	10
18034	Hưng Lợi	Hung Loi	Xã Hưng Lợi	Hung Loi Commune	hung_loi	431	10
18037	Hưng Nghĩa	Hung Nghia	Xã Hưng Nghĩa	Hung Nghia Commune	hung_nghia	431	10
18040	Hưng Phúc	Hung Phuc	Xã Hưng Phúc	Hung Phuc Commune	hung_phuc	431	10
18043	Long Xá	Long Xa	Xã Long Xá	Long Xa Commune	long_xa	431	10
18052	Châu Nhân	Chau Nhan	Xã Châu Nhân	Chau Nhan Commune	chau_nhan	431	10
18055	Xuân Lam	Xuan Lam	Xã Xuân Lam	Xuan Lam Commune	xuan_lam	431	10
18064	Hưng Thành	Hung Thanh	Xã Hưng Thành	Hung Thanh Commune	hung_thanh	431	10
17104	Quỳnh Vinh	Quynh Vinh	Xã Quỳnh Vinh	Quynh Vinh Commune	quynh_vinh	432	10
17107	Quỳnh Lộc	Quynh Loc	Xã Quỳnh Lộc	Quynh Loc Commune	quynh_loc	432	10
17110	Quỳnh Thiện	Quynh Thien	Phường Quỳnh Thiện	Quynh Thien Ward	quynh_thien	432	8
17113	Quỳnh Lập	Quynh Lap	Xã Quỳnh Lập	Quynh Lap Commune	quynh_lap	432	10
17116	Quỳnh Trang	Quynh Trang	Xã Quỳnh Trang	Quynh Trang Commune	quynh_trang	432	10
17125	Mai Hùng	Mai Hung	Phường Mai Hùng	Mai Hung Ward	mai_hung	432	8
17128	Quỳnh Dị	Quynh Di	Phường Quỳnh Dị	Quynh Di Ward	quynh_di	432	8
17131	Quỳnh Xuân	Quynh Xuan	Phường Quỳnh Xuân	Quynh Xuan Ward	quynh_xuan	432	8
17134	Quỳnh Phương	Quynh Phuong	Phường Quỳnh Phương	Quynh Phuong Ward	quynh_phuong	432	8
17137	Quỳnh Liên	Quynh Lien	Xã Quỳnh Liên	Quynh Lien Commune	quynh_lien	432	10
18070	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	436	8
18073	Nam Hà	Nam Ha	Phường Nam Hà	Nam Ha Ward	nam_ha	436	8
18076	Bắc Hà	Bac Ha	Phường Bắc Hà	Bac Ha Ward	bac_ha	436	8
18077	Nguyễn Du	Nguyen Du	Phường Nguyễn Du	Nguyen Du Ward	nguyen_du	436	8
18079	Tân Giang	Tan Giang	Phường Tân Giang	Tan Giang Ward	tan_giang	436	8
18082	Đại Nài	Dai Nai	Phường Đại Nài	Dai Nai Ward	dai_nai	436	8
18085	Hà Huy Tập	Ha Huy Tap	Phường Hà Huy Tập	Ha Huy Tap Ward	ha_huy_tap	436	8
18088	Thạch Trung	Thach Trung	Xã Thạch Trung	Thach Trung Commune	thach_trung	436	10
18091	Thạch Quý	Thach Quy	Phường Thạch Quý	Thach Quy Ward	thach_quy	436	8
18094	Thạch Linh	Thach Linh	Phường Thạch Linh	Thach Linh Ward	thach_linh	436	8
18097	Văn Yên	Van Yen	Phường Văn Yên	Van Yen Ward	van_yen	436	8
18100	Thạch Hạ	Thach Ha	Xã Thạch Hạ	Thach Ha Commune	thach_ha	436	10
18103	Đồng Môn	Dong Mon	Xã Đồng Môn	Dong Mon Commune	dong_mon	436	10
18109	Thạch Hưng	Thach Hung	Xã Thạch Hưng	Thach Hung Commune	thach_hung	436	10
18112	Thạch Bình	Thach Binh	Xã Thạch Bình	Thach Binh Commune	thach_binh	436	10
18115	Bắc Hồng	Bac Hong	Phường Bắc Hồng	Bac Hong Ward	bac_hong	437	8
18118	Nam Hồng	Nam Hong	Phường Nam Hồng	Nam Hong Ward	nam_hong	437	8
18121	Trung Lương	Trung Luong	Phường Trung Lương	Trung Luong Ward	trung_luong	437	8
18124	Đức Thuận	Duc Thuan	Phường Đức Thuận	Duc Thuan Ward	duc_thuan	437	8
18127	Đậu Liêu	Dau Lieu	Phường Đậu Liêu	Dau Lieu Ward	dau_lieu	437	8
18130	Thuận Lộc	Thuan Loc	Xã Thuận Lộc	Thuan Loc Commune	thuan_loc	437	10
18133	Phố Châu	Pho Chau	Thị trấn Phố Châu	Pho Chau Township	pho_chau	439	9
18136	 Tây Sơn	 Tay Son	Thị trấn  Tây Sơn	 Tay Son Township	_tay_son	439	9
18139	Sơn Hồng	Son Hong	Xã Sơn Hồng	Son Hong Commune	son_hong	439	10
18142	Sơn Tiến	Son Tien	Xã Sơn Tiến	Son Tien Commune	son_tien	439	10
18145	Sơn Lâm	Son Lam	Xã Sơn Lâm	Son Lam Commune	son_lam	439	10
18148	Sơn Lễ	Son Le	Xã Sơn Lễ	Son Le Commune	son_le	439	10
18157	Sơn Giang	Son Giang	Xã Sơn Giang	Son Giang Commune	son_giang	439	10
18160	Sơn Lĩnh	Son Linh	Xã Sơn Lĩnh	Son Linh Commune	son_linh	439	10
18163	An Hòa Thịnh	An Hoa Thinh	Xã An Hòa Thịnh	An Hoa Thinh Commune	an_hoa_thinh	439	10
18172	Sơn Tây	Son Tay	Xã Sơn Tây	Son Tay Commune	son_tay	439	10
18175	Sơn Ninh	Son Ninh	Xã Sơn Ninh	Son Ninh Commune	son_ninh	439	10
27304	09	09	Phường 09	09 Ward	09	774	8
18178	Sơn Châu	Son Chau	Xã Sơn Châu	Son Chau Commune	son_chau	439	10
18181	Tân Mỹ Hà	Tan My Ha	Xã Tân Mỹ Hà	Tan My Ha Commune	tan_my_ha	439	10
18184	Quang Diệm	Quang Diem	Xã Quang Diệm	Quang Diem Commune	quang_diem	439	10
18187	Sơn Trung	Son Trung	Xã Sơn Trung	Son Trung Commune	son_trung	439	10
18190	Sơn Bằng	Son Bang	Xã Sơn Bằng	Son Bang Commune	son_bang	439	10
18193	Sơn Bình	Son Binh	Xã Sơn Bình	Son Binh Commune	son_binh	439	10
18196	Sơn Kim 1	Son Kim 1	Xã Sơn Kim 1	Son Kim 1 Commune	son_kim_1	439	10
18199	Sơn Kim 2	Son Kim 2	Xã Sơn Kim 2	Son Kim 2 Commune	son_kim_2	439	10
18202	Sơn Trà	Son Tra	Xã Sơn Trà	Son Tra Commune	son_tra	439	10
18205	Sơn Long	Son Long	Xã Sơn Long	Son Long Commune	son_long	439	10
18211	Kim Hoa	Kim Hoa	Xã Kim Hoa	Kim Hoa Commune	kim_hoa	439	10
18214	Sơn Hàm	Son Ham	Xã Sơn Hàm	Son Ham Commune	son_ham	439	10
18217	Sơn Phú	Son Phu	Xã Sơn Phú	Son Phu Commune	son_phu	439	10
18223	Sơn Trường	Son Truong	Xã Sơn Trường	Son Truong Commune	son_truong	439	10
18229	Đức Thọ	Duc Tho	Thị trấn Đức Thọ	Duc Tho Township	duc_tho	440	9
18235	Quang Vĩnh	Quang Vinh	Xã Quang Vĩnh	Quang Vinh Commune	quang_vinh	440	10
18241	Tùng Châu	Tung Chau	Xã Tùng Châu	Tung Chau Commune	tung_chau	440	10
18244	Trường Sơn	Truong Son	Xã Trường Sơn	Truong Son Commune	truong_son	440	10
18247	Liên Minh	Lien Minh	Xã Liên Minh	Lien Minh Commune	lien_minh	440	10
18253	Yên Hồ	Yen Ho	Xã Yên Hồ	Yen Ho Commune	yen_ho	440	10
18259	Tùng Ảnh	Tung Anh	Xã Tùng Ảnh	Tung Anh Commune	tung_anh	440	10
18262	Bùi La Nhân	Bui La Nhan	Xã Bùi La Nhân	Bui La Nhan Commune	bui_la_nhan	440	10
18274	Thanh Bình Thịnh	Thanh Binh Thinh	Xã Thanh Bình Thịnh	Thanh Binh Thinh Commune	thanh_binh_thinh	440	10
18277	Lâm Trung Thủy	Lam Trung Thuy	Xã Lâm Trung Thủy	Lam Trung Thuy Commune	lam_trung_thuy	440	10
18280	Hòa Lạc	Hoa Lac	Xã Hòa Lạc	Hoa Lac Commune	hoa_lac	440	10
18283	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	440	10
18298	An Dũng	An Dung	Xã An Dũng	An Dung Commune	an_dung	440	10
18304	Đức Đồng	Duc Dong	Xã Đức Đồng	Duc Dong Commune	duc_dong	440	10
18307	Đức Lạng	Duc Lang	Xã Đức Lạng	Duc Lang Commune	duc_lang	440	10
18310	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	440	10
18313	Vũ Quang	Vu Quang	Thị trấn Vũ Quang	Vu Quang Township	vu_quang	441	9
18316	Ân Phú	An Phu	Xã Ân Phú	An Phu Commune	an_phu	441	10
18319	Đức Giang	Duc Giang	Xã Đức Giang	Duc Giang Commune	duc_giang	441	10
18322	Đức Lĩnh	Duc Linh	Xã Đức Lĩnh	Duc Linh Commune	duc_linh	441	10
18325	Thọ Điền	Tho Dien	Xã Thọ Điền	Tho Dien Commune	tho_dien	441	10
18328	Đức Hương	Duc Huong	Xã Đức Hương	Duc Huong Commune	duc_huong	441	10
18331	Đức Bồng	Duc Bong	Xã Đức Bồng	Duc Bong Commune	duc_bong	441	10
18334	Đức Liên	Duc Lien	Xã Đức Liên	Duc Lien Commune	duc_lien	441	10
18340	Hương Minh	Huong Minh	Xã Hương Minh	Huong Minh Commune	huong_minh	441	10
18343	Quang Thọ	Quang Tho	Xã Quang Thọ	Quang Tho Commune	quang_tho	441	10
18352	Xuân An	Xuan An	Thị trấn Xuân An	Xuan An Township	xuan_an	442	9
18355	Xuân Hội	Xuan Hoi	Xã Xuân Hội	Xuan Hoi Commune	xuan_hoi	442	10
19141	Cự Nẫm	Cu Nam	Xã Cự Nẫm	Cu Nam Commune	cu_nam	455	10
18358	Đan Trường	Dan Truong	Xã Đan Trường	Dan Truong Commune	dan_truong	442	10
18364	Xuân Phổ	Xuan Pho	Xã Xuân Phổ	Xuan Pho Commune	xuan_pho	442	10
18367	Xuân Hải	Xuan Hai	Xã Xuân Hải	Xuan Hai Commune	xuan_hai	442	10
18370	Xuân Giang	Xuan Giang	Xã Xuân Giang	Xuan Giang Commune	xuan_giang	442	10
18373	Tiên Điền	Tien Dien	Thị trấn Tiên Điền	Tien Dien Township	tien_dien	442	9
18376	Xuân Yên	Xuan Yen	Xã Xuân Yên	Xuan Yen Commune	xuan_yen	442	10
18379	Xuân Mỹ	Xuan My	Xã Xuân Mỹ	Xuan My Commune	xuan_my	442	10
18382	Xuân Thành	Xuan Thanh	Xã Xuân Thành	Xuan Thanh Commune	xuan_thanh	442	10
18385	Xuân Viên	Xuan Vien	Xã Xuân Viên	Xuan Vien Commune	xuan_vien	442	10
18388	Xuân Hồng	Xuan Hong	Xã Xuân Hồng	Xuan Hong Commune	xuan_hong	442	10
18391	Cỗ Đạm	Co Dam	Xã Cỗ Đạm	Co Dam Commune	co_dam	442	10
18394	Xuân Liên	Xuan Lien	Xã Xuân Liên	Xuan Lien Commune	xuan_lien	442	10
18397	Xuân Lĩnh	Xuan Linh	Xã Xuân Lĩnh	Xuan Linh Commune	xuan_linh	442	10
18400	Xuân Lam	Xuan Lam	Xã Xuân Lam	Xuan Lam Commune	xuan_lam	442	10
18403	Cương Gián	Cuong Gian	Xã Cương Gián	Cuong Gian Commune	cuong_gian	442	10
18406	Nghèn	Nghen	Thị trấn Nghèn	Nghen Township	nghen	443	9
18415	Thiên Lộc	Thien Loc	Xã Thiên Lộc	Thien Loc Commune	thien_loc	443	10
18418	Thuần Thiện	Thuan Thien	Xã Thuần Thiện	Thuan Thien Commune	thuan_thien	443	10
18427	Vượng Lộc	Vuong Loc	Xã Vượng Lộc	Vuong Loc Commune	vuong_loc	443	10
18433	Thanh Lộc	Thanh Loc	Xã Thanh Lộc	Thanh Loc Commune	thanh_loc	443	10
18436	Kim Song Trường	Kim Song Truong	Xã Kim Song Trường	Kim Song Truong Commune	kim_song_truong	443	10
18439	Thường Nga	Thuong Nga	Xã Thường Nga	Thuong Nga Commune	thuong_nga	443	10
18445	Tùng Lộc	Tung Loc	Xã Tùng Lộc	Tung Loc Commune	tung_loc	443	10
18454	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	443	10
18463	Gia Hanh	Gia Hanh	Xã Gia Hanh	Gia Hanh Commune	gia_hanh	443	10
18466	Khánh Vĩnh Yên	Khanh Vinh Yen	Xã Khánh Vĩnh Yên	Khanh Vinh Yen Commune	khanh_vinh_yen	443	10
18472	Trung Lộc	Trung Loc	Xã Trung Lộc	Trung Loc Commune	trung_loc	443	10
18475	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	443	10
18478	Thượng Lộc	Thuong Loc	Xã Thượng Lộc	Thuong Loc Commune	thuong_loc	443	10
18481	Quang Lộc	Quang Loc	Xã Quang Lộc	Quang Loc Commune	quang_loc	443	10
18484	Đồng Lộc	Dong Loc	Thị trấn Đồng Lộc	Dong Loc Township	dong_loc	443	9
18487	Mỹ Lộc	My Loc	Xã Mỹ Lộc	My Loc Commune	my_loc	443	10
18490	Sơn Lộc	Son Loc	Xã Sơn Lộc	Son Loc Commune	son_loc	443	10
18496	Hương Khê	Huong Khe	Thị trấn Hương Khê	Huong Khe Township	huong_khe	444	9
18499	Điền Mỹ	Dien My	Xã Điền Mỹ	Dien My Commune	dien_my	444	10
18502	Hà Linh	Ha Linh	Xã Hà Linh	Ha Linh Commune	ha_linh	444	10
18505	Hương Thủy	Huong Thuy	Xã Hương Thủy	Huong Thuy Commune	huong_thuy	444	10
18508	Hòa Hải	Hoa Hai	Xã Hòa Hải	Hoa Hai Commune	hoa_hai	444	10
18514	Phúc Đồng	Phuc Dong	Xã Phúc Đồng	Phuc Dong Commune	phuc_dong	444	10
18517	Hương Giang	Huong Giang	Xã Hương Giang	Huong Giang Commune	huong_giang	444	10
18520	Lộc Yên	Loc Yen	Xã Lộc Yên	Loc Yen Commune	loc_yen	444	10
18523	Hương Bình	Huong Binh	Xã Hương Bình	Huong Binh Commune	huong_binh	444	10
18526	Hương Long	Huong Long	Xã Hương Long	Huong Long Commune	huong_long	444	10
18529	Phú Gia	Phu Gia	Xã Phú Gia	Phu Gia Commune	phu_gia	444	10
18532	Gia Phố	Gia Pho	Xã Gia Phố	Gia Pho Commune	gia_pho	444	10
18535	Phú Phong	Phu Phong	Xã Phú Phong	Phu Phong Commune	phu_phong	444	10
18538	Hương Đô	Huong Do	Xã Hương Đô	Huong Do Commune	huong_do	444	10
18541	Hương Vĩnh	Huong Vinh	Xã Hương Vĩnh	Huong Vinh Commune	huong_vinh	444	10
18544	Hương Xuân	Huong Xuan	Xã Hương Xuân	Huong Xuan Commune	huong_xuan	444	10
18547	Phúc Trạch	Phuc Trach	Xã Phúc Trạch	Phuc Trach Commune	phuc_trach	444	10
18550	Hương Trà	Huong Tra	Xã Hương Trà	Huong Tra Commune	huong_tra	444	10
18553	Hương Trạch	Huong Trach	Xã Hương Trạch	Huong Trach Commune	huong_trach	444	10
18556	Hương Lâm	Huong Lam	Xã Hương Lâm	Huong Lam Commune	huong_lam	444	10
18559	Hương Liên	Huong Lien	Xã Hương Liên	Huong Lien Commune	huong_lien	444	10
18562	Thạch Hà	Thach Ha	Thị trấn Thạch Hà	Thach Ha Township	thach_ha	445	9
18565	Ngọc Sơn	Ngoc Son	Xã Ngọc Sơn	Ngoc Son Commune	ngoc_son	445	10
18571	Thạch Hải	Thach Hai	Xã Thạch Hải	Thach Hai Commune	thach_hai	445	10
18586	Thạch Kênh	Thach Kenh	Xã Thạch Kênh	Thach Kenh Commune	thach_kenh	445	10
18589	Thạch Sơn	Thach Son	Xã Thạch Sơn	Thach Son Commune	thach_son	445	10
18592	Thạch Liên	Thach Lien	Xã Thạch Liên	Thach Lien Commune	thach_lien	445	10
18595	Đỉnh Bàn	Dinh Ban	Xã Đỉnh Bàn	Dinh Ban Commune	dinh_ban	445	10
18601	Việt Tiến	Viet Tien	Xã Việt Tiến	Viet Tien Commune	viet_tien	445	10
18604	Thạch Khê	Thach Khe	Xã Thạch Khê	Thach Khe Commune	thach_khe	445	10
18607	Thạch Long	Thach Long	Xã Thạch Long	Thach Long Commune	thach_long	445	10
18619	Thạch Trị	Thach Tri	Xã Thạch Trị	Thach Tri Commune	thach_tri	445	10
18622	Thạch Lạc	Thach Lac	Xã Thạch Lạc	Thach Lac Commune	thach_lac	445	10
18625	Thạch Ngọc	Thach Ngoc	Xã Thạch Ngọc	Thach Ngoc Commune	thach_ngoc	445	10
18628	Tượng Sơn	Tuong Son	Xã Tượng Sơn	Tuong Son Commune	tuong_son	445	10
18631	Thạch Văn	Thach Van	Xã Thạch Văn	Thach Van Commune	thach_van	445	10
18634	Lưu Vĩnh Sơn	Luu Vinh Son	Xã Lưu Vĩnh Sơn	Luu Vinh Son Commune	luu_vinh_son	445	10
18637	Thạch Thắng	Thach Thang	Xã Thạch Thắng	Thach Thang Commune	thach_thang	445	10
19144	Hải Phú	Hai Phu	Xã Hải Phú	Hai Phu Commune	hai_phu	455	10
18643	Thạch Đài	Thach Dai	Xã Thạch Đài	Thach Dai Commune	thach_dai	445	10
18649	Thạch Hội	Thach Hoi	Xã Thạch Hội	Thach Hoi Commune	thach_hoi	445	10
18652	Tân Lâm Hương	Tan Lam Huong	Xã Tân Lâm Hương	Tan Lam Huong Commune	tan_lam_huong	445	10
18658	Thạch Xuân	Thach Xuan	Xã Thạch Xuân	Thach Xuan Commune	thach_xuan	445	10
18667	Nam Điền	Nam Dien	Xã Nam Điền	Nam Dien Commune	nam_dien	445	10
18673	Cẩm Xuyên	Cam Xuyen	Thị trấn Cẩm Xuyên	Cam Xuyen Township	cam_xuyen	446	9
18676	Thiên Cầm	Thien Cam	Thị trấn Thiên Cầm	Thien Cam Township	thien_cam	446	9
18679	Yên Hòa	Yen Hoa	Xã Yên Hòa	Yen Hoa Commune	yen_hoa	446	10
18682	Cẩm Dương	Cam Duong	Xã Cẩm Dương	Cam Duong Commune	cam_duong	446	10
18685	Cẩm Bình	Cam Binh	Xã Cẩm Bình	Cam Binh Commune	cam_binh	446	10
18691	Cẩm Vĩnh	Cam Vinh	Xã Cẩm Vĩnh	Cam Vinh Commune	cam_vinh	446	10
18694	Cẩm Thành	Cam Thanh	Xã Cẩm Thành	Cam Thanh Commune	cam_thanh	446	10
18697	Cẩm Quang	Cam Quang	Xã Cẩm Quang	Cam Quang Commune	cam_quang	446	10
18706	Cẩm Thạch	Cam Thach	Xã Cẩm Thạch	Cam Thach Commune	cam_thach	446	10
18709	Cẩm Nhượng	Cam Nhuong	Xã Cẩm Nhượng	Cam Nhuong Commune	cam_nhuong	446	10
18712	Nam Phúc Thăng	Nam Phuc Thang	Xã Nam Phúc Thăng	Nam Phuc Thang Commune	nam_phuc_thang	446	10
18715	Cẩm Duệ	Cam Due	Xã Cẩm Duệ	Cam Due Commune	cam_due	446	10
18721	Cẩm Lĩnh	Cam Linh	Xã Cẩm Lĩnh	Cam Linh Commune	cam_linh	446	10
18724	Cẩm Quan	Cam Quan	Xã Cẩm Quan	Cam Quan Commune	cam_quan	446	10
18727	Cẩm Hà	Cam Ha	Xã Cẩm Hà	Cam Ha Commune	cam_ha	446	10
18730	Cẩm Lộc	Cam Loc	Xã Cẩm Lộc	Cam Loc Commune	cam_loc	446	10
18733	Cẩm Hưng	Cam Hung	Xã Cẩm Hưng	Cam Hung Commune	cam_hung	446	10
18736	Cẩm Thịnh	Cam Thinh	Xã Cẩm Thịnh	Cam Thinh Commune	cam_thinh	446	10
18739	Cẩm Mỹ	Cam My	Xã Cẩm Mỹ	Cam My Commune	cam_my	446	10
18742	Cẩm Trung	Cam Trung	Xã Cẩm Trung	Cam Trung Commune	cam_trung	446	10
18745	Cẩm Sơn	Cam Son	Xã Cẩm Sơn	Cam Son Commune	cam_son	446	10
18748	Cẩm Lạc	Cam Lac	Xã Cẩm Lạc	Cam Lac Commune	cam_lac	446	10
18751	Cẩm Minh	Cam Minh	Xã Cẩm Minh	Cam Minh Commune	cam_minh	446	10
18757	Kỳ Xuân	Ky Xuan	Xã Kỳ Xuân	Ky Xuan Commune	ky_xuan	447	10
18760	Kỳ Bắc	Ky Bac	Xã Kỳ Bắc	Ky Bac Commune	ky_bac	447	10
18763	Kỳ Phú	Ky Phu	Xã Kỳ Phú	Ky Phu Commune	ky_phu	447	10
18766	Kỳ Phong	Ky Phong	Xã Kỳ Phong	Ky Phong Commune	ky_phong	447	10
18769	Kỳ Tiến	Ky Tien	Xã Kỳ Tiến	Ky Tien Commune	ky_tien	447	10
18772	Kỳ Giang	Ky Giang	Xã Kỳ Giang	Ky Giang Commune	ky_giang	447	10
18775	Kỳ Đồng	Ky Dong	Xã Kỳ Đồng	Ky Dong Commune	ky_dong	447	10
18778	Kỳ Khang	Ky Khang	Xã Kỳ Khang	Ky Khang Commune	ky_khang	447	10
18784	Kỳ Văn	Ky Van	Xã Kỳ Văn	Ky Van Commune	ky_van	447	10
18787	Kỳ Trung	Ky Trung	Xã Kỳ Trung	Ky Trung Commune	ky_trung	447	10
18790	Kỳ Thọ	Ky Tho	Xã Kỳ Thọ	Ky Tho Commune	ky_tho	447	10
18793	Kỳ Tây	Ky Tay	Xã Kỳ Tây	Ky Tay Commune	ky_tay	447	10
18799	Kỳ Thượng	Ky Thuong	Xã Kỳ Thượng	Ky Thuong Commune	ky_thuong	447	10
18802	Kỳ Hải	Ky Hai	Xã Kỳ Hải	Ky Hai Commune	ky_hai	447	10
18805	Kỳ Thư	Ky Thu	Xã Kỳ Thư	Ky Thu Commune	ky_thu	447	10
18811	Kỳ Châu	Ky Chau	Xã Kỳ Châu	Ky Chau Commune	ky_chau	447	10
18814	Kỳ Tân	Ky Tan	Xã Kỳ Tân	Ky Tan Commune	ky_tan	447	10
18838	Lâm Hợp	Lam Hop	Xã Lâm Hợp	Lam Hop Commune	lam_hop	447	10
18844	Kỳ Sơn	Ky Son	Xã Kỳ Sơn	Ky Son Commune	ky_son	447	10
18850	Kỳ Lạc	Ky Lac	Xã Kỳ Lạc	Ky Lac Commune	ky_lac	447	10
18409	Tân Lộc	Tan Loc	Xã Tân Lộc	Tan Loc Commune	tan_loc	448	10
18412	Hồng Lộc	Hong Loc	Xã Hồng Lộc	Hong Loc Commune	hong_loc	448	10
18421	Thịnh Lộc	Thinh Loc	Xã Thịnh Lộc	Thinh Loc Commune	thinh_loc	448	10
18430	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	448	10
18457	Ích Hậu	Ich Hau	Xã Ích Hậu	Ich Hau Commune	ich_hau	448	10
18493	Phù Lưu	Phu Luu	Xã Phù Lưu	Phu Luu Commune	phu_luu	448	10
18568	Lộc Hà	Loc Ha	Thị trấn Lộc Hà	Loc Ha Township	loc_ha	448	9
18577	Thạch Mỹ	Thach My	Xã Thạch Mỹ	Thach My Commune	thach_my	448	10
18580	Thạch Kim	Thach Kim	Xã Thạch Kim	Thach Kim Commune	thach_kim	448	10
18583	Thạch Châu	Thach Chau	Xã Thạch Châu	Thach Chau Commune	thach_chau	448	10
18598	Hộ Độ	Ho Do	Xã Hộ Độ	Ho Do Commune	ho_do	448	10
18670	Mai Phụ	Mai Phu	Xã Mai Phụ	Mai Phu Commune	mai_phu	448	10
18754	Hưng Trí	Hung Tri	Phường Hưng Trí	Hung Tri Ward	hung_tri	449	8
18781	Kỳ Ninh	Ky Ninh	Xã Kỳ Ninh	Ky Ninh Commune	ky_ninh	449	10
18796	Kỳ Lợi	Ky Loi	Xã Kỳ Lợi	Ky Loi Commune	ky_loi	449	10
18808	Kỳ Hà	Ky Ha	Xã Kỳ Hà	Ky Ha Commune	ky_ha	449	10
18820	Kỳ Trinh	Ky Trinh	Phường Kỳ Trinh	Ky Trinh Ward	ky_trinh	449	8
18823	Kỳ Thịnh	Ky Thinh	Phường Kỳ Thịnh	Ky Thinh Ward	ky_thinh	449	8
18829	Kỳ Hoa	Ky Hoa	Xã Kỳ Hoa	Ky Hoa Commune	ky_hoa	449	10
18832	Kỳ Phương	Ky Phuong	Phường Kỳ Phương	Ky Phuong Ward	ky_phuong	449	8
18835	Kỳ Long	Ky Long	Phường Kỳ Long	Ky Long Ward	ky_long	449	8
18841	Kỳ Liên	Ky Lien	Phường Kỳ Liên	Ky Lien Ward	ky_lien	449	8
18847	Kỳ Nam	Ky Nam	Xã Kỳ Nam	Ky Nam Commune	ky_nam	449	10
18853	Hải Thành	Hai Thanh	Phường Hải Thành	Hai Thanh Ward	hai_thanh	450	8
18856	Đồng Phú	Dong Phu	Phường Đồng Phú	Dong Phu Ward	dong_phu	450	8
18859	Bắc Lý	Bac Ly	Phường Bắc Lý	Bac Ly Ward	bac_ly	450	8
18865	Nam Lý	Nam Ly	Phường Nam Lý	Nam Ly Ward	nam_ly	450	8
19576	Ba Nang	Ba Nang	Xã Ba Nang	Ba Nang Commune	ba_nang	467	10
18868	Đồng Hải	Dong Hai	Phường Đồng Hải	Dong Hai Ward	dong_hai	450	8
18871	Đồng Sơn	Dong Son	Phường Đồng Sơn	Dong Son Ward	dong_son	450	8
18874	Phú Hải	Phu Hai	Phường Phú Hải	Phu Hai Ward	phu_hai	450	8
18877	Bắc Nghĩa	Bac Nghia	Phường Bắc Nghĩa	Bac Nghia Ward	bac_nghia	450	8
18880	Đức Ninh Đông	Duc Ninh Dong	Phường Đức Ninh Đông	Duc Ninh Dong Ward	duc_ninh_dong	450	8
18883	Quang Phú	Quang Phu	Xã Quang Phú	Quang Phu Commune	quang_phu	450	10
18886	Lộc Ninh	Loc Ninh	Xã Lộc Ninh	Loc Ninh Commune	loc_ninh	450	10
18889	Bảo Ninh	Bao Ninh	Xã Bảo Ninh	Bao Ninh Commune	bao_ninh	450	10
18892	Nghĩa Ninh	Nghia Ninh	Xã Nghĩa Ninh	Nghia Ninh Commune	nghia_ninh	450	10
18895	Thuận Đức	Thuan Duc	Xã Thuận Đức	Thuan Duc Commune	thuan_duc	450	10
18898	Đức Ninh	Duc Ninh	Xã Đức Ninh	Duc Ninh Commune	duc_ninh	450	10
18901	Quy Đạt	Quy Dat	Thị trấn Quy Đạt	Quy Dat Township	quy_dat	452	9
18904	Dân Hóa	Dan Hoa	Xã Dân Hóa	Dan Hoa Commune	dan_hoa	452	10
18907	Trọng Hóa	Trong Hoa	Xã Trọng Hóa	Trong Hoa Commune	trong_hoa	452	10
18910	Hóa Phúc	Hoa Phuc	Xã Hóa Phúc	Hoa Phuc Commune	hoa_phuc	452	10
18913	Hồng Hóa	Hong Hoa	Xã Hồng Hóa	Hong Hoa Commune	hong_hoa	452	10
18916	Hóa Thanh	Hoa Thanh	Xã Hóa Thanh	Hoa Thanh Commune	hoa_thanh	452	10
18919	Hóa Tiến	Hoa Tien	Xã Hóa Tiến	Hoa Tien Commune	hoa_tien	452	10
18922	Hóa Hợp	Hoa Hop	Xã Hóa Hợp	Hoa Hop Commune	hoa_hop	452	10
18925	Xuân Hóa	Xuan Hoa	Xã Xuân Hóa	Xuan Hoa Commune	xuan_hoa	452	10
18928	Yên Hóa	Yen Hoa	Xã Yên Hóa	Yen Hoa Commune	yen_hoa	452	10
18931	Minh Hóa	Minh Hoa	Xã Minh Hóa	Minh Hoa Commune	minh_hoa	452	10
18934	Tân Hóa	Tan Hoa	Xã Tân Hóa	Tan Hoa Commune	tan_hoa	452	10
18937	Hóa Sơn	Hoa Son	Xã Hóa Sơn	Hoa Son Commune	hoa_son	452	10
18943	Trung Hóa	Trung Hoa	Xã Trung Hóa	Trung Hoa Commune	trung_hoa	452	10
18946	Thượng Hóa	Thuong Hoa	Xã Thượng Hóa	Thuong Hoa Commune	thuong_hoa	452	10
18949	Đồng Lê	Dong Le	Thị trấn Đồng Lê	Dong Le Township	dong_le	453	9
18952	Hương Hóa	Huong Hoa	Xã Hương Hóa	Huong Hoa Commune	huong_hoa	453	10
18955	Kim Hóa	Kim Hoa	Xã Kim Hóa	Kim Hoa Commune	kim_hoa	453	10
18958	Thanh Hóa	Thanh Hoa	Xã Thanh Hóa	Thanh Hoa Commune	thanh_hoa	453	10
18961	Thanh Thạch	Thanh Thach	Xã Thanh Thạch	Thanh Thach Commune	thanh_thach	453	10
18964	Thuận Hóa	Thuan Hoa	Xã Thuận Hóa	Thuan Hoa Commune	thuan_hoa	453	10
18967	Lâm Hóa	Lam Hoa	Xã Lâm Hóa	Lam Hoa Commune	lam_hoa	453	10
18970	Lê Hóa	Le Hoa	Xã Lê Hóa	Le Hoa Commune	le_hoa	453	10
18973	Sơn Hóa	Son Hoa	Xã Sơn Hóa	Son Hoa Commune	son_hoa	453	10
18976	Đồng Hóa	Dong Hoa	Xã Đồng Hóa	Dong Hoa Commune	dong_hoa	453	10
18979	Ngư Hóa	Ngu Hoa	Xã Ngư Hóa	Ngu Hoa Commune	ngu_hoa	453	10
18985	Thạch Hóa	Thach Hoa	Xã Thạch Hóa	Thach Hoa Commune	thach_hoa	453	10
18988	Đức Hóa	Duc Hoa	Xã Đức Hóa	Duc Hoa Commune	duc_hoa	453	10
18991	Phong Hóa	Phong Hoa	Xã Phong Hóa	Phong Hoa Commune	phong_hoa	453	10
18994	Mai Hóa	Mai Hoa	Xã Mai Hóa	Mai Hoa Commune	mai_hoa	453	10
18997	Tiến Hóa	Tien Hoa	Xã Tiến Hóa	Tien Hoa Commune	tien_hoa	453	10
19000	Châu Hóa	Chau Hoa	Xã Châu Hóa	Chau Hoa Commune	chau_hoa	453	10
19003	Cao Quảng	Cao Quang	Xã Cao Quảng	Cao Quang Commune	cao_quang	453	10
19006	Văn Hóa	Van Hoa	Xã Văn Hóa	Van Hoa Commune	van_hoa	453	10
19012	Quảng Hợp	Quang Hop	Xã Quảng Hợp	Quang Hop Commune	quang_hop	454	10
19015	Quảng Kim	Quang Kim	Xã Quảng Kim	Quang Kim Commune	quang_kim	454	10
19018	Quảng Đông	Quang Dong	Xã Quảng Đông	Quang Dong Commune	quang_dong	454	10
19021	Quảng Phú	Quang Phu	Xã Quảng Phú	Quang Phu Commune	quang_phu	454	10
19024	Quảng Châu	Quang Chau	Xã Quảng Châu	Quang Chau Commune	quang_chau	454	10
19027	Quảng Thạch	Quang Thach	Xã Quảng Thạch	Quang Thach Commune	quang_thach	454	10
19030	Quảng Lưu	Quang Luu	Xã Quảng Lưu	Quang Luu Commune	quang_luu	454	10
19033	Quảng Tùng	Quang Tung	Xã Quảng Tùng	Quang Tung Commune	quang_tung	454	10
19036	Cảnh Dương	Canh Duong	Xã Cảnh Dương	Canh Duong Commune	canh_duong	454	10
19039	Quảng Tiến	Quang Tien	Xã Quảng Tiến	Quang Tien Commune	quang_tien	454	10
19042	Quảng Hưng	Quang Hung	Xã Quảng Hưng	Quang Hung Commune	quang_hung	454	10
19045	Quảng Xuân	Quang Xuan	Xã Quảng Xuân	Quang Xuan Commune	quang_xuan	454	10
19048	Cảnh Hóa	Canh Hoa	Xã Cảnh Hóa	Canh Hoa Commune	canh_hoa	454	10
19051	Liên Trường	Lien Truong	Xã Liên Trường	Lien Truong Commune	lien_truong	454	10
19057	Quảng Phương	Quang Phuong	Xã Quảng Phương	Quang Phuong Commune	quang_phuong	454	10
19063	Phù Hóa	Phu Hoa	Xã Phù Hóa	Phu Hoa Commune	phu_hoa	454	10
19072	Quảng Thanh	Quang Thanh	Xã Quảng Thanh	Quang Thanh Commune	quang_thanh	454	10
19111	Hoàn Lão	Hoan Lao	Thị trấn Hoàn Lão	Hoan Lao Township	hoan_lao	455	9
19114	NT Việt Trung	NT Viet Trung	Thị trấn NT Việt Trung	NT Viet Trung Township	nt_viet_trung	455	9
19117	Xuân Trạch	Xuan Trach	Xã Xuân Trạch	Xuan Trach Commune	xuan_trach	455	10
19120	Mỹ Trạch	My Trach	Xã Mỹ Trạch	My Trach Commune	my_trach	455	10
19123	Hạ Trạch	Ha Trach	Xã Hạ Trạch	Ha Trach Commune	ha_trach	455	10
19126	Bắc Trạch	Bac Trach	Xã Bắc Trạch	Bac Trach Commune	bac_trach	455	10
19129	Lâm Trạch	Lam Trach	Xã Lâm Trạch	Lam Trach Commune	lam_trach	455	10
19132	Thanh Trạch	Thanh Trach	Xã Thanh Trạch	Thanh Trach Commune	thanh_trach	455	10
19135	Liên Trạch	Lien Trach	Xã Liên Trạch	Lien Trach Commune	lien_trach	455	10
19138	Phúc Trạch	Phuc Trach	Xã Phúc Trạch	Phuc Trach Commune	phuc_trach	455	10
19147	Thượng Trạch	Thuong Trach	Xã Thượng Trạch	Thuong Trach Commune	thuong_trach	455	10
19150	Sơn Lộc	Son Loc	Xã Sơn Lộc	Son Loc Commune	son_loc	455	10
19156	Hưng Trạch	Hung Trach	Xã Hưng Trạch	Hung Trach Commune	hung_trach	455	10
19159	Đồng Trạch	Dong Trach	Xã Đồng Trạch	Dong Trach Commune	dong_trach	455	10
19162	Đức Trạch	Duc Trach	Xã Đức Trạch	Duc Trach Commune	duc_trach	455	10
19165	Phong Nha	Phong Nha	Thị trấn Phong Nha	Phong Nha Township	phong_nha	455	9
19168	Vạn Trạch	Van Trach	Xã Vạn Trạch	Van Trach Commune	van_trach	455	10
19174	Phú Định	Phu Dinh	Xã Phú Định	Phu Dinh Commune	phu_dinh	455	10
19177	Trung Trạch	Trung Trach	Xã Trung Trạch	Trung Trach Commune	trung_trach	455	10
19180	Tây Trạch	Tay Trach	Xã Tây Trạch	Tay Trach Commune	tay_trach	455	10
19183	Hòa Trạch	Hoa Trach	Xã Hòa Trạch	Hoa Trach Commune	hoa_trach	455	10
19186	Đại Trạch	Dai Trach	Xã Đại Trạch	Dai Trach Commune	dai_trach	455	10
19189	Nhân Trạch	Nhan Trach	Xã Nhân Trạch	Nhan Trach Commune	nhan_trach	455	10
19192	Tân Trạch	Tan Trach	Xã Tân Trạch	Tan Trach Commune	tan_trach	455	10
19195	Nam Trạch	Nam Trach	Xã Nam Trạch	Nam Trach Commune	nam_trach	455	10
19198	Lý Trạch	Ly Trach	Xã Lý Trạch	Ly Trach Commune	ly_trach	455	10
19201	Quán Hàu	Quan Hau	Thị trấn Quán Hàu	Quan Hau Township	quan_hau	456	9
19204	Trường Sơn	Truong Son	Xã Trường Sơn	Truong Son Commune	truong_son	456	10
19207	Lương Ninh	Luong Ninh	Xã Lương Ninh	Luong Ninh Commune	luong_ninh	456	10
19210	Vĩnh Ninh	Vinh Ninh	Xã Vĩnh Ninh	Vinh Ninh Commune	vinh_ninh	456	10
19213	Võ Ninh	Vo Ninh	Xã Võ Ninh	Vo Ninh Commune	vo_ninh	456	10
19216	Hải Ninh	Hai Ninh	Xã Hải Ninh	Hai Ninh Commune	hai_ninh	456	10
19219	Hàm Ninh	Ham Ninh	Xã Hàm Ninh	Ham Ninh Commune	ham_ninh	456	10
19222	Duy Ninh	Duy Ninh	Xã Duy Ninh	Duy Ninh Commune	duy_ninh	456	10
19225	Gia Ninh	Gia Ninh	Xã Gia Ninh	Gia Ninh Commune	gia_ninh	456	10
19228	Trường Xuân	Truong Xuan	Xã Trường Xuân	Truong Xuan Commune	truong_xuan	456	10
19231	Hiền Ninh	Hien Ninh	Xã Hiền Ninh	Hien Ninh Commune	hien_ninh	456	10
19234	Tân Ninh	Tan Ninh	Xã Tân Ninh	Tan Ninh Commune	tan_ninh	456	10
19237	Xuân Ninh	Xuan Ninh	Xã Xuân Ninh	Xuan Ninh Commune	xuan_ninh	456	10
19240	An Ninh	An Ninh	Xã An Ninh	An Ninh Commune	an_ninh	456	10
19243	Vạn Ninh	Van Ninh	Xã Vạn Ninh	Van Ninh Commune	van_ninh	456	10
19246	NT Lệ Ninh	NT Le Ninh	Thị trấn NT Lệ Ninh	NT Le Ninh Township	nt_le_ninh	457	9
19249	Kiến Giang	Kien Giang	Thị trấn Kiến Giang	Kien Giang Township	kien_giang	457	9
19252	Hồng Thủy	Hong Thuy	Xã Hồng Thủy	Hong Thuy Commune	hong_thuy	457	10
19255	Ngư Thủy Bắc	Ngu Thuy Bac	Xã Ngư Thủy Bắc	Ngu Thuy Bac Commune	ngu_thuy_bac	457	10
19258	Hoa Thủy	Hoa Thuy	Xã Hoa Thủy	Hoa Thuy Commune	hoa_thuy	457	10
19261	Thanh Thủy	Thanh Thuy	Xã Thanh Thủy	Thanh Thuy Commune	thanh_thuy	457	10
19264	An Thủy	An Thuy	Xã An Thủy	An Thuy Commune	an_thuy	457	10
19267	Phong Thủy	Phong Thuy	Xã Phong Thủy	Phong Thuy Commune	phong_thuy	457	10
19270	Cam Thủy	Cam Thuy	Xã Cam Thủy	Cam Thuy Commune	cam_thuy	457	10
19273	Ngân Thủy	Ngan Thuy	Xã Ngân Thủy	Ngan Thuy Commune	ngan_thuy	457	10
19276	Sơn Thủy	Son Thuy	Xã Sơn Thủy	Son Thuy Commune	son_thuy	457	10
19279	Lộc Thủy	Loc Thuy	Xã Lộc Thủy	Loc Thuy Commune	loc_thuy	457	10
19285	Liên Thủy	Lien Thuy	Xã Liên Thủy	Lien Thuy Commune	lien_thuy	457	10
19288	Hưng Thủy	Hung Thuy	Xã Hưng Thủy	Hung Thuy Commune	hung_thuy	457	10
19291	Dương Thủy	Duong Thuy	Xã Dương Thủy	Duong Thuy Commune	duong_thuy	457	10
19294	Tân Thủy	Tan Thuy	Xã Tân Thủy	Tan Thuy Commune	tan_thuy	457	10
19297	Phú Thủy	Phu Thuy	Xã Phú Thủy	Phu Thuy Commune	phu_thuy	457	10
19300	Xuân Thủy	Xuan Thuy	Xã Xuân Thủy	Xuan Thuy Commune	xuan_thuy	457	10
19303	Mỹ Thủy	My Thuy	Xã Mỹ Thủy	My Thuy Commune	my_thuy	457	10
19306	Ngư Thủy 	Ngu Thuy 	Xã Ngư Thủy 	Ngu Thuy  Commune	ngu_thuy_	457	10
19309	Mai Thủy	Mai Thuy	Xã Mai Thủy	Mai Thuy Commune	mai_thuy	457	10
19312	Sen Thủy	Sen Thuy	Xã Sen Thủy	Sen Thuy Commune	sen_thuy	457	10
19315	Thái Thủy	Thai Thuy	Xã Thái Thủy	Thai Thuy Commune	thai_thuy	457	10
19318	Kim Thủy	Kim Thuy	Xã Kim Thủy	Kim Thuy Commune	kim_thuy	457	10
19321	Trường Thủy	Truong Thuy	Xã Trường Thủy	Truong Thuy Commune	truong_thuy	457	10
19327	Lâm Thủy	Lam Thuy	Xã Lâm Thủy	Lam Thuy Commune	lam_thuy	457	10
19009	Ba Đồn	Ba Don	Phường Ba Đồn	Ba Don Ward	ba_don	458	8
19060	Quảng Long	Quang Long	Phường Quảng Long	Quang Long Ward	quang_long	458	8
19066	Quảng Thọ	Quang Tho	Phường Quảng Thọ	Quang Tho Ward	quang_tho	458	8
19069	Quảng Tiên	Quang Tien	Xã Quảng Tiên	Quang Tien Commune	quang_tien	458	10
19075	Quảng Trung	Quang Trung	Xã Quảng Trung	Quang Trung Commune	quang_trung	458	10
19078	Quảng Phong	Quang Phong	Phường Quảng Phong	Quang Phong Ward	quang_phong	458	8
19081	Quảng Thuận	Quang Thuan	Phường Quảng Thuận	Quang Thuan Ward	quang_thuan	458	8
19084	Quảng Tân	Quang Tan	Xã Quảng Tân	Quang Tan Commune	quang_tan	458	10
19087	Quảng Hải	Quang Hai	Xã Quảng Hải	Quang Hai Commune	quang_hai	458	10
19090	Quảng Sơn	Quang Son	Xã Quảng Sơn	Quang Son Commune	quang_son	458	10
19093	Quảng Lộc	Quang Loc	Xã Quảng Lộc	Quang Loc Commune	quang_loc	458	10
19096	Quảng Thủy	Quang Thuy	Xã Quảng Thủy	Quang Thuy Commune	quang_thuy	458	10
19099	Quảng Văn	Quang Van	Xã Quảng Văn	Quang Van Commune	quang_van	458	10
19102	Quảng Phúc	Quang Phuc	Phường Quảng Phúc	Quang Phuc Ward	quang_phuc	458	8
19105	Quảng Hòa	Quang Hoa	Xã Quảng Hòa	Quang Hoa Commune	quang_hoa	458	10
19108	Quảng Minh	Quang Minh	Xã Quảng Minh	Quang Minh Commune	quang_minh	458	10
19330	Đông Giang	Dong Giang	Phường Đông Giang	Dong Giang Ward	dong_giang	461	8
19333	1	1	Phường 1	1 Ward	1	461	8
19336	Đông Lễ	Dong Le	Phường Đông Lễ	Dong Le Ward	dong_le	461	8
19339	Đông Thanh	Dong Thanh	Phường Đông Thanh	Dong Thanh Ward	dong_thanh	461	8
19342	2	2	Phường 2	2 Ward	2	461	8
19345	4	4	Phường 4	4 Ward	4	461	8
19348	5	5	Phường 5	5 Ward	5	461	8
19351	Đông Lương	Dong Luong	Phường Đông Lương	Dong Luong Ward	dong_luong	461	8
19354	3	3	Phường 3	3 Ward	3	461	8
19357	1	1	Phường 1	1 Ward	1	462	8
19358	An Đôn	An Don	Phường An Đôn	An Don Ward	an_don	462	8
19360	2	2	Phường 2	2 Ward	2	462	8
19361	3	3	Phường 3	3 Ward	3	462	8
19705	Hải Lệ	Hai Le	Xã Hải Lệ	Hai Le Commune	hai_le	462	10
19363	Hồ Xá	Ho Xa	Thị trấn Hồ Xá	Ho Xa Township	ho_xa	464	9
19366	Bến Quan	Ben Quan	Thị trấn Bến Quan	Ben Quan Township	ben_quan	464	9
19369	Vĩnh Thái	Vinh Thai	Xã Vĩnh Thái	Vinh Thai Commune	vinh_thai	464	10
19372	Vĩnh Tú	Vinh Tu	Xã Vĩnh Tú	Vinh Tu Commune	vinh_tu	464	10
19375	Vĩnh Chấp	Vinh Chap	Xã Vĩnh Chấp	Vinh Chap Commune	vinh_chap	464	10
19378	Trung Nam	Trung Nam	Xã Trung Nam	Trung Nam Commune	trung_nam	464	10
19384	Kim Thạch	Kim Thach	Xã Kim Thạch	Kim Thach Commune	kim_thach	464	10
19387	Vĩnh Long	Vinh Long	Xã Vĩnh Long	Vinh Long Commune	vinh_long	464	10
19393	Vĩnh Khê	Vinh Khe	Xã Vĩnh Khê	Vinh Khe Commune	vinh_khe	464	10
19396	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	464	10
19402	Vĩnh Thủy	Vinh Thuy	Xã Vĩnh Thủy	Vinh Thuy Commune	vinh_thuy	464	10
19405	Vĩnh Lâm	Vinh Lam	Xã Vĩnh Lâm	Vinh Lam Commune	vinh_lam	464	10
19408	Hiền Thành	Hien Thanh	Xã Hiền Thành	Hien Thanh Commune	hien_thanh	464	10
19414	Cửa Tùng	Cua Tung	Thị trấn Cửa Tùng	Cua Tung Township	cua_tung	464	9
19417	Vĩnh Hà	Vinh Ha	Xã Vĩnh Hà	Vinh Ha Commune	vinh_ha	464	10
19420	Vĩnh Sơn	Vinh Son	Xã Vĩnh Sơn	Vinh Son Commune	vinh_son	464	10
19423	Vĩnh Giang	Vinh Giang	Xã Vĩnh Giang	Vinh Giang Commune	vinh_giang	464	10
19426	Vĩnh Ô	Vinh O	Xã Vĩnh Ô	Vinh O Commune	vinh_o	464	10
19429	Khe Sanh	Khe Sanh	Thị trấn Khe Sanh	Khe Sanh Township	khe_sanh	465	9
19432	Lao Bảo	Lao Bao	Thị trấn Lao Bảo	Lao Bao Township	lao_bao	465	9
19435	Hướng Lập	Huong Lap	Xã Hướng Lập	Huong Lap Commune	huong_lap	465	10
19438	Hướng Việt	Huong Viet	Xã Hướng Việt	Huong Viet Commune	huong_viet	465	10
19441	Hướng Phùng	Huong Phung	Xã Hướng Phùng	Huong Phung Commune	huong_phung	465	10
19444	Hướng Sơn	Huong Son	Xã Hướng Sơn	Huong Son Commune	huong_son	465	10
19447	Hướng Linh	Huong Linh	Xã Hướng Linh	Huong Linh Commune	huong_linh	465	10
19450	Tân Hợp	Tan Hop	Xã Tân Hợp	Tan Hop Commune	tan_hop	465	10
19453	Hướng Tân	Huong Tan	Xã Hướng Tân	Huong Tan Commune	huong_tan	465	10
19456	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	465	10
19459	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	465	10
19462	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	465	10
19465	Tân Liên	Tan Lien	Xã Tân Liên	Tan Lien Commune	tan_lien	465	10
19468	Húc	Huc	Xã Húc	Huc Commune	huc	465	10
19471	Thuận	Thuan	Xã Thuận	Thuan Commune	thuan	465	10
19474	Hướng Lộc	Huong Loc	Xã Hướng Lộc	Huong Loc Commune	huong_loc	465	10
19477	Ba Tầng	Ba Tang	Xã Ba Tầng	Ba Tang Commune	ba_tang	465	10
19480	Thanh	Thanh	Xã Thanh	Thanh Commune	thanh	465	10
19483	 A Dơi	 A Doi	Xã  A Dơi	 A Doi Commune	_a_doi	465	10
19489	Lìa	Lia	Xã Lìa	Lia Commune	lia	465	10
19492	Xy	Xy	Xã Xy	Xy Commune	xy	465	10
19495	Gio Linh	Gio Linh	Thị trấn Gio Linh	Gio Linh Township	gio_linh	466	9
19496	Cửa Việt	Cua Viet	Thị trấn Cửa Việt	Cua Viet Township	cua_viet	466	9
19498	Trung Giang	Trung Giang	Xã Trung Giang	Trung Giang Commune	trung_giang	466	10
19501	Trung Hải	Trung Hai	Xã Trung Hải	Trung Hai Commune	trung_hai	466	10
19504	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	466	10
19507	Phong Bình	Phong Binh	Xã Phong Bình	Phong Binh Commune	phong_binh	466	10
19510	Gio Mỹ	Gio My	Xã Gio Mỹ	Gio My Commune	gio_my	466	10
19519	Gio Hải	Gio Hai	Xã Gio Hải	Gio Hai Commune	gio_hai	466	10
19522	Gio An	Gio An	Xã Gio An	Gio An Commune	gio_an	466	10
19525	Gio Châu	Gio Chau	Xã Gio Châu	Gio Chau Commune	gio_chau	466	10
19531	Gio Việt	Gio Viet	Xã Gio Việt	Gio Viet Commune	gio_viet	466	10
19534	Linh Trường	Linh Truong	Xã Linh Trường	Linh Truong Commune	linh_truong	466	10
19537	Gio Sơn	Gio Son	Xã Gio Sơn	Gio Son Commune	gio_son	466	10
19543	Gio Mai	Gio Mai	Xã Gio Mai	Gio Mai Commune	gio_mai	466	10
19546	Hải Thái	Hai Thai	Xã Hải Thái	Hai Thai Commune	hai_thai	466	10
19549	Linh Hải	Linh Hai	Xã Linh Hải	Linh Hai Commune	linh_hai	466	10
19552	Gio Quang	Gio Quang	Xã Gio Quang	Gio Quang Commune	gio_quang	466	10
19555	Krông Klang	Krong Klang	Thị trấn Krông Klang	Krong Klang Township	krong_klang	467	9
19558	Mò Ó	Mo O	Xã Mò Ó	Mo O Commune	mo_o	467	10
19561	Hướng Hiệp	Huong Hiep	Xã Hướng Hiệp	Huong Hiep Commune	huong_hiep	467	10
19564	Đa Krông	Da Krong	Xã Đa Krông	Da Krong Commune	da_krong	467	10
19567	Triệu Nguyên	Trieu Nguyen	Xã Triệu Nguyên	Trieu Nguyen Commune	trieu_nguyen	467	10
19570	Ba Lòng	Ba Long	Xã Ba Lòng	Ba Long Commune	ba_long	467	10
19579	Tà Long	Ta Long	Xã Tà Long	Ta Long Commune	ta_long	467	10
19582	Húc Nghì	Huc Nghi	Xã Húc Nghì	Huc Nghi Commune	huc_nghi	467	10
19585	A Vao	A Vao	Xã A Vao	A Vao Commune	a_vao	467	10
19588	Tà Rụt	Ta Rut	Xã Tà Rụt	Ta Rut Commune	ta_rut	467	10
19591	A Bung	A Bung	Xã A Bung	A Bung Commune	a_bung	467	10
19594	A Ngo	A Ngo	Xã A Ngo	A Ngo Commune	a_ngo	467	10
19597	Cam Lộ	Cam Lo	Thị trấn Cam Lộ	Cam Lo Township	cam_lo	468	9
19600	Cam Tuyền	Cam Tuyen	Xã Cam Tuyền	Cam Tuyen Commune	cam_tuyen	468	10
19603	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	468	10
19606	Cam Thủy	Cam Thuy	Xã Cam Thủy	Cam Thuy Commune	cam_thuy	468	10
19612	Cam Thành	Cam Thanh	Xã Cam Thành	Cam Thanh Commune	cam_thanh	468	10
19615	Cam Hiếu	Cam Hieu	Xã Cam Hiếu	Cam Hieu Commune	cam_hieu	468	10
19618	Cam Chính	Cam Chinh	Xã Cam Chính	Cam Chinh Commune	cam_chinh	468	10
19621	Cam Nghĩa	Cam Nghia	Xã Cam Nghĩa	Cam Nghia Commune	cam_nghia	468	10
19624	Ái Tử	Ai Tu	Thị trấn Ái Tử	Ai Tu Township	ai_tu	469	9
19627	Triệu An	Trieu An	Xã Triệu An	Trieu An Commune	trieu_an	469	10
19630	Triệu Vân	Trieu Van	Xã Triệu Vân	Trieu Van Commune	trieu_van	469	10
19633	Triệu Phước	Trieu Phuoc	Xã Triệu Phước	Trieu Phuoc Commune	trieu_phuoc	469	10
19636	Triệu Độ	Trieu Do	Xã Triệu Độ	Trieu Do Commune	trieu_do	469	10
19639	Triệu Trạch	Trieu Trach	Xã Triệu Trạch	Trieu Trach Commune	trieu_trach	469	10
19642	Triệu Thuận	Trieu Thuan	Xã Triệu Thuận	Trieu Thuan Commune	trieu_thuan	469	10
19645	Triệu Đại	Trieu Dai	Xã Triệu Đại	Trieu Dai Commune	trieu_dai	469	10
19648	Triệu Hòa	Trieu Hoa	Xã Triệu Hòa	Trieu Hoa Commune	trieu_hoa	469	10
19651	Triệu Lăng	Trieu Lang	Xã Triệu Lăng	Trieu Lang Commune	trieu_lang	469	10
19654	Triệu Sơn	Trieu Son	Xã Triệu Sơn	Trieu Son Commune	trieu_son	469	10
19657	Triệu Long	Trieu Long	Xã Triệu Long	Trieu Long Commune	trieu_long	469	10
19660	Triệu Tài	Trieu Tai	Xã Triệu Tài	Trieu Tai Commune	trieu_tai	469	10
19666	Triệu Trung	Trieu Trung	Xã Triệu Trung	Trieu Trung Commune	trieu_trung	469	10
19669	Triệu Ái	Trieu Ai	Xã Triệu Ái	Trieu Ai Commune	trieu_ai	469	10
19672	Triệu Thượng	Trieu Thuong	Xã Triệu Thượng	Trieu Thuong Commune	trieu_thuong	469	10
19675	Triệu Giang	Trieu Giang	Xã Triệu Giang	Trieu Giang Commune	trieu_giang	469	10
19678	Triệu Thành	Trieu Thanh	Xã Triệu Thành	Trieu Thanh Commune	trieu_thanh	469	10
19681	Diên Sanh	Dien Sanh	Thị trấn Diên Sanh	Dien Sanh Township	dien_sanh	470	9
19684	Hải An	Hai An	Xã Hải An	Hai An Commune	hai_an	470	10
19687	Hải Ba	Hai Ba	Xã Hải Ba	Hai Ba Commune	hai_ba	470	10
19693	Hải Quy	Hai Quy	Xã Hải Quy	Hai Quy Commune	hai_quy	470	10
19696	Hải Quế	Hai Que	Xã Hải Quế	Hai Que Commune	hai_que	470	10
19699	Hải Hưng	Hai Hung	Xã Hải Hưng	Hai Hung Commune	hai_hung	470	10
19702	Hải Phú	Hai Phu	Xã Hải Phú	Hai Phu Commune	hai_phu	470	10
19708	Hải Thượng	Hai Thuong	Xã Hải Thượng	Hai Thuong Commune	hai_thuong	470	10
19711	Hải Dương	Hai Duong	Xã Hải Dương	Hai Duong Commune	hai_duong	470	10
19714	Hải Định	Hai Dinh	Xã Hải Định	Hai Dinh Commune	hai_dinh	470	10
19717	Hải Lâm	Hai Lam	Xã Hải Lâm	Hai Lam Commune	hai_lam	470	10
19726	Hải Phong	Hai Phong	Xã Hải Phong	Hai Phong Commune	hai_phong	470	10
19729	Hải Trường	Hai Truong	Xã Hải Trường	Hai Truong Commune	hai_truong	470	10
19735	Hải Sơn	Hai Son	Xã Hải Sơn	Hai Son Commune	hai_son	470	10
19738	Hải Chánh	Hai Chanh	Xã Hải Chánh	Hai Chanh Commune	hai_chanh	470	10
19741	Hải Khê	Hai Khe	Xã Hải Khê	Hai Khe Commune	hai_khe	470	10
19750	Tây Lộc	Tay Loc	Phường Tây Lộc	Tay Loc Ward	tay_loc	474	8
19753	Thuận Lộc	Thuan Loc	Phường Thuận Lộc	Thuan Loc Ward	thuan_loc	474	8
19756	Gia Hội	Gia Hoi	Phường Gia Hội	Gia Hoi Ward	gia_hoi	474	8
19759	Phú Hậu	Phu Hau	Phường Phú Hậu	Phu Hau Ward	phu_hau	474	8
19762	Thuận Hòa	Thuan Hoa	Phường Thuận Hòa	Thuan Hoa Ward	thuan_hoa	474	8
19768	Đông Ba	Dong Ba	Phường Đông Ba	Dong Ba Ward	dong_ba	474	8
19774	Kim Long	Kim Long	Phường Kim Long	Kim Long Ward	kim_long	474	8
19777	Vỹ Dạ	Vy Da	Phường Vỹ Dạ	Vy Da Ward	vy_da	474	8
19780	Đúc	Duc	Phường Phường Đúc	Duc Ward	duc	474	8
19783	Vĩnh Ninh	Vinh Ninh	Phường Vĩnh Ninh	Vinh Ninh Ward	vinh_ninh	474	8
19786	Phú Hội	Phu Hoi	Phường Phú Hội	Phu Hoi Ward	phu_hoi	474	8
19789	Phú Nhuận	Phu Nhuan	Phường Phú Nhuận	Phu Nhuan Ward	phu_nhuan	474	8
19792	Xuân Phú	Xuan Phu	Phường Xuân Phú	Xuan Phu Ward	xuan_phu	474	8
19795	Trường An	Truong An	Phường Trường An	Truong An Ward	truong_an	474	8
19798	Phước Vĩnh	Phuoc Vinh	Phường Phước Vĩnh	Phuoc Vinh Ward	phuoc_vinh	474	8
19801	An Cựu	An Cuu	Phường An Cựu	An Cuu Ward	an_cuu	474	8
19803	An Hòa	An Hoa	Phường An Hòa	An Hoa Ward	an_hoa	474	8
19804	Hương Sơ	Huong So	Phường Hương Sơ	Huong So Ward	huong_so	474	8
19807	Thuỷ Biều	Thuy Bieu	Phường Thuỷ Biều	Thuy Bieu Ward	thuy_bieu	474	8
19810	Hương Long	Huong Long	Phường Hương Long	Huong Long Ward	huong_long	474	8
19813	Thuỷ Xuân	Thuy Xuan	Phường Thuỷ Xuân	Thuy Xuan Ward	thuy_xuan	474	8
19815	An Đông	An Dong	Phường An Đông	An Dong Ward	an_dong	474	8
19816	An Tây	An Tay	Phường An Tây	An Tay Ward	an_tay	474	8
19900	Thuận An	Thuan An	Phường Thuận An	Thuan An Ward	thuan_an	474	8
19906	Phú Dương	Phu Duong	Xã Phú Dương	Phu Duong Commune	phu_duong	474	10
19909	Phú Mậu	Phu Mau	Xã Phú Mậu	Phu Mau Commune	phu_mau	474	10
19924	Phú Thanh	Phu Thanh	Xã Phú Thanh	Phu Thanh Commune	phu_thanh	474	10
19930	Phú Thượng	Phu Thuong	Phường Phú Thượng	Phu Thuong Ward	phu_thuong	474	8
19963	Thủy Vân	Thuy Van	Phường Thủy Vân	Thuy Van Ward	thuy_van	474	8
19981	Thủy Bằng	Thuy Bang	Xã Thủy Bằng	Thuy Bang Commune	thuy_bang	474	10
19999	Hải Dương	Hai Duong	Xã Hải Dương	Hai Duong Commune	hai_duong	474	10
20002	Hương Phong	Huong Phong	Xã Hương Phong	Huong Phong Commune	huong_phong	474	10
20014	Hương Vinh	Huong Vinh	Phường Hương Vinh	Huong Vinh Ward	huong_vinh	474	8
20023	Hương An	Huong An	Phường Hương An	Huong An Ward	huong_an	474	8
20029	Hương Hồ	Huong Ho	Phường Hương Hồ	Huong Ho Ward	huong_ho	474	8
20032	Hương Thọ	Huong Tho	Xã Hương Thọ	Huong Tho Commune	huong_tho	474	10
19819	Phong Điền	Phong Dien	Thị trấn Phong Điền	Phong Dien Township	phong_dien	476	9
19822	Điền Hương	Dien Huong	Xã Điền Hương	Dien Huong Commune	dien_huong	476	10
19825	Điền Môn	Dien Mon	Xã Điền Môn	Dien Mon Commune	dien_mon	476	10
19828	Điền Lộc	Dien Loc	Xã Điền Lộc	Dien Loc Commune	dien_loc	476	10
19831	Phong Bình	Phong Binh	Xã Phong Bình	Phong Binh Commune	phong_binh	476	10
19834	Điền Hòa	Dien Hoa	Xã Điền Hòa	Dien Hoa Commune	dien_hoa	476	10
19837	Phong Chương	Phong Chuong	Xã Phong Chương	Phong Chuong Commune	phong_chuong	476	10
19840	Phong Hải	Phong Hai	Xã Phong Hải	Phong Hai Commune	phong_hai	476	10
19843	Điền Hải	Dien Hai	Xã Điền Hải	Dien Hai Commune	dien_hai	476	10
19846	Phong Hòa	Phong Hoa	Xã Phong Hòa	Phong Hoa Commune	phong_hoa	476	10
19849	Phong Thu	Phong Thu	Xã Phong Thu	Phong Thu Commune	phong_thu	476	10
19852	Phong Hiền	Phong Hien	Xã Phong Hiền	Phong Hien Commune	phong_hien	476	10
19855	Phong Mỹ	Phong My	Xã Phong Mỹ	Phong My Commune	phong_my	476	10
19858	Phong An	Phong An	Xã Phong An	Phong An Commune	phong_an	476	10
19861	Phong Xuân	Phong Xuan	Xã Phong Xuân	Phong Xuan Commune	phong_xuan	476	10
19864	Phong Sơn	Phong Son	Xã Phong Sơn	Phong Son Commune	phong_son	476	10
19867	Sịa	Sia	Thị trấn Sịa	Sia Township	sia	477	9
19870	Quảng Thái	Quang Thai	Xã Quảng Thái	Quang Thai Commune	quang_thai	477	10
19873	Quảng Ngạn	Quang Ngan	Xã Quảng Ngạn	Quang Ngan Commune	quang_ngan	477	10
19876	Quảng Lợi	Quang Loi	Xã Quảng Lợi	Quang Loi Commune	quang_loi	477	10
19879	Quảng Công	Quang Cong	Xã Quảng Công	Quang Cong Commune	quang_cong	477	10
19882	Quảng Phước	Quang Phuoc	Xã Quảng Phước	Quang Phuoc Commune	quang_phuoc	477	10
19885	Quảng Vinh	Quang Vinh	Xã Quảng Vinh	Quang Vinh Commune	quang_vinh	477	10
19888	Quảng An	Quang An	Xã Quảng An	Quang An Commune	quang_an	477	10
19891	Quảng Thành	Quang Thanh	Xã Quảng Thành	Quang Thanh Commune	quang_thanh	477	10
19894	Quảng Thọ	Quang Tho	Xã Quảng Thọ	Quang Tho Commune	quang_tho	477	10
19897	Quảng Phú	Quang Phu	Xã Quảng Phú	Quang Phu Commune	quang_phu	477	10
19903	Phú Thuận	Phu Thuan	Xã Phú Thuận	Phu Thuan Commune	phu_thuan	478	10
19912	Phú An	Phu An	Xã Phú An	Phu An Commune	phu_an	478	10
19915	Phú Hải	Phu Hai	Xã Phú Hải	Phu Hai Commune	phu_hai	478	10
19918	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	478	10
19921	Phú Diên	Phu Dien	Xã Phú Diên	Phu Dien Commune	phu_dien	478	10
19927	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	478	10
19933	Phú Hồ	Phu Ho	Xã Phú Hồ	Phu Ho Commune	phu_ho	478	10
19936	Vinh Xuân	Vinh Xuan	Xã Vinh Xuân	Vinh Xuan Commune	vinh_xuan	478	10
19939	Phú Lương	Phu Luong	Xã Phú Lương	Phu Luong Commune	phu_luong	478	10
19942	Phú Đa	Phu Da	Thị trấn Phú Đa	Phu Da Township	phu_da	478	9
19945	Vinh Thanh	Vinh Thanh	Xã Vinh Thanh	Vinh Thanh Commune	vinh_thanh	478	10
19948	Vinh An	Vinh An	Xã Vinh An	Vinh An Commune	vinh_an	478	10
19954	Phú Gia	Phu Gia	Xã Phú Gia	Phu Gia Commune	phu_gia	478	10
19957	Vinh Hà	Vinh Ha	Xã Vinh Hà	Vinh Ha Commune	vinh_ha	478	10
19960	Phú Bài	Phu Bai	Phường Phú Bài	Phu Bai Ward	phu_bai	479	8
19966	Thủy Thanh	Thuy Thanh	Xã Thủy Thanh	Thuy Thanh Commune	thuy_thanh	479	10
19969	Thủy Dương	Thuy Duong	Phường Thủy Dương	Thuy Duong Ward	thuy_duong	479	8
19972	Thủy Phương	Thuy Phuong	Phường Thủy Phương	Thuy Phuong Ward	thuy_phuong	479	8
19975	Thủy Châu	Thuy Chau	Phường Thủy Châu	Thuy Chau Ward	thuy_chau	479	8
19978	Thủy Lương	Thuy Luong	Phường Thủy Lương	Thuy Luong Ward	thuy_luong	479	8
19984	Thủy Tân	Thuy Tan	Xã Thủy Tân	Thuy Tan Commune	thuy_tan	479	10
19987	Thủy Phù	Thuy Phu	Xã Thủy Phù	Thuy Phu Commune	thuy_phu	479	10
19990	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	479	10
19993	Dương Hòa	Duong Hoa	Xã Dương Hòa	Duong Hoa Commune	duong_hoa	479	10
19996	Tứ Hạ	Tu Ha	Phường Tứ Hạ	Tu Ha Ward	tu_ha	480	8
20005	Hương Toàn	Huong Toan	Xã Hương Toàn	Huong Toan Commune	huong_toan	480	10
20008	Hương Vân	Huong Van	Phường Hương Vân	Huong Van Ward	huong_van	480	8
20011	Hương Văn	Huong Van	Phường Hương Văn	Huong Van Ward	huong_van	480	8
20017	Hương Xuân	Huong Xuan	Phường Hương Xuân	Huong Xuan Ward	huong_xuan	480	8
20020	Hương Chữ	Huong Chu	Phường Hương Chữ	Huong Chu Ward	huong_chu	480	8
20026	Hương Bình	Huong Binh	Xã Hương Bình	Huong Binh Commune	huong_binh	480	10
20035	Bình Tiến	Binh Tien	Xã Bình Tiến	Binh Tien Commune	binh_tien	480	10
20041	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	480	10
20044	A Lưới	A Luoi	Thị trấn A Lưới	A Luoi Township	a_luoi	481	9
20047	Hồng Vân	Hong Van	Xã Hồng Vân	Hong Van Commune	hong_van	481	10
20050	Hồng Hạ	Hong Ha	Xã Hồng Hạ	Hong Ha Commune	hong_ha	481	10
20053	Hồng Kim	Hong Kim	Xã Hồng Kim	Hong Kim Commune	hong_kim	481	10
20056	Trung Sơn	Trung Son	Xã Trung Sơn	Trung Son Commune	trung_son	481	10
20059	Hương Nguyên	Huong Nguyen	Xã Hương Nguyên	Huong Nguyen Commune	huong_nguyen	481	10
20065	Hồng Bắc	Hong Bac	Xã Hồng Bắc	Hong Bac Commune	hong_bac	481	10
20068	A Ngo	A Ngo	Xã A Ngo	A Ngo Commune	a_ngo	481	10
20071	Sơn Thủy	Son Thuy	Xã Sơn Thủy	Son Thuy Commune	son_thuy	481	10
20074	Phú Vinh	Phu Vinh	Xã Phú Vinh	Phu Vinh Commune	phu_vinh	481	10
20080	Hương Phong	Huong Phong	Xã Hương Phong	Huong Phong Commune	huong_phong	481	10
20083	Quảng Nhâm	Quang Nham	Xã Quảng Nhâm	Quang Nham Commune	quang_nham	481	10
20086	Hồng Thượng	Hong Thuong	Xã Hồng Thượng	Hong Thuong Commune	hong_thuong	481	10
20089	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	481	10
20095	A Roàng	A Roang	Xã A Roàng	A Roang Commune	a_roang	481	10
20098	Đông Sơn	Dong Son	Xã Đông Sơn	Dong Son Commune	dong_son	481	10
20101	Lâm Đớt	Lam Dot	Xã Lâm Đớt	Lam Dot Commune	lam_dot	481	10
20104	Hồng Thủy	Hong Thuy	Xã Hồng Thủy	Hong Thuy Commune	hong_thuy	481	10
20107	Phú Lộc	Phu Loc	Thị trấn Phú Lộc	Phu Loc Township	phu_loc	482	9
20110	Lăng Cô	Lang Co	Thị trấn Lăng Cô	Lang Co Township	lang_co	482	9
20113	Vinh Mỹ	Vinh My	Xã Vinh Mỹ	Vinh My Commune	vinh_my	482	10
20116	Vinh Hưng	Vinh Hung	Xã Vinh Hưng	Vinh Hung Commune	vinh_hung	482	10
20122	Giang Hải	Giang Hai	Xã Giang Hải	Giang Hai Commune	giang_hai	482	10
20125	Vinh Hiền	Vinh Hien	Xã Vinh Hiền	Vinh Hien Commune	vinh_hien	482	10
20128	Lộc Bổn	Loc Bon	Xã Lộc Bổn	Loc Bon Commune	loc_bon	482	10
20131	Lộc Sơn	Loc Son	Xã Lộc Sơn	Loc Son Commune	loc_son	482	10
20134	Lộc Bình	Loc Binh	Xã Lộc Bình	Loc Binh Commune	loc_binh	482	10
20137	Lộc Vĩnh	Loc Vinh	Xã Lộc Vĩnh	Loc Vinh Commune	loc_vinh	482	10
20140	Lộc An	Loc An	Xã Lộc An	Loc An Commune	loc_an	482	10
20143	Lộc Điền	Loc Dien	Xã Lộc Điền	Loc Dien Commune	loc_dien	482	10
20146	Lộc Thủy	Loc Thuy	Xã Lộc Thủy	Loc Thuy Commune	loc_thuy	482	10
20149	Lộc Trì	Loc Tri	Xã Lộc Trì	Loc Tri Commune	loc_tri	482	10
20152	Lộc Tiến	Loc Tien	Xã Lộc Tiến	Loc Tien Commune	loc_tien	482	10
20155	Lộc Hòa	Loc Hoa	Xã Lộc Hòa	Loc Hoa Commune	loc_hoa	482	10
20158	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	482	10
20161	Khe Tre	Khe Tre	Thị trấn Khe Tre	Khe Tre Township	khe_tre	483	9
20164	Hương Phú	Huong Phu	Xã Hương Phú	Huong Phu Commune	huong_phu	483	10
20167	Hương Sơn	Huong Son	Xã Hương Sơn	Huong Son Commune	huong_son	483	10
20170	Hương Lộc	Huong Loc	Xã Hương Lộc	Huong Loc Commune	huong_loc	483	10
20173	Thượng Quảng	Thuong Quang	Xã Thượng Quảng	Thuong Quang Commune	thuong_quang	483	10
20179	Hương Xuân	Huong Xuan	Xã Hương Xuân	Huong Xuan Commune	huong_xuan	483	10
20182	Hương Hữu	Huong Huu	Xã Hương Hữu	Huong Huu Commune	huong_huu	483	10
20185	Thượng Lộ	Thuong Lo	Xã Thượng Lộ	Thuong Lo Commune	thuong_lo	483	10
20188	Thượng Long	Thuong Long	Xã Thượng Long	Thuong Long Commune	thuong_long	483	10
20191	Thượng Nhật	Thuong Nhat	Xã Thượng Nhật	Thuong Nhat Commune	thuong_nhat	483	10
20194	Hòa Hiệp Bắc	Hoa Hiep Bac	Phường Hòa Hiệp Bắc	Hoa Hiep Bac Ward	hoa_hiep_bac	490	8
20195	Hòa Hiệp Nam	Hoa Hiep Nam	Phường Hòa Hiệp Nam	Hoa Hiep Nam Ward	hoa_hiep_nam	490	8
20197	Hòa Khánh Bắc	Hoa Khanh Bac	Phường Hòa Khánh Bắc	Hoa Khanh Bac Ward	hoa_khanh_bac	490	8
20198	Hòa Khánh Nam	Hoa Khanh Nam	Phường Hòa Khánh Nam	Hoa Khanh Nam Ward	hoa_khanh_nam	490	8
20200	Hòa Minh	Hoa Minh	Phường Hòa Minh	Hoa Minh Ward	hoa_minh	490	8
20203	Tam Thuận	Tam Thuan	Phường Tam Thuận	Tam Thuan Ward	tam_thuan	491	8
20206	Thanh Khê Tây	Thanh Khe Tay	Phường Thanh Khê Tây	Thanh Khe Tay Ward	thanh_khe_tay	491	8
20207	Thanh Khê Đông	Thanh Khe Dong	Phường Thanh Khê Đông	Thanh Khe Dong Ward	thanh_khe_dong	491	8
20209	Xuân Hà	Xuan Ha	Phường Xuân Hà	Xuan Ha Ward	xuan_ha	491	8
20212	Tân Chính	Tan Chinh	Phường Tân Chính	Tan Chinh Ward	tan_chinh	491	8
20215	Chính Gián	Chinh Gian	Phường Chính Gián	Chinh Gian Ward	chinh_gian	491	8
20218	Vĩnh Trung	Vinh Trung	Phường Vĩnh Trung	Vinh Trung Ward	vinh_trung	491	8
20221	Thạc Gián	Thac Gian	Phường Thạc Gián	Thac Gian Ward	thac_gian	491	8
20224	An Khê	An Khe	Phường An Khê	An Khe Ward	an_khe	491	8
20225	Hòa Khê	Hoa Khe	Phường Hòa Khê	Hoa Khe Ward	hoa_khe	491	8
20227	Thanh Bình	Thanh Binh	Phường Thanh Bình	Thanh Binh Ward	thanh_binh	492	8
20230	Thuận Phước	Thuan Phuoc	Phường Thuận Phước	Thuan Phuoc Ward	thuan_phuoc	492	8
20233	Thạch Thang	Thach Thang	Phường Thạch Thang	Thach Thang Ward	thach_thang	492	8
20236	Hải Châu  I	Hai Chau  I	Phường Hải Châu  I	Hai Chau  I Ward	hai_chau__i	492	8
20239	Hải Châu II	Hai Chau II	Phường Hải Châu II	Hai Chau II Ward	hai_chau_ii	492	8
20242	Phước Ninh	Phuoc Ninh	Phường Phước Ninh	Phuoc Ninh Ward	phuoc_ninh	492	8
20245	Hòa Thuận Tây	Hoa Thuan Tay	Phường Hòa Thuận Tây	Hoa Thuan Tay Ward	hoa_thuan_tay	492	8
20246	Hòa Thuận Đông	Hoa Thuan Dong	Phường Hòa Thuận Đông	Hoa Thuan Dong Ward	hoa_thuan_dong	492	8
20248	Nam Dương	Nam Duong	Phường Nam Dương	Nam Duong Ward	nam_duong	492	8
20251	Bình Hiên	Binh Hien	Phường Bình Hiên	Binh Hien Ward	binh_hien	492	8
20254	Bình Thuận	Binh Thuan	Phường Bình Thuận	Binh Thuan Ward	binh_thuan	492	8
20257	Hòa Cường Bắc	Hoa Cuong Bac	Phường Hòa Cường Bắc	Hoa Cuong Bac Ward	hoa_cuong_bac	492	8
20258	Hòa Cường Nam	Hoa Cuong Nam	Phường Hòa Cường Nam	Hoa Cuong Nam Ward	hoa_cuong_nam	492	8
20263	Thọ Quang	Tho Quang	Phường Thọ Quang	Tho Quang Ward	tho_quang	493	8
20266	Nại Hiên Đông	Nai Hien Dong	Phường Nại Hiên Đông	Nai Hien Dong Ward	nai_hien_dong	493	8
20269	Mân Thái	Man Thai	Phường Mân Thái	Man Thai Ward	man_thai	493	8
20272	An Hải Bắc	An Hai Bac	Phường An Hải Bắc	An Hai Bac Ward	an_hai_bac	493	8
20275	Phước Mỹ	Phuoc My	Phường Phước Mỹ	Phuoc My Ward	phuoc_my	493	8
20278	An Hải Tây	An Hai Tay	Phường An Hải Tây	An Hai Tay Ward	an_hai_tay	493	8
20281	An Hải Đông	An Hai Dong	Phường An Hải Đông	An Hai Dong Ward	an_hai_dong	493	8
20284	Mỹ An	My An	Phường Mỹ An	My An Ward	my_an	494	8
20285	Khuê Mỹ	Khue My	Phường Khuê Mỹ	Khue My Ward	khue_my	494	8
20287	Hoà Quý	Hoa Quy	Phường Hoà Quý	Hoa Quy Ward	hoa_quy	494	8
20290	Hoà Hải	Hoa Hai	Phường Hoà Hải	Hoa Hai Ward	hoa_hai	494	8
20260	Khuê Trung	Khue Trung	Phường Khuê Trung	Khue Trung Ward	khue_trung	495	8
20305	Hòa Phát	Hoa Phat	Phường Hòa Phát	Hoa Phat Ward	hoa_phat	495	8
20306	Hòa An	Hoa An	Phường Hòa An	Hoa An Ward	hoa_an	495	8
20311	Hòa Thọ Tây	Hoa Tho Tay	Phường Hòa Thọ Tây	Hoa Tho Tay Ward	hoa_tho_tay	495	8
20312	Hòa Thọ Đông	Hoa Tho Dong	Phường Hòa Thọ Đông	Hoa Tho Dong Ward	hoa_tho_dong	495	8
20314	Hòa Xuân	Hoa Xuan	Phường Hòa Xuân	Hoa Xuan Ward	hoa_xuan	495	8
20293	Hòa Bắc	Hoa Bac	Xã Hòa Bắc	Hoa Bac Commune	hoa_bac	497	10
20296	Hòa Liên	Hoa Lien	Xã Hòa Liên	Hoa Lien Commune	hoa_lien	497	10
20299	Hòa Ninh	Hoa Ninh	Xã Hòa Ninh	Hoa Ninh Commune	hoa_ninh	497	10
20302	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	497	10
20308	Hòa Nhơn	Hoa Nhon	Xã Hòa Nhơn	Hoa Nhon Commune	hoa_nhon	497	10
20317	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	497	10
20320	Hòa Phong	Hoa Phong	Xã Hòa Phong	Hoa Phong Commune	hoa_phong	497	10
20323	Hòa Châu	Hoa Chau	Xã Hòa Châu	Hoa Chau Commune	hoa_chau	497	10
20326	Hòa Tiến	Hoa Tien	Xã Hòa Tiến	Hoa Tien Commune	hoa_tien	497	10
20329	Hòa Phước	Hoa Phuoc	Xã Hòa Phước	Hoa Phuoc Commune	hoa_phuoc	497	10
20332	Hòa Khương	Hoa Khuong	Xã Hòa Khương	Hoa Khuong Commune	hoa_khuong	497	10
20335	Tân Thạnh	Tan Thanh	Phường Tân Thạnh	Tan Thanh Ward	tan_thanh	502	8
20338	Phước Hòa	Phuoc Hoa	Phường Phước Hòa	Phuoc Hoa Ward	phuoc_hoa	502	8
20341	An Mỹ	An My	Phường An Mỹ	An My Ward	an_my	502	8
20344	Hòa Hương	Hoa Huong	Phường Hòa Hương	Hoa Huong Ward	hoa_huong	502	8
20347	An Xuân	An Xuan	Phường An Xuân	An Xuan Ward	an_xuan	502	8
20350	An Sơn	An Son	Phường An Sơn	An Son Ward	an_son	502	8
20353	Trường Xuân	Truong Xuan	Phường Trường Xuân	Truong Xuan Ward	truong_xuan	502	8
20356	An Phú	An Phu	Phường An Phú	An Phu Ward	an_phu	502	8
20359	Tam Thanh	Tam Thanh	Xã Tam Thanh	Tam Thanh Commune	tam_thanh	502	10
20362	Tam Thăng	Tam Thang	Xã Tam Thăng	Tam Thang Commune	tam_thang	502	10
20371	Tam Phú	Tam Phu	Xã Tam Phú	Tam Phu Commune	tam_phu	502	10
20375	Hoà Thuận	Hoa Thuan	Phường Hoà Thuận	Hoa Thuan Ward	hoa_thuan	502	8
20389	Tam Ngọc	Tam Ngoc	Xã Tam Ngọc	Tam Ngoc Commune	tam_ngoc	502	10
20398	Minh An	Minh An	Phường Minh An	Minh An Ward	minh_an	503	8
20401	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	503	8
20404	Cẩm Phô	Cam Pho	Phường Cẩm Phô	Cam Pho Ward	cam_pho	503	8
20407	Thanh Hà	Thanh Ha	Phường Thanh Hà	Thanh Ha Ward	thanh_ha	503	8
20410	Sơn Phong	Son Phong	Phường Sơn Phong	Son Phong Ward	son_phong	503	8
20413	Cẩm Châu	Cam Chau	Phường Cẩm Châu	Cam Chau Ward	cam_chau	503	8
20416	Cửa Đại	Cua Dai	Phường Cửa Đại	Cua Dai Ward	cua_dai	503	8
20419	Cẩm An	Cam An	Phường Cẩm An	Cam An Ward	cam_an	503	8
20422	Cẩm Hà	Cam Ha	Xã Cẩm Hà	Cam Ha Commune	cam_ha	503	10
20425	Cẩm Kim	Cam Kim	Xã Cẩm Kim	Cam Kim Commune	cam_kim	503	10
20428	Cẩm Nam	Cam Nam	Phường Cẩm Nam	Cam Nam Ward	cam_nam	503	8
20431	Cẩm Thanh	Cam Thanh	Xã Cẩm Thanh	Cam Thanh Commune	cam_thanh	503	10
20434	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	503	10
20437	Ch'ơm	Ch'om	Xã Ch'ơm	Ch'om Commune	ch'om	504	10
20440	Ga Ri	Ga Ri	Xã Ga Ri	Ga Ri Commune	ga_ri	504	10
20443	A Xan	A Xan	Xã A Xan	A Xan Commune	a_xan	504	10
20446	Tr'Hy	Tr'Hy	Xã Tr'Hy	Tr'Hy Commune	tr'hy	504	10
20449	Lăng	Lang	Xã Lăng	Lang Commune	lang	504	10
20452	A Nông	A Nong	Xã A Nông	A Nong Commune	a_nong	504	10
20455	A Tiêng	A Tieng	Xã A Tiêng	A Tieng Commune	a_tieng	504	10
20458	Bha Lê	Bha Le	Xã Bha Lê	Bha Le Commune	bha_le	504	10
20461	A Vương	A Vuong	Xã A Vương	A Vuong Commune	a_vuong	504	10
20464	Dang	Dang	Xã Dang	Dang Commune	dang	504	10
20467	P Rao	P Rao	Thị trấn P Rao	P Rao Township	p_rao	505	9
20470	Tà Lu	Ta Lu	Xã Tà Lu	Ta Lu Commune	ta_lu	505	10
20473	Sông Kôn	Song Kon	Xã Sông Kôn	Song Kon Commune	song_kon	505	10
20476	Jơ Ngây	Jo Ngay	Xã Jơ Ngây	Jo Ngay Commune	jo_ngay	505	10
20479	A Ting	A Ting	Xã A Ting	A Ting Commune	a_ting	505	10
20482	 Tư	 Tu	Xã  Tư	 Tu Commune	_tu	505	10
20485	Ba	Ba	Xã Ba	Ba Commune	ba	505	10
20488	A Rooi	A Rooi	Xã A Rooi	A Rooi Commune	a_rooi	505	10
20491	Za Hung	Za Hung	Xã Za Hung	Za Hung Commune	za_hung	505	10
20494	Mà Cooi	Ma Cooi	Xã Mà Cooi	Ma Cooi Commune	ma_cooi	505	10
20497	Ka Dăng	Ka Dang	Xã Ka Dăng	Ka Dang Commune	ka_dang	505	10
20500	Ái Nghĩa	Ai Nghia	Thị trấn Ái Nghĩa	Ai Nghia Township	ai_nghia	506	9
20503	Đại Sơn	Dai Son	Xã Đại Sơn	Dai Son Commune	dai_son	506	10
20506	Đại Lãnh	Dai Lanh	Xã Đại Lãnh	Dai Lanh Commune	dai_lanh	506	10
20509	Đại Hưng	Dai Hung	Xã Đại Hưng	Dai Hung Commune	dai_hung	506	10
20512	Đại Hồng	Dai Hong	Xã Đại Hồng	Dai Hong Commune	dai_hong	506	10
20515	Đại Đồng	Dai Dong	Xã Đại Đồng	Dai Dong Commune	dai_dong	506	10
20518	Đại Quang	Dai Quang	Xã Đại Quang	Dai Quang Commune	dai_quang	506	10
20521	Đại Nghĩa	Dai Nghia	Xã Đại Nghĩa	Dai Nghia Commune	dai_nghia	506	10
20524	Đại Hiệp	Dai Hiep	Xã Đại Hiệp	Dai Hiep Commune	dai_hiep	506	10
20527	Đại Thạnh	Dai Thanh	Xã Đại Thạnh	Dai Thanh Commune	dai_thanh	506	10
20530	Đại Chánh	Dai Chanh	Xã Đại Chánh	Dai Chanh Commune	dai_chanh	506	10
20533	Đại Tân	Dai Tan	Xã Đại Tân	Dai Tan Commune	dai_tan	506	10
20536	Đại Phong	Dai Phong	Xã Đại Phong	Dai Phong Commune	dai_phong	506	10
20539	Đại Minh	Dai Minh	Xã Đại Minh	Dai Minh Commune	dai_minh	506	10
20542	Đại Thắng	Dai Thang	Xã Đại Thắng	Dai Thang Commune	dai_thang	506	10
20545	Đại Cường	Dai Cuong	Xã Đại Cường	Dai Cuong Commune	dai_cuong	506	10
20547	Đại An	Dai An	Xã Đại An	Dai An Commune	dai_an	506	10
20548	Đại Hòa	Dai Hoa	Xã Đại Hòa	Dai Hoa Commune	dai_hoa	506	10
20551	Vĩnh Điện	Vinh Dien	Phường Vĩnh Điện	Vinh Dien Ward	vinh_dien	507	8
20554	Điện Tiến	Dien Tien	Xã Điện Tiến	Dien Tien Commune	dien_tien	507	10
20557	Điện Hòa	Dien Hoa	Xã Điện Hòa	Dien Hoa Commune	dien_hoa	507	10
20560	Điện Thắng Bắc	Dien Thang Bac	Xã Điện Thắng Bắc	Dien Thang Bac Commune	dien_thang_bac	507	10
20561	Điện Thắng Trung	Dien Thang Trung	Xã Điện Thắng Trung	Dien Thang Trung Commune	dien_thang_trung	507	10
20562	Điện Thắng Nam	Dien Thang Nam	Xã Điện Thắng Nam	Dien Thang Nam Commune	dien_thang_nam	507	10
20563	Điện Ngọc	Dien Ngoc	Phường Điện Ngọc	Dien Ngoc Ward	dien_ngoc	507	8
20566	Điện Hồng	Dien Hong	Xã Điện Hồng	Dien Hong Commune	dien_hong	507	10
20569	Điện Thọ	Dien Tho	Xã Điện Thọ	Dien Tho Commune	dien_tho	507	10
20572	Điện Phước	Dien Phuoc	Xã Điện Phước	Dien Phuoc Commune	dien_phuoc	507	10
20575	Điện An	Dien An	Phường Điện An	Dien An Ward	dien_an	507	8
20578	Điện Nam Bắc	Dien Nam Bac	Phường Điện Nam Bắc	Dien Nam Bac Ward	dien_nam_bac	507	8
20579	Điện Nam Trung	Dien Nam Trung	Phường Điện Nam Trung	Dien Nam Trung Ward	dien_nam_trung	507	8
20580	Điện Nam Đông	Dien Nam Dong	Phường Điện Nam Đông	Dien Nam Dong Ward	dien_nam_dong	507	8
20581	Điện Dương	Dien Duong	Phường Điện Dương	Dien Duong Ward	dien_duong	507	8
20584	Điện Quang	Dien Quang	Xã Điện Quang	Dien Quang Commune	dien_quang	507	10
20587	Điện Trung	Dien Trung	Xã Điện Trung	Dien Trung Commune	dien_trung	507	10
20590	Điện Phong	Dien Phong	Xã Điện Phong	Dien Phong Commune	dien_phong	507	10
20593	Điện Minh	Dien Minh	Xã Điện Minh	Dien Minh Commune	dien_minh	507	10
20596	Điện Phương	Dien Phuong	Xã Điện Phương	Dien Phuong Commune	dien_phuong	507	10
20599	Nam Phước	Nam Phuoc	Thị trấn Nam Phước	Nam Phuoc Township	nam_phuoc	508	9
20602	Duy Thu	Duy Thu	Xã Duy Thu	Duy Thu Commune	duy_thu	508	10
20605	Duy Phú	Duy Phu	Xã Duy Phú	Duy Phu Commune	duy_phu	508	10
20608	Duy Tân	Duy Tan	Xã Duy Tân	Duy Tan Commune	duy_tan	508	10
20611	Duy Hòa	Duy Hoa	Xã Duy Hòa	Duy Hoa Commune	duy_hoa	508	10
20614	Duy Châu	Duy Chau	Xã Duy Châu	Duy Chau Commune	duy_chau	508	10
20617	Duy Trinh	Duy Trinh	Xã Duy Trinh	Duy Trinh Commune	duy_trinh	508	10
20620	Duy Sơn	Duy Son	Xã Duy Sơn	Duy Son Commune	duy_son	508	10
20623	Duy Trung	Duy Trung	Xã Duy Trung	Duy Trung Commune	duy_trung	508	10
20626	Duy Phước	Duy Phuoc	Xã Duy Phước	Duy Phuoc Commune	duy_phuoc	508	10
20629	Duy Thành	Duy Thanh	Xã Duy Thành	Duy Thanh Commune	duy_thanh	508	10
20632	Duy Vinh	Duy Vinh	Xã Duy Vinh	Duy Vinh Commune	duy_vinh	508	10
20635	Duy Nghĩa	Duy Nghia	Xã Duy Nghĩa	Duy Nghia Commune	duy_nghia	508	10
20638	Duy Hải	Duy Hai	Xã Duy Hải	Duy Hai Commune	duy_hai	508	10
20641	Đông Phú	Dong Phu	Thị trấn Đông Phú	Dong Phu Township	dong_phu	509	9
20644	Quế Xuân 1	Que Xuan 1	Xã Quế Xuân 1	Que Xuan 1 Commune	que_xuan_1	509	10
20647	Quế Xuân 2	Que Xuan 2	Xã Quế Xuân 2	Que Xuan 2 Commune	que_xuan_2	509	10
20650	Quế Phú	Que Phu	Xã Quế Phú	Que Phu Commune	que_phu	509	10
20651	Hương An	Huong An	Thị trấn Hương An	Huong An Township	huong_an	509	9
20659	Quế Hiệp	Que Hiep	Xã Quế Hiệp	Que Hiep Commune	que_hiep	509	10
20662	Quế Thuận	Que Thuan	Xã Quế Thuận	Que Thuan Commune	que_thuan	509	10
20665	Quế Mỹ	Que My	Xã Quế Mỹ	Que My Commune	que_my	509	10
20677	Quế Long	Que Long	Xã Quế Long	Que Long Commune	que_long	509	10
20680	Quế Châu	Que Chau	Xã Quế Châu	Que Chau Commune	que_chau	509	10
20683	Quế Phong	Que Phong	Xã Quế Phong	Que Phong Commune	que_phong	509	10
20686	Quế An	Que An	Xã Quế An	Que An Commune	que_an	509	10
20689	Quế Minh	Que Minh	Xã Quế Minh	Que Minh Commune	que_minh	509	10
20695	Thạnh Mỹ	Thanh My	Thị trấn Thạnh Mỹ	Thanh My Township	thanh_my	510	9
20698	Laêê	Laee	Xã Laêê	Laee Commune	laee	510	10
20699	Chơ Chun	Cho Chun	Xã Chơ Chun	Cho Chun Commune	cho_chun	510	10
20701	Zuôich	Zuoich	Xã Zuôich	Zuoich Commune	zuoich	510	10
20702	Tà Pơơ	Ta Poo	Xã Tà Pơơ	Ta Poo Commune	ta_poo	510	10
20704	La Dêê	La Dee	Xã La Dêê	La Dee Commune	la_dee	510	10
20705	Đắc Tôi	Dac Toi	Xã Đắc Tôi	Dac Toi Commune	dac_toi	510	10
20707	Chà Vàl	Cha Val	Xã Chà Vàl	Cha Val Commune	cha_val	510	10
20710	Tà Bhinh	Ta Bhinh	Xã Tà Bhinh	Ta Bhinh Commune	ta_bhinh	510	10
20713	Cà Dy	Ca Dy	Xã Cà Dy	Ca Dy Commune	ca_dy	510	10
20716	Đắc Pre	Dac Pre	Xã Đắc Pre	Dac Pre Commune	dac_pre	510	10
20719	Đắc Pring	Dac Pring	Xã Đắc Pring	Dac Pring Commune	dac_pring	510	10
20722	Khâm Đức	Kham Duc	Thị trấn Khâm Đức	Kham Duc Township	kham_duc	511	9
20725	Phước Xuân	Phuoc Xuan	Xã Phước Xuân	Phuoc Xuan Commune	phuoc_xuan	511	10
20728	Phước Hiệp	Phuoc Hiep	Xã Phước Hiệp	Phuoc Hiep Commune	phuoc_hiep	511	10
20729	Phước Hoà	Phuoc Hoa	Xã Phước Hoà	Phuoc Hoa Commune	phuoc_hoa	511	10
20731	Phước Đức	Phuoc Duc	Xã Phước Đức	Phuoc Duc Commune	phuoc_duc	511	10
20734	Phước Năng	Phuoc Nang	Xã Phước Năng	Phuoc Nang Commune	phuoc_nang	511	10
20737	Phước Mỹ	Phuoc My	Xã Phước Mỹ	Phuoc My Commune	phuoc_my	511	10
20740	Phước Chánh	Phuoc Chanh	Xã Phước Chánh	Phuoc Chanh Commune	phuoc_chanh	511	10
20743	Phước Công	Phuoc Cong	Xã Phước Công	Phuoc Cong Commune	phuoc_cong	511	10
20746	Phước Kim	Phuoc Kim	Xã Phước Kim	Phuoc Kim Commune	phuoc_kim	511	10
20749	Phước Lộc	Phuoc Loc	Xã Phước Lộc	Phuoc Loc Commune	phuoc_loc	511	10
20752	Phước Thành	Phuoc Thanh	Xã Phước Thành	Phuoc Thanh Commune	phuoc_thanh	511	10
20758	Hiệp Hòa	Hiep Hoa	Xã Hiệp Hòa	Hiep Hoa Commune	hiep_hoa	512	10
20761	Hiệp Thuận	Hiep Thuan	Xã Hiệp Thuận	Hiep Thuan Commune	hiep_thuan	512	10
20764	Quế Thọ	Que Tho	Xã Quế Thọ	Que Tho Commune	que_tho	512	10
20767	Bình Lâm	Binh Lam	Xã Bình Lâm	Binh Lam Commune	binh_lam	512	10
20770	Sông Trà	Song Tra	Xã Sông Trà	Song Tra Commune	song_tra	512	10
20773	Phước Trà	Phuoc Tra	Xã Phước Trà	Phuoc Tra Commune	phuoc_tra	512	10
20776	Phước Gia	Phuoc Gia	Xã Phước Gia	Phuoc Gia Commune	phuoc_gia	512	10
20779	Tân Bình	Tan Binh	Thị trấn Tân Bình	Tan Binh Township	tan_binh	512	9
20782	Quế Lưu	Que Luu	Xã Quế Lưu	Que Luu Commune	que_luu	512	10
20785	Thăng Phước	Thang Phuoc	Xã Thăng Phước	Thang Phuoc Commune	thang_phuoc	512	10
20788	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	512	10
20791	Hà Lam	Ha Lam	Thị trấn Hà Lam	Ha Lam Township	ha_lam	513	9
20794	Bình Dương	Binh Duong	Xã Bình Dương	Binh Duong Commune	binh_duong	513	10
20797	Bình Giang	Binh Giang	Xã Bình Giang	Binh Giang Commune	binh_giang	513	10
20800	Bình Nguyên	Binh Nguyen	Xã Bình Nguyên	Binh Nguyen Commune	binh_nguyen	513	10
20803	Bình Phục	Binh Phuc	Xã Bình Phục	Binh Phuc Commune	binh_phuc	513	10
20806	Bình Triều	Binh Trieu	Xã Bình Triều	Binh Trieu Commune	binh_trieu	513	10
20809	Bình Đào	Binh Dao	Xã Bình Đào	Binh Dao Commune	binh_dao	513	10
20812	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	513	10
20815	Bình Lãnh	Binh Lanh	Xã Bình Lãnh	Binh Lanh Commune	binh_lanh	513	10
20818	Bình Trị	Binh Tri	Xã Bình Trị	Binh Tri Commune	binh_tri	513	10
20821	Bình Định Bắc	Binh Dinh Bac	Xã Bình Định Bắc	Binh Dinh Bac Commune	binh_dinh_bac	513	10
20822	Bình Định Nam	Binh Dinh Nam	Xã Bình Định Nam	Binh Dinh Nam Commune	binh_dinh_nam	513	10
20824	Bình Quý	Binh Quy	Xã Bình Quý	Binh Quy Commune	binh_quy	513	10
20827	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	513	10
20830	Bình Chánh	Binh Chanh	Xã Bình Chánh	Binh Chanh Commune	binh_chanh	513	10
20833	Bình Tú	Binh Tu	Xã Bình Tú	Binh Tu Commune	binh_tu	513	10
20836	Bình Sa	Binh Sa	Xã Bình Sa	Binh Sa Commune	binh_sa	513	10
20839	Bình Hải	Binh Hai	Xã Bình Hải	Binh Hai Commune	binh_hai	513	10
20842	Bình Quế	Binh Que	Xã Bình Quế	Binh Que Commune	binh_que	513	10
20845	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	513	10
20848	Bình Trung	Binh Trung	Xã Bình Trung	Binh Trung Commune	binh_trung	513	10
20851	Bình Nam	Binh Nam	Xã Bình Nam	Binh Nam Commune	binh_nam	513	10
20854	Tiên Kỳ	Tien Ky	Thị trấn Tiên Kỳ	Tien Ky Township	tien_ky	514	9
20857	Tiên Sơn	Tien Son	Xã Tiên Sơn	Tien Son Commune	tien_son	514	10
20860	Tiên Hà	Tien Ha	Xã Tiên Hà	Tien Ha Commune	tien_ha	514	10
20863	Tiên Cẩm	Tien Cam	Xã Tiên Cẩm	Tien Cam Commune	tien_cam	514	10
20866	Tiên Châu	Tien Chau	Xã Tiên Châu	Tien Chau Commune	tien_chau	514	10
20869	Tiên Lãnh	Tien Lanh	Xã Tiên Lãnh	Tien Lanh Commune	tien_lanh	514	10
20872	Tiên Ngọc	Tien Ngoc	Xã Tiên Ngọc	Tien Ngoc Commune	tien_ngoc	514	10
20875	Tiên Hiệp	Tien Hiep	Xã Tiên Hiệp	Tien Hiep Commune	tien_hiep	514	10
20878	Tiên Cảnh	Tien Canh	Xã Tiên Cảnh	Tien Canh Commune	tien_canh	514	10
20881	Tiên Mỹ	Tien My	Xã Tiên Mỹ	Tien My Commune	tien_my	514	10
20884	Tiên Phong	Tien Phong	Xã Tiên Phong	Tien Phong Commune	tien_phong	514	10
20887	Tiên Thọ	Tien Tho	Xã Tiên Thọ	Tien Tho Commune	tien_tho	514	10
20890	Tiên An	Tien An	Xã Tiên An	Tien An Commune	tien_an	514	10
20893	Tiên Lộc	Tien Loc	Xã Tiên Lộc	Tien Loc Commune	tien_loc	514	10
20896	Tiên Lập	Tien Lap	Xã Tiên Lập	Tien Lap Commune	tien_lap	514	10
20899	Trà My	Tra My	Thị trấn Trà My	Tra My Township	tra_my	515	9
20900	Trà Sơn	Tra Son	Xã Trà Sơn	Tra Son Commune	tra_son	515	10
20902	Trà Kót	Tra Kot	Xã Trà Kót	Tra Kot Commune	tra_kot	515	10
20905	Trà Nú	Tra Nu	Xã Trà Nú	Tra Nu Commune	tra_nu	515	10
20908	Trà Đông	Tra Dong	Xã Trà Đông	Tra Dong Commune	tra_dong	515	10
20911	Trà Dương	Tra Duong	Xã Trà Dương	Tra Duong Commune	tra_duong	515	10
20914	Trà Giang	Tra Giang	Xã Trà Giang	Tra Giang Commune	tra_giang	515	10
20917	Trà Bui	Tra Bui	Xã Trà Bui	Tra Bui Commune	tra_bui	515	10
20920	Trà Đốc	Tra Doc	Xã Trà Đốc	Tra Doc Commune	tra_doc	515	10
20923	Trà Tân	Tra Tan	Xã Trà Tân	Tra Tan Commune	tra_tan	515	10
20926	Trà Giác	Tra Giac	Xã Trà Giác	Tra Giac Commune	tra_giac	515	10
20929	Trà Giáp	Tra Giap	Xã Trà Giáp	Tra Giap Commune	tra_giap	515	10
20932	Trà Ka	Tra Ka	Xã Trà Ka	Tra Ka Commune	tra_ka	515	10
20935	Trà Leng	Tra Leng	Xã Trà Leng	Tra Leng Commune	tra_leng	516	10
20938	Trà Dơn	Tra Don	Xã Trà Dơn	Tra Don Commune	tra_don	516	10
20941	Trà Tập	Tra Tap	Xã Trà Tập	Tra Tap Commune	tra_tap	516	10
20944	Trà Mai	Tra Mai	Xã Trà Mai	Tra Mai Commune	tra_mai	516	10
20947	Trà Cang	Tra Cang	Xã Trà Cang	Tra Cang Commune	tra_cang	516	10
20950	Trà Linh	Tra Linh	Xã Trà Linh	Tra Linh Commune	tra_linh	516	10
20953	Trà Nam	Tra Nam	Xã Trà Nam	Tra Nam Commune	tra_nam	516	10
20956	Trà Don	Tra Don	Xã Trà Don	Tra Don Commune	tra_don	516	10
20959	Trà Vân	Tra Van	Xã Trà Vân	Tra Van Commune	tra_van	516	10
20962	Trà Vinh	Tra Vinh	Xã Trà Vinh	Tra Vinh Commune	tra_vinh	516	10
20965	Núi Thành	Nui Thanh	Thị trấn Núi Thành	Nui Thanh Township	nui_thanh	517	9
20968	Tam Xuân I	Tam Xuan I	Xã Tam Xuân I	Tam Xuan I Commune	tam_xuan_i	517	10
20971	Tam Xuân II	Tam Xuan II	Xã Tam Xuân II	Tam Xuan II Commune	tam_xuan_ii	517	10
20974	Tam Tiến	Tam Tien	Xã Tam Tiến	Tam Tien Commune	tam_tien	517	10
20977	Tam Sơn	Tam Son	Xã Tam Sơn	Tam Son Commune	tam_son	517	10
20980	Tam Thạnh	Tam Thanh	Xã Tam Thạnh	Tam Thanh Commune	tam_thanh	517	10
20983	Tam Anh Bắc	Tam Anh Bac	Xã Tam Anh Bắc	Tam Anh Bac Commune	tam_anh_bac	517	10
20984	Tam Anh Nam	Tam Anh Nam	Xã Tam Anh Nam	Tam Anh Nam Commune	tam_anh_nam	517	10
20986	Tam Hòa	Tam Hoa	Xã Tam Hòa	Tam Hoa Commune	tam_hoa	517	10
20989	Tam Hiệp	Tam Hiep	Xã Tam Hiệp	Tam Hiep Commune	tam_hiep	517	10
20992	Tam Hải	Tam Hai	Xã Tam Hải	Tam Hai Commune	tam_hai	517	10
20995	Tam Giang	Tam Giang	Xã Tam Giang	Tam Giang Commune	tam_giang	517	10
20998	Tam Quang	Tam Quang	Xã Tam Quang	Tam Quang Commune	tam_quang	517	10
21001	Tam Nghĩa	Tam Nghia	Xã Tam Nghĩa	Tam Nghia Commune	tam_nghia	517	10
21004	Tam Mỹ Tây	Tam My Tay	Xã Tam Mỹ Tây	Tam My Tay Commune	tam_my_tay	517	10
21005	Tam Mỹ Đông	Tam My Dong	Xã Tam Mỹ Đông	Tam My Dong Commune	tam_my_dong	517	10
21007	Tam Trà	Tam Tra	Xã Tam Trà	Tam Tra Commune	tam_tra	517	10
20364	Phú Thịnh	Phu Thinh	Thị trấn Phú Thịnh	Phu Thinh Township	phu_thinh	518	9
20365	Tam Thành	Tam Thanh	Xã Tam Thành	Tam Thanh Commune	tam_thanh	518	10
20368	Tam An	Tam An	Xã Tam An	Tam An Commune	tam_an	518	10
20374	Tam Đàn	Tam Dan	Xã Tam Đàn	Tam Dan Commune	tam_dan	518	10
20377	Tam Lộc	Tam Loc	Xã Tam Lộc	Tam Loc Commune	tam_loc	518	10
20380	Tam Phước	Tam Phuoc	Xã Tam Phước	Tam Phuoc Commune	tam_phuoc	518	10
20383	Tam Vinh	Tam Vinh	Xã Tam Vinh	Tam Vinh Commune	tam_vinh	518	10
20386	Tam Thái	Tam Thai	Xã Tam Thái	Tam Thai Commune	tam_thai	518	10
20387	Tam Đại	Tam Dai	Xã Tam Đại	Tam Dai Commune	tam_dai	518	10
20392	Tam Dân	Tam Dan	Xã Tam Dân	Tam Dan Commune	tam_dan	518	10
20395	Tam Lãnh	Tam Lanh	Xã Tam Lãnh	Tam Lanh Commune	tam_lanh	518	10
20656	Quế Trung	Que Trung	Xã Quế Trung	Que Trung Commune	que_trung	519	10
20668	Ninh Phước	Ninh Phuoc	Xã Ninh Phước	Ninh Phuoc Commune	ninh_phuoc	519	10
20669	Phước Ninh	Phuoc Ninh	Xã Phước Ninh	Phuoc Ninh Commune	phuoc_ninh	519	10
20671	Quế Lộc	Que Loc	Xã Quế Lộc	Que Loc Commune	que_loc	519	10
20672	Sơn Viên	Son Vien	Xã Sơn Viên	Son Vien Commune	son_vien	519	10
20692	Quế Lâm	Que Lam	Xã Quế Lâm	Que Lam Commune	que_lam	519	10
21010	Lê Hồng Phong	Le Hong Phong	Phường Lê Hồng Phong	Le Hong Phong Ward	le_hong_phong	522	8
21013	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	522	8
21016	Quảng Phú	Quang Phu	Phường Quảng Phú	Quang Phu Ward	quang_phu	522	8
21019	Nghĩa Chánh	Nghia Chanh	Phường Nghĩa Chánh	Nghia Chanh Ward	nghia_chanh	522	8
21022	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	522	8
21025	Nguyễn Nghiêm	Nguyen Nghiem	Phường Nguyễn Nghiêm	Nguyen Nghiem Ward	nguyen_nghiem	522	8
21028	Nghĩa Lộ	Nghia Lo	Phường Nghĩa Lộ	Nghia Lo Ward	nghia_lo	522	8
21031	Chánh Lộ	Chanh Lo	Phường Chánh Lộ	Chanh Lo Ward	chanh_lo	522	8
21034	Nghĩa Dũng	Nghia Dung	Xã Nghĩa Dũng	Nghia Dung Commune	nghia_dung	522	10
21037	Nghĩa Dõng	Nghia Dong	Xã Nghĩa Dõng	Nghia Dong Commune	nghia_dong	522	10
21172	Trương Quang Trọng	Truong Quang Trong	Phường Trương Quang Trọng	Truong Quang Trong Ward	truong_quang_trong	522	8
21187	Tịnh Hòa	Tinh Hoa	Xã Tịnh Hòa	Tinh Hoa Commune	tinh_hoa	522	10
21190	Tịnh Kỳ	Tinh Ky	Xã Tịnh Kỳ	Tinh Ky Commune	tinh_ky	522	10
21199	Tịnh Thiện	Tinh Thien	Xã Tịnh Thiện	Tinh Thien Commune	tinh_thien	522	10
21202	Tịnh Ấn Đông	Tinh An Dong	Xã Tịnh Ấn Đông	Tinh An Dong Commune	tinh_an_dong	522	10
21208	Tịnh Châu	Tinh Chau	Xã Tịnh Châu	Tinh Chau Commune	tinh_chau	522	10
21211	Tịnh Khê	Tinh Khe	Xã Tịnh Khê	Tinh Khe Commune	tinh_khe	522	10
21214	Tịnh Long	Tinh Long	Xã Tịnh Long	Tinh Long Commune	tinh_long	522	10
21223	Tịnh Ấn Tây	Tinh An Tay	Xã Tịnh Ấn Tây	Tinh An Tay Commune	tinh_an_tay	522	10
21232	Tịnh An	Tinh An	Xã Tịnh An	Tinh An Commune	tinh_an	522	10
21253	Nghĩa Phú	Nghia Phu	Xã Nghĩa Phú	Nghia Phu Commune	nghia_phu	522	10
21256	Nghĩa Hà	Nghia Ha	Xã Nghĩa Hà	Nghia Ha Commune	nghia_ha	522	10
21262	Nghĩa An	Nghia An	Xã Nghĩa An	Nghia An Commune	nghia_an	522	10
21040	Châu Ổ	Chau O	Thị trấn Châu Ổ	Chau O Township	chau_o	524	9
21043	Bình Thuận	Binh Thuan	Xã Bình Thuận	Binh Thuan Commune	binh_thuan	524	10
21046	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	524	10
21049	Bình Đông	Binh Dong	Xã Bình Đông	Binh Dong Commune	binh_dong	524	10
21052	Bình Chánh	Binh Chanh	Xã Bình Chánh	Binh Chanh Commune	binh_chanh	524	10
21055	Bình Nguyên	Binh Nguyen	Xã Bình Nguyên	Binh Nguyen Commune	binh_nguyen	524	10
21058	Bình Khương	Binh Khuong	Xã Bình Khương	Binh Khuong Commune	binh_khuong	524	10
21061	Bình Trị	Binh Tri	Xã Bình Trị	Binh Tri Commune	binh_tri	524	10
21064	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	524	10
21067	Bình Hải	Binh Hai	Xã Bình Hải	Binh Hai Commune	binh_hai	524	10
21070	Bình Dương	Binh Duong	Xã Bình Dương	Binh Duong Commune	binh_duong	524	10
21073	Bình Phước	Binh Phuoc	Xã Bình Phước	Binh Phuoc Commune	binh_phuoc	524	10
21079	Bình Hòa	Binh Hoa	Xã Bình Hòa	Binh Hoa Commune	binh_hoa	524	10
21082	Bình Trung	Binh Trung	Xã Bình Trung	Binh Trung Commune	binh_trung	524	10
21085	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	524	10
21088	Bình Long	Binh Long	Xã Bình Long	Binh Long Commune	binh_long	524	10
21091	Bình Thanh 	Binh Thanh 	Xã Bình Thanh 	Binh Thanh  Commune	binh_thanh_	524	10
21100	Bình Chương	Binh Chuong	Xã Bình Chương	Binh Chuong Commune	binh_chuong	524	10
21103	Bình Hiệp	Binh Hiep	Xã Bình Hiệp	Binh Hiep Commune	binh_hiep	524	10
21106	Bình Mỹ	Binh My	Xã Bình Mỹ	Binh My Commune	binh_my	524	10
21109	Bình Tân Phú	Binh Tan Phu	Xã Bình Tân Phú	Binh Tan Phu Commune	binh_tan_phu	524	10
21112	Bình Châu	Binh Chau	Xã Bình Châu	Binh Chau Commune	binh_chau	524	10
21115	Trà Xuân	Tra Xuan	Thị trấn Trà Xuân	Tra Xuan Township	tra_xuan	525	9
21118	Trà Giang	Tra Giang	Xã Trà Giang	Tra Giang Commune	tra_giang	525	10
21121	Trà Thủy	Tra Thuy	Xã Trà Thủy	Tra Thuy Commune	tra_thuy	525	10
21124	Trà Hiệp	Tra Hiep	Xã Trà Hiệp	Tra Hiep Commune	tra_hiep	525	10
21127	Trà Bình	Tra Binh	Xã Trà Bình	Tra Binh Commune	tra_binh	525	10
21130	Trà Phú	Tra Phu	Xã Trà Phú	Tra Phu Commune	tra_phu	525	10
21133	Trà Lâm	Tra Lam	Xã Trà Lâm	Tra Lam Commune	tra_lam	525	10
21136	Trà Tân	Tra Tan	Xã Trà Tân	Tra Tan Commune	tra_tan	525	10
21139	Trà Sơn	Tra Son	Xã Trà Sơn	Tra Son Commune	tra_son	525	10
21142	Trà Bùi	Tra Bui	Xã Trà Bùi	Tra Bui Commune	tra_bui	525	10
21145	Trà Thanh	Tra Thanh	Xã Trà Thanh	Tra Thanh Commune	tra_thanh	525	10
21148	Sơn Trà	Son Tra	Xã Sơn Trà	Son Tra Commune	son_tra	525	10
21154	Trà Phong	Tra Phong	Xã Trà Phong	Tra Phong Commune	tra_phong	525	10
21157	Hương Trà	Huong Tra	Xã Hương Trà	Huong Tra Commune	huong_tra	525	10
21163	Trà Xinh	Tra Xinh	Xã Trà Xinh	Tra Xinh Commune	tra_xinh	525	10
21166	Trà Tây	Tra Tay	Xã Trà Tây	Tra Tay Commune	tra_tay	525	10
21175	Tịnh Thọ	Tinh Tho	Xã Tịnh Thọ	Tinh Tho Commune	tinh_tho	527	10
21178	Tịnh Trà	Tinh Tra	Xã Tịnh Trà	Tinh Tra Commune	tinh_tra	527	10
21181	Tịnh Phong	Tinh Phong	Xã Tịnh Phong	Tinh Phong Commune	tinh_phong	527	10
21184	Tịnh Hiệp	Tinh Hiep	Xã Tịnh Hiệp	Tinh Hiep Commune	tinh_hiep	527	10
21193	Tịnh Bình	Tinh Binh	Xã Tịnh Bình	Tinh Binh Commune	tinh_binh	527	10
21196	Tịnh Đông	Tinh Dong	Xã Tịnh Đông	Tinh Dong Commune	tinh_dong	527	10
21205	Tịnh Bắc	Tinh Bac	Xã Tịnh Bắc	Tinh Bac Commune	tinh_bac	527	10
21217	Tịnh Sơn	Tinh Son	Xã Tịnh Sơn	Tinh Son Commune	tinh_son	527	10
21220	Tịnh Hà	Tinh Ha	Xã Tịnh Hà	Tinh Ha Commune	tinh_ha	527	10
21226	Tịnh Giang	Tinh Giang	Xã Tịnh Giang	Tinh Giang Commune	tinh_giang	527	10
21229	Tịnh Minh	Tinh Minh	Xã Tịnh Minh	Tinh Minh Commune	tinh_minh	527	10
21235	La Hà	La Ha	Thị trấn La Hà	La Ha Township	la_ha	528	9
21238	Sông Vệ	Song Ve	Thị trấn Sông Vệ	Song Ve Township	song_ve	528	9
21241	Nghĩa Lâm	Nghia Lam	Xã Nghĩa Lâm	Nghia Lam Commune	nghia_lam	528	10
21244	Nghĩa Thắng	Nghia Thang	Xã Nghĩa Thắng	Nghia Thang Commune	nghia_thang	528	10
21247	Nghĩa Thuận	Nghia Thuan	Xã Nghĩa Thuận	Nghia Thuan Commune	nghia_thuan	528	10
21250	Nghĩa Kỳ	Nghia Ky	Xã Nghĩa Kỳ	Nghia Ky Commune	nghia_ky	528	10
21259	Nghĩa Sơn	Nghia Son	Xã Nghĩa Sơn	Nghia Son Commune	nghia_son	528	10
21268	Nghĩa Hòa	Nghia Hoa	Xã Nghĩa Hòa	Nghia Hoa Commune	nghia_hoa	528	10
21271	Nghĩa Điền	Nghia Dien	Xã Nghĩa Điền	Nghia Dien Commune	nghia_dien	528	10
21274	Nghĩa Thương	Nghia Thuong	Xã Nghĩa Thương	Nghia Thuong Commune	nghia_thuong	528	10
21277	Nghĩa Trung	Nghia Trung	Xã Nghĩa Trung	Nghia Trung Commune	nghia_trung	528	10
21280	Nghĩa Hiệp	Nghia Hiep	Xã Nghĩa Hiệp	Nghia Hiep Commune	nghia_hiep	528	10
21283	Nghĩa Phương	Nghia Phuong	Xã Nghĩa Phương	Nghia Phuong Commune	nghia_phuong	528	10
21286	Nghĩa Mỹ	Nghia My	Xã Nghĩa Mỹ	Nghia My Commune	nghia_my	528	10
21289	Di Lăng	Di Lang	Thị trấn Di Lăng	Di Lang Township	di_lang	529	9
21292	Sơn Hạ	Son Ha	Xã Sơn Hạ	Son Ha Commune	son_ha	529	10
21295	Sơn Thành	Son Thanh	Xã Sơn Thành	Son Thanh Commune	son_thanh	529	10
21298	Sơn Nham	Son Nham	Xã Sơn Nham	Son Nham Commune	son_nham	529	10
21301	Sơn Bao	Son Bao	Xã Sơn Bao	Son Bao Commune	son_bao	529	10
21304	Sơn Linh	Son Linh	Xã Sơn Linh	Son Linh Commune	son_linh	529	10
21307	Sơn Giang	Son Giang	Xã Sơn Giang	Son Giang Commune	son_giang	529	10
21310	Sơn Trung	Son Trung	Xã Sơn Trung	Son Trung Commune	son_trung	529	10
21313	Sơn Thượng	Son Thuong	Xã Sơn Thượng	Son Thuong Commune	son_thuong	529	10
21316	Sơn Cao	Son Cao	Xã Sơn Cao	Son Cao Commune	son_cao	529	10
21319	Sơn Hải	Son Hai	Xã Sơn Hải	Son Hai Commune	son_hai	529	10
21322	Sơn Thủy	Son Thuy	Xã Sơn Thủy	Son Thuy Commune	son_thuy	529	10
21325	Sơn Kỳ	Son Ky	Xã Sơn Kỳ	Son Ky Commune	son_ky	529	10
21328	Sơn Ba	Son Ba	Xã Sơn Ba	Son Ba Commune	son_ba	529	10
21331	Sơn Bua	Son Bua	Xã Sơn Bua	Son Bua Commune	son_bua	530	10
21334	Sơn Mùa	Son Mua	Xã Sơn Mùa	Son Mua Commune	son_mua	530	10
21335	Sơn Liên	Son Lien	Xã Sơn Liên	Son Lien Commune	son_lien	530	10
21337	Sơn Tân	Son Tan	Xã Sơn Tân	Son Tan Commune	son_tan	530	10
21338	Sơn Màu	Son Mau	Xã Sơn Màu	Son Mau Commune	son_mau	530	10
21340	Sơn Dung	Son Dung	Xã Sơn Dung	Son Dung Commune	son_dung	530	10
21341	Sơn Long	Son Long	Xã Sơn Long	Son Long Commune	son_long	530	10
21343	Sơn Tinh	Son Tinh	Xã Sơn Tinh	Son Tinh Commune	son_tinh	530	10
21346	Sơn Lập	Son Lap	Xã Sơn Lập	Son Lap Commune	son_lap	530	10
21349	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	531	10
21352	Long Mai	Long Mai	Xã Long Mai	Long Mai Commune	long_mai	531	10
21355	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	531	10
21358	Long Môn	Long Mon	Xã Long Môn	Long Mon Commune	long_mon	531	10
21361	Long Hiệp	Long Hiep	Xã Long Hiệp	Long Hiep Commune	long_hiep	531	10
21364	Chợ Chùa	Cho Chua	Thị trấn Chợ Chùa	Cho Chua Township	cho_chua	532	9
21367	Hành Thuận	Hanh Thuan	Xã Hành Thuận	Hanh Thuan Commune	hanh_thuan	532	10
21370	Hành Dũng	Hanh Dung	Xã Hành Dũng	Hanh Dung Commune	hanh_dung	532	10
21373	Hành Trung	Hanh Trung	Xã Hành Trung	Hanh Trung Commune	hanh_trung	532	10
21376	Hành Nhân	Hanh Nhan	Xã Hành Nhân	Hanh Nhan Commune	hanh_nhan	532	10
21379	Hành Đức	Hanh Duc	Xã Hành Đức	Hanh Duc Commune	hanh_duc	532	10
21382	Hành Minh	Hanh Minh	Xã Hành Minh	Hanh Minh Commune	hanh_minh	532	10
21385	Hành Phước	Hanh Phuoc	Xã Hành Phước	Hanh Phuoc Commune	hanh_phuoc	532	10
21388	Hành Thiện	Hanh Thien	Xã Hành Thiện	Hanh Thien Commune	hanh_thien	532	10
21391	Hành Thịnh	Hanh Thinh	Xã Hành Thịnh	Hanh Thinh Commune	hanh_thinh	532	10
21394	Hành Tín Tây	Hanh Tin Tay	Xã Hành Tín Tây	Hanh Tin Tay Commune	hanh_tin_tay	532	10
21397	Hành Tín  Đông	Hanh Tin  Dong	Xã Hành Tín  Đông	Hanh Tin  Dong Commune	hanh_tin__dong	532	10
21400	Mộ Đức	Mo Duc	Thị trấn Mộ Đức	Mo Duc Township	mo_duc	533	9
21403	Đức Lợi	Duc Loi	Xã Đức Lợi	Duc Loi Commune	duc_loi	533	10
21406	Đức Thắng	Duc Thang	Xã Đức Thắng	Duc Thang Commune	duc_thang	533	10
21409	Đức Nhuận	Duc Nhuan	Xã Đức Nhuận	Duc Nhuan Commune	duc_nhuan	533	10
21412	Đức Chánh	Duc Chanh	Xã Đức Chánh	Duc Chanh Commune	duc_chanh	533	10
21415	Đức Hiệp	Duc Hiep	Xã Đức Hiệp	Duc Hiep Commune	duc_hiep	533	10
21418	Đức Minh	Duc Minh	Xã Đức Minh	Duc Minh Commune	duc_minh	533	10
21421	Đức Thạnh	Duc Thanh	Xã Đức Thạnh	Duc Thanh Commune	duc_thanh	533	10
21424	Đức Hòa	Duc Hoa	Xã Đức Hòa	Duc Hoa Commune	duc_hoa	533	10
21427	Đức Tân	Duc Tan	Xã Đức Tân	Duc Tan Commune	duc_tan	533	10
21430	Đức Phú	Duc Phu	Xã Đức Phú	Duc Phu Commune	duc_phu	533	10
21433	Đức Phong	Duc Phong	Xã Đức Phong	Duc Phong Commune	duc_phong	533	10
21436	Đức Lân	Duc Lan	Xã Đức Lân	Duc Lan Commune	duc_lan	533	10
21439	Nguyễn Nghiêm	Nguyen Nghiem	Phường Nguyễn Nghiêm	Nguyen Nghiem Ward	nguyen_nghiem	534	8
21442	Phổ An	Pho An	Xã Phổ An	Pho An Commune	pho_an	534	10
21445	Phổ Phong	Pho Phong	Xã Phổ Phong	Pho Phong Commune	pho_phong	534	10
21448	Phổ Thuận	Pho Thuan	Xã Phổ Thuận	Pho Thuan Commune	pho_thuan	534	10
21451	Phổ Văn	Pho Van	Phường Phổ Văn	Pho Van Ward	pho_van	534	8
21454	Phổ Quang	Pho Quang	Phường Phổ Quang	Pho Quang Ward	pho_quang	534	8
21457	Phổ Nhơn	Pho Nhon	Xã Phổ Nhơn	Pho Nhon Commune	pho_nhon	534	10
21460	Phổ Ninh	Pho Ninh	Phường Phổ Ninh	Pho Ninh Ward	pho_ninh	534	8
21463	Phổ Minh	Pho Minh	Phường Phổ Minh	Pho Minh Ward	pho_minh	534	8
21466	Phổ Vinh	Pho Vinh	Phường Phổ Vinh	Pho Vinh Ward	pho_vinh	534	8
21469	Phổ Hòa	Pho Hoa	Phường Phổ Hòa	Pho Hoa Ward	pho_hoa	534	8
21472	Phổ Cường	Pho Cuong	Xã Phổ Cường	Pho Cuong Commune	pho_cuong	534	10
21475	Phổ Khánh	Pho Khanh	Xã Phổ Khánh	Pho Khanh Commune	pho_khanh	534	10
21478	Phổ Thạnh	Pho Thanh	Phường Phổ Thạnh	Pho Thanh Ward	pho_thanh	534	8
21481	Phổ Châu	Pho Chau	Xã Phổ Châu	Pho Chau Commune	pho_chau	534	10
21484	Ba Tơ	Ba To	Thị trấn Ba Tơ	Ba To Township	ba_to	535	9
21487	Ba Điền	Ba Dien	Xã Ba Điền	Ba Dien Commune	ba_dien	535	10
21490	Ba Vinh	Ba Vinh	Xã Ba Vinh	Ba Vinh Commune	ba_vinh	535	10
21493	Ba Thành	Ba Thanh	Xã Ba Thành	Ba Thanh Commune	ba_thanh	535	10
21496	Ba Động	Ba Dong	Xã Ba Động	Ba Dong Commune	ba_dong	535	10
21499	Ba Dinh	Ba Dinh	Xã Ba Dinh	Ba Dinh Commune	ba_dinh	535	10
21500	Ba Giang	Ba Giang	Xã Ba Giang	Ba Giang Commune	ba_giang	535	10
21502	Ba Liên	Ba Lien	Xã Ba Liên	Ba Lien Commune	ba_lien	535	10
21505	Ba Ngạc	Ba Ngac	Xã Ba Ngạc	Ba Ngac Commune	ba_ngac	535	10
21508	Ba Khâm	Ba Kham	Xã Ba Khâm	Ba Kham Commune	ba_kham	535	10
21511	Ba Cung	Ba Cung	Xã Ba Cung	Ba Cung Commune	ba_cung	535	10
21517	Ba Tiêu	Ba Tieu	Xã Ba Tiêu	Ba Tieu Commune	ba_tieu	535	10
21520	Ba Trang	Ba Trang	Xã Ba Trang	Ba Trang Commune	ba_trang	535	10
21523	Ba Tô	Ba To	Xã Ba Tô	Ba To Commune	ba_to	535	10
21526	Ba Bích	Ba Bich	Xã Ba Bích	Ba Bich Commune	ba_bich	535	10
21529	Ba Vì	Ba Vi	Xã Ba Vì	Ba Vi Commune	ba_vi	535	10
21532	Ba Lế	Ba Le	Xã Ba Lế	Ba Le Commune	ba_le	535	10
21535	Ba Nam	Ba Nam	Xã Ba Nam	Ba Nam Commune	ba_nam	535	10
21538	Ba Xa	Ba Xa	Xã Ba Xa	Ba Xa Commune	ba_xa	535	10
23224	Đông Hà	Dong Ha	Xã Đông Hà	Dong Ha Commune	dong_ha	600	10
21550	Nhơn Bình	Nhon Binh	Phường Nhơn Bình	Nhon Binh Ward	nhon_binh	540	8
21553	Nhơn Phú	Nhon Phu	Phường Nhơn Phú	Nhon Phu Ward	nhon_phu	540	8
21556	Đống Đa	Dong Da	Phường Đống Đa	Dong Da Ward	dong_da	540	8
21559	Trần Quang Diệu	Tran Quang Dieu	Phường Trần Quang Diệu	Tran Quang Dieu Ward	tran_quang_dieu	540	8
21562	Hải Cảng	Hai Cang	Phường Hải Cảng	Hai Cang Ward	hai_cang	540	8
21565	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	540	8
21568	Thị Nại	Thi Nai	Phường Thị Nại	Thi Nai Ward	thi_nai	540	8
21571	Lê Hồng Phong	Le Hong Phong	Phường Lê Hồng Phong	Le Hong Phong Ward	le_hong_phong	540	8
21574	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	540	8
21577	Ngô Mây	Ngo May	Phường Ngô Mây	Ngo May Ward	ngo_may	540	8
21580	Lý Thường Kiệt	Ly Thuong Kiet	Phường Lý Thường Kiệt	Ly Thuong Kiet Ward	ly_thuong_kiet	540	8
21583	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	540	8
21586	Trần Phú	Tran Phu	Phường Trần Phú	Tran Phu Ward	tran_phu	540	8
21589	Bùi Thị Xuân	Bui Thi Xuan	Phường Bùi Thị Xuân	Bui Thi Xuan Ward	bui_thi_xuan	540	8
21592	Nguyễn Văn Cừ	Nguyen Van Cu	Phường Nguyễn Văn Cừ	Nguyen Van Cu Ward	nguyen_van_cu	540	8
21595	Ghềnh Ráng	Ghenh Rang	Phường Ghềnh Ráng	Ghenh Rang Ward	ghenh_rang	540	8
21598	Nhơn Lý	Nhon Ly	Xã Nhơn Lý	Nhon Ly Commune	nhon_ly	540	10
21601	Nhơn Hội	Nhon Hoi	Xã Nhơn Hội	Nhon Hoi Commune	nhon_hoi	540	10
21604	Nhơn Hải	Nhon Hai	Xã Nhơn Hải	Nhon Hai Commune	nhon_hai	540	10
21607	Nhơn Châu	Nhon Chau	Xã Nhơn Châu	Nhon Chau Commune	nhon_chau	540	10
21991	Phước Mỹ	Phuoc My	Xã Phước Mỹ	Phuoc My Commune	phuoc_my	540	10
21609	An Lão	An Lao	Thị trấn An Lão	An Lao Township	an_lao	542	9
21610	An Hưng	An Hung	Xã An Hưng	An Hung Commune	an_hung	542	10
21613	An Trung	An Trung	Xã An Trung	An Trung Commune	an_trung	542	10
21616	An Dũng	An Dung	Xã An Dũng	An Dung Commune	an_dung	542	10
21619	An Vinh	An Vinh	Xã An Vinh	An Vinh Commune	an_vinh	542	10
21622	An Toàn	An Toan	Xã An Toàn	An Toan Commune	an_toan	542	10
21625	An Tân	An Tan	Xã An Tân	An Tan Commune	an_tan	542	10
21628	An Hòa	An Hoa	Xã An Hòa	An Hoa Commune	an_hoa	542	10
21631	An Quang	An Quang	Xã An Quang	An Quang Commune	an_quang	542	10
21634	An Nghĩa	An Nghia	Xã An Nghĩa	An Nghia Commune	an_nghia	542	10
21637	Tam Quan	Tam Quan	Phường Tam Quan	Tam Quan Ward	tam_quan	543	8
21640	Bồng Sơn	Bong Son	Phường Bồng Sơn	Bong Son Ward	bong_son	543	8
21643	Hoài Sơn	Hoai Son	Xã Hoài Sơn	Hoai Son Commune	hoai_son	543	10
21646	Hoài Châu Bắc	Hoai Chau Bac	Xã Hoài Châu Bắc	Hoai Chau Bac Commune	hoai_chau_bac	543	10
21649	Hoài Châu	Hoai Chau	Xã Hoài Châu	Hoai Chau Commune	hoai_chau	543	10
21652	Hoài Phú	Hoai Phu	Xã Hoài Phú	Hoai Phu Commune	hoai_phu	543	10
21655	Tam Quan Bắc	Tam Quan Bac	Phường Tam Quan Bắc	Tam Quan Bac Ward	tam_quan_bac	543	8
21658	Tam Quan Nam	Tam Quan Nam	Phường Tam Quan Nam	Tam Quan Nam Ward	tam_quan_nam	543	8
21661	Hoài Hảo	Hoai Hao	Phường Hoài Hảo	Hoai Hao Ward	hoai_hao	543	8
21664	Hoài Thanh Tây	Hoai Thanh Tay	Phường Hoài Thanh Tây	Hoai Thanh Tay Ward	hoai_thanh_tay	543	8
21667	Hoài Thanh	Hoai Thanh	Phường Hoài Thanh	Hoai Thanh Ward	hoai_thanh	543	8
21670	Hoài Hương	Hoai Huong	Phường Hoài Hương	Hoai Huong Ward	hoai_huong	543	8
21673	Hoài Tân	Hoai Tan	Phường Hoài Tân	Hoai Tan Ward	hoai_tan	543	8
21676	Hoài Hải	Hoai Hai	Xã Hoài Hải	Hoai Hai Commune	hoai_hai	543	10
21679	Hoài Xuân	Hoai Xuan	Phường Hoài Xuân	Hoai Xuan Ward	hoai_xuan	543	8
21682	Hoài Mỹ	Hoai My	Xã Hoài Mỹ	Hoai My Commune	hoai_my	543	10
21685	Hoài Đức	Hoai Duc	Phường Hoài Đức	Hoai Duc Ward	hoai_duc	543	8
21688	Tăng Bạt Hổ	Tang Bat Ho	Thị trấn Tăng Bạt Hổ	Tang Bat Ho Township	tang_bat_ho	544	9
21690	Ân Hảo Tây	An Hao Tay	Xã Ân Hảo Tây	An Hao Tay Commune	an_hao_tay	544	10
21691	Ân Hảo Đông	An Hao Dong	Xã Ân Hảo Đông	An Hao Dong Commune	an_hao_dong	544	10
21694	Ân Sơn	An Son	Xã Ân Sơn	An Son Commune	an_son	544	10
21697	Ân Mỹ	An My	Xã Ân Mỹ	An My Commune	an_my	544	10
21700	Đak Mang	Dak Mang	Xã Đak Mang	Dak Mang Commune	dak_mang	544	10
21703	Ân Tín	An Tin	Xã Ân Tín	An Tin Commune	an_tin	544	10
21706	Ân Thạnh	An Thanh	Xã Ân Thạnh	An Thanh Commune	an_thanh	544	10
21709	Ân Phong	An Phong	Xã Ân Phong	An Phong Commune	an_phong	544	10
21712	Ân Đức	An Duc	Xã Ân Đức	An Duc Commune	an_duc	544	10
21715	Ân Hữu	An Huu	Xã Ân Hữu	An Huu Commune	an_huu	544	10
21718	Bok Tới	Bok Toi	Xã Bok Tới	Bok Toi Commune	bok_toi	544	10
21721	Ân Tường Tây	An Tuong Tay	Xã Ân Tường Tây	An Tuong Tay Commune	an_tuong_tay	544	10
27307	03	03	Phường 03	03 Ward	03	774	8
21724	Ân Tường Đông	An Tuong Dong	Xã Ân Tường Đông	An Tuong Dong Commune	an_tuong_dong	544	10
21727	Ân Nghĩa	An Nghia	Xã Ân Nghĩa	An Nghia Commune	an_nghia	544	10
21730	Phù Mỹ	Phu My	Thị trấn Phù Mỹ	Phu My Township	phu_my	545	9
21733	Bình Dương	Binh Duong	Thị trấn Bình Dương	Binh Duong Township	binh_duong	545	9
21736	Mỹ Đức	My Duc	Xã Mỹ Đức	My Duc Commune	my_duc	545	10
21739	Mỹ Châu	My Chau	Xã Mỹ Châu	My Chau Commune	my_chau	545	10
21742	Mỹ Thắng	My Thang	Xã Mỹ Thắng	My Thang Commune	my_thang	545	10
21745	Mỹ Lộc	My Loc	Xã Mỹ Lộc	My Loc Commune	my_loc	545	10
21748	Mỹ Lợi	My Loi	Xã Mỹ Lợi	My Loi Commune	my_loi	545	10
21751	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	545	10
21754	Mỹ Phong	My Phong	Xã Mỹ Phong	My Phong Commune	my_phong	545	10
21757	Mỹ Trinh	My Trinh	Xã Mỹ Trinh	My Trinh Commune	my_trinh	545	10
21760	Mỹ Thọ	My Tho	Xã Mỹ Thọ	My Tho Commune	my_tho	545	10
21763	Mỹ Hòa	My Hoa	Xã Mỹ Hòa	My Hoa Commune	my_hoa	545	10
21766	Mỹ Thành	My Thanh	Xã Mỹ Thành	My Thanh Commune	my_thanh	545	10
21769	Mỹ Chánh	My Chanh	Xã Mỹ Chánh	My Chanh Commune	my_chanh	545	10
21772	Mỹ Quang	My Quang	Xã Mỹ Quang	My Quang Commune	my_quang	545	10
21775	Mỹ Hiệp	My Hiep	Xã Mỹ Hiệp	My Hiep Commune	my_hiep	545	10
21778	Mỹ Tài	My Tai	Xã Mỹ Tài	My Tai Commune	my_tai	545	10
21781	Mỹ Cát	My Cat	Xã Mỹ Cát	My Cat Commune	my_cat	545	10
21784	Mỹ Chánh Tây	My Chanh Tay	Xã Mỹ Chánh Tây	My Chanh Tay Commune	my_chanh_tay	545	10
21786	Vĩnh Thạnh	Vinh Thanh	Thị trấn Vĩnh Thạnh	Vinh Thanh Township	vinh_thanh	546	9
21787	Vĩnh Sơn	Vinh Son	Xã Vĩnh Sơn	Vinh Son Commune	vinh_son	546	10
21790	Vĩnh Kim	Vinh Kim	Xã Vĩnh Kim	Vinh Kim Commune	vinh_kim	546	10
21796	Vĩnh Hiệp	Vinh Hiep	Xã Vĩnh Hiệp	Vinh Hiep Commune	vinh_hiep	546	10
21799	Vĩnh Hảo	Vinh Hao	Xã Vĩnh Hảo	Vinh Hao Commune	vinh_hao	546	10
21801	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	546	10
21802	Vĩnh Thịnh	Vinh Thinh	Xã Vĩnh Thịnh	Vinh Thinh Commune	vinh_thinh	546	10
21804	Vĩnh Thuận	Vinh Thuan	Xã Vĩnh Thuận	Vinh Thuan Commune	vinh_thuan	546	10
21805	Vĩnh Quang	Vinh Quang	Xã Vĩnh Quang	Vinh Quang Commune	vinh_quang	546	10
21808	Phú Phong	Phu Phong	Thị trấn Phú Phong	Phu Phong Township	phu_phong	547	9
21811	Bình Tân	Binh Tan	Xã Bình Tân	Binh Tan Commune	binh_tan	547	10
21814	Tây Thuận	Tay Thuan	Xã Tây Thuận	Tay Thuan Commune	tay_thuan	547	10
21817	Bình Thuận	Binh Thuan	Xã Bình Thuận	Binh Thuan Commune	binh_thuan	547	10
21820	Tây Giang	Tay Giang	Xã Tây Giang	Tay Giang Commune	tay_giang	547	10
21823	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	547	10
21826	Tây An	Tay An	Xã Tây An	Tay An Commune	tay_an	547	10
21829	Bình Hòa	Binh Hoa	Xã Bình Hòa	Binh Hoa Commune	binh_hoa	547	10
21832	Tây Bình	Tay Binh	Xã Tây Bình	Tay Binh Commune	tay_binh	547	10
21835	Bình Tường	Binh Tuong	Xã Bình Tường	Binh Tuong Commune	binh_tuong	547	10
21838	Tây Vinh	Tay Vinh	Xã Tây Vinh	Tay Vinh Commune	tay_vinh	547	10
21841	Vĩnh An	Vinh An	Xã Vĩnh An	Vinh An Commune	vinh_an	547	10
21844	Tây Xuân	Tay Xuan	Xã Tây Xuân	Tay Xuan Commune	tay_xuan	547	10
21847	Bình Nghi	Binh Nghi	Xã Bình Nghi	Binh Nghi Commune	binh_nghi	547	10
21850	Tây Phú	Tay Phu	Xã Tây Phú	Tay Phu Commune	tay_phu	547	10
21853	Ngô Mây	Ngo May	Thị trấn Ngô Mây	Ngo May Township	ngo_may	548	9
21856	Cát Sơn	Cat Son	Xã Cát Sơn	Cat Son Commune	cat_son	548	10
21859	Cát Minh	Cat Minh	Xã Cát Minh	Cat Minh Commune	cat_minh	548	10
21862	Cát Khánh	Cat Khanh	Xã Cát Khánh	Cat Khanh Commune	cat_khanh	548	10
21865	Cát Tài	Cat Tai	Xã Cát Tài	Cat Tai Commune	cat_tai	548	10
21868	Cát Lâm	Cat Lam	Xã Cát Lâm	Cat Lam Commune	cat_lam	548	10
21871	Cát Hanh	Cat Hanh	Xã Cát Hanh	Cat Hanh Commune	cat_hanh	548	10
21874	Cát Thành	Cat Thanh	Xã Cát Thành	Cat Thanh Commune	cat_thanh	548	10
21877	Cát Trinh	Cat Trinh	Xã Cát Trinh	Cat Trinh Commune	cat_trinh	548	10
21880	Cát Hải	Cat Hai	Xã Cát Hải	Cat Hai Commune	cat_hai	548	10
21883	Cát Hiệp	Cat Hiep	Xã Cát Hiệp	Cat Hiep Commune	cat_hiep	548	10
21886	Cát Nhơn	Cat Nhon	Xã Cát Nhơn	Cat Nhon Commune	cat_nhon	548	10
21889	Cát Hưng	Cat Hung	Xã Cát Hưng	Cat Hung Commune	cat_hung	548	10
21892	Cát Tường	Cat Tuong	Xã Cát Tường	Cat Tuong Commune	cat_tuong	548	10
21895	Cát Tân	Cat Tan	Xã Cát Tân	Cat Tan Commune	cat_tan	548	10
21898	Cát Tiến	Cat Tien	Thị trấn Cát Tiến	Cat Tien Township	cat_tien	548	9
21901	Cát Thắng	Cat Thang	Xã Cát Thắng	Cat Thang Commune	cat_thang	548	10
21904	Cát Chánh	Cat Chanh	Xã Cát Chánh	Cat Chanh Commune	cat_chanh	548	10
21907	Bình Định	Binh Dinh	Phường Bình Định	Binh Dinh Ward	binh_dinh	549	8
21910	Đập Đá	Dap Da	Phường Đập Đá	Dap Da Ward	dap_da	549	8
21913	Nhơn Mỹ	Nhon My	Xã Nhơn Mỹ	Nhon My Commune	nhon_my	549	10
21916	Nhơn Thành	Nhon Thanh	Phường Nhơn Thành	Nhon Thanh Ward	nhon_thanh	549	8
21919	Nhơn Hạnh	Nhon Hanh	Xã Nhơn Hạnh	Nhon Hanh Commune	nhon_hanh	549	10
21922	Nhơn Hậu	Nhon Hau	Xã Nhơn Hậu	Nhon Hau Commune	nhon_hau	549	10
21925	Nhơn Phong	Nhon Phong	Xã Nhơn Phong	Nhon Phong Commune	nhon_phong	549	10
21928	Nhơn An	Nhon An	Xã Nhơn An	Nhon An Commune	nhon_an	549	10
21931	Nhơn Phúc	Nhon Phuc	Xã Nhơn Phúc	Nhon Phuc Commune	nhon_phuc	549	10
21934	Nhơn Hưng	Nhon Hung	Phường Nhơn Hưng	Nhon Hung Ward	nhon_hung	549	8
21937	Nhơn Khánh	Nhon Khanh	Xã Nhơn Khánh	Nhon Khanh Commune	nhon_khanh	549	10
21940	Nhơn Lộc	Nhon Loc	Xã Nhơn Lộc	Nhon Loc Commune	nhon_loc	549	10
21943	Nhơn Hoà	Nhon Hoa	Phường Nhơn Hoà	Nhon Hoa Ward	nhon_hoa	549	8
21946	Nhơn Tân	Nhon Tan	Xã Nhơn Tân	Nhon Tan Commune	nhon_tan	549	10
21949	Nhơn Thọ	Nhon Tho	Xã Nhơn Thọ	Nhon Tho Commune	nhon_tho	549	10
21952	Tuy Phước	Tuy Phuoc	Thị trấn Tuy Phước	Tuy Phuoc Township	tuy_phuoc	550	9
21955	Diêu Trì	Dieu Tri	Thị trấn Diêu Trì	Dieu Tri Township	dieu_tri	550	9
21958	Phước Thắng	Phuoc Thang	Xã Phước Thắng	Phuoc Thang Commune	phuoc_thang	550	10
21961	Phước Hưng	Phuoc Hung	Xã Phước Hưng	Phuoc Hung Commune	phuoc_hung	550	10
21964	Phước Quang	Phuoc Quang	Xã Phước Quang	Phuoc Quang Commune	phuoc_quang	550	10
21967	Phước Hòa	Phuoc Hoa	Xã Phước Hòa	Phuoc Hoa Commune	phuoc_hoa	550	10
21970	Phước Sơn	Phuoc Son	Xã Phước Sơn	Phuoc Son Commune	phuoc_son	550	10
21973	Phước Hiệp	Phuoc Hiep	Xã Phước Hiệp	Phuoc Hiep Commune	phuoc_hiep	550	10
21976	Phước Lộc	Phuoc Loc	Xã Phước Lộc	Phuoc Loc Commune	phuoc_loc	550	10
21979	Phước Nghĩa	Phuoc Nghia	Xã Phước Nghĩa	Phuoc Nghia Commune	phuoc_nghia	550	10
21982	Phước Thuận	Phuoc Thuan	Xã Phước Thuận	Phuoc Thuan Commune	phuoc_thuan	550	10
21985	Phước An	Phuoc An	Xã Phước An	Phuoc An Commune	phuoc_an	550	10
21988	Phước Thành	Phuoc Thanh	Xã Phước Thành	Phuoc Thanh Commune	phuoc_thanh	550	10
21994	Vân Canh	Van Canh	Thị trấn Vân Canh	Van Canh Township	van_canh	551	9
21997	Canh Liên	Canh Lien	Xã Canh Liên	Canh Lien Commune	canh_lien	551	10
22000	Canh Hiệp	Canh Hiep	Xã Canh Hiệp	Canh Hiep Commune	canh_hiep	551	10
22003	Canh Vinh	Canh Vinh	Xã Canh Vinh	Canh Vinh Commune	canh_vinh	551	10
22006	Canh Hiển	Canh Hien	Xã Canh Hiển	Canh Hien Commune	canh_hien	551	10
22009	Canh Thuận	Canh Thuan	Xã Canh Thuận	Canh Thuan Commune	canh_thuan	551	10
22012	Canh Hòa	Canh Hoa	Xã Canh Hòa	Canh Hoa Commune	canh_hoa	551	10
22015	1	1	Phường 1	1 Ward	1	555	8
22018	8	8	Phường 8	8 Ward	8	555	8
22021	2	2	Phường 2	2 Ward	2	555	8
22024	9	9	Phường 9	9 Ward	9	555	8
22027	3	3	Phường 3	3 Ward	3	555	8
22030	4	4	Phường 4	4 Ward	4	555	8
22033	5	5	Phường 5	5 Ward	5	555	8
22036	7	7	Phường 7	7 Ward	7	555	8
22039	6	6	Phường 6	6 Ward	6	555	8
22040	Phú Thạnh	Phu Thanh	Phường Phú Thạnh	Phu Thanh Ward	phu_thanh	555	8
22041	Phú Đông	Phu Dong	Phường Phú Đông	Phu Dong Ward	phu_dong	555	8
22042	Hòa Kiến	Hoa Kien	Xã Hòa Kiến	Hoa Kien Commune	hoa_kien	555	10
22045	Bình Kiến	Binh Kien	Xã Bình Kiến	Binh Kien Commune	binh_kien	555	10
22048	Bình Ngọc	Binh Ngoc	Xã Bình Ngọc	Binh Ngoc Commune	binh_ngoc	555	10
22162	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	555	10
22240	Phú Lâm	Phu Lam	Phường Phú Lâm	Phu Lam Ward	phu_lam	555	8
22051	Xuân Phú	Xuan Phu	Phường Xuân Phú	Xuan Phu Ward	xuan_phu	557	8
22052	Xuân Lâm	Xuan Lam	Xã Xuân Lâm	Xuan Lam Commune	xuan_lam	557	10
22053	Xuân Thành	Xuan Thanh	Phường Xuân Thành	Xuan Thanh Ward	xuan_thanh	557	8
22054	Xuân Hải	Xuan Hai	Xã Xuân Hải	Xuan Hai Commune	xuan_hai	557	10
22057	Xuân Lộc	Xuan Loc	Xã Xuân Lộc	Xuan Loc Commune	xuan_loc	557	10
22060	Xuân Bình	Xuan Binh	Xã Xuân Bình	Xuan Binh Commune	xuan_binh	557	10
22066	Xuân Cảnh	Xuan Canh	Xã Xuân Cảnh	Xuan Canh Commune	xuan_canh	557	10
22069	Xuân Thịnh	Xuan Thinh	Xã Xuân Thịnh	Xuan Thinh Commune	xuan_thinh	557	10
22072	Xuân Phương	Xuan Phuong	Xã Xuân Phương	Xuan Phuong Commune	xuan_phuong	557	10
22073	Xuân Yên	Xuan Yen	Phường Xuân Yên	Xuan Yen Ward	xuan_yen	557	8
22075	Xuân Thọ 1	Xuan Tho 1	Xã Xuân Thọ 1	Xuan Tho 1 Commune	xuan_tho_1	557	10
22076	Xuân Đài	Xuan Dai	Phường Xuân Đài	Xuan Dai Ward	xuan_dai	557	8
22078	Xuân Thọ 2	Xuan Tho 2	Xã Xuân Thọ 2	Xuan Tho 2 Commune	xuan_tho_2	557	10
22081	La Hai	La Hai	Thị trấn La Hai	La Hai Township	la_hai	558	9
22084	Đa Lộc	Da Loc	Xã Đa Lộc	Da Loc Commune	da_loc	558	10
22087	Phú Mỡ	Phu Mo	Xã Phú Mỡ	Phu Mo Commune	phu_mo	558	10
22090	Xuân Lãnh	Xuan Lanh	Xã Xuân Lãnh	Xuan Lanh Commune	xuan_lanh	558	10
22093	Xuân Long	Xuan Long	Xã Xuân Long	Xuan Long Commune	xuan_long	558	10
22096	Xuân Quang 1	Xuan Quang 1	Xã Xuân Quang 1	Xuan Quang 1 Commune	xuan_quang_1	558	10
22099	Xuân Sơn Bắc	Xuan Son Bac	Xã Xuân Sơn Bắc	Xuan Son Bac Commune	xuan_son_bac	558	10
22102	Xuân Quang 2	Xuan Quang 2	Xã Xuân Quang 2	Xuan Quang 2 Commune	xuan_quang_2	558	10
22105	Xuân Sơn Nam	Xuan Son Nam	Xã Xuân Sơn Nam	Xuan Son Nam Commune	xuan_son_nam	558	10
22108	Xuân Quang 3	Xuan Quang 3	Xã Xuân Quang 3	Xuan Quang 3 Commune	xuan_quang_3	558	10
22111	Xuân Phước	Xuan Phuoc	Xã Xuân Phước	Xuan Phuoc Commune	xuan_phuoc	558	10
22114	Chí Thạnh	Chi Thanh	Thị trấn Chí Thạnh	Chi Thanh Township	chi_thanh	559	9
22117	An Dân	An Dan	Xã An Dân	An Dan Commune	an_dan	559	10
22120	An Ninh Tây	An Ninh Tay	Xã An Ninh Tây	An Ninh Tay Commune	an_ninh_tay	559	10
22123	An Ninh Đông	An Ninh Dong	Xã An Ninh Đông	An Ninh Dong Commune	an_ninh_dong	559	10
22126	An Thạch	An Thach	Xã An Thạch	An Thach Commune	an_thach	559	10
22129	An Định	An Dinh	Xã An Định	An Dinh Commune	an_dinh	559	10
22132	An Nghiệp	An Nghiep	Xã An Nghiệp	An Nghiep Commune	an_nghiep	559	10
22138	An Cư	An Cu	Xã An Cư	An Cu Commune	an_cu	559	10
22141	An Xuân	An Xuan	Xã An Xuân	An Xuan Commune	an_xuan	559	10
22144	An Lĩnh	An Linh	Xã An Lĩnh	An Linh Commune	an_linh	559	10
22147	An Hòa Hải	An Hoa Hai	Xã An Hòa Hải	An Hoa Hai Commune	an_hoa_hai	559	10
22150	An Hiệp	An Hiep	Xã An Hiệp	An Hiep Commune	an_hiep	559	10
22153	An Mỹ	An My	Xã An Mỹ	An My Commune	an_my	559	10
22156	An Chấn	An Chan	Xã An Chấn	An Chan Commune	an_chan	559	10
22159	An Thọ	An Tho	Xã An Thọ	An Tho Commune	an_tho	559	10
22165	Củng Sơn	Cung Son	Thị trấn Củng Sơn	Cung Son Township	cung_son	560	9
22168	Phước Tân	Phuoc Tan	Xã Phước Tân	Phuoc Tan Commune	phuoc_tan	560	10
22171	Sơn Hội	Son Hoi	Xã Sơn Hội	Son Hoi Commune	son_hoi	560	10
22174	Sơn Định	Son Dinh	Xã Sơn Định	Son Dinh Commune	son_dinh	560	10
22177	Sơn Long	Son Long	Xã Sơn Long	Son Long Commune	son_long	560	10
22180	Cà Lúi	Ca Lui	Xã Cà Lúi	Ca Lui Commune	ca_lui	560	10
22183	Sơn Phước	Son Phuoc	Xã Sơn Phước	Son Phuoc Commune	son_phuoc	560	10
22186	Sơn Xuân	Son Xuan	Xã Sơn Xuân	Son Xuan Commune	son_xuan	560	10
22189	Sơn Nguyên	Son Nguyen	Xã Sơn Nguyên	Son Nguyen Commune	son_nguyen	560	10
22192	Eachà Rang	Eacha Rang	Xã Eachà Rang	Eacha Rang Commune	eacha_rang	560	10
22195	Krông Pa	Krong Pa	Xã Krông Pa	Krong Pa Commune	krong_pa	560	10
22198	Suối Bạc	Suoi Bac	Xã Suối Bạc	Suoi Bac Commune	suoi_bac	560	10
22201	Sơn Hà	Son Ha	Xã Sơn Hà	Son Ha Commune	son_ha	560	10
22204	Suối Trai	Suoi Trai	Xã Suối Trai	Suoi Trai Commune	suoi_trai	560	10
22207	Hai Riêng	Hai Rieng	Thị trấn Hai Riêng	Hai Rieng Township	hai_rieng	561	9
22210	Ea Lâm	Ea Lam	Xã Ea Lâm	Ea Lam Commune	ea_lam	561	10
22213	Đức Bình Tây	Duc Binh Tay	Xã Đức Bình Tây	Duc Binh Tay Commune	duc_binh_tay	561	10
22216	Ea Bá	Ea Ba	Xã Ea Bá	Ea Ba Commune	ea_ba	561	10
22219	Sơn Giang	Son Giang	Xã Sơn Giang	Son Giang Commune	son_giang	561	10
22222	Đức Bình Đông	Duc Binh Dong	Xã Đức Bình Đông	Duc Binh Dong Commune	duc_binh_dong	561	10
22225	EaBar	EaBar	Xã EaBar	EaBar Commune	eabar	561	10
22228	EaBia	EaBia	Xã EaBia	EaBia Commune	eabia	561	10
22231	EaTrol	EaTrol	Xã EaTrol	EaTrol Commune	eatrol	561	10
22234	Sông Hinh	Song Hinh	Xã Sông Hinh	Song Hinh Commune	song_hinh	561	10
22237	Ealy	Ealy	Xã Ealy	Ealy Commune	ealy	561	10
22249	Sơn Thành Tây	Son Thanh Tay	Xã Sơn Thành Tây	Son Thanh Tay Commune	son_thanh_tay	562	10
22250	Sơn Thành Đông	Son Thanh Dong	Xã Sơn Thành Đông	Son Thanh Dong Commune	son_thanh_dong	562	10
22252	Hòa Bình 1	Hoa Binh 1	Xã Hòa Bình 1	Hoa Binh 1 Commune	hoa_binh_1	562	10
22255	Phú Thứ	Phu Thu	Thị trấn Phú Thứ	Phu Thu Township	phu_thu	562	9
22264	Hòa Phong	Hoa Phong	Xã Hòa Phong	Hoa Phong Commune	hoa_phong	562	10
22270	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	562	10
22273	Hòa Tân Tây	Hoa Tan Tay	Xã Hòa Tân Tây	Hoa Tan Tay Commune	hoa_tan_tay	562	10
22276	Hòa Đồng	Hoa Dong	Xã Hòa Đồng	Hoa Dong Commune	hoa_dong	562	10
22285	Hòa Mỹ Đông	Hoa My Dong	Xã Hòa Mỹ Đông	Hoa My Dong Commune	hoa_my_dong	562	10
22288	Hòa Mỹ Tây	Hoa My Tay	Xã Hòa Mỹ Tây	Hoa My Tay Commune	hoa_my_tay	562	10
22294	Hòa Thịnh	Hoa Thinh	Xã Hòa Thịnh	Hoa Thinh Commune	hoa_thinh	562	10
22303	Hòa Quang Bắc	Hoa Quang Bac	Xã Hòa Quang Bắc	Hoa Quang Bac Commune	hoa_quang_bac	563	10
22306	Hòa Quang Nam	Hoa Quang Nam	Xã Hòa Quang Nam	Hoa Quang Nam Commune	hoa_quang_nam	563	10
22309	Hòa Hội	Hoa Hoi	Xã Hòa Hội	Hoa Hoi Commune	hoa_hoi	563	10
22312	Hòa Trị	Hoa Tri	Xã Hòa Trị	Hoa Tri Commune	hoa_tri	563	10
22315	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	563	10
22318	Hòa Định Đông	Hoa Dinh Dong	Xã Hòa Định Đông	Hoa Dinh Dong Commune	hoa_dinh_dong	563	10
22319	Phú Hoà	Phu Hoa	Thị trấn Phú Hoà	Phu Hoa Township	phu_hoa	563	9
22321	Hòa Định Tây	Hoa Dinh Tay	Xã Hòa Định Tây	Hoa Dinh Tay Commune	hoa_dinh_tay	563	10
22324	Hòa Thắng	Hoa Thang	Xã Hòa Thắng	Hoa Thang Commune	hoa_thang	563	10
22243	Hòa Thành	Hoa Thanh	Xã Hòa Thành	Hoa Thanh Commune	hoa_thanh	564	10
22246	Hòa Hiệp Bắc	Hoa Hiep Bac	Phường Hòa Hiệp Bắc	Hoa Hiep Bac Ward	hoa_hiep_bac	564	8
22258	Hoà Vinh	Hoa Vinh	Phường Hoà Vinh	Hoa Vinh Ward	hoa_vinh	564	8
22261	Hoà Hiệp Trung	Hoa Hiep Trung	Phường Hoà Hiệp Trung	Hoa Hiep Trung Ward	hoa_hiep_trung	564	8
22267	Hòa Tân Đông	Hoa Tan Dong	Xã Hòa Tân Đông	Hoa Tan Dong Commune	hoa_tan_dong	564	10
22279	Hòa Xuân Tây	Hoa Xuan Tay	Phường Hòa Xuân Tây	Hoa Xuan Tay Ward	hoa_xuan_tay	564	8
22282	Hòa Hiệp Nam	Hoa Hiep Nam	Phường Hòa Hiệp Nam	Hoa Hiep Nam Ward	hoa_hiep_nam	564	8
22291	Hòa Xuân Đông	Hoa Xuan Dong	Xã Hòa Xuân Đông	Hoa Xuan Dong Commune	hoa_xuan_dong	564	10
22297	Hòa Tâm	Hoa Tam	Xã Hòa Tâm	Hoa Tam Commune	hoa_tam	564	10
22300	Hòa Xuân Nam	Hoa Xuan Nam	Xã Hòa Xuân Nam	Hoa Xuan Nam Commune	hoa_xuan_nam	564	10
22327	Vĩnh Hòa	Vinh Hoa	Phường Vĩnh Hòa	Vinh Hoa Ward	vinh_hoa	568	8
22330	Vĩnh Hải	Vinh Hai	Phường Vĩnh Hải	Vinh Hai Ward	vinh_hai	568	8
22333	Vĩnh Phước	Vinh Phuoc	Phường Vĩnh Phước	Vinh Phuoc Ward	vinh_phuoc	568	8
22336	Ngọc Hiệp	Ngoc Hiep	Phường Ngọc Hiệp	Ngoc Hiep Ward	ngoc_hiep	568	8
22339	Vĩnh Thọ	Vinh Tho	Phường Vĩnh Thọ	Vinh Tho Ward	vinh_tho	568	8
22342	Xương Huân	Xuong Huan	Phường Xương Huân	Xuong Huan Ward	xuong_huan	568	8
22345	Vạn Thắng	Van Thang	Phường Vạn Thắng	Van Thang Ward	van_thang	568	8
22348	Vạn Thạnh	Van Thanh	Phường Vạn Thạnh	Van Thanh Ward	van_thanh	568	8
22351	Phương Sài	Phuong Sai	Phường Phương Sài	Phuong Sai Ward	phuong_sai	568	8
22354	Phương Sơn	Phuong Son	Phường Phương Sơn	Phuong Son Ward	phuong_son	568	8
22357	Phước Hải	Phuoc Hai	Phường Phước Hải	Phuoc Hai Ward	phuoc_hai	568	8
22360	Phước Tân	Phuoc Tan	Phường Phước Tân	Phuoc Tan Ward	phuoc_tan	568	8
22363	Lộc Thọ	Loc Tho	Phường Lộc Thọ	Loc Tho Ward	loc_tho	568	8
22366	Phước Tiến	Phuoc Tien	Phường Phước Tiến	Phuoc Tien Ward	phuoc_tien	568	8
22369	Tân Lập	Tan Lap	Phường Tân Lập	Tan Lap Ward	tan_lap	568	8
22372	Phước Hòa	Phuoc Hoa	Phường Phước Hòa	Phuoc Hoa Ward	phuoc_hoa	568	8
22375	Vĩnh Nguyên	Vinh Nguyen	Phường Vĩnh Nguyên	Vinh Nguyen Ward	vinh_nguyen	568	8
22378	Phước Long	Phuoc Long	Phường Phước Long	Phuoc Long Ward	phuoc_long	568	8
22381	Vĩnh Trường	Vinh Truong	Phường Vĩnh Trường	Vinh Truong Ward	vinh_truong	568	8
22384	Vĩnh Lương	Vinh Luong	Xã Vĩnh Lương	Vinh Luong Commune	vinh_luong	568	10
22387	Vĩnh Phương	Vinh Phuong	Xã Vĩnh Phương	Vinh Phuong Commune	vinh_phuong	568	10
22390	Vĩnh Ngọc	Vinh Ngoc	Xã Vĩnh Ngọc	Vinh Ngoc Commune	vinh_ngoc	568	10
22393	Vĩnh Thạnh	Vinh Thanh	Xã Vĩnh Thạnh	Vinh Thanh Commune	vinh_thanh	568	10
22396	Vĩnh Trung	Vinh Trung	Xã Vĩnh Trung	Vinh Trung Commune	vinh_trung	568	10
22399	Vĩnh Hiệp	Vinh Hiep	Xã Vĩnh Hiệp	Vinh Hiep Commune	vinh_hiep	568	10
22402	Vĩnh Thái	Vinh Thai	Xã Vĩnh Thái	Vinh Thai Commune	vinh_thai	568	10
22405	Phước Đồng	Phuoc Dong	Xã Phước Đồng	Phuoc Dong Commune	phuoc_dong	568	10
22408	Cam Nghĩa	Cam Nghia	Phường Cam Nghĩa	Cam Nghia Ward	cam_nghia	569	8
22411	Cam Phúc Bắc	Cam Phuc Bac	Phường Cam Phúc Bắc	Cam Phuc Bac Ward	cam_phuc_bac	569	8
22414	Cam Phúc Nam	Cam Phuc Nam	Phường Cam Phúc Nam	Cam Phuc Nam Ward	cam_phuc_nam	569	8
22417	Cam Lộc	Cam Loc	Phường Cam Lộc	Cam Loc Ward	cam_loc	569	8
22420	Cam Phú	Cam Phu	Phường Cam Phú	Cam Phu Ward	cam_phu	569	8
22423	Ba Ngòi	Ba Ngoi	Phường Ba Ngòi	Ba Ngoi Ward	ba_ngoi	569	8
22426	Cam Thuận	Cam Thuan	Phường Cam Thuận	Cam Thuan Ward	cam_thuan	569	8
22429	Cam Lợi	Cam Loi	Phường Cam Lợi	Cam Loi Ward	cam_loi	569	8
22432	Cam Linh	Cam Linh	Phường Cam Linh	Cam Linh Ward	cam_linh	569	8
22468	Cam Thành Nam	Cam Thanh Nam	Xã Cam Thành Nam	Cam Thanh Nam Commune	cam_thanh_nam	569	10
22474	Cam Phước Đông	Cam Phuoc Dong	Xã Cam Phước Đông	Cam Phuoc Dong Commune	cam_phuoc_dong	569	10
22477	Cam Thịnh Tây	Cam Thinh Tay	Xã Cam Thịnh Tây	Cam Thinh Tay Commune	cam_thinh_tay	569	10
22480	Cam Thịnh Đông	Cam Thinh Dong	Xã Cam Thịnh Đông	Cam Thinh Dong Commune	cam_thinh_dong	569	10
22483	Cam Lập	Cam Lap	Xã Cam Lập	Cam Lap Commune	cam_lap	569	10
22486	Cam Bình	Cam Binh	Xã Cam Bình	Cam Binh Commune	cam_binh	569	10
22435	Cam Tân	Cam Tan	Xã Cam Tân	Cam Tan Commune	cam_tan	570	10
22438	Cam Hòa	Cam Hoa	Xã Cam Hòa	Cam Hoa Commune	cam_hoa	570	10
22441	Cam Hải Đông	Cam Hai Dong	Xã Cam Hải Đông	Cam Hai Dong Commune	cam_hai_dong	570	10
22444	Cam Hải Tây	Cam Hai Tay	Xã Cam Hải Tây	Cam Hai Tay Commune	cam_hai_tay	570	10
22447	Sơn Tân	Son Tan	Xã Sơn Tân	Son Tan Commune	son_tan	570	10
22450	Cam Hiệp Bắc	Cam Hiep Bac	Xã Cam Hiệp Bắc	Cam Hiep Bac Commune	cam_hiep_bac	570	10
22453	Cam Đức	Cam Duc	Thị trấn Cam Đức	Cam Duc Township	cam_duc	570	9
22456	Cam Hiệp Nam	Cam Hiep Nam	Xã Cam Hiệp Nam	Cam Hiep Nam Commune	cam_hiep_nam	570	10
22459	Cam Phước Tây	Cam Phuoc Tay	Xã Cam Phước Tây	Cam Phuoc Tay Commune	cam_phuoc_tay	570	10
22462	Cam Thành Bắc	Cam Thanh Bac	Xã Cam Thành Bắc	Cam Thanh Bac Commune	cam_thanh_bac	570	10
22465	Cam An Bắc	Cam An Bac	Xã Cam An Bắc	Cam An Bac Commune	cam_an_bac	570	10
22471	Cam An Nam	Cam An Nam	Xã Cam An Nam	Cam An Nam Commune	cam_an_nam	570	10
22708	Suối Cát	Suoi Cat	Xã Suối Cát	Suoi Cat Commune	suoi_cat	570	10
22711	Suối Tân	Suoi Tan	Xã Suối Tân	Suoi Tan Commune	suoi_tan	570	10
22489	Vạn Giã	Van Gia	Thị trấn Vạn Giã	Van Gia Township	van_gia	571	9
22492	Đại Lãnh	Dai Lanh	Xã Đại Lãnh	Dai Lanh Commune	dai_lanh	571	10
22495	Vạn Phước	Van Phuoc	Xã Vạn Phước	Van Phuoc Commune	van_phuoc	571	10
22498	Vạn Long	Van Long	Xã Vạn Long	Van Long Commune	van_long	571	10
22501	Vạn Bình	Van Binh	Xã Vạn Bình	Van Binh Commune	van_binh	571	10
22504	Vạn Thọ	Van Tho	Xã Vạn Thọ	Van Tho Commune	van_tho	571	10
22507	Vạn Khánh	Van Khanh	Xã Vạn Khánh	Van Khanh Commune	van_khanh	571	10
22510	Vạn Phú	Van Phu	Xã Vạn Phú	Van Phu Commune	van_phu	571	10
22513	Vạn Lương	Van Luong	Xã Vạn Lương	Van Luong Commune	van_luong	571	10
22516	Vạn Thắng	Van Thang	Xã Vạn Thắng	Van Thang Commune	van_thang	571	10
22519	Vạn Thạnh	Van Thanh	Xã Vạn Thạnh	Van Thanh Commune	van_thanh	571	10
22522	Xuân Sơn	Xuan Son	Xã Xuân Sơn	Xuan Son Commune	xuan_son	571	10
22525	Vạn Hưng	Van Hung	Xã Vạn Hưng	Van Hung Commune	van_hung	571	10
22528	Ninh Hiệp	Ninh Hiep	Phường Ninh Hiệp	Ninh Hiep Ward	ninh_hiep	572	8
22531	Ninh Sơn	Ninh Son	Xã Ninh Sơn	Ninh Son Commune	ninh_son	572	10
22534	Ninh Tây	Ninh Tay	Xã Ninh Tây	Ninh Tay Commune	ninh_tay	572	10
22537	Ninh Thượng	Ninh Thuong	Xã Ninh Thượng	Ninh Thuong Commune	ninh_thuong	572	10
22540	Ninh An	Ninh An	Xã Ninh An	Ninh An Commune	ninh_an	572	10
22543	Ninh Hải	Ninh Hai	Phường Ninh Hải	Ninh Hai Ward	ninh_hai	572	8
22546	Ninh Thọ	Ninh Tho	Xã Ninh Thọ	Ninh Tho Commune	ninh_tho	572	10
22549	Ninh Trung	Ninh Trung	Xã Ninh Trung	Ninh Trung Commune	ninh_trung	572	10
22552	Ninh Sim	Ninh Sim	Xã Ninh Sim	Ninh Sim Commune	ninh_sim	572	10
22555	Ninh Xuân	Ninh Xuan	Xã Ninh Xuân	Ninh Xuan Commune	ninh_xuan	572	10
22558	Ninh Thân	Ninh Than	Xã Ninh Thân	Ninh Than Commune	ninh_than	572	10
22561	Ninh Diêm	Ninh Diem	Phường Ninh Diêm	Ninh Diem Ward	ninh_diem	572	8
22564	Ninh Đông	Ninh Dong	Xã Ninh Đông	Ninh Dong Commune	ninh_dong	572	10
22567	Ninh Thủy	Ninh Thuy	Phường Ninh Thủy	Ninh Thuy Ward	ninh_thuy	572	8
22570	Ninh Đa	Ninh Da	Phường Ninh Đa	Ninh Da Ward	ninh_da	572	8
22573	Ninh Phụng	Ninh Phung	Xã Ninh Phụng	Ninh Phung Commune	ninh_phung	572	10
22576	Ninh Bình	Ninh Binh	Xã Ninh Bình	Ninh Binh Commune	ninh_binh	572	10
22579	Ninh Phước	Ninh Phuoc	Xã Ninh Phước	Ninh Phuoc Commune	ninh_phuoc	572	10
22582	Ninh Phú	Ninh Phu	Xã Ninh Phú	Ninh Phu Commune	ninh_phu	572	10
22585	Ninh Tân	Ninh Tan	Xã Ninh Tân	Ninh Tan Commune	ninh_tan	572	10
22588	Ninh Quang	Ninh Quang	Xã Ninh Quang	Ninh Quang Commune	ninh_quang	572	10
22591	Ninh Giang	Ninh Giang	Phường Ninh Giang	Ninh Giang Ward	ninh_giang	572	8
22594	Ninh Hà	Ninh Ha	Phường Ninh Hà	Ninh Ha Ward	ninh_ha	572	8
22597	Ninh Hưng	Ninh Hung	Xã Ninh Hưng	Ninh Hung Commune	ninh_hung	572	10
22600	Ninh Lộc	Ninh Loc	Xã Ninh Lộc	Ninh Loc Commune	ninh_loc	572	10
22603	Ninh Ích	Ninh Ich	Xã Ninh Ích	Ninh Ich Commune	ninh_ich	572	10
22606	Ninh Vân	Ninh Van	Xã Ninh Vân	Ninh Van Commune	ninh_van	572	10
22609	Khánh Vĩnh	Khanh Vinh	Thị trấn Khánh Vĩnh	Khanh Vinh Township	khanh_vinh	573	9
22612	Khánh Hiệp	Khanh Hiep	Xã Khánh Hiệp	Khanh Hiep Commune	khanh_hiep	573	10
22615	Khánh Bình	Khanh Binh	Xã Khánh Bình	Khanh Binh Commune	khanh_binh	573	10
22618	Khánh Trung	Khanh Trung	Xã Khánh Trung	Khanh Trung Commune	khanh_trung	573	10
22621	Khánh Đông	Khanh Dong	Xã Khánh Đông	Khanh Dong Commune	khanh_dong	573	10
22624	Khánh Thượng	Khanh Thuong	Xã Khánh Thượng	Khanh Thuong Commune	khanh_thuong	573	10
22627	Khánh Nam	Khanh Nam	Xã Khánh Nam	Khanh Nam Commune	khanh_nam	573	10
22630	Sông Cầu	Song Cau	Xã Sông Cầu	Song Cau Commune	song_cau	573	10
22633	Giang Ly	Giang Ly	Xã Giang Ly	Giang Ly Commune	giang_ly	573	10
22636	Cầu Bà	Cau Ba	Xã Cầu Bà	Cau Ba Commune	cau_ba	573	10
22639	Liên Sang	Lien Sang	Xã Liên Sang	Lien Sang Commune	lien_sang	573	10
22642	Khánh Thành	Khanh Thanh	Xã Khánh Thành	Khanh Thanh Commune	khanh_thanh	573	10
22645	Khánh Phú	Khanh Phu	Xã Khánh Phú	Khanh Phu Commune	khanh_phu	573	10
22648	Sơn Thái	Son Thai	Xã Sơn Thái	Son Thai Commune	son_thai	573	10
22651	Diên Khánh	Dien Khanh	Thị trấn Diên Khánh	Dien Khanh Township	dien_khanh	574	9
22654	Diên Lâm	Dien Lam	Xã Diên Lâm	Dien Lam Commune	dien_lam	574	10
22657	Diên Điền	Dien Dien	Xã Diên Điền	Dien Dien Commune	dien_dien	574	10
22660	Diên Xuân	Dien Xuan	Xã Diên Xuân	Dien Xuan Commune	dien_xuan	574	10
22663	Diên Sơn	Dien Son	Xã Diên Sơn	Dien Son Commune	dien_son	574	10
22666	Diên Đồng	Dien Dong	Xã Diên Đồng	Dien Dong Commune	dien_dong	574	10
22669	Diên Phú	Dien Phu	Xã Diên Phú	Dien Phu Commune	dien_phu	574	10
22672	Diên Thọ	Dien Tho	Xã Diên Thọ	Dien Tho Commune	dien_tho	574	10
22675	Diên Phước	Dien Phuoc	Xã Diên Phước	Dien Phuoc Commune	dien_phuoc	574	10
22678	Diên Lạc	Dien Lac	Xã Diên Lạc	Dien Lac Commune	dien_lac	574	10
22681	Diên Tân	Dien Tan	Xã Diên Tân	Dien Tan Commune	dien_tan	574	10
22684	Diên Hòa	Dien Hoa	Xã Diên Hòa	Dien Hoa Commune	dien_hoa	574	10
22687	Diên Thạnh	Dien Thanh	Xã Diên Thạnh	Dien Thanh Commune	dien_thanh	574	10
22690	Diên Toàn	Dien Toan	Xã Diên Toàn	Dien Toan Commune	dien_toan	574	10
22693	Diên An	Dien An	Xã Diên An	Dien An Commune	dien_an	574	10
22696	Bình Lộc	Binh Loc	Xã Bình Lộc	Binh Loc Commune	binh_loc	574	10
22702	Suối Hiệp	Suoi Hiep	Xã Suối Hiệp	Suoi Hiep Commune	suoi_hiep	574	10
22705	Suối Tiên	Suoi Tien	Xã Suối Tiên	Suoi Tien Commune	suoi_tien	574	10
22714	Tô Hạp	To Hap	Thị trấn Tô Hạp	To Hap Township	to_hap	575	9
22717	Thành Sơn	Thanh Son	Xã Thành Sơn	Thanh Son Commune	thanh_son	575	10
22720	Sơn Lâm	Son Lam	Xã Sơn Lâm	Son Lam Commune	son_lam	575	10
22723	Sơn Hiệp	Son Hiep	Xã Sơn Hiệp	Son Hiep Commune	son_hiep	575	10
22726	Sơn Bình	Son Binh	Xã Sơn Bình	Son Binh Commune	son_binh	575	10
22729	Sơn Trung	Son Trung	Xã Sơn Trung	Son Trung Commune	son_trung	575	10
22732	Ba Cụm Bắc	Ba Cum Bac	Xã Ba Cụm Bắc	Ba Cum Bac Commune	ba_cum_bac	575	10
22735	Ba Cụm Nam	Ba Cum Nam	Xã Ba Cụm Nam	Ba Cum Nam Commune	ba_cum_nam	575	10
22736	Trường Sa	Truong Sa	Thị trấn Trường Sa	Truong Sa Township	truong_sa	576	9
22737	Song Tử Tây	Song Tu Tay	Xã Song Tử Tây	Song Tu Tay Commune	song_tu_tay	576	10
27310	12	12	Phường 12	12 Ward	12	774	8
22739	Sinh Tồn	Sinh Ton	Xã Sinh Tồn	Sinh Ton Commune	sinh_ton	576	10
22738	Đô Vinh	Do Vinh	Phường Đô Vinh	Do Vinh Ward	do_vinh	582	8
22741	Phước Mỹ	Phuoc My	Phường Phước Mỹ	Phuoc My Ward	phuoc_my	582	8
22744	Bảo An	Bao An	Phường Bảo An	Bao An Ward	bao_an	582	8
22747	Phủ Hà	Phu Ha	Phường Phủ Hà	Phu Ha Ward	phu_ha	582	8
22750	Thanh Sơn	Thanh Son	Phường Thanh Sơn	Thanh Son Ward	thanh_son	582	8
22753	Mỹ Hương	My Huong	Phường Mỹ Hương	My Huong Ward	my_huong	582	8
22756	Tấn Tài	Tan Tai	Phường Tấn Tài	Tan Tai Ward	tan_tai	582	8
22759	Kinh Dinh	Kinh Dinh	Phường Kinh Dinh	Kinh Dinh Ward	kinh_dinh	582	8
22762	Đạo Long	Dao Long	Phường Đạo Long	Dao Long Ward	dao_long	582	8
22765	Đài Sơn	Dai Son	Phường Đài Sơn	Dai Son Ward	dai_son	582	8
22768	Đông Hải	Dong Hai	Phường Đông Hải	Dong Hai Ward	dong_hai	582	8
22771	Mỹ Đông	My Dong	Phường Mỹ Đông	My Dong Ward	my_dong	582	8
22774	Thành Hải	Thanh Hai	Xã Thành Hải	Thanh Hai Commune	thanh_hai	582	10
22777	Văn Hải	Van Hai	Phường Văn Hải	Van Hai Ward	van_hai	582	8
22779	Mỹ Bình	My Binh	Phường Mỹ Bình	My Binh Ward	my_binh	582	8
22780	Mỹ Hải	My Hai	Phường Mỹ Hải	My Hai Ward	my_hai	582	8
22783	Phước Bình	Phuoc Binh	Xã Phước Bình	Phuoc Binh Commune	phuoc_binh	584	10
22786	Phước Hòa	Phuoc Hoa	Xã Phước Hòa	Phuoc Hoa Commune	phuoc_hoa	584	10
22789	Phước Tân	Phuoc Tan	Xã Phước Tân	Phuoc Tan Commune	phuoc_tan	584	10
22792	Phước Tiến	Phuoc Tien	Xã Phước Tiến	Phuoc Tien Commune	phuoc_tien	584	10
22795	Phước Thắng	Phuoc Thang	Xã Phước Thắng	Phuoc Thang Commune	phuoc_thang	584	10
22798	Phước Thành	Phuoc Thanh	Xã Phước Thành	Phuoc Thanh Commune	phuoc_thanh	584	10
22801	Phước Đại	Phuoc Dai	Xã Phước Đại	Phuoc Dai Commune	phuoc_dai	584	10
22804	Phước Chính	Phuoc Chinh	Xã Phước Chính	Phuoc Chinh Commune	phuoc_chinh	584	10
22807	Phước Trung	Phuoc Trung	Xã Phước Trung	Phuoc Trung Commune	phuoc_trung	584	10
22810	Tân Sơn	Tan Son	Thị trấn Tân Sơn	Tan Son Township	tan_son	585	9
22813	Lâm Sơn	Lam Son	Xã Lâm Sơn	Lam Son Commune	lam_son	585	10
23227	Trà Tân	Tra Tan	Xã Trà Tân	Tra Tan Commune	tra_tan	600	10
22816	Lương Sơn	Luong Son	Xã Lương Sơn	Luong Son Commune	luong_son	585	10
22819	Quảng Sơn	Quang Son	Xã Quảng Sơn	Quang Son Commune	quang_son	585	10
22822	Mỹ Sơn	My Son	Xã Mỹ Sơn	My Son Commune	my_son	585	10
22825	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	585	10
22828	Ma Nới	Ma Noi	Xã Ma Nới	Ma Noi Commune	ma_noi	585	10
22831	Nhơn Sơn	Nhon Son	Xã Nhơn Sơn	Nhon Son Commune	nhon_son	585	10
22834	Khánh Hải	Khanh Hai	Thị trấn Khánh Hải	Khanh Hai Township	khanh_hai	586	9
22846	Vĩnh Hải	Vinh Hai	Xã Vĩnh Hải	Vinh Hai Commune	vinh_hai	586	10
22852	Phương Hải	Phuong Hai	Xã Phương Hải	Phuong Hai Commune	phuong_hai	586	10
22855	Tân Hải	Tan Hai	Xã Tân Hải	Tan Hai Commune	tan_hai	586	10
22858	Xuân Hải	Xuan Hai	Xã Xuân Hải	Xuan Hai Commune	xuan_hai	586	10
22861	Hộ Hải	Ho Hai	Xã Hộ Hải	Ho Hai Commune	ho_hai	586	10
22864	Tri Hải	Tri Hai	Xã Tri Hải	Tri Hai Commune	tri_hai	586	10
22867	Nhơn Hải	Nhon Hai	Xã Nhơn Hải	Nhon Hai Commune	nhon_hai	586	10
22868	Thanh Hải	Thanh Hai	Xã Thanh Hải	Thanh Hai Commune	thanh_hai	586	10
22870	Phước Dân	Phuoc Dan	Thị trấn Phước Dân	Phuoc Dan Township	phuoc_dan	587	9
22873	Phước Sơn	Phuoc Son	Xã Phước Sơn	Phuoc Son Commune	phuoc_son	587	10
22876	Phước Thái	Phuoc Thai	Xã Phước Thái	Phuoc Thai Commune	phuoc_thai	587	10
22879	Phước Hậu	Phuoc Hau	Xã Phước Hậu	Phuoc Hau Commune	phuoc_hau	587	10
22882	Phước Thuận	Phuoc Thuan	Xã Phước Thuận	Phuoc Thuan Commune	phuoc_thuan	587	10
22888	An Hải	An Hai	Xã An Hải	An Hai Commune	an_hai	587	10
22891	Phước Hữu	Phuoc Huu	Xã Phước Hữu	Phuoc Huu Commune	phuoc_huu	587	10
22894	Phước Hải	Phuoc Hai	Xã Phước Hải	Phuoc Hai Commune	phuoc_hai	587	10
22912	Phước Vinh	Phuoc Vinh	Xã Phước Vinh	Phuoc Vinh Commune	phuoc_vinh	587	10
22837	Phước Chiến	Phuoc Chien	Xã Phước Chiến	Phuoc Chien Commune	phuoc_chien	588	10
22840	Công Hải	Cong Hai	Xã Công Hải	Cong Hai Commune	cong_hai	588	10
22843	Phước Kháng	Phuoc Khang	Xã Phước Kháng	Phuoc Khang Commune	phuoc_khang	588	10
22849	Lợi Hải	Loi Hai	Xã Lợi Hải	Loi Hai Commune	loi_hai	588	10
22853	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	588	10
22856	Bắc Phong	Bac Phong	Xã Bắc Phong	Bac Phong Commune	bac_phong	588	10
22885	Phước Hà	Phuoc Ha	Xã Phước Hà	Phuoc Ha Commune	phuoc_ha	589	10
22897	Phước Nam	Phuoc Nam	Xã Phước Nam	Phuoc Nam Commune	phuoc_nam	589	10
22898	Phước Ninh	Phuoc Ninh	Xã Phước Ninh	Phuoc Ninh Commune	phuoc_ninh	589	10
22900	Nhị Hà	Nhi Ha	Xã Nhị Hà	Nhi Ha Commune	nhi_ha	589	10
22903	Phước Dinh	Phuoc Dinh	Xã Phước Dinh	Phuoc Dinh Commune	phuoc_dinh	589	10
22906	Phước Minh	Phuoc Minh	Xã Phước Minh	Phuoc Minh Commune	phuoc_minh	589	10
22909	Phước Diêm	Phuoc Diem	Xã Phước Diêm	Phuoc Diem Commune	phuoc_diem	589	10
22910	Cà Ná	Ca Na	Xã Cà Ná	Ca Na Commune	ca_na	589	10
22915	Mũi Né	Mui Ne	Phường Mũi Né	Mui Ne Ward	mui_ne	593	8
22918	Hàm Tiến	Ham Tien	Phường Hàm Tiến	Ham Tien Ward	ham_tien	593	8
22921	Phú Hài	Phu Hai	Phường Phú Hài	Phu Hai Ward	phu_hai	593	8
22924	Phú Thủy	Phu Thuy	Phường Phú Thủy	Phu Thuy Ward	phu_thuy	593	8
22927	Phú Tài	Phu Tai	Phường Phú Tài	Phu Tai Ward	phu_tai	593	8
22930	Phú Trinh	Phu Trinh	Phường Phú Trinh	Phu Trinh Ward	phu_trinh	593	8
22933	Xuân An	Xuan An	Phường Xuân An	Xuan An Ward	xuan_an	593	8
22936	Thanh Hải	Thanh Hai	Phường Thanh Hải	Thanh Hai Ward	thanh_hai	593	8
22939	Bình Hưng	Binh Hung	Phường Bình Hưng	Binh Hung Ward	binh_hung	593	8
22942	Đức Nghĩa	Duc Nghia	Phường Đức Nghĩa	Duc Nghia Ward	duc_nghia	593	8
22945	Lạc Đạo	Lac Dao	Phường Lạc Đạo	Lac Dao Ward	lac_dao	593	8
22948	Đức Thắng	Duc Thang	Phường Đức Thắng	Duc Thang Ward	duc_thang	593	8
22951	Hưng Long	Hung Long	Phường Hưng Long	Hung Long Ward	hung_long	593	8
22954	Đức Long	Duc Long	Phường Đức Long	Duc Long Ward	duc_long	593	8
22957	Thiện Nghiệp	Thien Nghiep	Xã Thiện Nghiệp	Thien Nghiep Commune	thien_nghiep	593	10
22960	Phong Nẫm	Phong Nam	Xã Phong Nẫm	Phong Nam Commune	phong_nam	593	10
22963	Tiến Lợi	Tien Loi	Xã Tiến Lợi	Tien Loi Commune	tien_loi	593	10
22966	Tiến Thành	Tien Thanh	Xã Tiến Thành	Tien Thanh Commune	tien_thanh	593	10
23231	Phước Hội	Phuoc Hoi	Phường Phước Hội	Phuoc Hoi Ward	phuoc_hoi	594	8
23232	Phước Lộc	Phuoc Loc	Phường Phước Lộc	Phuoc Loc Ward	phuoc_loc	594	8
23234	Tân Thiện	Tan Thien	Phường Tân Thiện	Tan Thien Ward	tan_thien	594	8
23235	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	594	8
23237	Bình Tân	Binh Tan	Phường Bình Tân	Binh Tan Ward	binh_tan	594	8
23245	Tân Hải	Tan Hai	Xã Tân Hải	Tan Hai Commune	tan_hai	594	10
23246	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	594	10
23248	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	594	10
23268	Tân Phước	Tan Phuoc	Xã Tân Phước	Tan Phuoc Commune	tan_phuoc	594	10
22969	Liên Hương	Lien Huong	Thị trấn Liên Hương	Lien Huong Township	lien_huong	595	9
22972	Phan Rí Cửa	Phan Ri Cua	Thị trấn Phan Rí Cửa	Phan Ri Cua Township	phan_ri_cua	595	9
22975	Phan Dũng	Phan Dung	Xã Phan Dũng	Phan Dung Commune	phan_dung	595	10
22978	Phong Phú	Phong Phu	Xã Phong Phú	Phong Phu Commune	phong_phu	595	10
22981	Vĩnh Hảo	Vinh Hao	Xã Vĩnh Hảo	Vinh Hao Commune	vinh_hao	595	10
22984	Vĩnh Tân	Vinh Tan	Xã Vĩnh Tân	Vinh Tan Commune	vinh_tan	595	10
22987	Phú Lạc	Phu Lac	Xã Phú Lạc	Phu Lac Commune	phu_lac	595	10
22990	Phước Thể	Phuoc The	Xã Phước Thể	Phuoc The Commune	phuoc_the	595	10
22993	Hòa Minh	Hoa Minh	Xã Hòa Minh	Hoa Minh Commune	hoa_minh	595	10
22996	Chí Công	Chi Cong	Xã Chí Công	Chi Cong Commune	chi_cong	595	10
22999	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	595	10
23005	Chợ Lầu	Cho Lau	Thị trấn Chợ Lầu	Cho Lau Township	cho_lau	596	9
23008	Phan Sơn	Phan Son	Xã Phan Sơn	Phan Son Commune	phan_son	596	10
23011	Phan Lâm	Phan Lam	Xã Phan Lâm	Phan Lam Commune	phan_lam	596	10
23014	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	596	10
23017	Phan Điền	Phan Dien	Xã Phan Điền	Phan Dien Commune	phan_dien	596	10
23020	Hải Ninh	Hai Ninh	Xã Hải Ninh	Hai Ninh Commune	hai_ninh	596	10
23023	Sông Lũy	Song Luy	Xã Sông Lũy	Song Luy Commune	song_luy	596	10
23026	Phan Tiến	Phan Tien	Xã Phan Tiến	Phan Tien Commune	phan_tien	596	10
23029	Sông Bình	Song Binh	Xã Sông Bình	Song Binh Commune	song_binh	596	10
23032	Lương Sơn	Luong Son	Thị trấn Lương Sơn	Luong Son Township	luong_son	596	9
23035	Phan Hòa	Phan Hoa	Xã Phan Hòa	Phan Hoa Commune	phan_hoa	596	10
23038	Phan Thanh	Phan Thanh	Xã Phan Thanh	Phan Thanh Commune	phan_thanh	596	10
23041	Hồng Thái	Hong Thai	Xã Hồng Thái	Hong Thai Commune	hong_thai	596	10
23044	Phan Hiệp	Phan Hiep	Xã Phan Hiệp	Phan Hiep Commune	phan_hiep	596	10
23047	Bình Tân	Binh Tan	Xã Bình Tân	Binh Tan Commune	binh_tan	596	10
23050	Phan Rí Thành	Phan Ri Thanh	Xã Phan Rí Thành	Phan Ri Thanh Commune	phan_ri_thanh	596	10
23053	Hòa Thắng	Hoa Thang	Xã Hòa Thắng	Hoa Thang Commune	hoa_thang	596	10
23056	Hồng Phong	Hong Phong	Xã Hồng Phong	Hong Phong Commune	hong_phong	596	10
23059	Ma Lâm	Ma Lam	Thị trấn Ma Lâm	Ma Lam Township	ma_lam	597	9
23062	Phú Long	Phu Long	Thị trấn Phú Long	Phu Long Township	phu_long	597	9
23065	La Dạ	La Da	Xã La Dạ	La Da Commune	la_da	597	10
23068	Đông Tiến	Dong Tien	Xã Đông Tiến	Dong Tien Commune	dong_tien	597	10
23071	Thuận Hòa	Thuan Hoa	Xã Thuận Hòa	Thuan Hoa Commune	thuan_hoa	597	10
23074	Đông Giang	Dong Giang	Xã Đông Giang	Dong Giang Commune	dong_giang	597	10
23077	Hàm Phú	Ham Phu	Xã Hàm Phú	Ham Phu Commune	ham_phu	597	10
23080	Hồng Liêm	Hong Liem	Xã Hồng Liêm	Hong Liem Commune	hong_liem	597	10
23083	Thuận Minh	Thuan Minh	Xã Thuận Minh	Thuan Minh Commune	thuan_minh	597	10
23086	Hồng Sơn	Hong Son	Xã Hồng Sơn	Hong Son Commune	hong_son	597	10
23089	Hàm Trí	Ham Tri	Xã Hàm Trí	Ham Tri Commune	ham_tri	597	10
23092	Hàm Đức	Ham Duc	Xã Hàm Đức	Ham Duc Commune	ham_duc	597	10
23095	Hàm Liêm	Ham Liem	Xã Hàm Liêm	Ham Liem Commune	ham_liem	597	10
23098	Hàm Chính	Ham Chinh	Xã Hàm Chính	Ham Chinh Commune	ham_chinh	597	10
23101	Hàm Hiệp	Ham Hiep	Xã Hàm Hiệp	Ham Hiep Commune	ham_hiep	597	10
23104	Hàm Thắng	Ham Thang	Xã Hàm Thắng	Ham Thang Commune	ham_thang	597	10
23107	Đa Mi	Da Mi	Xã Đa Mi	Da Mi Commune	da_mi	597	10
23110	Thuận Nam	Thuan Nam	Thị trấn Thuận Nam	Thuan Nam Township	thuan_nam	598	9
23113	Mỹ Thạnh	My Thanh	Xã Mỹ Thạnh	My Thanh Commune	my_thanh	598	10
23116	Hàm Cần	Ham Can	Xã Hàm Cần	Ham Can Commune	ham_can	598	10
23119	Mương Mán	Muong Man	Xã Mương Mán	Muong Man Commune	muong_man	598	10
23122	Hàm Thạnh	Ham Thanh	Xã Hàm Thạnh	Ham Thanh Commune	ham_thanh	598	10
23125	Hàm Kiệm	Ham Kiem	Xã Hàm Kiệm	Ham Kiem Commune	ham_kiem	598	10
23128	Hàm Cường	Ham Cuong	Xã Hàm Cường	Ham Cuong Commune	ham_cuong	598	10
23131	Hàm Mỹ	Ham My	Xã Hàm Mỹ	Ham My Commune	ham_my	598	10
23134	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	598	10
23137	Hàm Minh	Ham Minh	Xã Hàm Minh	Ham Minh Commune	ham_minh	598	10
23140	Thuận Quí	Thuan Qui	Xã Thuận Quí	Thuan Qui Commune	thuan_qui	598	10
23143	Tân Thuận	Tan Thuan	Xã Tân Thuận	Tan Thuan Commune	tan_thuan	598	10
23146	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	598	10
23149	Lạc Tánh	Lac Tanh	Thị trấn Lạc Tánh	Lac Tanh Township	lac_tanh	599	9
23152	Bắc Ruộng	Bac Ruong	Xã Bắc Ruộng	Bac Ruong Commune	bac_ruong	599	10
23158	Nghị Đức	Nghi Duc	Xã Nghị Đức	Nghi Duc Commune	nghi_duc	599	10
23161	La Ngâu	La Ngau	Xã La Ngâu	La Ngau Commune	la_ngau	599	10
23164	Huy Khiêm	Huy Khiem	Xã Huy Khiêm	Huy Khiem Commune	huy_khiem	599	10
23167	Măng Tố	Mang To	Xã Măng Tố	Mang To Commune	mang_to	599	10
23170	Đức Phú	Duc Phu	Xã Đức Phú	Duc Phu Commune	duc_phu	599	10
23173	Đồng Kho	Dong Kho	Xã Đồng Kho	Dong Kho Commune	dong_kho	599	10
23176	Gia An	Gia An	Xã Gia An	Gia An Commune	gia_an	599	10
23179	Đức Bình	Duc Binh	Xã Đức Bình	Duc Binh Commune	duc_binh	599	10
23182	Gia Huynh	Gia Huynh	Xã Gia Huynh	Gia Huynh Commune	gia_huynh	599	10
23185	Đức Thuận	Duc Thuan	Xã Đức Thuận	Duc Thuan Commune	duc_thuan	599	10
23188	Suối Kiết	Suoi Kiet	Xã Suối Kiết	Suoi Kiet Commune	suoi_kiet	599	10
23191	Võ Xu	Vo Xu	Thị trấn Võ Xu	Vo Xu Township	vo_xu	600	9
23194	Đức Tài	Duc Tai	Thị trấn Đức Tài	Duc Tai Township	duc_tai	600	9
23197	Đa Kai	Da Kai	Xã Đa Kai	Da Kai Commune	da_kai	600	10
23200	Sùng Nhơn	Sung Nhon	Xã Sùng Nhơn	Sung Nhon Commune	sung_nhon	600	10
23203	Mê Pu	Me Pu	Xã Mê Pu	Me Pu Commune	me_pu	600	10
23206	Nam Chính	Nam Chinh	Xã Nam Chính	Nam Chinh Commune	nam_chinh	600	10
23212	Đức Hạnh	Duc Hanh	Xã Đức Hạnh	Duc Hanh Commune	duc_hanh	600	10
23215	Đức Tín	Duc Tin	Xã Đức Tín	Duc Tin Commune	duc_tin	600	10
23218	Vũ Hoà	Vu Hoa	Xã Vũ Hoà	Vu Hoa Commune	vu_hoa	600	10
23221	Tân Hà	Tan Ha	Xã Tân Hà	Tan Ha Commune	tan_ha	600	10
23230	Tân Minh	Tan Minh	Thị trấn Tân Minh	Tan Minh Township	tan_minh	601	9
23236	Tân Nghĩa	Tan Nghia	Thị trấn Tân Nghĩa	Tan Nghia Township	tan_nghia	601	9
23239	Sông Phan	Song Phan	Xã Sông Phan	Song Phan Commune	song_phan	601	10
23242	Tân Phúc	Tan Phuc	Xã Tân Phúc	Tan Phuc Commune	tan_phuc	601	10
23251	Tân Đức	Tan Duc	Xã Tân Đức	Tan Duc Commune	tan_duc	601	10
23254	Tân Thắng	Tan Thang	Xã Tân Thắng	Tan Thang Commune	tan_thang	601	10
23255	Thắng Hải	Thang Hai	Xã Thắng Hải	Thang Hai Commune	thang_hai	601	10
23257	Tân Hà	Tan Ha	Xã Tân Hà	Tan Ha Commune	tan_ha	601	10
23260	Tân Xuân	Tan Xuan	Xã Tân Xuân	Tan Xuan Commune	tan_xuan	601	10
23266	Sơn Mỹ	Son My	Xã Sơn Mỹ	Son My Commune	son_my	601	10
23272	Ngũ Phụng	Ngu Phung	Xã Ngũ Phụng	Ngu Phung Commune	ngu_phung	602	10
23275	Long Hải	Long Hai	Xã Long Hải	Long Hai Commune	long_hai	602	10
23278	Tam Thanh	Tam Thanh	Xã Tam Thanh	Tam Thanh Commune	tam_thanh	602	10
23281	Quang Trung	Quang Trung	Phường Quang Trung	Quang Trung Ward	quang_trung	608	8
23284	Duy Tân	Duy Tan	Phường Duy Tân	Duy Tan Ward	duy_tan	608	8
23287	Quyết Thắng	Quyet Thang	Phường Quyết Thắng	Quyet Thang Ward	quyet_thang	608	8
23290	Trường Chinh	Truong Chinh	Phường Trường Chinh	Truong Chinh Ward	truong_chinh	608	8
23293	Thắng Lợi	Thang Loi	Phường Thắng Lợi	Thang Loi Ward	thang_loi	608	8
23296	Ngô Mây	Ngo May	Phường Ngô Mây	Ngo May Ward	ngo_may	608	8
23299	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	608	8
23302	Lê Lợi	Le Loi	Phường Lê Lợi	Le Loi Ward	le_loi	608	8
23305	Nguyễn Trãi	Nguyen Trai	Phường Nguyễn Trãi	Nguyen Trai Ward	nguyen_trai	608	8
23308	Trần Hưng Đạo	Tran Hung Dao	Phường Trần Hưng Đạo	Tran Hung Dao Ward	tran_hung_dao	608	8
23311	Đắk Cấm	Dak Cam	Xã Đắk Cấm	Dak Cam Commune	dak_cam	608	10
23314	Kroong	Kroong	Xã Kroong	Kroong Commune	kroong	608	10
23317	Ngọk Bay	Ngok Bay	Xã Ngọk Bay	Ngok Bay Commune	ngok_bay	608	10
23320	Vinh Quang	Vinh Quang	Xã Vinh Quang	Vinh Quang Commune	vinh_quang	608	10
23323	Đắk Blà	Dak Bla	Xã Đắk Blà	Dak Bla Commune	dak_bla	608	10
23326	Ia Chim	Ia Chim	Xã Ia Chim	Ia Chim Commune	ia_chim	608	10
23327	Đăk Năng	Dak Nang	Xã Đăk Năng	Dak Nang Commune	dak_nang	608	10
23329	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	608	10
23332	Chư Hreng	Chu Hreng	Xã Chư Hreng	Chu Hreng Commune	chu_hreng	608	10
23335	Đắk Rơ Wa	Dak Ro Wa	Xã Đắk Rơ Wa	Dak Ro Wa Commune	dak_ro_wa	608	10
23338	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	608	10
23341	Đắk Glei	Dak Glei	Thị trấn Đắk Glei	Dak Glei Township	dak_glei	610	9
23344	Đắk Blô	Dak Blo	Xã Đắk Blô	Dak Blo Commune	dak_blo	610	10
23347	Đắk Man	Dak Man	Xã Đắk Man	Dak Man Commune	dak_man	610	10
23350	Đắk Nhoong	Dak Nhoong	Xã Đắk Nhoong	Dak Nhoong Commune	dak_nhoong	610	10
23353	Đắk Pék	Dak Pek	Xã Đắk Pék	Dak Pek Commune	dak_pek	610	10
23356	Đắk Choong	Dak Choong	Xã Đắk Choong	Dak Choong Commune	dak_choong	610	10
23359	Xốp	Xop	Xã Xốp	Xop Commune	xop	610	10
23362	Mường Hoong	Muong Hoong	Xã Mường Hoong	Muong Hoong Commune	muong_hoong	610	10
23365	Ngọc Linh	Ngoc Linh	Xã Ngọc Linh	Ngoc Linh Commune	ngoc_linh	610	10
23368	Đắk Long	Dak Long	Xã Đắk Long	Dak Long Commune	dak_long	610	10
23371	Đắk KRoong	Dak KRoong	Xã Đắk KRoong	Dak KRoong Commune	dak_kroong	610	10
23374	Đắk Môn	Dak Mon	Xã Đắk Môn	Dak Mon Commune	dak_mon	610	10
23377	Plei Kần	Plei Kan	Thị trấn Plei Kần	Plei Kan Township	plei_kan	611	9
23380	Đắk Ang	Dak Ang	Xã Đắk Ang	Dak Ang Commune	dak_ang	611	10
23383	Đắk Dục	Dak Duc	Xã Đắk Dục	Dak Duc Commune	dak_duc	611	10
23386	Đắk Nông	Dak Nong	Xã Đắk Nông	Dak Nong Commune	dak_nong	611	10
23389	Đắk Xú	Dak Xu	Xã Đắk Xú	Dak Xu Commune	dak_xu	611	10
23392	Đắk Kan	Dak Kan	Xã Đắk Kan	Dak Kan Commune	dak_kan	611	10
23395	Bờ Y	Bo Y	Xã Bờ Y	Bo Y Commune	bo_y	611	10
23398	Sa Loong	Sa Loong	Xã Sa Loong	Sa Loong Commune	sa_loong	611	10
23401	Đắk Tô	Dak To	Thị trấn Đắk Tô	Dak To Township	dak_to	612	9
23427	Đắk Rơ Nga	Dak Ro Nga	Xã Đắk Rơ Nga	Dak Ro Nga Commune	dak_ro_nga	612	10
23428	Ngọk Tụ	Ngok Tu	Xã Ngọk Tụ	Ngok Tu Commune	ngok_tu	612	10
23430	Đắk Trăm	Dak Tram	Xã Đắk Trăm	Dak Tram Commune	dak_tram	612	10
23431	Văn Lem	Van Lem	Xã Văn Lem	Van Lem Commune	van_lem	612	10
23434	Kon Đào	Kon Dao	Xã Kon Đào	Kon Dao Commune	kon_dao	612	10
23437	Tân Cảnh	Tan Canh	Xã Tân Cảnh	Tan Canh Commune	tan_canh	612	10
23440	Diên Bình	Dien Binh	Xã Diên Bình	Dien Binh Commune	dien_binh	612	10
23443	Pô Kô	Po Ko	Xã Pô Kô	Po Ko Commune	po_ko	612	10
23452	Đắk Nên	Dak Nen	Xã Đắk Nên	Dak Nen Commune	dak_nen	613	10
23455	Đắk Ring	Dak Ring	Xã Đắk Ring	Dak Ring Commune	dak_ring	613	10
23458	Măng Buk	Mang Buk	Xã Măng Buk	Mang Buk Commune	mang_buk	613	10
23461	Đắk Tăng	Dak Tang	Xã Đắk Tăng	Dak Tang Commune	dak_tang	613	10
23464	Ngok Tem	Ngok Tem	Xã Ngok Tem	Ngok Tem Commune	ngok_tem	613	10
23467	Pờ Ê	Po E	Xã Pờ Ê	Po E Commune	po_e	613	10
23470	Măng Cành	Mang Canh	Xã Măng Cành	Mang Canh Commune	mang_canh	613	10
23473	Măng Đen	Mang Den	Thị trấn Măng Đen	Mang Den Township	mang_den	613	9
23476	Hiếu	Hieu	Xã Hiếu	Hieu Commune	hieu	613	10
23479	Đắk Rve	Dak Rve	Thị trấn Đắk Rve	Dak Rve Township	dak_rve	614	9
23482	Đắk Kôi	Dak Koi	Xã Đắk Kôi	Dak Koi Commune	dak_koi	614	10
24103	Ia RMok	Ia RMok	Xã Ia RMok	Ia RMok Commune	ia_rmok	637	10
23485	Đắk Tơ Lung	Dak To Lung	Xã Đắk Tơ Lung	Dak To Lung Commune	dak_to_lung	614	10
23488	Đắk Ruồng	Dak Ruong	Xã Đắk Ruồng	Dak Ruong Commune	dak_ruong	614	10
23491	Đắk Pne	Dak Pne	Xã Đắk Pne	Dak Pne Commune	dak_pne	614	10
23494	Đắk Tờ Re	Dak To Re	Xã Đắk Tờ Re	Dak To Re Commune	dak_to_re	614	10
23497	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	614	10
23500	Đắk Hà	Dak Ha	Thị trấn Đắk Hà	Dak Ha Township	dak_ha	615	9
23503	Đắk PXi	Dak PXi	Xã Đắk PXi	Dak PXi Commune	dak_pxi	615	10
23504	Đăk Long	Dak Long	Xã Đăk Long	Dak Long Commune	dak_long	615	10
23506	Đắk HRing	Dak HRing	Xã Đắk HRing	Dak HRing Commune	dak_hring	615	10
23509	Đắk Ui	Dak Ui	Xã Đắk Ui	Dak Ui Commune	dak_ui	615	10
27313	02	02	Phường 02	02 Ward	02	774	8
23510	Đăk Ngọk	Dak Ngok	Xã Đăk Ngọk	Dak Ngok Commune	dak_ngok	615	10
23512	Đắk Mar	Dak Mar	Xã Đắk Mar	Dak Mar Commune	dak_mar	615	10
23515	Ngok Wang	Ngok Wang	Xã Ngok Wang	Ngok Wang Commune	ngok_wang	615	10
23518	Ngok Réo	Ngok Reo	Xã Ngok Réo	Ngok Reo Commune	ngok_reo	615	10
23521	Hà Mòn	Ha Mon	Xã Hà Mòn	Ha Mon Commune	ha_mon	615	10
23524	Đắk La	Dak La	Xã Đắk La	Dak La Commune	dak_la	615	10
23527	Sa Thầy	Sa Thay	Thị trấn Sa Thầy	Sa Thay Township	sa_thay	616	9
23530	Rơ Kơi	Ro Koi	Xã Rơ Kơi	Ro Koi Commune	ro_koi	616	10
23533	Sa Nhơn	Sa Nhon	Xã Sa Nhơn	Sa Nhon Commune	sa_nhon	616	10
23534	Hơ Moong	Ho Moong	Xã Hơ Moong	Ho Moong Commune	ho_moong	616	10
23536	Mô Rai	Mo Rai	Xã Mô Rai	Mo Rai Commune	mo_rai	616	10
23539	Sa Sơn	Sa Son	Xã Sa Sơn	Sa Son Commune	sa_son	616	10
23542	Sa Nghĩa	Sa Nghia	Xã Sa Nghĩa	Sa Nghia Commune	sa_nghia	616	10
23545	Sa Bình	Sa Binh	Xã Sa Bình	Sa Binh Commune	sa_binh	616	10
23548	Ya Xiêr	Ya Xier	Xã Ya Xiêr	Ya Xier Commune	ya_xier	616	10
23551	Ya Tăng	Ya Tang	Xã Ya Tăng	Ya Tang Commune	ya_tang	616	10
23554	Ya ly	Ya ly	Xã Ya ly	Ya ly Commune	ya_ly	616	10
23404	Ngọc Lây	Ngoc Lay	Xã Ngọc Lây	Ngoc Lay Commune	ngoc_lay	617	10
23407	Đắk Na	Dak Na	Xã Đắk Na	Dak Na Commune	dak_na	617	10
23410	Măng Ri	Mang Ri	Xã Măng Ri	Mang Ri Commune	mang_ri	617	10
23413	Ngọc Yêu	Ngoc Yeu	Xã Ngọc Yêu	Ngoc Yeu Commune	ngoc_yeu	617	10
23416	Đắk Sao	Dak Sao	Xã Đắk Sao	Dak Sao Commune	dak_sao	617	10
23417	Đắk Rơ Ông	Dak Ro Ong	Xã Đắk Rơ Ông	Dak Ro Ong Commune	dak_ro_ong	617	10
23419	Đắk Tờ Kan	Dak To Kan	Xã Đắk Tờ Kan	Dak To Kan Commune	dak_to_kan	617	10
23422	Tu Mơ Rông	Tu Mo Rong	Xã Tu Mơ Rông	Tu Mo Rong Commune	tu_mo_rong	617	10
23425	Đắk Hà	Dak Ha	Xã Đắk Hà	Dak Ha Commune	dak_ha	617	10
23446	Tê Xăng	Te Xang	Xã Tê Xăng	Te Xang Commune	te_xang	617	10
23449	Văn Xuôi	Van Xuoi	Xã Văn Xuôi	Van Xuoi Commune	van_xuoi	617	10
23535	Ia Đal	Ia Dal	Xã Ia Đal	Ia Dal Commune	ia_dal	618	10
23537	Ia Dom	Ia Dom	Xã Ia Dom	Ia Dom Commune	ia_dom	618	10
23538	Ia Tơi	Ia Toi	Xã Ia Tơi	Ia Toi Commune	ia_toi	618	10
23557	Yên Đỗ	Yen Do	Phường Yên Đỗ	Yen Do Ward	yen_do	622	8
23560	Diên Hồng	Dien Hong	Phường Diên Hồng	Dien Hong Ward	dien_hong	622	8
23563	Ia Kring	Ia Kring	Phường Ia Kring	Ia Kring Ward	ia_kring	622	8
23566	Hội Thương	Hoi Thuong	Phường Hội Thương	Hoi Thuong Ward	hoi_thuong	622	8
23569	Hội Phú	Hoi Phu	Phường Hội Phú	Hoi Phu Ward	hoi_phu	622	8
23570	Phù Đổng	Phu Dong	Phường Phù Đổng	Phu Dong Ward	phu_dong	622	8
23572	Hoa Lư	Hoa Lu	Phường Hoa Lư	Hoa Lu Ward	hoa_lu	622	8
23575	Tây Sơn	Tay Son	Phường Tây Sơn	Tay Son Ward	tay_son	622	8
23578	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	622	8
23579	Đống Đa	Dong Da	Phường Đống Đa	Dong Da Ward	dong_da	622	8
23581	Trà Bá	Tra Ba	Phường Trà Bá	Tra Ba Ward	tra_ba	622	8
23582	Thắng Lợi	Thang Loi	Phường Thắng Lợi	Thang Loi Ward	thang_loi	622	8
23584	Yên Thế	Yen The	Phường Yên Thế	Yen The Ward	yen_the	622	8
23586	Chi Lăng	Chi Lang	Phường Chi Lăng	Chi Lang Ward	chi_lang	622	8
23590	Biển Hồ	Bien Ho	Xã Biển Hồ	Bien Ho Commune	bien_ho	622	10
23593	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	622	10
23596	Trà Đa	Tra Da	Xã Trà Đa	Tra Da Commune	tra_da	622	10
23599	Chư Á	Chu A	Xã Chư Á	Chu A Commune	chu_a	622	10
23602	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	622	10
23605	Diên Phú	Dien Phu	Xã Diên Phú	Dien Phu Commune	dien_phu	622	10
23608	Ia Kênh	Ia Kenh	Xã Ia Kênh	Ia Kenh Commune	ia_kenh	622	10
23611	Gào	Gao	Xã Gào	Gao Commune	gao	622	10
23614	An Bình	An Binh	Phường An Bình	An Binh Ward	an_binh	623	8
23617	Tây Sơn	Tay Son	Phường Tây Sơn	Tay Son Ward	tay_son	623	8
23620	An Phú	An Phu	Phường An Phú	An Phu Ward	an_phu	623	8
23623	An Tân	An Tan	Phường An Tân	An Tan Ward	an_tan	623	8
23626	Tú An	Tu An	Xã Tú An	Tu An Commune	tu_an	623	10
23627	Xuân An	Xuan An	Xã Xuân An	Xuan An Commune	xuan_an	623	10
23629	Cửu An	Cuu An	Xã Cửu An	Cuu An Commune	cuu_an	623	10
23630	An Phước	An Phuoc	Phường An Phước	An Phuoc Ward	an_phuoc	623	8
23632	Song An	Song An	Xã Song An	Song An Commune	song_an	623	10
23633	Ngô Mây	Ngo May	Phường Ngô Mây	Ngo May Ward	ngo_may	623	8
23635	Thành An	Thanh An	Xã Thành An	Thanh An Commune	thanh_an	623	10
24041	Cheo Reo	Cheo Reo	Phường Cheo Reo	Cheo Reo Ward	cheo_reo	624	8
24042	Hòa Bình	Hoa Binh	Phường Hòa Bình	Hoa Binh Ward	hoa_binh	624	8
24044	Đoàn Kết	Doan Ket	Phường Đoàn Kết	Doan Ket Ward	doan_ket	624	8
24045	Sông Bờ	Song Bo	Phường Sông Bờ	Song Bo Ward	song_bo	624	8
24064	Ia RBol	Ia RBol	Xã Ia RBol	Ia RBol Commune	ia_rbol	624	10
24065	Chư Băh	Chu Bah	Xã Chư Băh	Chu Bah Commune	chu_bah	624	10
24070	Ia RTô	Ia RTo	Xã Ia RTô	Ia RTo Commune	ia_rto	624	10
24073	Ia Sao	Ia Sao	Xã Ia Sao	Ia Sao Commune	ia_sao	624	10
23638	KBang	KBang	Thị trấn KBang	KBang Township	kbang	625	9
23641	Kon Pne	Kon Pne	Xã Kon Pne	Kon Pne Commune	kon_pne	625	10
23644	Đăk Roong	Dak Roong	Xã Đăk Roong	Dak Roong Commune	dak_roong	625	10
23647	Sơn Lang	Son Lang	Xã Sơn Lang	Son Lang Commune	son_lang	625	10
23650	KRong	KRong	Xã KRong	KRong Commune	krong	625	10
23653	Sơ Pai	So Pai	Xã Sơ Pai	So Pai Commune	so_pai	625	10
23656	Lơ Ku	Lo Ku	Xã Lơ Ku	Lo Ku Commune	lo_ku	625	10
23659	Đông	Dong	Xã Đông	Dong Commune	dong	625	10
23660	Đak SMar	Dak SMar	Xã Đak SMar	Dak SMar Commune	dak_smar	625	10
23662	Nghĩa An	Nghia An	Xã Nghĩa An	Nghia An Commune	nghia_an	625	10
23665	Tơ Tung	To Tung	Xã Tơ Tung	To Tung Commune	to_tung	625	10
23668	Kông Lơng Khơng	Kong Long Khong	Xã Kông Lơng Khơng	Kong Long Khong Commune	kong_long_khong	625	10
23671	Kông Pla	Kong Pla	Xã Kông Pla	Kong Pla Commune	kong_pla	625	10
23674	Đăk HLơ	Dak HLo	Xã Đăk HLơ	Dak HLo Commune	dak_hlo	625	10
23677	Đăk Đoa	Dak Doa	Thị trấn Đăk Đoa	Dak Doa Township	dak_doa	626	9
23680	Hà Đông	Ha Dong	Xã Hà Đông	Ha Dong Commune	ha_dong	626	10
23683	Đăk Sơmei	Dak Somei	Xã Đăk Sơmei	Dak Somei Commune	dak_somei	626	10
23684	Đăk Krong	Dak Krong	Xã Đăk Krong	Dak Krong Commune	dak_krong	626	10
23686	Hải Yang	Hai Yang	Xã Hải Yang	Hai Yang Commune	hai_yang	626	10
23689	Kon Gang	Kon Gang	Xã Kon Gang	Kon Gang Commune	kon_gang	626	10
23692	Hà Bầu	Ha Bau	Xã Hà Bầu	Ha Bau Commune	ha_bau	626	10
27316	08	08	Phường 08	08 Ward	08	774	8
23695	Nam Yang	Nam Yang	Xã Nam Yang	Nam Yang Commune	nam_yang	626	10
23698	K' Dang	K' Dang	Xã K' Dang	K' Dang Commune	k'_dang	626	10
23701	H' Neng	H' Neng	Xã H' Neng	H' Neng Commune	h'_neng	626	10
23704	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	626	10
23707	Glar	Glar	Xã Glar	Glar Commune	glar	626	10
23710	A Dơk	A Dok	Xã A Dơk	A Dok Commune	a_dok	626	10
23713	Trang	Trang	Xã Trang	Trang Commune	trang	626	10
23714	HNol	HNol	Xã HNol	HNol Commune	hnol	626	10
23716	Ia Pết	Ia Pet	Xã Ia Pết	Ia Pet Commune	ia_pet	626	10
23719	Ia Băng	Ia Bang	Xã Ia Băng	Ia Bang Commune	ia_bang	626	10
23722	Phú Hòa	Phu Hoa	Thị trấn Phú Hòa	Phu Hoa Township	phu_hoa	627	9
23725	Hà Tây	Ha Tay	Xã Hà Tây	Ha Tay Commune	ha_tay	627	10
23728	Ia Khươl	Ia Khuol	Xã Ia Khươl	Ia Khuol Commune	ia_khuol	627	10
23731	Ia Phí	Ia Phi	Xã Ia Phí	Ia Phi Commune	ia_phi	627	10
23734	Ia Ly	Ia Ly	Thị trấn Ia Ly	Ia Ly Township	ia_ly	627	9
23737	Ia Mơ Nông	Ia Mo Nong	Xã Ia Mơ Nông	Ia Mo Nong Commune	ia_mo_nong	627	10
23738	Ia Kreng	Ia Kreng	Xã Ia Kreng	Ia Kreng Commune	ia_kreng	627	10
23740	Đăk Tơ Ver	Dak To Ver	Xã Đăk Tơ Ver	Dak To Ver Commune	dak_to_ver	627	10
23743	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	627	10
23746	Chư Đăng Ya	Chu Dang Ya	Xã Chư Đăng Ya	Chu Dang Ya Commune	chu_dang_ya	627	10
23749	Ia Ka	Ia Ka	Xã Ia Ka	Ia Ka Commune	ia_ka	627	10
23752	Ia Nhin	Ia Nhin	Xã Ia Nhin	Ia Nhin Commune	ia_nhin	627	10
23755	Nghĩa Hòa	Nghia Hoa	Xã Nghĩa Hòa	Nghia Hoa Commune	nghia_hoa	627	10
23761	Nghĩa Hưng	Nghia Hung	Xã Nghĩa Hưng	Nghia Hung Commune	nghia_hung	627	10
23764	Ia Kha	Ia Kha	Thị trấn Ia Kha	Ia Kha Township	ia_kha	628	9
23767	Ia Sao	Ia Sao	Xã Ia Sao	Ia Sao Commune	ia_sao	628	10
23768	Ia Yok	Ia Yok	Xã Ia Yok	Ia Yok Commune	ia_yok	628	10
23770	Ia Hrung	Ia Hrung	Xã Ia Hrung	Ia Hrung Commune	ia_hrung	628	10
23771	Ia Bă	Ia Ba	Xã Ia Bă	Ia Ba Commune	ia_ba	628	10
23773	Ia Khai	Ia Khai	Xã Ia Khai	Ia Khai Commune	ia_khai	628	10
23776	Ia KRai	Ia KRai	Xã Ia KRai	Ia KRai Commune	ia_krai	628	10
23778	Ia Grăng	Ia Grang	Xã Ia Grăng	Ia Grang Commune	ia_grang	628	10
23779	Ia Tô	Ia To	Xã Ia Tô	Ia To Commune	ia_to	628	10
23782	Ia O	Ia O	Xã Ia O	Ia O Commune	ia_o	628	10
23785	Ia Dêr	Ia Der	Xã Ia Dêr	Ia Der Commune	ia_der	628	10
23788	Ia Chia	Ia Chia	Xã Ia Chia	Ia Chia Commune	ia_chia	628	10
23791	Ia Pếch	Ia Pech	Xã Ia Pếch	Ia Pech Commune	ia_pech	628	10
23794	Kon Dơng	Kon Dong	Thị trấn Kon Dơng	Kon Dong Township	kon_dong	629	9
23797	Ayun	Ayun	Xã Ayun	Ayun Commune	ayun	629	10
23798	Đak Jơ Ta	Dak Jo Ta	Xã Đak Jơ Ta	Dak Jo Ta Commune	dak_jo_ta	629	10
23799	Đak Ta Ley	Dak Ta Ley	Xã Đak Ta Ley	Dak Ta Ley Commune	dak_ta_ley	629	10
23800	Hra	Hra	Xã Hra	Hra Commune	hra	629	10
23803	Đăk Yă	Dak Ya	Xã Đăk Yă	Dak Ya Commune	dak_ya	629	10
23806	Đăk Djrăng	Dak Djrang	Xã Đăk Djrăng	Dak Djrang Commune	dak_djrang	629	10
23809	Lơ Pang	Lo Pang	Xã Lơ Pang	Lo Pang Commune	lo_pang	629	10
23812	Kon Thụp	Kon Thup	Xã Kon Thụp	Kon Thup Commune	kon_thup	629	10
23815	Đê Ar	De Ar	Xã Đê Ar	De Ar Commune	de_ar	629	10
23818	Kon Chiêng	Kon Chieng	Xã Kon Chiêng	Kon Chieng Commune	kon_chieng	629	10
23821	Đăk Trôi	Dak Troi	Xã Đăk Trôi	Dak Troi Commune	dak_troi	629	10
23824	Kông Chro	Kong Chro	Thị trấn Kông Chro	Kong Chro Township	kong_chro	630	9
23827	Chư Krêy	Chu Krey	Xã Chư Krêy	Chu Krey Commune	chu_krey	630	10
23830	An Trung	An Trung	Xã An Trung	An Trung Commune	an_trung	630	10
23833	Kông Yang	Kong Yang	Xã Kông Yang	Kong Yang Commune	kong_yang	630	10
23836	Đăk Tơ Pang	Dak To Pang	Xã Đăk Tơ Pang	Dak To Pang Commune	dak_to_pang	630	10
23839	SRó	SRo	Xã SRó	SRo Commune	sro	630	10
23840	Đắk Kơ Ning	Dak Ko Ning	Xã Đắk Kơ Ning	Dak Ko Ning Commune	dak_ko_ning	630	10
23842	Đăk Song	Dak Song	Xã Đăk Song	Dak Song Commune	dak_song	630	10
23843	Đăk Pling	Dak Pling	Xã Đăk Pling	Dak Pling Commune	dak_pling	630	10
23845	Yang Trung	Yang Trung	Xã Yang Trung	Yang Trung Commune	yang_trung	630	10
23846	Đăk Pơ Pho	Dak Po Pho	Xã Đăk Pơ Pho	Dak Po Pho Commune	dak_po_pho	630	10
23848	Ya Ma	Ya Ma	Xã Ya Ma	Ya Ma Commune	ya_ma	630	10
23851	Chơ Long	Cho Long	Xã Chơ Long	Cho Long Commune	cho_long	630	10
23854	Yang Nam	Yang Nam	Xã Yang Nam	Yang Nam Commune	yang_nam	630	10
23857	Chư Ty	Chu Ty	Thị trấn Chư Ty	Chu Ty Township	chu_ty	631	9
23860	Ia Dơk	Ia Dok	Xã Ia Dơk	Ia Dok Commune	ia_dok	631	10
23863	Ia Krêl	Ia Krel	Xã Ia Krêl	Ia Krel Commune	ia_krel	631	10
23866	Ia Din	Ia Din	Xã Ia Din	Ia Din Commune	ia_din	631	10
23869	Ia Kla	Ia Kla	Xã Ia Kla	Ia Kla Commune	ia_kla	631	10
23872	Ia Dom	Ia Dom	Xã Ia Dom	Ia Dom Commune	ia_dom	631	10
23875	Ia Lang	Ia Lang	Xã Ia Lang	Ia Lang Commune	ia_lang	631	10
23878	Ia Kriêng	Ia Krieng	Xã Ia Kriêng	Ia Krieng Commune	ia_krieng	631	10
23881	Ia Pnôn	Ia Pnon	Xã Ia Pnôn	Ia Pnon Commune	ia_pnon	631	10
23884	Ia Nan	Ia Nan	Xã Ia Nan	Ia Nan Commune	ia_nan	631	10
23887	Chư Prông	Chu Prong	Thị trấn Chư Prông	Chu Prong Township	chu_prong	632	9
23888	Ia Kly	Ia Kly	Xã Ia Kly	Ia Kly Commune	ia_kly	632	10
23890	Bình Giáo	Binh Giao	Xã Bình Giáo	Binh Giao Commune	binh_giao	632	10
23893	Ia Drăng	Ia Drang	Xã Ia Drăng	Ia Drang Commune	ia_drang	632	10
23896	Thăng Hưng	Thang Hung	Xã Thăng Hưng	Thang Hung Commune	thang_hung	632	10
23899	Bàu Cạn	Bau Can	Xã Bàu Cạn	Bau Can Commune	bau_can	632	10
23902	Ia Phìn	Ia Phin	Xã Ia Phìn	Ia Phin Commune	ia_phin	632	10
23905	Ia Băng	Ia Bang	Xã Ia Băng	Ia Bang Commune	ia_bang	632	10
23908	Ia Tôr	Ia Tor	Xã Ia Tôr	Ia Tor Commune	ia_tor	632	10
23911	Ia Boòng	Ia Boong	Xã Ia Boòng	Ia Boong Commune	ia_boong	632	10
23914	Ia O	Ia O	Xã Ia O	Ia O Commune	ia_o	632	10
23917	Ia Púch	Ia Puch	Xã Ia Púch	Ia Puch Commune	ia_puch	632	10
23920	Ia Me	Ia Me	Xã Ia Me	Ia Me Commune	ia_me	632	10
23923	Ia Vê	Ia Ve	Xã Ia Vê	Ia Ve Commune	ia_ve	632	10
23924	Ia Bang	Ia Bang	Xã Ia Bang	Ia Bang Commune	ia_bang	632	10
23926	Ia Pia	Ia Pia	Xã Ia Pia	Ia Pia Commune	ia_pia	632	10
23929	Ia Ga	Ia Ga	Xã Ia Ga	Ia Ga Commune	ia_ga	632	10
23932	Ia Lâu	Ia Lau	Xã Ia Lâu	Ia Lau Commune	ia_lau	632	10
23935	Ia Piơr	Ia Pior	Xã Ia Piơr	Ia Pior Commune	ia_pior	632	10
23938	Ia Mơ	Ia Mo	Xã Ia Mơ	Ia Mo Commune	ia_mo	632	10
23941	Chư Sê	Chu Se	Thị trấn Chư Sê	Chu Se Township	chu_se	633	9
23944	Ia Tiêm	Ia Tiem	Xã Ia Tiêm	Ia Tiem Commune	ia_tiem	633	10
23945	Chư Pơng	Chu Pong	Xã Chư Pơng	Chu Pong Commune	chu_pong	633	10
23946	Bar Măih	Bar Maih	Xã Bar Măih	Bar Maih Commune	bar_maih	633	10
23947	Bờ Ngoong	Bo Ngoong	Xã Bờ Ngoong	Bo Ngoong Commune	bo_ngoong	633	10
23950	Ia Glai	Ia Glai	Xã Ia Glai	Ia Glai Commune	ia_glai	633	10
23953	AL Bá	AL Ba	Xã AL Bá	AL Ba Commune	al_ba	633	10
23954	Kông HTok	Kong HTok	Xã Kông HTok	Kong HTok Commune	kong_htok	633	10
23956	AYun	AYun	Xã AYun	AYun Commune	ayun	633	10
23959	Ia HLốp	Ia HLop	Xã Ia HLốp	Ia HLop Commune	ia_hlop	633	10
23962	Ia Blang	Ia Blang	Xã Ia Blang	Ia Blang Commune	ia_blang	633	10
23965	Dun	Dun	Xã Dun	Dun Commune	dun	633	10
23966	Ia Pal	Ia Pal	Xã Ia Pal	Ia Pal Commune	ia_pal	633	10
23968	H Bông	H Bong	Xã H Bông	H Bong Commune	h_bong	633	10
23977	Ia Ko	Ia Ko	Xã Ia Ko	Ia Ko Commune	ia_ko	633	10
23989	Hà Tam	Ha Tam	Xã Hà Tam	Ha Tam Commune	ha_tam	634	10
23992	An Thành	An Thanh	Xã An Thành	An Thanh Commune	an_thanh	634	10
23995	Đak Pơ	Dak Po	Thị trấn Đak Pơ	Dak Po Township	dak_po	634	9
23998	Yang Bắc	Yang Bac	Xã Yang Bắc	Yang Bac Commune	yang_bac	634	10
24001	Cư An	Cu An	Xã Cư An	Cu An Commune	cu_an	634	10
24004	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	634	10
24007	Phú An	Phu An	Xã Phú An	Phu An Commune	phu_an	634	10
24010	Ya Hội	Ya Hoi	Xã Ya Hội	Ya Hoi Commune	ya_hoi	634	10
24013	Pờ Tó	Po To	Xã Pờ Tó	Po To Commune	po_to	635	10
24016	Chư Răng	Chu Rang	Xã Chư Răng	Chu Rang Commune	chu_rang	635	10
24019	Ia KDăm	Ia KDam	Xã Ia KDăm	Ia KDam Commune	ia_kdam	635	10
24022	Kim Tân	Kim Tan	Xã Kim Tân	Kim Tan Commune	kim_tan	635	10
24025	Chư Mố	Chu Mo	Xã Chư Mố	Chu Mo Commune	chu_mo	635	10
24028	Ia Tul	Ia Tul	Xã Ia Tul	Ia Tul Commune	ia_tul	635	10
24031	Ia Ma Rơn	Ia Ma Ron	Xã Ia Ma Rơn	Ia Ma Ron Commune	ia_ma_ron	635	10
24034	Ia Broăi	Ia Broai	Xã Ia Broăi	Ia Broai Commune	ia_broai	635	10
24037	Ia Trok	Ia Trok	Xã Ia Trok	Ia Trok Commune	ia_trok	635	10
24076	Phú Túc	Phu Tuc	Thị trấn Phú Túc	Phu Tuc Township	phu_tuc	637	9
24079	Ia RSai	Ia RSai	Xã Ia RSai	Ia RSai Commune	ia_rsai	637	10
24082	Ia RSươm	Ia RSuom	Xã Ia RSươm	Ia RSuom Commune	ia_rsuom	637	10
24085	Chư Gu	Chu Gu	Xã Chư Gu	Chu Gu Commune	chu_gu	637	10
24088	Đất Bằng	Dat Bang	Xã Đất Bằng	Dat Bang Commune	dat_bang	637	10
24091	Ia Mláh	Ia Mlah	Xã Ia Mláh	Ia Mlah Commune	ia_mlah	637	10
24094	Chư Drăng	Chu Drang	Xã Chư Drăng	Chu Drang Commune	chu_drang	637	10
24097	Phú Cần	Phu Can	Xã Phú Cần	Phu Can Commune	phu_can	637	10
24100	Ia HDreh	Ia HDreh	Xã Ia HDreh	Ia HDreh Commune	ia_hdreh	637	10
24106	Chư Ngọc	Chu Ngoc	Xã Chư Ngọc	Chu Ngoc Commune	chu_ngoc	637	10
24109	Uar	Uar	Xã Uar	Uar Commune	uar	637	10
24112	Chư Rcăm	Chu Rcam	Xã Chư Rcăm	Chu Rcam Commune	chu_rcam	637	10
24115	Krông Năng	Krong Nang	Xã Krông Năng	Krong Nang Commune	krong_nang	637	10
24043	Phú Thiện	Phu Thien	Thị trấn Phú Thiện	Phu Thien Township	phu_thien	638	9
24046	Chư A Thai	Chu A Thai	Xã Chư A Thai	Chu A Thai Commune	chu_a_thai	638	10
24048	Ayun Hạ	Ayun Ha	Xã Ayun Hạ	Ayun Ha Commune	ayun_ha	638	10
24049	Ia Ake	Ia Ake	Xã Ia Ake	Ia Ake Commune	ia_ake	638	10
24052	Ia Sol	Ia Sol	Xã Ia Sol	Ia Sol Commune	ia_sol	638	10
24055	Ia Piar	Ia Piar	Xã Ia Piar	Ia Piar Commune	ia_piar	638	10
24058	Ia Peng	Ia Peng	Xã Ia Peng	Ia Peng Commune	ia_peng	638	10
24060	Chrôh Pơnan	Chroh Ponan	Xã Chrôh Pơnan	Chroh Ponan Commune	chroh_ponan	638	10
24061	Ia Hiao	Ia Hiao	Xã Ia Hiao	Ia Hiao Commune	ia_hiao	638	10
24067	Ia Yeng	Ia Yeng	Xã Ia Yeng	Ia Yeng Commune	ia_yeng	638	10
23942	Nhơn Hoà	Nhon Hoa	Thị trấn Nhơn Hoà	Nhon Hoa Township	nhon_hoa	639	9
23971	Ia Hrú	Ia Hru	Xã Ia Hrú	Ia Hru Commune	ia_hru	639	10
23972	Ia Rong	Ia Rong	Xã Ia Rong	Ia Rong Commune	ia_rong	639	10
23974	Ia Dreng	Ia Dreng	Xã Ia Dreng	Ia Dreng Commune	ia_dreng	639	10
23978	Ia Hla	Ia Hla	Xã Ia Hla	Ia Hla Commune	ia_hla	639	10
23980	Chư Don	Chu Don	Xã Chư Don	Chu Don Commune	chu_don	639	10
23983	Ia Phang	Ia Phang	Xã Ia Phang	Ia Phang Commune	ia_phang	639	10
23986	Ia Le	Ia Le	Xã Ia Le	Ia Le Commune	ia_le	639	10
23987	Ia BLứ	Ia BLu	Xã Ia BLứ	Ia BLu Commune	ia_blu	639	10
24118	Tân Lập	Tan Lap	Phường Tân Lập	Tan Lap Ward	tan_lap	643	8
24121	Tân Hòa	Tan Hoa	Phường Tân Hòa	Tan Hoa Ward	tan_hoa	643	8
24124	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	643	8
24127	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	643	8
24130	Thành Nhất	Thanh Nhat	Phường Thành Nhất	Thanh Nhat Ward	thanh_nhat	643	8
24133	Thắng Lợi	Thang Loi	Phường Thắng Lợi	Thang Loi Ward	thang_loi	643	8
24136	Tân Lợi	Tan Loi	Phường Tân Lợi	Tan Loi Ward	tan_loi	643	8
24139	Thành Công	Thanh Cong	Phường Thành Công	Thanh Cong Ward	thanh_cong	643	8
24142	Tân Thành	Tan Thanh	Phường Tân Thành	Tan Thanh Ward	tan_thanh	643	8
24145	Tân Tiến	Tan Tien	Phường Tân Tiến	Tan Tien Ward	tan_tien	643	8
24148	Tự An	Tu An	Phường Tự An	Tu An Ward	tu_an	643	8
24151	Ea Tam	Ea Tam	Phường Ea Tam	Ea Tam Ward	ea_tam	643	8
24154	Khánh Xuân	Khanh Xuan	Phường Khánh Xuân	Khanh Xuan Ward	khanh_xuan	643	8
24157	Hòa Thuận	Hoa Thuan	Xã Hòa Thuận	Hoa Thuan Commune	hoa_thuan	643	10
24160	Cư ÊBur	Cu EBur	Xã Cư ÊBur	Cu EBur Commune	cu_ebur	643	10
24163	Ea Tu	Ea Tu	Xã Ea Tu	Ea Tu Commune	ea_tu	643	10
24166	Hòa Thắng	Hoa Thang	Xã Hòa Thắng	Hoa Thang Commune	hoa_thang	643	10
24169	Ea Kao	Ea Kao	Xã Ea Kao	Ea Kao Commune	ea_kao	643	10
24172	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	643	10
24175	Hòa Khánh	Hoa Khanh	Xã Hòa Khánh	Hoa Khanh Commune	hoa_khanh	643	10
24178	Hòa Xuân	Hoa Xuan	Xã Hòa Xuân	Hoa Xuan Commune	hoa_xuan	643	10
24305	An Lạc	An Lac	Phường An Lạc	An Lac Ward	an_lac	644	8
24308	An Bình	An Binh	Phường An Bình	An Binh Ward	an_binh	644	8
24311	Thiện An	Thien An	Phường Thiện An	Thien An Ward	thien_an	644	8
24318	Đạt Hiếu	Dat Hieu	Phường Đạt Hiếu	Dat Hieu Ward	dat_hieu	644	8
24322	Đoàn Kết	Doan Ket	Phường Đoàn Kết	Doan Ket Ward	doan_ket	644	8
24325	Ea Blang	Ea Blang	Xã Ea Blang	Ea Blang Commune	ea_blang	644	10
24328	Ea Drông	Ea Drong	Xã Ea Drông	Ea Drong Commune	ea_drong	644	10
24331	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	644	8
24332	Bình Tân	Binh Tan	Phường Bình Tân	Binh Tan Ward	binh_tan	644	8
24334	Ea Siên	Ea Sien	Xã Ea Siên	Ea Sien Commune	ea_sien	644	10
24337	Bình Thuận	Binh Thuan	Xã Bình Thuận	Binh Thuan Commune	binh_thuan	644	10
24340	Cư Bao	Cu Bao	Xã Cư Bao	Cu Bao Commune	cu_bao	644	10
24181	Ea Drăng	Ea Drang	Thị trấn Ea Drăng	Ea Drang Township	ea_drang	645	9
24184	Ea H'leo	Ea H'leo	Xã Ea H'leo	Ea H'leo Commune	ea_h'leo	645	10
24187	Ea Sol	Ea Sol	Xã Ea Sol	Ea Sol Commune	ea_sol	645	10
24190	Ea Ral	Ea Ral	Xã Ea Ral	Ea Ral Commune	ea_ral	645	10
24193	Ea Wy	Ea Wy	Xã Ea Wy	Ea Wy Commune	ea_wy	645	10
24194	Cư A Mung	Cu A Mung	Xã Cư A Mung	Cu A Mung Commune	cu_a_mung	645	10
24196	Cư Mốt	Cu Mot	Xã Cư Mốt	Cu Mot Commune	cu_mot	645	10
24199	Ea Hiao	Ea Hiao	Xã Ea Hiao	Ea Hiao Commune	ea_hiao	645	10
24202	Ea Khal	Ea Khal	Xã Ea Khal	Ea Khal Commune	ea_khal	645	10
24205	Dliê Yang	Dlie Yang	Xã Dliê Yang	Dlie Yang Commune	dlie_yang	645	10
24207	Ea Tir	Ea Tir	Xã Ea Tir	Ea Tir Commune	ea_tir	645	10
24208	Ea Nam	Ea Nam	Xã Ea Nam	Ea Nam Commune	ea_nam	645	10
24211	Ea Súp	Ea Sup	Thị trấn Ea Súp	Ea Sup Township	ea_sup	646	9
24214	Ia Lốp	Ia Lop	Xã Ia Lốp	Ia Lop Commune	ia_lop	646	10
24215	Ia JLơi	Ia JLoi	Xã Ia JLơi	Ia JLoi Commune	ia_jloi	646	10
24217	Ea Rốk	Ea Rok	Xã Ea Rốk	Ea Rok Commune	ea_rok	646	10
24220	Ya Tờ Mốt	Ya To Mot	Xã Ya Tờ Mốt	Ya To Mot Commune	ya_to_mot	646	10
24221	Ia RVê	Ia RVe	Xã Ia RVê	Ia RVe Commune	ia_rve	646	10
24223	Ea Lê	Ea Le	Xã Ea Lê	Ea Le Commune	ea_le	646	10
24226	Cư KBang	Cu KBang	Xã Cư KBang	Cu KBang Commune	cu_kbang	646	10
24229	Ea Bung	Ea Bung	Xã Ea Bung	Ea Bung Commune	ea_bung	646	10
24232	Cư M'Lan	Cu M'Lan	Xã Cư M'Lan	Cu M'Lan Commune	cu_m'lan	646	10
24235	Krông Na	Krong Na	Xã Krông Na	Krong Na Commune	krong_na	647	10
24238	Ea Huar	Ea Huar	Xã Ea Huar	Ea Huar Commune	ea_huar	647	10
24241	Ea Wer	Ea Wer	Xã Ea Wer	Ea Wer Commune	ea_wer	647	10
24244	Tân Hoà	Tan Hoa	Xã Tân Hoà	Tan Hoa Commune	tan_hoa	647	10
24247	Cuôr KNia	Cuor KNia	Xã Cuôr KNia	Cuor KNia Commune	cuor_knia	647	10
24250	Ea Bar	Ea Bar	Xã Ea Bar	Ea Bar Commune	ea_bar	647	10
24253	Ea Nuôl	Ea Nuol	Xã Ea Nuôl	Ea Nuol Commune	ea_nuol	647	10
24256	Ea Pốk	Ea Pok	Thị trấn Ea Pốk	Ea Pok Township	ea_pok	648	9
24259	Quảng Phú	Quang Phu	Thị trấn Quảng Phú	Quang Phu Township	quang_phu	648	9
24262	Quảng Tiến	Quang Tien	Xã Quảng Tiến	Quang Tien Commune	quang_tien	648	10
24264	Ea Kuêh	Ea Kueh	Xã Ea Kuêh	Ea Kueh Commune	ea_kueh	648	10
24265	Ea Kiết	Ea Kiet	Xã Ea Kiết	Ea Kiet Commune	ea_kiet	648	10
24268	Ea Tar	Ea Tar	Xã Ea Tar	Ea Tar Commune	ea_tar	648	10
24271	Cư Dliê M'nông	Cu Dlie M'nong	Xã Cư Dliê M'nông	Cu Dlie M'nong Commune	cu_dlie_m'nong	648	10
24274	Ea H'đinh	Ea H'dinh	Xã Ea H'đinh	Ea H'dinh Commune	ea_h'dinh	648	10
24277	Ea Tul	Ea Tul	Xã Ea Tul	Ea Tul Commune	ea_tul	648	10
24280	Ea KPam	Ea KPam	Xã Ea KPam	Ea KPam Commune	ea_kpam	648	10
24283	Ea M'DRóh	Ea M'DRoh	Xã Ea M'DRóh	Ea M'DRoh Commune	ea_m'droh	648	10
24286	Quảng Hiệp	Quang Hiep	Xã Quảng Hiệp	Quang Hiep Commune	quang_hiep	648	10
24289	Cư M'gar	Cu M'gar	Xã Cư M'gar	Cu M'gar Commune	cu_m'gar	648	10
24292	Ea D'Rơng	Ea D'Rong	Xã Ea D'Rơng	Ea D'Rong Commune	ea_d'rong	648	10
24295	Ea M'nang	Ea M'nang	Xã Ea M'nang	Ea M'nang Commune	ea_m'nang	648	10
24298	Cư Suê	Cu Sue	Xã Cư Suê	Cu Sue Commune	cu_sue	648	10
24301	Cuor Đăng	Cuor Dang	Xã Cuor Đăng	Cuor Dang Commune	cuor_dang	648	10
24307	Cư Né	Cu Ne	Xã Cư Né	Cu Ne Commune	cu_ne	649	10
24310	Chư KBô	Chu KBo	Xã Chư KBô	Chu KBo Commune	chu_kbo	649	10
24313	Cư Pơng	Cu Pong	Xã Cư Pơng	Cu Pong Commune	cu_pong	649	10
24314	Ea Sin	Ea Sin	Xã Ea Sin	Ea Sin Commune	ea_sin	649	10
24316	Pơng Drang	Pong Drang	Xã Pơng Drang	Pong Drang Commune	pong_drang	649	10
24317	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	649	10
24319	Ea Ngai	Ea Ngai	Xã Ea Ngai	Ea Ngai Commune	ea_ngai	649	10
24343	Krông Năng	Krong Nang	Thị trấn Krông Năng	Krong Nang Township	krong_nang	650	9
24346	ĐLiê Ya	DLie Ya	Xã ĐLiê Ya	DLie Ya Commune	dlie_ya	650	10
24349	Ea Tóh	Ea Toh	Xã Ea Tóh	Ea Toh Commune	ea_toh	650	10
24352	Ea Tam	Ea Tam	Xã Ea Tam	Ea Tam Commune	ea_tam	650	10
24355	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	650	10
24358	Tam Giang	Tam Giang	Xã Tam Giang	Tam Giang Commune	tam_giang	650	10
24359	Ea Puk	Ea Puk	Xã Ea Puk	Ea Puk Commune	ea_puk	650	10
24360	Ea Dăh	Ea Dah	Xã Ea Dăh	Ea Dah Commune	ea_dah	650	10
24361	Ea Hồ	Ea Ho	Xã Ea Hồ	Ea Ho Commune	ea_ho	650	10
24364	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	650	10
24367	Cư Klông	Cu Klong	Xã Cư Klông	Cu Klong Commune	cu_klong	650	10
24370	Ea Tân	Ea Tan	Xã Ea Tân	Ea Tan Commune	ea_tan	650	10
24373	Ea Kar	Ea Kar	Thị trấn Ea Kar	Ea Kar Township	ea_kar	651	9
24376	Ea Knốp	Ea Knop	Thị trấn Ea Knốp	Ea Knop Township	ea_knop	651	9
24379	Ea Sô	Ea So	Xã Ea Sô	Ea So Commune	ea_so	651	10
24380	Ea Sar	Ea Sar	Xã Ea Sar	Ea Sar Commune	ea_sar	651	10
24382	Xuân Phú	Xuan Phu	Xã Xuân Phú	Xuan Phu Commune	xuan_phu	651	10
24385	Cư Huê	Cu Hue	Xã Cư Huê	Cu Hue Commune	cu_hue	651	10
24388	Ea Tih	Ea Tih	Xã Ea Tih	Ea Tih Commune	ea_tih	651	10
24391	Ea Đar	Ea Dar	Xã Ea Đar	Ea Dar Commune	ea_dar	651	10
24394	Ea Kmút	Ea Kmut	Xã Ea Kmút	Ea Kmut Commune	ea_kmut	651	10
24397	Cư Ni	Cu Ni	Xã Cư Ni	Cu Ni Commune	cu_ni	651	10
24400	Ea Păl	Ea Pal	Xã Ea Păl	Ea Pal Commune	ea_pal	651	10
24401	Cư Prông	Cu Prong	Xã Cư Prông	Cu Prong Commune	cu_prong	651	10
24403	Ea Ô	Ea O	Xã Ea Ô	Ea O Commune	ea_o	651	10
24404	Cư ELang	Cu ELang	Xã Cư ELang	Cu ELang Commune	cu_elang	651	10
24406	Cư Bông	Cu Bong	Xã Cư Bông	Cu Bong Commune	cu_bong	651	10
24409	Cư Jang	Cu Jang	Xã Cư Jang	Cu Jang Commune	cu_jang	651	10
24412	M'Đrắk	M'Drak	Thị trấn M'Đrắk	M'Drak Township	m'drak	652	9
24415	Cư Prao	Cu Prao	Xã Cư Prao	Cu Prao Commune	cu_prao	652	10
24418	Ea Pil	Ea Pil	Xã Ea Pil	Ea Pil Commune	ea_pil	652	10
24421	Ea Lai	Ea Lai	Xã Ea Lai	Ea Lai Commune	ea_lai	652	10
24424	Ea H'MLay	Ea H'MLay	Xã Ea H'MLay	Ea H'MLay Commune	ea_h'mlay	652	10
24427	Krông Jing	Krong Jing	Xã Krông Jing	Krong Jing Commune	krong_jing	652	10
24430	Ea M' Doal	Ea M' Doal	Xã Ea M' Doal	Ea M' Doal Commune	ea_m'_doal	652	10
24433	Ea Riêng	Ea Rieng	Xã Ea Riêng	Ea Rieng Commune	ea_rieng	652	10
24436	Cư M'ta	Cu M'ta	Xã Cư M'ta	Cu M'ta Commune	cu_m'ta	652	10
24439	Cư K Róa	Cu K Roa	Xã Cư K Róa	Cu K Roa Commune	cu_k_roa	652	10
24442	Krông Á	Krong A	Xã Krông Á	Krong A Commune	krong_a	652	10
24444	Cư San	Cu San	Xã Cư San	Cu San Commune	cu_san	652	10
24445	Ea Trang	Ea Trang	Xã Ea Trang	Ea Trang Commune	ea_trang	652	10
24448	Krông Kmar	Krong Kmar	Thị trấn Krông Kmar	Krong Kmar Township	krong_kmar	653	9
24451	Dang Kang	Dang Kang	Xã Dang Kang	Dang Kang Commune	dang_kang	653	10
24454	Cư KTy	Cu KTy	Xã Cư KTy	Cu KTy Commune	cu_kty	653	10
24457	Hòa Thành	Hoa Thanh	Xã Hòa Thành	Hoa Thanh Commune	hoa_thanh	653	10
24460	Hòa Tân	Hoa Tan	Xã Hòa Tân	Hoa Tan Commune	hoa_tan	653	10
24463	Hòa Phong	Hoa Phong	Xã Hòa Phong	Hoa Phong Commune	hoa_phong	653	10
24466	Hòa Lễ	Hoa Le	Xã Hòa Lễ	Hoa Le Commune	hoa_le	653	10
24469	Yang Reh	Yang Reh	Xã Yang Reh	Yang Reh Commune	yang_reh	653	10
24472	Ea Trul	Ea Trul	Xã Ea Trul	Ea Trul Commune	ea_trul	653	10
24475	Khuê Ngọc Điền	Khue Ngoc Dien	Xã Khuê Ngọc Điền	Khue Ngoc Dien Commune	khue_ngoc_dien	653	10
24478	Cư Pui	Cu Pui	Xã Cư Pui	Cu Pui Commune	cu_pui	653	10
24481	Hòa Sơn	Hoa Son	Xã Hòa Sơn	Hoa Son Commune	hoa_son	653	10
24484	Cư Drăm	Cu Dram	Xã Cư Drăm	Cu Dram Commune	cu_dram	653	10
24487	Yang Mao	Yang Mao	Xã Yang Mao	Yang Mao Commune	yang_mao	653	10
24490	Phước An	Phuoc An	Thị trấn Phước An	Phuoc An Township	phuoc_an	654	9
24493	KRông Búk	KRong Buk	Xã KRông Búk	KRong Buk Commune	krong_buk	654	10
24496	Ea Kly	Ea Kly	Xã Ea Kly	Ea Kly Commune	ea_kly	654	10
24499	Ea Kênh	Ea Kenh	Xã Ea Kênh	Ea Kenh Commune	ea_kenh	654	10
24502	Ea Phê	Ea Phe	Xã Ea Phê	Ea Phe Commune	ea_phe	654	10
24505	Ea KNuec	Ea KNuec	Xã Ea KNuec	Ea KNuec Commune	ea_knuec	654	10
24508	Ea Yông	Ea Yong	Xã Ea Yông	Ea Yong Commune	ea_yong	654	10
24511	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	654	10
24514	Ea Kuăng	Ea Kuang	Xã Ea Kuăng	Ea Kuang Commune	ea_kuang	654	10
24517	Hòa Đông	Hoa Dong	Xã Hòa Đông	Hoa Dong Commune	hoa_dong	654	10
24520	Ea Hiu	Ea Hiu	Xã Ea Hiu	Ea Hiu Commune	ea_hiu	654	10
24523	Hòa Tiến	Hoa Tien	Xã Hòa Tiến	Hoa Tien Commune	hoa_tien	654	10
24526	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	654	10
24529	Vụ Bổn	Vu Bon	Xã Vụ Bổn	Vu Bon Commune	vu_bon	654	10
24532	Ea Uy	Ea Uy	Xã Ea Uy	Ea Uy Commune	ea_uy	654	10
24535	Ea Yiêng	Ea Yieng	Xã Ea Yiêng	Ea Yieng Commune	ea_yieng	654	10
24538	Buôn Trấp	Buon Trap	Thị trấn Buôn Trấp	Buon Trap Township	buon_trap	655	9
24556	Dray Sáp	Dray Sap	Xã Dray Sáp	Dray Sap Commune	dray_sap	655	10
24559	Ea Na	Ea Na	Xã Ea Na	Ea Na Commune	ea_na	655	10
24565	Ea Bông	Ea Bong	Xã Ea Bông	Ea Bong Commune	ea_bong	655	10
24568	Băng A Drênh	Bang A Drenh	Xã Băng A Drênh	Bang A Drenh Commune	bang_a_drenh	655	10
24571	Dur KMăl	Dur KMal	Xã Dur KMăl	Dur KMal Commune	dur_kmal	655	10
24574	Bình Hòa	Binh Hoa	Xã Bình Hòa	Binh Hoa Commune	binh_hoa	655	10
24577	Quảng Điền	Quang Dien	Xã Quảng Điền	Quang Dien Commune	quang_dien	655	10
24580	Liên Sơn	Lien Son	Thị trấn Liên Sơn	Lien Son Township	lien_son	656	9
24583	Yang Tao	Yang Tao	Xã Yang Tao	Yang Tao Commune	yang_tao	656	10
24586	Bông Krang	Bong Krang	Xã Bông Krang	Bong Krang Commune	bong_krang	656	10
24589	Đắk Liêng	Dak Lieng	Xã Đắk Liêng	Dak Lieng Commune	dak_lieng	656	10
24592	Buôn Triết	Buon Triet	Xã Buôn Triết	Buon Triet Commune	buon_triet	656	10
24595	Buôn Tría	Buon Tria	Xã Buôn Tría	Buon Tria Commune	buon_tria	656	10
24598	Đắk Phơi	Dak Phoi	Xã Đắk Phơi	Dak Phoi Commune	dak_phoi	656	10
24601	Đắk Nuê	Dak Nue	Xã Đắk Nuê	Dak Nue Commune	dak_nue	656	10
24604	Krông Nô	Krong No	Xã Krông Nô	Krong No Commune	krong_no	656	10
24607	Nam Ka	Nam Ka	Xã Nam Ka	Nam Ka Commune	nam_ka	656	10
24610	Ea R'Bin	Ea R'Bin	Xã Ea R'Bin	Ea R'Bin Commune	ea_r'bin	656	10
24540	Ea Ning	Ea Ning	Xã Ea Ning	Ea Ning Commune	ea_ning	657	10
24541	Cư Ê Wi	Cu E Wi	Xã Cư Ê Wi	Cu E Wi Commune	cu_e_wi	657	10
24544	Ea Ktur	Ea Ktur	Xã Ea Ktur	Ea Ktur Commune	ea_ktur	657	10
24547	Ea Tiêu	Ea Tieu	Xã Ea Tiêu	Ea Tieu Commune	ea_tieu	657	10
24550	Ea BHốk	Ea BHok	Xã Ea BHốk	Ea BHok Commune	ea_bhok	657	10
24553	Ea Hu	Ea Hu	Xã Ea Hu	Ea Hu Commune	ea_hu	657	10
24561	Dray Bhăng	Dray Bhang	Xã Dray Bhăng	Dray Bhang Commune	dray_bhang	657	10
24562	Hòa Hiệp	Hoa Hiep	Xã Hòa Hiệp	Hoa Hiep Commune	hoa_hiep	657	10
24611	Nghĩa Đức	Nghia Duc	Phường Nghĩa Đức	Nghia Duc Ward	nghia_duc	660	8
24612	Nghĩa Thành	Nghia Thanh	Phường Nghĩa Thành	Nghia Thanh Ward	nghia_thanh	660	8
24614	Nghĩa Phú	Nghia Phu	Phường Nghĩa Phú	Nghia Phu Ward	nghia_phu	660	8
24615	Nghĩa Tân	Nghia Tan	Phường Nghĩa Tân	Nghia Tan Ward	nghia_tan	660	8
24617	Nghĩa Trung	Nghia Trung	Phường Nghĩa Trung	Nghia Trung Ward	nghia_trung	660	8
24618	Đăk R'Moan	Dak R'Moan	Xã Đăk R'Moan	Dak R'Moan Commune	dak_r'moan	660	10
24619	Quảng Thành	Quang Thanh	Phường Quảng Thành	Quang Thanh Ward	quang_thanh	660	8
24628	Đắk Nia	Dak Nia	Xã Đắk Nia	Dak Nia Commune	dak_nia	660	10
24616	Quảng Sơn	Quang Son	Xã Quảng Sơn	Quang Son Commune	quang_son	661	10
24620	Quảng Hoà	Quang Hoa	Xã Quảng Hoà	Quang Hoa Commune	quang_hoa	661	10
24622	Đắk Ha	Dak Ha	Xã Đắk Ha	Dak Ha Commune	dak_ha	661	10
24625	Đắk R'Măng	Dak R'Mang	Xã Đắk R'Măng	Dak R'Mang Commune	dak_r'mang	661	10
24631	Quảng Khê	Quang Khe	Xã Quảng Khê	Quang Khe Commune	quang_khe	661	10
24634	Đắk Plao	Dak Plao	Xã Đắk Plao	Dak Plao Commune	dak_plao	661	10
24637	Đắk Som	Dak Som	Xã Đắk Som	Dak Som Commune	dak_som	661	10
24640	Ea T'Ling	Ea T'Ling	Thị trấn Ea T'Ling	Ea T'Ling Township	ea_t'ling	662	9
24643	Đắk Wil	Dak Wil	Xã Đắk Wil	Dak Wil Commune	dak_wil	662	10
24646	Ea Pô	Ea Po	Xã Ea Pô	Ea Po Commune	ea_po	662	10
24649	Nam Dong	Nam Dong	Xã Nam Dong	Nam Dong Commune	nam_dong	662	10
24652	Đắk DRông	Dak DRong	Xã Đắk DRông	Dak DRong Commune	dak_drong	662	10
24655	Tâm Thắng	Tam Thang	Xã Tâm Thắng	Tam Thang Commune	tam_thang	662	10
24658	Cư Knia	Cu Knia	Xã Cư Knia	Cu Knia Commune	cu_knia	662	10
24661	Trúc Sơn	Truc Son	Xã Trúc Sơn	Truc Son Commune	truc_son	662	10
24664	Đắk Mil	Dak Mil	Thị trấn Đắk Mil	Dak Mil Township	dak_mil	663	9
24667	 Đắk Lao	 Dak Lao	Xã  Đắk Lao	 Dak Lao Commune	_dak_lao	663	10
24670	Đắk R'La	Dak R'La	Xã Đắk R'La	Dak R'La Commune	dak_r'la	663	10
24673	Đắk Gằn	Dak Gan	Xã Đắk Gằn	Dak Gan Commune	dak_gan	663	10
24676	Đức Mạnh	Duc Manh	Xã Đức Mạnh	Duc Manh Commune	duc_manh	663	10
24677	Đắk N'Drót	Dak N'Drot	Xã Đắk N'Drót	Dak N'Drot Commune	dak_n'drot	663	10
24678	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	663	10
24679	Đắk Sắk	Dak Sak	Xã Đắk Sắk	Dak Sak Commune	dak_sak	663	10
24682	Thuận An	Thuan An	Xã Thuận An	Thuan An Commune	thuan_an	663	10
24685	Đức Minh	Duc Minh	Xã Đức Minh	Duc Minh Commune	duc_minh	663	10
24688	Đắk Mâm	Dak Mam	Thị trấn Đắk Mâm	Dak Mam Township	dak_mam	664	9
27322	07	07	Phường 07	07 Ward	07	774	8
24691	Đắk Sôr	Dak Sor	Xã Đắk Sôr	Dak Sor Commune	dak_sor	664	10
24692	Nam Xuân	Nam Xuan	Xã Nam Xuân	Nam Xuan Commune	nam_xuan	664	10
24694	Buôn Choah	Buon Choah	Xã Buôn Choah	Buon Choah Commune	buon_choah	664	10
24697	Nam Đà	Nam Da	Xã Nam Đà	Nam Da Commune	nam_da	664	10
24699	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	664	10
24700	Đắk Drô	Dak Dro	Xã Đắk Drô	Dak Dro Commune	dak_dro	664	10
24703	Nâm Nung	Nam Nung	Xã Nâm Nung	Nam Nung Commune	nam_nung	664	10
24706	Đức Xuyên	Duc Xuyen	Xã Đức Xuyên	Duc Xuyen Commune	duc_xuyen	664	10
24709	Đắk Nang	Dak Nang	Xã Đắk Nang	Dak Nang Commune	dak_nang	664	10
24712	Quảng Phú	Quang Phu	Xã Quảng Phú	Quang Phu Commune	quang_phu	664	10
24715	Nâm N'Đir	Nam N'Dir	Xã Nâm N'Đir	Nam N'Dir Commune	nam_n'dir	664	10
24717	Đức An	Duc An	Thị trấn Đức An	Duc An Township	duc_an	665	9
24718	Đắk Môl	Dak Mol	Xã Đắk Môl	Dak Mol Commune	dak_mol	665	10
24719	Đắk Hòa	Dak Hoa	Xã Đắk Hòa	Dak Hoa Commune	dak_hoa	665	10
24721	Nam Bình	Nam Binh	Xã Nam Bình	Nam Binh Commune	nam_binh	665	10
24722	Thuận Hà	Thuan Ha	Xã Thuận Hà	Thuan Ha Commune	thuan_ha	665	10
24724	Thuận Hạnh	Thuan Hanh	Xã Thuận Hạnh	Thuan Hanh Commune	thuan_hanh	665	10
24727	Đắk N'Dung	Dak N'Dung	Xã Đắk N'Dung	Dak N'Dung Commune	dak_n'dung	665	10
24728	Nâm N'Jang	Nam N'Jang	Xã Nâm N'Jang	Nam N'Jang Commune	nam_n'jang	665	10
24730	Trường Xuân	Truong Xuan	Xã Trường Xuân	Truong Xuan Commune	truong_xuan	665	10
24733	Kiến Đức	Kien Duc	Thị trấn Kiến Đức	Kien Duc Township	kien_duc	666	9
24745	Quảng Tín	Quang Tin	Xã Quảng Tín	Quang Tin Commune	quang_tin	666	10
24750	Đắk Wer	Dak Wer	Xã Đắk Wer	Dak Wer Commune	dak_wer	666	10
24751	Nhân Cơ	Nhan Co	Xã Nhân Cơ	Nhan Co Commune	nhan_co	666	10
24754	Kiến Thành	Kien Thanh	Xã Kiến Thành	Kien Thanh Commune	kien_thanh	666	10
24756	Nghĩa Thắng	Nghia Thang	Xã Nghĩa Thắng	Nghia Thang Commune	nghia_thang	666	10
24757	Đạo Nghĩa	Dao Nghia	Xã Đạo Nghĩa	Dao Nghia Commune	dao_nghia	666	10
24760	Đắk Sin	Dak Sin	Xã Đắk Sin	Dak Sin Commune	dak_sin	666	10
24761	Hưng Bình	Hung Binh	Xã Hưng Bình	Hung Binh Commune	hung_binh	666	10
24763	Đắk Ru	Dak Ru	Xã Đắk Ru	Dak Ru Commune	dak_ru	666	10
24766	Nhân Đạo	Nhan Dao	Xã Nhân Đạo	Nhan Dao Commune	nhan_dao	666	10
24736	Quảng Trực	Quang Truc	Xã Quảng Trực	Quang Truc Commune	quang_truc	667	10
24739	Đắk Búk So	Dak Buk So	Xã Đắk Búk So	Dak Buk So Commune	dak_buk_so	667	10
24740	Quảng Tâm	Quang Tam	Xã Quảng Tâm	Quang Tam Commune	quang_tam	667	10
24742	Đắk R'Tíh	Dak R'Tih	Xã Đắk R'Tíh	Dak R'Tih Commune	dak_r'tih	667	10
24746	Đắk Ngo	Dak Ngo	Xã Đắk Ngo	Dak Ngo Commune	dak_ngo	667	10
24748	Quảng Tân	Quang Tan	Xã Quảng Tân	Quang Tan Commune	quang_tan	667	10
24769	7	7	Phường 7	7 Ward	7	672	8
24772	8	8	Phường 8	8 Ward	8	672	8
24775	12	12	Phường 12	12 Ward	12	672	8
24778	9	9	Phường 9	9 Ward	9	672	8
24781	2	2	Phường 2	2 Ward	2	672	8
24784	1	1	Phường 1	1 Ward	1	672	8
24787	6	6	Phường 6	6 Ward	6	672	8
24790	5	5	Phường 5	5 Ward	5	672	8
24793	4	4	Phường 4	4 Ward	4	672	8
24796	10	10	Phường 10	10 Ward	10	672	8
24799	11	11	Phường 11	11 Ward	11	672	8
24802	3	3	Phường 3	3 Ward	3	672	8
24805	Xuân Thọ	Xuan Tho	Xã Xuân Thọ	Xuan Tho Commune	xuan_tho	672	10
24808	Tà Nung	Ta Nung	Xã Tà Nung	Ta Nung Commune	ta_nung	672	10
24810	Trạm Hành	Tram Hanh	Xã Trạm Hành	Tram Hanh Commune	tram_hanh	672	10
24811	Xuân Trường	Xuan Truong	Xã Xuân Trường	Xuan Truong Commune	xuan_truong	672	10
24814	Lộc Phát	Loc Phat	Phường Lộc Phát	Loc Phat Ward	loc_phat	673	8
24817	Lộc Tiến	Loc Tien	Phường Lộc Tiến	Loc Tien Ward	loc_tien	673	8
24820	2	2	Phường 2	2 Ward	2	673	8
24823	1	1	Phường 1	1 Ward	1	673	8
24826	B'lao	B'lao	Phường B'lao	B'lao Ward	b'lao	673	8
24829	Lộc Sơn	Loc Son	Phường Lộc Sơn	Loc Son Ward	loc_son	673	8
24832	Đạm Bri	Dam Bri	Xã Đạm Bri	Dam Bri Commune	dam_bri	673	10
24835	Lộc Thanh	Loc Thanh	Xã Lộc Thanh	Loc Thanh Commune	loc_thanh	673	10
24838	Lộc Nga	Loc Nga	Xã Lộc Nga	Loc Nga Commune	loc_nga	673	10
24841	Lộc Châu	Loc Chau	Xã Lộc Châu	Loc Chau Commune	loc_chau	673	10
24844	Đại Lào	Dai Lao	Xã Đại Lào	Dai Lao Commune	dai_lao	673	10
24853	Đạ Tông	Da Tong	Xã Đạ Tông	Da Tong Commune	da_tong	674	10
24856	Đạ Long	Da Long	Xã Đạ Long	Da Long Commune	da_long	674	10
24859	Đạ M' Rong	Da M' Rong	Xã Đạ M' Rong	Da M' Rong Commune	da_m'_rong	674	10
24874	Liêng Srônh	Lieng Sronh	Xã Liêng Srônh	Lieng Sronh Commune	lieng_sronh	674	10
24875	Đạ Rsal	Da Rsal	Xã Đạ Rsal	Da Rsal Commune	da_rsal	674	10
24877	Rô Men	Ro Men	Xã Rô Men	Ro Men Commune	ro_men	674	10
24886	Phi Liêng	Phi Lieng	Xã Phi Liêng	Phi Lieng Commune	phi_lieng	674	10
24889	Đạ K' Nàng	Da K' Nang	Xã Đạ K' Nàng	Da K' Nang Commune	da_k'_nang	674	10
24846	Lạc Dương	Lac Duong	Thị trấn Lạc Dương	Lac Duong Township	lac_duong	675	9
24847	Đạ Chais	Da Chais	Xã Đạ Chais	Da Chais Commune	da_chais	675	10
24848	Đạ Nhim	Da Nhim	Xã Đạ Nhim	Da Nhim Commune	da_nhim	675	10
24850	Đưng KNớ	Dung KNo	Xã Đưng KNớ	Dung KNo Commune	dung_kno	675	10
24862	Lát	Lat	Xã Lát	Lat Commune	lat	675	10
24865	Đạ Sar	Da Sar	Xã Đạ Sar	Da Sar Commune	da_sar	675	10
24868	Nam Ban	Nam Ban	Thị trấn Nam Ban	Nam Ban Township	nam_ban	676	9
24871	Đinh Văn	Dinh Van	Thị trấn Đinh Văn	Dinh Van Township	dinh_van	676	9
24880	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	676	10
24883	Phi Tô	Phi To	Xã Phi Tô	Phi To Commune	phi_to	676	10
24892	Mê Linh	Me Linh	Xã Mê Linh	Me Linh Commune	me_linh	676	10
24895	Đạ Đờn	Da Don	Xã Đạ Đờn	Da Don Commune	da_don	676	10
24898	Phúc Thọ	Phuc Tho	Xã Phúc Thọ	Phuc Tho Commune	phuc_tho	676	10
24901	Đông Thanh	Dong Thanh	Xã Đông Thanh	Dong Thanh Commune	dong_thanh	676	10
24904	Gia Lâm	Gia Lam	Xã Gia Lâm	Gia Lam Commune	gia_lam	676	10
24907	Tân Thanh	Tan Thanh	Xã Tân Thanh	Tan Thanh Commune	tan_thanh	676	10
24910	Tân Văn	Tan Van	Xã Tân Văn	Tan Van Commune	tan_van	676	10
24913	Hoài Đức	Hoai Duc	Xã Hoài Đức	Hoai Duc Commune	hoai_duc	676	10
24916	Tân Hà	Tan Ha	Xã Tân Hà	Tan Ha Commune	tan_ha	676	10
24919	Liên Hà	Lien Ha	Xã Liên Hà	Lien Ha Commune	lien_ha	676	10
24922	Đan Phượng	Dan Phuong	Xã Đan Phượng	Dan Phuong Commune	dan_phuong	676	10
24925	Nam Hà	Nam Ha	Xã Nam Hà	Nam Ha Commune	nam_ha	676	10
24928	D'Ran	D'Ran	Thị trấn D'Ran	D'Ran Township	d'ran	677	9
24931	Thạnh Mỹ	Thanh My	Thị trấn Thạnh Mỹ	Thanh My Township	thanh_my	677	9
24934	Lạc Xuân	Lac Xuan	Xã Lạc Xuân	Lac Xuan Commune	lac_xuan	677	10
24937	Đạ Ròn	Da Ron	Xã Đạ Ròn	Da Ron Commune	da_ron	677	10
24940	Lạc Lâm	Lac Lam	Xã Lạc Lâm	Lac Lam Commune	lac_lam	677	10
24943	Ka Đô	Ka Do	Xã Ka Đô	Ka Do Commune	ka_do	677	10
24946	Quảng Lập	Quang Lap	Xã Quảng Lập	Quang Lap Commune	quang_lap	677	10
24949	Ka Đơn	Ka Don	Xã Ka Đơn	Ka Don Commune	ka_don	677	10
24952	Tu Tra	Tu Tra	Xã Tu Tra	Tu Tra Commune	tu_tra	677	10
24955	Pró	Pro	Xã Pró	Pro Commune	pro	677	10
24958	Liên Nghĩa	Lien Nghia	Thị trấn Liên Nghĩa	Lien Nghia Township	lien_nghia	678	9
24961	Hiệp An	Hiep An	Xã Hiệp An	Hiep An Commune	hiep_an	678	10
24964	Liên Hiệp	Lien Hiep	Xã Liên Hiệp	Lien Hiep Commune	lien_hiep	678	10
24967	Hiệp Thạnh	Hiep Thanh	Xã Hiệp Thạnh	Hiep Thanh Commune	hiep_thanh	678	10
24970	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	678	10
24973	N'Thol Hạ	N'Thol Ha	Xã N'Thol Hạ	N'Thol Ha Commune	n'thol_ha	678	10
24976	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	678	10
24979	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	678	10
24982	Phú Hội	Phu Hoi	Xã Phú Hội	Phu Hoi Commune	phu_hoi	678	10
24985	Ninh Gia	Ninh Gia	Xã Ninh Gia	Ninh Gia Commune	ninh_gia	678	10
24988	Tà Năng	Ta Nang	Xã Tà Năng	Ta Nang Commune	ta_nang	678	10
24989	Đa Quyn	Da Quyn	Xã Đa Quyn	Da Quyn Commune	da_quyn	678	10
24991	Tà Hine	Ta Hine	Xã Tà Hine	Ta Hine Commune	ta_hine	678	10
24994	Đà Loan	Da Loan	Xã Đà Loan	Da Loan Commune	da_loan	678	10
24997	Ninh Loan	Ninh Loan	Xã Ninh Loan	Ninh Loan Commune	ninh_loan	678	10
25000	Di Linh	Di Linh	Thị trấn Di Linh	Di Linh Township	di_linh	679	9
25003	Đinh Trang Thượng	Dinh Trang Thuong	Xã Đinh Trang Thượng	Dinh Trang Thuong Commune	dinh_trang_thuong	679	10
25006	Tân Thượng	Tan Thuong	Xã Tân Thượng	Tan Thuong Commune	tan_thuong	679	10
25007	Tân Lâm	Tan Lam	Xã Tân Lâm	Tan Lam Commune	tan_lam	679	10
25009	Tân Châu	Tan Chau	Xã Tân Châu	Tan Chau Commune	tan_chau	679	10
25012	Tân Nghĩa	Tan Nghia	Xã Tân Nghĩa	Tan Nghia Commune	tan_nghia	679	10
25015	Gia Hiệp	Gia Hiep	Xã Gia Hiệp	Gia Hiep Commune	gia_hiep	679	10
25018	Đinh Lạc	Dinh Lac	Xã Đinh Lạc	Dinh Lac Commune	dinh_lac	679	10
25021	Tam Bố	Tam Bo	Xã Tam Bố	Tam Bo Commune	tam_bo	679	10
25024	Đinh Trang Hòa	Dinh Trang Hoa	Xã Đinh Trang Hòa	Dinh Trang Hoa Commune	dinh_trang_hoa	679	10
25027	Liên Đầm	Lien Dam	Xã Liên Đầm	Lien Dam Commune	lien_dam	679	10
25030	Gung Ré	Gung Re	Xã Gung Ré	Gung Re Commune	gung_re	679	10
25033	Bảo Thuận	Bao Thuan	Xã Bảo Thuận	Bao Thuan Commune	bao_thuan	679	10
25036	Hòa Ninh	Hoa Ninh	Xã Hòa Ninh	Hoa Ninh Commune	hoa_ninh	679	10
25039	Hòa Trung	Hoa Trung	Xã Hòa Trung	Hoa Trung Commune	hoa_trung	679	10
25042	Hòa Nam	Hoa Nam	Xã Hòa Nam	Hoa Nam Commune	hoa_nam	679	10
25045	Hòa Bắc	Hoa Bac	Xã Hòa Bắc	Hoa Bac Commune	hoa_bac	679	10
25048	Sơn Điền	Son Dien	Xã Sơn Điền	Son Dien Commune	son_dien	679	10
25051	Gia Bắc	Gia Bac	Xã Gia Bắc	Gia Bac Commune	gia_bac	679	10
25054	Lộc Thắng	Loc Thang	Thị trấn Lộc Thắng	Loc Thang Township	loc_thang	680	9
25057	Lộc Bảo	Loc Bao	Xã Lộc Bảo	Loc Bao Commune	loc_bao	680	10
25060	Lộc Lâm	Loc Lam	Xã Lộc Lâm	Loc Lam Commune	loc_lam	680	10
25063	Lộc Phú	Loc Phu	Xã Lộc Phú	Loc Phu Commune	loc_phu	680	10
25066	Lộc Bắc	Loc Bac	Xã Lộc Bắc	Loc Bac Commune	loc_bac	680	10
25069	B' Lá	B' La	Xã B' Lá	B' La Commune	b'_la	680	10
25072	Lộc Ngãi	Loc Ngai	Xã Lộc Ngãi	Loc Ngai Commune	loc_ngai	680	10
25075	Lộc Quảng	Loc Quang	Xã Lộc Quảng	Loc Quang Commune	loc_quang	680	10
25078	Lộc Tân	Loc Tan	Xã Lộc Tân	Loc Tan Commune	loc_tan	680	10
25081	Lộc Đức	Loc Duc	Xã Lộc Đức	Loc Duc Commune	loc_duc	680	10
25084	Lộc An	Loc An	Xã Lộc An	Loc An Commune	loc_an	680	10
25087	Tân Lạc	Tan Lac	Xã Tân Lạc	Tan Lac Commune	tan_lac	680	10
25090	Lộc Thành	Loc Thanh	Xã Lộc Thành	Loc Thanh Commune	loc_thanh	680	10
25093	Lộc Nam	Loc Nam	Xã Lộc Nam	Loc Nam Commune	loc_nam	680	10
25096	Đạ M'ri	Da M'ri	Thị trấn Đạ M'ri	Da M'ri Township	da_m'ri	681	9
25099	Ma Đa Guôi	Ma Da Guoi	Thị trấn Ma Đa Guôi	Ma Da Guoi Township	ma_da_guoi	681	9
25105	Hà Lâm	Ha Lam	Xã Hà Lâm	Ha Lam Commune	ha_lam	681	10
25108	Đạ Tồn	Da Ton	Xã Đạ Tồn	Da Ton Commune	da_ton	681	10
25111	Đạ Oai	Da Oai	Xã Đạ Oai	Da Oai Commune	da_oai	681	10
25114	Đạ Ploa	Da Ploa	Xã Đạ Ploa	Da Ploa Commune	da_ploa	681	10
25117	Ma Đa Guôi	Ma Da Guoi	Xã Ma Đa Guôi	Ma Da Guoi Commune	ma_da_guoi	681	10
25120	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	681	10
25123	Phước Lộc	Phuoc Loc	Xã Phước Lộc	Phuoc Loc Commune	phuoc_loc	681	10
25126	Đạ Tẻh	Da Teh	Thị trấn Đạ Tẻh	Da Teh Township	da_teh	682	9
25129	An Nhơn	An Nhon	Xã An Nhơn	An Nhon Commune	an_nhon	682	10
25132	Quốc Oai	Quoc Oai	Xã Quốc Oai	Quoc Oai Commune	quoc_oai	682	10
25135	Mỹ Đức	My Duc	Xã Mỹ Đức	My Duc Commune	my_duc	682	10
25138	Quảng Trị	Quang Tri	Xã Quảng Trị	Quang Tri Commune	quang_tri	682	10
25141	Đạ Lây	Da Lay	Xã Đạ Lây	Da Lay Commune	da_lay	682	10
25147	Triệu Hải	Trieu Hai	Xã Triệu Hải	Trieu Hai Commune	trieu_hai	682	10
25153	Đạ Kho	Da Kho	Xã Đạ Kho	Da Kho Commune	da_kho	682	10
25156	Đạ Pal	Da Pal	Xã Đạ Pal	Da Pal Commune	da_pal	682	10
25159	Cát Tiên	Cat Tien	Thị trấn Cát Tiên	Cat Tien Township	cat_tien	683	9
25162	Tiên Hoàng	Tien Hoang	Xã Tiên Hoàng	Tien Hoang Commune	tien_hoang	683	10
25165	Phước Cát 2	Phuoc Cat 2	Xã Phước Cát 2	Phuoc Cat 2 Commune	phuoc_cat_2	683	10
25168	Gia Viễn	Gia Vien	Xã Gia Viễn	Gia Vien Commune	gia_vien	683	10
25171	Nam Ninh	Nam Ninh	Xã Nam Ninh	Nam Ninh Commune	nam_ninh	683	10
25180	Phước Cát 	Phuoc Cat 	Thị trấn Phước Cát 	Phuoc Cat  Township	phuoc_cat_	683	9
25183	Đức Phổ	Duc Pho	Xã Đức Phổ	Duc Pho Commune	duc_pho	683	10
25189	Quảng Ngãi	Quang Ngai	Xã Quảng Ngãi	Quang Ngai Commune	quang_ngai	683	10
25192	Đồng Nai Thượng	Dong Nai Thuong	Xã Đồng Nai Thượng	Dong Nai Thuong Commune	dong_nai_thuong	683	10
25216	Thác Mơ	Thac Mo	Phường Thác Mơ	Thac Mo Ward	thac_mo	688	8
25217	Long Thủy	Long Thuy	Phường Long Thủy	Long Thuy Ward	long_thuy	688	8
25219	Phước Bình	Phuoc Binh	Phường Phước Bình	Phuoc Binh Ward	phuoc_binh	688	8
27325	01	01	Phường 01	01 Ward	01	774	8
25220	Long Phước	Long Phuoc	Phường Long Phước	Long Phuoc Ward	long_phuoc	688	8
25237	Sơn Giang	Son Giang	Phường Sơn Giang	Son Giang Ward	son_giang	688	8
25245	Long Giang	Long Giang	Xã Long Giang	Long Giang Commune	long_giang	688	10
25249	Phước Tín	Phuoc Tin	Xã Phước Tín	Phuoc Tin Commune	phuoc_tin	688	10
25195	Tân Phú	Tan Phu	Phường Tân Phú	Tan Phu Ward	tan_phu	689	8
25198	Tân Đồng	Tan Dong	Phường Tân Đồng	Tan Dong Ward	tan_dong	689	8
25201	Tân Bình	Tan Binh	Phường Tân Bình	Tan Binh Ward	tan_binh	689	8
25204	Tân Xuân	Tan Xuan	Phường Tân Xuân	Tan Xuan Ward	tan_xuan	689	8
25205	Tân Thiện	Tan Thien	Phường Tân Thiện	Tan Thien Ward	tan_thien	689	8
25207	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	689	10
25210	Tiến Thành	Tien Thanh	Phường Tiến Thành	Tien Thanh Ward	tien_thanh	689	8
25213	Tiến Hưng	Tien Hung	Xã Tiến Hưng	Tien Hung Commune	tien_hung	689	10
25320	Hưng Chiến	Hung Chien	Phường Hưng Chiến	Hung Chien Ward	hung_chien	690	8
25324	An Lộc	An Loc	Phường An Lộc	An Loc Ward	an_loc	690	8
25325	Phú Thịnh	Phu Thinh	Phường Phú Thịnh	Phu Thinh Ward	phu_thinh	690	8
25326	Phú Đức	Phu Duc	Phường Phú Đức	Phu Duc Ward	phu_duc	690	8
25333	Thanh Lương	Thanh Luong	Xã Thanh Lương	Thanh Luong Commune	thanh_luong	690	10
25336	Thanh Phú	Thanh Phu	Xã Thanh Phú	Thanh Phu Commune	thanh_phu	690	10
25222	Bù Gia Mập	Bu Gia Map	Xã Bù Gia Mập	Bu Gia Map Commune	bu_gia_map	691	10
25225	Đak Ơ	Dak O	Xã Đak Ơ	Dak O Commune	dak_o	691	10
25228	Đức Hạnh	Duc Hanh	Xã Đức Hạnh	Duc Hanh Commune	duc_hanh	691	10
25229	Phú Văn	Phu Van	Xã Phú Văn	Phu Van Commune	phu_van	691	10
25231	Đa Kia	Da Kia	Xã Đa Kia	Da Kia Commune	da_kia	691	10
25232	Phước Minh	Phuoc Minh	Xã Phước Minh	Phuoc Minh Commune	phuoc_minh	691	10
25234	Bình Thắng	Binh Thang	Xã Bình Thắng	Binh Thang Commune	binh_thang	691	10
25267	Phú Nghĩa	Phu Nghia	Xã Phú Nghĩa	Phu Nghia Commune	phu_nghia	691	10
25270	Lộc Ninh	Loc Ninh	Thị trấn Lộc Ninh	Loc Ninh Township	loc_ninh	692	9
25273	Lộc Hòa	Loc Hoa	Xã Lộc Hòa	Loc Hoa Commune	loc_hoa	692	10
25276	Lộc An	Loc An	Xã Lộc An	Loc An Commune	loc_an	692	10
25279	Lộc Tấn	Loc Tan	Xã Lộc Tấn	Loc Tan Commune	loc_tan	692	10
25280	Lộc Thạnh	Loc Thanh	Xã Lộc Thạnh	Loc Thanh Commune	loc_thanh	692	10
25282	Lộc Hiệp	Loc Hiep	Xã Lộc Hiệp	Loc Hiep Commune	loc_hiep	692	10
25285	Lộc Thiện	Loc Thien	Xã Lộc Thiện	Loc Thien Commune	loc_thien	692	10
25288	Lộc Thuận	Loc Thuan	Xã Lộc Thuận	Loc Thuan Commune	loc_thuan	692	10
25291	Lộc Quang	Loc Quang	Xã Lộc Quang	Loc Quang Commune	loc_quang	692	10
25292	Lộc Phú	Loc Phu	Xã Lộc Phú	Loc Phu Commune	loc_phu	692	10
25294	Lộc Thành	Loc Thanh	Xã Lộc Thành	Loc Thanh Commune	loc_thanh	692	10
25297	Lộc Thái	Loc Thai	Xã Lộc Thái	Loc Thai Commune	loc_thai	692	10
25300	Lộc Điền	Loc Dien	Xã Lộc Điền	Loc Dien Commune	loc_dien	692	10
25303	Lộc Hưng	Loc Hung	Xã Lộc Hưng	Loc Hung Commune	loc_hung	692	10
25305	Lộc Thịnh	Loc Thinh	Xã Lộc Thịnh	Loc Thinh Commune	loc_thinh	692	10
25306	Lộc Khánh	Loc Khanh	Xã Lộc Khánh	Loc Khanh Commune	loc_khanh	692	10
25308	Thanh Bình	Thanh Binh	Thị trấn Thanh Bình	Thanh Binh Township	thanh_binh	693	9
25309	Hưng Phước	Hung Phuoc	Xã Hưng Phước	Hung Phuoc Commune	hung_phuoc	693	10
25310	Phước Thiện	Phuoc Thien	Xã Phước Thiện	Phuoc Thien Commune	phuoc_thien	693	10
25312	Thiện Hưng	Thien Hung	Xã Thiện Hưng	Thien Hung Commune	thien_hung	693	10
25315	Thanh Hòa	Thanh Hoa	Xã Thanh Hòa	Thanh Hoa Commune	thanh_hoa	693	10
25318	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	693	10
25321	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	693	10
25327	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	694	10
25330	An Khương	An Khuong	Xã An Khương	An Khuong Commune	an_khuong	694	10
25339	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	694	10
25342	Tân Lợi	Tan Loi	Xã Tân Lợi	Tan Loi Commune	tan_loi	694	10
25345	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	694	10
25348	Minh Đức	Minh Duc	Xã Minh Đức	Minh Duc Commune	minh_duc	694	10
25349	Minh Tâm	Minh Tam	Xã Minh Tâm	Minh Tam Commune	minh_tam	694	10
25351	Phước An	Phuoc An	Xã Phước An	Phuoc An Commune	phuoc_an	694	10
25354	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	694	10
25357	Tân Khai	Tan Khai	Thị trấn Tân Khai	Tan Khai Township	tan_khai	694	9
25360	Đồng Nơ	Dong No	Xã Đồng Nơ	Dong No Commune	dong_no	694	10
25361	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	694	10
25438	Tân Quan	Tan Quan	Xã Tân Quan	Tan Quan Commune	tan_quan	694	10
25363	Tân Phú	Tan Phu	Thị trấn Tân Phú	Tan Phu Township	tan_phu	695	9
25366	Thuận Lợi	Thuan Loi	Xã Thuận Lợi	Thuan Loi Commune	thuan_loi	695	10
25369	Đồng Tâm	Dong Tam	Xã Đồng Tâm	Dong Tam Commune	dong_tam	695	10
25372	Tân Phước	Tan Phuoc	Xã Tân Phước	Tan Phuoc Commune	tan_phuoc	695	10
25375	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	695	10
25378	Tân Lợi	Tan Loi	Xã Tân Lợi	Tan Loi Commune	tan_loi	695	10
25381	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	695	10
25384	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	695	10
25387	Thuận Phú	Thuan Phu	Xã Thuận Phú	Thuan Phu Commune	thuan_phu	695	10
25390	Đồng Tiến	Dong Tien	Xã Đồng Tiến	Dong Tien Commune	dong_tien	695	10
25393	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	695	10
25396	Đức Phong	Duc Phong	Thị trấn Đức Phong	Duc Phong Township	duc_phong	696	9
25398	Đường 10	Duong 10	Xã Đường 10	Duong 10 Commune	duong_10	696	10
25399	Đak Nhau	Dak Nhau	Xã Đak Nhau	Dak Nhau Commune	dak_nhau	696	10
25400	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	696	10
25402	Thọ Sơn	Tho Son	Xã Thọ Sơn	Tho Son Commune	tho_son	696	10
25404	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	696	10
25405	Bom Bo	Bom Bo	Xã Bom Bo	Bom Bo Commune	bom_bo	696	10
25408	Minh Hưng	Minh Hung	Xã Minh Hưng	Minh Hung Commune	minh_hung	696	10
25411	Đoàn Kết	Doan Ket	Xã Đoàn Kết	Doan Ket Commune	doan_ket	696	10
25414	Đồng Nai	Dong Nai	Xã Đồng Nai	Dong Nai Commune	dong_nai	696	10
25417	Đức Liễu	Duc Lieu	Xã Đức Liễu	Duc Lieu Commune	duc_lieu	696	10
25420	Thống Nhất	Thong Nhat	Xã Thống Nhất	Thong Nhat Commune	thong_nhat	696	10
25423	Nghĩa Trung	Nghia Trung	Xã Nghĩa Trung	Nghia Trung Commune	nghia_trung	696	10
25424	Nghĩa Bình	Nghia Binh	Xã Nghĩa Bình	Nghia Binh Commune	nghia_binh	696	10
27328	11	11	Phường 11	11 Ward	11	774	8
25426	Đăng Hà	Dang Ha	Xã Đăng Hà	Dang Ha Commune	dang_ha	696	10
25429	Phước Sơn	Phuoc Son	Xã Phước Sơn	Phuoc Son Commune	phuoc_son	696	10
25432	Chơn Thành	Chon Thanh	Thị trấn Chơn Thành	Chon Thanh Township	chon_thanh	697	9
25433	Thành Tâm	Thanh Tam	Xã Thành Tâm	Thanh Tam Commune	thanh_tam	697	10
25435	Minh Lập	Minh Lap	Xã Minh Lập	Minh Lap Commune	minh_lap	697	10
25439	Quang Minh	Quang Minh	Xã Quang Minh	Quang Minh Commune	quang_minh	697	10
25441	Minh Hưng	Minh Hung	Xã Minh Hưng	Minh Hung Commune	minh_hung	697	10
25444	Minh Long	Minh Long	Xã Minh Long	Minh Long Commune	minh_long	697	10
25447	Minh Thành	Minh Thanh	Xã Minh Thành	Minh Thanh Commune	minh_thanh	697	10
25450	Nha Bích	Nha Bich	Xã Nha Bích	Nha Bich Commune	nha_bich	697	10
25453	Minh Thắng	Minh Thang	Xã Minh Thắng	Minh Thang Commune	minh_thang	697	10
25240	Long Bình	Long Binh	Xã Long Bình	Long Binh Commune	long_binh	698	10
25243	Bình Tân	Binh Tan	Xã Bình Tân	Binh Tan Commune	binh_tan	698	10
25244	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	698	10
25246	Long Hưng	Long Hung	Xã Long Hưng	Long Hung Commune	long_hung	698	10
25250	Phước Tân	Phuoc Tan	Xã Phước Tân	Phuoc Tan Commune	phuoc_tan	698	10
25252	Bù Nho	Bu Nho	Xã Bù Nho	Bu Nho Commune	bu_nho	698	10
25255	Long Hà	Long Ha	Xã Long Hà	Long Ha Commune	long_ha	698	10
25258	Long Tân	Long Tan	Xã Long Tân	Long Tan Commune	long_tan	698	10
25261	Phú Trung	Phu Trung	Xã Phú Trung	Phu Trung Commune	phu_trung	698	10
25264	Phú Riềng	Phu Rieng	Xã Phú Riềng	Phu Rieng Commune	phu_rieng	698	10
25456	1	1	Phường 1	1 Ward	1	703	8
25459	3	3	Phường 3	3 Ward	3	703	8
25462	4	4	Phường 4	4 Ward	4	703	8
25465	Hiệp Ninh	Hiep Ninh	Phường Hiệp Ninh	Hiep Ninh Ward	hiep_ninh	703	8
25468	2	2	Phường 2	2 Ward	2	703	8
25471	Thạnh Tân	Thanh Tan	Xã Thạnh Tân	Thanh Tan Commune	thanh_tan	703	10
25474	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	703	10
25477	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	703	10
25480	Ninh Sơn	Ninh Son	Phường Ninh Sơn	Ninh Son Ward	ninh_son	703	8
25483	Ninh Thạnh	Ninh Thanh	Phường Ninh Thạnh	Ninh Thanh Ward	ninh_thanh	703	8
25486	Tân Biên	Tan Bien	Thị trấn Tân Biên	Tan Bien Township	tan_bien	705	9
25489	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	705	10
25492	Thạnh Bắc	Thanh Bac	Xã Thạnh Bắc	Thanh Bac Commune	thanh_bac	705	10
25495	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	705	10
25498	Thạnh Bình	Thanh Binh	Xã Thạnh Bình	Thanh Binh Commune	thanh_binh	705	10
25501	Thạnh Tây	Thanh Tay	Xã Thạnh Tây	Thanh Tay Commune	thanh_tay	705	10
25504	Hòa Hiệp	Hoa Hiep	Xã Hòa Hiệp	Hoa Hiep Commune	hoa_hiep	705	10
25507	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	705	10
25510	Mỏ Công	Mo Cong	Xã Mỏ Công	Mo Cong Commune	mo_cong	705	10
25513	Trà Vong	Tra Vong	Xã Trà Vong	Tra Vong Commune	tra_vong	705	10
25516	Tân Châu	Tan Chau	Thị trấn Tân Châu	Tan Chau Township	tan_chau	706	9
25519	Tân Hà	Tan Ha	Xã Tân Hà	Tan Ha Commune	tan_ha	706	10
25522	Tân Đông	Tan Dong	Xã Tân Đông	Tan Dong Commune	tan_dong	706	10
25525	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	706	10
25528	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	706	10
25531	Suối Ngô	Suoi Ngo	Xã Suối Ngô	Suoi Ngo Commune	suoi_ngo	706	10
25534	Suối Dây	Suoi Day	Xã Suối Dây	Suoi Day Commune	suoi_day	706	10
25537	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	706	10
25540	Thạnh Đông	Thanh Dong	Xã Thạnh Đông	Thanh Dong Commune	thanh_dong	706	10
25543	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	706	10
25546	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	706	10
25549	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	706	10
25552	Dương Minh Châu	Duong Minh Chau	Thị trấn Dương Minh Châu	Duong Minh Chau Township	duong_minh_chau	707	9
25555	Suối Đá	Suoi Da	Xã Suối Đá	Suoi Da Commune	suoi_da	707	10
25558	Phan	Phan	Xã Phan	Phan Commune	phan	707	10
25561	Phước Ninh	Phuoc Ninh	Xã Phước Ninh	Phuoc Ninh Commune	phuoc_ninh	707	10
25564	Phước Minh	Phuoc Minh	Xã Phước Minh	Phuoc Minh Commune	phuoc_minh	707	10
25567	Bàu Năng	Bau Nang	Xã Bàu Năng	Bau Nang Commune	bau_nang	707	10
25570	Chà Là	Cha La	Xã Chà Là	Cha La Commune	cha_la	707	10
25573	Cầu Khởi	Cau Khoi	Xã Cầu Khởi	Cau Khoi Commune	cau_khoi	707	10
25576	Bến Củi	Ben Cui	Xã Bến Củi	Ben Cui Commune	ben_cui	707	10
25579	Lộc Ninh	Loc Ninh	Xã Lộc Ninh	Loc Ninh Commune	loc_ninh	707	10
25582	Truông Mít	Truong Mit	Xã Truông Mít	Truong Mit Commune	truong_mit	707	10
25585	Châu Thành	Chau Thanh	Thị trấn Châu Thành	Chau Thanh Township	chau_thanh	708	9
25588	Hảo Đước	Hao Duoc	Xã Hảo Đước	Hao Duoc Commune	hao_duoc	708	10
25591	Phước Vinh	Phuoc Vinh	Xã Phước Vinh	Phuoc Vinh Commune	phuoc_vinh	708	10
25594	Đồng Khởi	Dong Khoi	Xã Đồng Khởi	Dong Khoi Commune	dong_khoi	708	10
25597	Thái Bình	Thai Binh	Xã Thái Bình	Thai Binh Commune	thai_binh	708	10
25600	An Cơ	An Co	Xã An Cơ	An Co Commune	an_co	708	10
25603	Biên Giới	Bien Gioi	Xã Biên Giới	Bien Gioi Commune	bien_gioi	708	10
25606	Hòa Thạnh	Hoa Thanh	Xã Hòa Thạnh	Hoa Thanh Commune	hoa_thanh	708	10
25609	Trí Bình	Tri Binh	Xã Trí Bình	Tri Binh Commune	tri_binh	708	10
25612	Hòa Hội	Hoa Hoi	Xã Hòa Hội	Hoa Hoi Commune	hoa_hoi	708	10
25615	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	708	10
25618	Thanh Điền	Thanh Dien	Xã Thanh Điền	Thanh Dien Commune	thanh_dien	708	10
25621	Thành Long	Thanh Long	Xã Thành Long	Thanh Long Commune	thanh_long	708	10
25624	Ninh Điền	Ninh Dien	Xã Ninh Điền	Ninh Dien Commune	ninh_dien	708	10
25627	Long Vĩnh	Long Vinh	Xã Long Vĩnh	Long Vinh Commune	long_vinh	708	10
25630	Long Hoa	Long Hoa	Phường Long Hoa	Long Hoa Ward	long_hoa	709	8
25633	Hiệp Tân	Hiep Tan	Phường Hiệp Tân	Hiep Tan Ward	hiep_tan	709	8
25636	Long Thành Bắc	Long Thanh Bac	Phường Long Thành Bắc	Long Thanh Bac Ward	long_thanh_bac	709	8
25639	Trường Hòa	Truong Hoa	Xã Trường Hòa	Truong Hoa Commune	truong_hoa	709	10
25642	Trường Đông	Truong Dong	Xã Trường Đông	Truong Dong Commune	truong_dong	709	10
25645	Long Thành Trung	Long Thanh Trung	Phường Long Thành Trung	Long Thanh Trung Ward	long_thanh_trung	709	8
25648	Trường Tây	Truong Tay	Xã Trường Tây	Truong Tay Commune	truong_tay	709	10
25651	Long Thành Nam	Long Thanh Nam	Xã Long Thành Nam	Long Thanh Nam Commune	long_thanh_nam	709	10
25654	Gò Dầu	Go Dau	Thị trấn Gò Dầu	Go Dau Township	go_dau	710	9
25657	Thạnh Đức	Thanh Duc	Xã Thạnh Đức	Thanh Duc Commune	thanh_duc	710	10
25660	Cẩm Giang	Cam Giang	Xã Cẩm Giang	Cam Giang Commune	cam_giang	710	10
25663	Hiệp Thạnh	Hiep Thanh	Xã Hiệp Thạnh	Hiep Thanh Commune	hiep_thanh	710	10
25666	Bàu Đồn	Bau Don	Xã Bàu Đồn	Bau Don Commune	bau_don	710	10
25669	Phước Thạnh	Phuoc Thanh	Xã Phước Thạnh	Phuoc Thanh Commune	phuoc_thanh	710	10
25672	Phước Đông	Phuoc Dong	Xã Phước Đông	Phuoc Dong Commune	phuoc_dong	710	10
25675	Phước Trạch	Phuoc Trach	Xã Phước Trạch	Phuoc Trach Commune	phuoc_trach	710	10
25678	Thanh Phước	Thanh Phuoc	Xã Thanh Phước	Thanh Phuoc Commune	thanh_phuoc	710	10
25681	Bến Cầu	Ben Cau	Thị trấn Bến Cầu	Ben Cau Township	ben_cau	711	9
25684	Long Chữ	Long Chu	Xã Long Chữ	Long Chu Commune	long_chu	711	10
25687	Long Phước	Long Phuoc	Xã Long Phước	Long Phuoc Commune	long_phuoc	711	10
25690	Long Giang	Long Giang	Xã Long Giang	Long Giang Commune	long_giang	711	10
25693	Tiên Thuận	Tien Thuan	Xã Tiên Thuận	Tien Thuan Commune	tien_thuan	711	10
25696	Long Khánh	Long Khanh	Xã Long Khánh	Long Khanh Commune	long_khanh	711	10
25699	Lợi Thuận	Loi Thuan	Xã Lợi Thuận	Loi Thuan Commune	loi_thuan	711	10
25702	Long Thuận	Long Thuan	Xã Long Thuận	Long Thuan Commune	long_thuan	711	10
25705	An Thạnh	An Thanh	Xã An Thạnh	An Thanh Commune	an_thanh	711	10
25708	Trảng Bàng	Trang Bang	Phường Trảng Bàng	Trang Bang Ward	trang_bang	712	8
25711	Đôn Thuận	Don Thuan	Xã Đôn Thuận	Don Thuan Commune	don_thuan	712	10
25714	Hưng Thuận	Hung Thuan	Xã Hưng Thuận	Hung Thuan Commune	hung_thuan	712	10
25717	Lộc Hưng	Loc Hung	Phường Lộc Hưng	Loc Hung Ward	loc_hung	712	8
25720	Gia Lộc	Gia Loc	Phường Gia Lộc	Gia Loc Ward	gia_loc	712	8
25723	Gia Bình	Gia Binh	Phường Gia Bình	Gia Binh Ward	gia_binh	712	8
25729	Phước Bình	Phuoc Binh	Xã Phước Bình	Phuoc Binh Commune	phuoc_binh	712	10
25732	An Tịnh	An Tinh	Phường An Tịnh	An Tinh Ward	an_tinh	712	8
25735	An Hòa	An Hoa	Phường An Hòa	An Hoa Ward	an_hoa	712	8
25738	Phước Chỉ	Phuoc Chi	Xã Phước Chỉ	Phuoc Chi Commune	phuoc_chi	712	10
25741	Hiệp Thành	Hiep Thanh	Phường Hiệp Thành	Hiep Thanh Ward	hiep_thanh	718	8
25744	Phú Lợi	Phu Loi	Phường Phú Lợi	Phu Loi Ward	phu_loi	718	8
25747	Phú Cường	Phu Cuong	Phường Phú Cường	Phu Cuong Ward	phu_cuong	718	8
25750	Phú Hòa	Phu Hoa	Phường Phú Hòa	Phu Hoa Ward	phu_hoa	718	8
25753	Phú Thọ	Phu Tho	Phường Phú Thọ	Phu Tho Ward	phu_tho	718	8
25756	Chánh Nghĩa	Chanh Nghia	Phường Chánh Nghĩa	Chanh Nghia Ward	chanh_nghia	718	8
25759	Định Hoà	Dinh Hoa	Phường Định Hoà	Dinh Hoa Ward	dinh_hoa	718	8
25760	Hoà Phú	Hoa Phu	Phường Hoà Phú	Hoa Phu Ward	hoa_phu	718	8
25762	Phú Mỹ	Phu My	Phường Phú Mỹ	Phu My Ward	phu_my	718	8
25763	Phú Tân	Phu Tan	Phường Phú Tân	Phu Tan Ward	phu_tan	718	8
25765	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	718	8
25768	Hiệp An	Hiep An	Phường Hiệp An	Hiep An Ward	hiep_an	718	8
25771	Tương Bình Hiệp	Tuong Binh Hiep	Phường Tương Bình Hiệp	Tuong Binh Hiep Ward	tuong_binh_hiep	718	8
25774	Chánh Mỹ	Chanh My	Phường Chánh Mỹ	Chanh My Ward	chanh_my	718	8
25816	Trừ Văn Thố	Tru Van Tho	Xã Trừ Văn Thố	Tru Van Tho Commune	tru_van_tho	719	10
25819	Cây Trường II	Cay Truong II	Xã Cây Trường II	Cay Truong II Commune	cay_truong_ii	719	10
25822	Lai Uyên	Lai Uyen	Thị trấn Lai Uyên	Lai Uyen Township	lai_uyen	719	9
25825	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	719	10
25828	Long Nguyên	Long Nguyen	Xã Long Nguyên	Long Nguyen Commune	long_nguyen	719	10
25831	Hưng Hòa	Hung Hoa	Xã Hưng Hòa	Hung Hoa Commune	hung_hoa	719	10
25834	Lai Hưng	Lai Hung	Xã Lai Hưng	Lai Hung Commune	lai_hung	719	10
25777	Dầu Tiếng	Dau Tieng	Thị trấn Dầu Tiếng	Dau Tieng Township	dau_tieng	720	9
25780	Minh Hoà	Minh Hoa	Xã Minh Hoà	Minh Hoa Commune	minh_hoa	720	10
25783	Minh Thạnh	Minh Thanh	Xã Minh Thạnh	Minh Thanh Commune	minh_thanh	720	10
25786	Minh Tân	Minh Tan	Xã Minh Tân	Minh Tan Commune	minh_tan	720	10
25789	Định An	Dinh An	Xã Định An	Dinh An Commune	dinh_an	720	10
25792	Long Hoà	Long Hoa	Xã Long Hoà	Long Hoa Commune	long_hoa	720	10
25795	Định Thành	Dinh Thanh	Xã Định Thành	Dinh Thanh Commune	dinh_thanh	720	10
25798	Định Hiệp	Dinh Hiep	Xã Định Hiệp	Dinh Hiep Commune	dinh_hiep	720	10
25801	An Lập	An Lap	Xã An Lập	An Lap Commune	an_lap	720	10
25804	Long Tân	Long Tan	Xã Long Tân	Long Tan Commune	long_tan	720	10
25807	Thanh An	Thanh An	Xã Thanh An	Thanh An Commune	thanh_an	720	10
25810	Thanh Tuyền	Thanh Tuyen	Xã Thanh Tuyền	Thanh Tuyen Commune	thanh_tuyen	720	10
25813	Mỹ Phước	My Phuoc	Phường Mỹ Phước	My Phuoc Ward	my_phuoc	721	8
25837	Chánh Phú Hòa	Chanh Phu Hoa	Phường Chánh Phú Hòa	Chanh Phu Hoa Ward	chanh_phu_hoa	721	8
25840	An Điền	An Dien	Xã An Điền	An Dien Commune	an_dien	721	10
25843	An Tây	An Tay	Xã An Tây	An Tay Commune	an_tay	721	10
25846	Thới Hòa	Thoi Hoa	Phường Thới Hòa	Thoi Hoa Ward	thoi_hoa	721	8
25849	Hòa Lợi	Hoa Loi	Phường Hòa Lợi	Hoa Loi Ward	hoa_loi	721	8
25852	Tân Định	Tan Dinh	Phường Tân Định	Tan Dinh Ward	tan_dinh	721	8
25855	Phú An	Phu An	Xã Phú An	Phu An Commune	phu_an	721	10
25858	Phước Vĩnh	Phuoc Vinh	Thị trấn Phước Vĩnh	Phuoc Vinh Township	phuoc_vinh	722	9
25861	An Linh	An Linh	Xã An Linh	An Linh Commune	an_linh	722	10
25864	Phước Sang	Phuoc Sang	Xã Phước Sang	Phuoc Sang Commune	phuoc_sang	722	10
25865	An Thái	An Thai	Xã An Thái	An Thai Commune	an_thai	722	10
25867	An Long	An Long	Xã An Long	An Long Commune	an_long	722	10
25870	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	722	10
25873	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	722	10
25876	Tam Lập	Tam Lap	Xã Tam Lập	Tam Lap Commune	tam_lap	722	10
25879	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	722	10
25882	Vĩnh Hoà	Vinh Hoa	Xã Vĩnh Hoà	Vinh Hoa Commune	vinh_hoa	722	10
25885	Phước Hoà	Phuoc Hoa	Xã Phước Hoà	Phuoc Hoa Commune	phuoc_hoa	722	10
25888	Uyên Hưng	Uyen Hung	Phường Uyên Hưng	Uyen Hung Ward	uyen_hung	723	8
27085	13	13	Phường 13	13 Ward	13	768	8
25891	Tân Phước Khánh	Tan Phuoc Khanh	Phường Tân Phước Khánh	Tan Phuoc Khanh Ward	tan_phuoc_khanh	723	8
25912	Vĩnh Tân	Vinh Tan	Phường Vĩnh Tân	Vinh Tan Ward	vinh_tan	723	8
25915	Hội Nghĩa	Hoi Nghia	Phường Hội Nghĩa	Hoi Nghia Ward	hoi_nghia	723	8
25920	Tân Hiệp	Tan Hiep	Phường Tân Hiệp	Tan Hiep Ward	tan_hiep	723	8
25921	Khánh Bình	Khanh Binh	Phường Khánh Bình	Khanh Binh Ward	khanh_binh	723	8
25924	Phú Chánh	Phu Chanh	Phường Phú Chánh	Phu Chanh Ward	phu_chanh	723	8
25930	Bạch Đằng	Bach Dang	Xã Bạch Đằng	Bach Dang Commune	bach_dang	723	10
25933	Tân Vĩnh Hiệp	Tan Vinh Hiep	Phường Tân Vĩnh Hiệp	Tan Vinh Hiep Ward	tan_vinh_hiep	723	8
25936	Thạnh Phước	Thanh Phuoc	Phường Thạnh Phước	Thanh Phuoc Ward	thanh_phuoc	723	8
25937	Thạnh Hội	Thanh Hoi	Xã Thạnh Hội	Thanh Hoi Commune	thanh_hoi	723	10
25939	Thái Hòa	Thai Hoa	Phường Thái Hòa	Thai Hoa Ward	thai_hoa	723	8
25942	Dĩ An	Di An	Phường Dĩ An	Di An Ward	di_an	724	8
25945	Tân Bình	Tan Binh	Phường Tân Bình	Tan Binh Ward	tan_binh	724	8
25948	Tân Đông Hiệp	Tan Dong Hiep	Phường Tân Đông Hiệp	Tan Dong Hiep Ward	tan_dong_hiep	724	8
25951	Bình An	Binh An	Phường Bình An	Binh An Ward	binh_an	724	8
25954	Bình Thắng	Binh Thang	Phường Bình Thắng	Binh Thang Ward	binh_thang	724	8
25957	Đông Hòa	Dong Hoa	Phường Đông Hòa	Dong Hoa Ward	dong_hoa	724	8
25960	An Bình	An Binh	Phường An Bình	An Binh Ward	an_binh	724	8
25963	An Thạnh	An Thanh	Phường An Thạnh	An Thanh Ward	an_thanh	725	8
25966	Lái Thiêu	Lai Thieu	Phường Lái Thiêu	Lai Thieu Ward	lai_thieu	725	8
25969	Bình Chuẩn	Binh Chuan	Phường Bình Chuẩn	Binh Chuan Ward	binh_chuan	725	8
25972	Thuận Giao	Thuan Giao	Phường Thuận Giao	Thuan Giao Ward	thuan_giao	725	8
25975	An Phú	An Phu	Phường An Phú	An Phu Ward	an_phu	725	8
25978	Hưng Định	Hung Dinh	Phường Hưng Định	Hung Dinh Ward	hung_dinh	725	8
25981	An Sơn	An Son	Xã An Sơn	An Son Commune	an_son	725	10
25984	Bình Nhâm	Binh Nham	Phường Bình Nhâm	Binh Nham Ward	binh_nham	725	8
25987	Bình Hòa	Binh Hoa	Phường Bình Hòa	Binh Hoa Ward	binh_hoa	725	8
25990	Vĩnh Phú	Vinh Phu	Phường Vĩnh Phú	Vinh Phu Ward	vinh_phu	725	8
25894	Tân Định	Tan Dinh	Xã Tân Định	Tan Dinh Commune	tan_dinh	726	10
25897	Bình Mỹ	Binh My	Xã Bình Mỹ	Binh My Commune	binh_my	726	10
25900	Tân Bình	Tan Binh	Thị trấn Tân Bình	Tan Binh Township	tan_binh	726	9
25903	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	726	10
25906	Tân Thành	Tan Thanh	Thị trấn Tân Thành	Tan Thanh Township	tan_thanh	726	9
25907	Đất Cuốc	Dat Cuoc	Xã Đất Cuốc	Dat Cuoc Commune	dat_cuoc	726	10
25908	Hiếu Liêm	Hieu Liem	Xã Hiếu Liêm	Hieu Liem Commune	hieu_liem	726	10
25909	Lạc An	Lac An	Xã Lạc An	Lac An Commune	lac_an	726	10
25918	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	726	10
25927	Thường Tân	Thuong Tan	Xã Thường Tân	Thuong Tan Commune	thuong_tan	726	10
25993	Trảng Dài	Trang Dai	Phường Trảng Dài	Trang Dai Ward	trang_dai	731	8
25996	Tân Phong	Tan Phong	Phường Tân Phong	Tan Phong Ward	tan_phong	731	8
25999	Tân Biên	Tan Bien	Phường Tân Biên	Tan Bien Ward	tan_bien	731	8
26002	Hố Nai	Ho Nai	Phường Hố Nai	Ho Nai Ward	ho_nai	731	8
26005	Tân Hòa	Tan Hoa	Phường Tân Hòa	Tan Hoa Ward	tan_hoa	731	8
26008	Tân Hiệp	Tan Hiep	Phường Tân Hiệp	Tan Hiep Ward	tan_hiep	731	8
26011	Bửu Long	Buu Long	Phường Bửu Long	Buu Long Ward	buu_long	731	8
26014	Tân Tiến	Tan Tien	Phường Tân Tiến	Tan Tien Ward	tan_tien	731	8
26017	Tam Hiệp	Tam Hiep	Phường Tam Hiệp	Tam Hiep Ward	tam_hiep	731	8
26020	Long Bình	Long Binh	Phường Long Bình	Long Binh Ward	long_binh	731	8
26023	Quang Vinh	Quang Vinh	Phường Quang Vinh	Quang Vinh Ward	quang_vinh	731	8
26026	Tân Mai	Tan Mai	Phường Tân Mai	Tan Mai Ward	tan_mai	731	8
26029	Thống Nhất	Thong Nhat	Phường Thống Nhất	Thong Nhat Ward	thong_nhat	731	8
26032	Trung Dũng	Trung Dung	Phường Trung Dũng	Trung Dung Ward	trung_dung	731	8
26035	Tam Hòa	Tam Hoa	Phường Tam Hòa	Tam Hoa Ward	tam_hoa	731	8
26038	Hòa Bình	Hoa Binh	Phường Hòa Bình	Hoa Binh Ward	hoa_binh	731	8
26041	Quyết Thắng	Quyet Thang	Phường Quyết Thắng	Quyet Thang Ward	quyet_thang	731	8
26044	Thanh Bình	Thanh Binh	Phường Thanh Bình	Thanh Binh Ward	thanh_binh	731	8
26047	Bình Đa	Binh Da	Phường Bình Đa	Binh Da Ward	binh_da	731	8
26050	An Bình	An Binh	Phường An Bình	An Binh Ward	an_binh	731	8
26053	Bửu Hòa	Buu Hoa	Phường Bửu Hòa	Buu Hoa Ward	buu_hoa	731	8
26056	Long Bình Tân	Long Binh Tan	Phường Long Bình Tân	Long Binh Tan Ward	long_binh_tan	731	8
26059	Tân Vạn	Tan Van	Phường Tân Vạn	Tan Van Ward	tan_van	731	8
26062	Tân Hạnh	Tan Hanh	Phường Tân Hạnh	Tan Hanh Ward	tan_hanh	731	8
26065	Hiệp Hòa	Hiep Hoa	Phường Hiệp Hòa	Hiep Hoa Ward	hiep_hoa	731	8
26068	Hóa An	Hoa An	Phường Hóa An	Hoa An Ward	hoa_an	731	8
26371	An Hòa	An Hoa	Phường An Hòa	An Hoa Ward	an_hoa	731	8
26374	Tam Phước	Tam Phuoc	Phường Tam Phước	Tam Phuoc Ward	tam_phuoc	731	8
26377	Phước Tân	Phuoc Tan	Phường Phước Tân	Phuoc Tan Ward	phuoc_tan	731	8
26380	Long Hưng	Long Hung	Xã Long Hưng	Long Hung Commune	long_hung	731	10
26071	Xuân Trung	Xuan Trung	Phường Xuân Trung	Xuan Trung Ward	xuan_trung	732	8
26074	Xuân Thanh	Xuan Thanh	Phường Xuân Thanh	Xuan Thanh Ward	xuan_thanh	732	8
26077	Xuân Bình	Xuan Binh	Phường Xuân Bình	Xuan Binh Ward	xuan_binh	732	8
26080	Xuân An	Xuan An	Phường Xuân An	Xuan An Ward	xuan_an	732	8
26083	Xuân Hoà	Xuan Hoa	Phường Xuân Hoà	Xuan Hoa Ward	xuan_hoa	732	8
26086	Phú Bình	Phu Binh	Phường Phú Bình	Phu Binh Ward	phu_binh	732	8
26089	Bình Lộc	Binh Loc	Xã Bình Lộc	Binh Loc Commune	binh_loc	732	10
26092	Bảo Quang	Bao Quang	Xã Bảo Quang	Bao Quang Commune	bao_quang	732	10
26095	Suối Tre	Suoi Tre	Phường Suối Tre	Suoi Tre Ward	suoi_tre	732	8
26098	Bảo Vinh	Bao Vinh	Phường Bảo Vinh	Bao Vinh Ward	bao_vinh	732	8
26101	Xuân Lập	Xuan Lap	Phường Xuân Lập	Xuan Lap Ward	xuan_lap	732	8
26104	Bàu Sen	Bau Sen	Phường Bàu Sen	Bau Sen Ward	bau_sen	732	8
26107	Bàu Trâm	Bau Tram	Xã Bàu Trâm	Bau Tram Commune	bau_tram	732	10
26110	Xuân Tân	Xuan Tan	Phường Xuân Tân	Xuan Tan Ward	xuan_tan	732	8
26113	Hàng Gòn	Hang Gon	Xã Hàng Gòn	Hang Gon Commune	hang_gon	732	10
26116	Tân Phú	Tan Phu	Thị trấn Tân Phú	Tan Phu Township	tan_phu	734	9
26119	Dak Lua	Dak Lua	Xã Dak Lua	Dak Lua Commune	dak_lua	734	10
26122	Nam Cát Tiên	Nam Cat Tien	Xã Nam Cát Tiên	Nam Cat Tien Commune	nam_cat_tien	734	10
26125	Phú An	Phu An	Xã Phú An	Phu An Commune	phu_an	734	10
26128	Núi Tượng	Nui Tuong	Xã Núi Tượng	Nui Tuong Commune	nui_tuong	734	10
26131	Tà Lài	Ta Lai	Xã Tà Lài	Ta Lai Commune	ta_lai	734	10
26134	Phú Lập	Phu Lap	Xã Phú Lập	Phu Lap Commune	phu_lap	734	10
27331	14	14	Phường 14	14 Ward	14	774	8
26137	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	734	10
26140	Phú Thịnh	Phu Thinh	Xã Phú Thịnh	Phu Thinh Commune	phu_thinh	734	10
26143	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	734	10
26146	Phú Trung	Phu Trung	Xã Phú Trung	Phu Trung Commune	phu_trung	734	10
26149	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	734	10
26152	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	734	10
26155	Phú Lâm	Phu Lam	Xã Phú Lâm	Phu Lam Commune	phu_lam	734	10
26158	Phú Bình	Phu Binh	Xã Phú Bình	Phu Binh Commune	phu_binh	734	10
26161	Phú Thanh	Phu Thanh	Xã Phú Thanh	Phu Thanh Commune	phu_thanh	734	10
26164	Trà Cổ	Tra Co	Xã Trà Cổ	Tra Co Commune	tra_co	734	10
26167	Phú Điền	Phu Dien	Xã Phú Điền	Phu Dien Commune	phu_dien	734	10
26170	Vĩnh An	Vinh An	Thị trấn Vĩnh An	Vinh An Township	vinh_an	735	9
26173	Phú Lý	Phu Ly	Xã Phú Lý	Phu Ly Commune	phu_ly	735	10
26176	Trị An	Tri An	Xã Trị An	Tri An Commune	tri_an	735	10
26179	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	735	10
26182	Vĩnh Tân	Vinh Tan	Xã Vĩnh Tân	Vinh Tan Commune	vinh_tan	735	10
26185	Bình Lợi	Binh Loi	Xã Bình Lợi	Binh Loi Commune	binh_loi	735	10
26188	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	735	10
26191	Thiện Tân	Thien Tan	Xã Thiện Tân	Thien Tan Commune	thien_tan	735	10
26194	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	735	10
26197	Bình Hòa	Binh Hoa	Xã Bình Hòa	Binh Hoa Commune	binh_hoa	735	10
26200	Mã Đà	Ma Da	Xã Mã Đà	Ma Da Commune	ma_da	735	10
26203	Hiếu Liêm	Hieu Liem	Xã Hiếu Liêm	Hieu Liem Commune	hieu_liem	735	10
26206	Định Quán	Dinh Quan	Thị trấn Định Quán	Dinh Quan Township	dinh_quan	736	9
26209	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	736	10
26212	Phú Tân	Phu Tan	Xã Phú Tân	Phu Tan Commune	phu_tan	736	10
26215	Phú Vinh	Phu Vinh	Xã Phú Vinh	Phu Vinh Commune	phu_vinh	736	10
26218	Phú Lợi	Phu Loi	Xã Phú Lợi	Phu Loi Commune	phu_loi	736	10
26221	Phú Hòa	Phu Hoa	Xã Phú Hòa	Phu Hoa Commune	phu_hoa	736	10
26224	Ngọc Định	Ngoc Dinh	Xã Ngọc Định	Ngoc Dinh Commune	ngoc_dinh	736	10
26227	La Ngà	La Nga	Xã La Ngà	La Nga Commune	la_nga	736	10
26230	Gia Canh	Gia Canh	Xã Gia Canh	Gia Canh Commune	gia_canh	736	10
26233	Phú Ngọc	Phu Ngoc	Xã Phú Ngọc	Phu Ngoc Commune	phu_ngoc	736	10
26236	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	736	10
26239	Túc Trưng	Tuc Trung	Xã Túc Trưng	Tuc Trung Commune	tuc_trung	736	10
26242	Phú Túc	Phu Tuc	Xã Phú Túc	Phu Tuc Commune	phu_tuc	736	10
26245	Suối Nho	Suoi Nho	Xã Suối Nho	Suoi Nho Commune	suoi_nho	736	10
26248	Trảng Bom	Trang Bom	Thị trấn Trảng Bom	Trang Bom Township	trang_bom	737	9
26251	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	737	10
26254	Cây Gáo	Cay Gao	Xã Cây Gáo	Cay Gao Commune	cay_gao	737	10
26257	Bàu Hàm	Bau Ham	Xã Bàu Hàm	Bau Ham Commune	bau_ham	737	10
26260	Sông Thao	Song Thao	Xã Sông Thao	Song Thao Commune	song_thao	737	10
26263	Sông Trầu	Song Trau	Xã Sông Trầu	Song Trau Commune	song_trau	737	10
26266	Đông Hoà	Dong Hoa	Xã Đông Hoà	Dong Hoa Commune	dong_hoa	737	10
26269	Bắc Sơn	Bac Son	Xã Bắc Sơn	Bac Son Commune	bac_son	737	10
26272	Hố Nai 3	Ho Nai 3	Xã Hố Nai 3	Ho Nai 3 Commune	ho_nai_3	737	10
26275	Tây Hoà	Tay Hoa	Xã Tây Hoà	Tay Hoa Commune	tay_hoa	737	10
26278	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	737	10
26281	Trung Hoà	Trung Hoa	Xã Trung Hoà	Trung Hoa Commune	trung_hoa	737	10
26284	Đồi 61	Doi 61	Xã Đồi 61	Doi 61 Commune	doi_61	737	10
26287	Hưng Thịnh	Hung Thinh	Xã Hưng Thịnh	Hung Thinh Commune	hung_thinh	737	10
26290	Quảng Tiến	Quang Tien	Xã Quảng Tiến	Quang Tien Commune	quang_tien	737	10
26293	Giang Điền	Giang Dien	Xã Giang Điền	Giang Dien Commune	giang_dien	737	10
26296	An Viễn	An Vien	Xã An Viễn	An Vien Commune	an_vien	737	10
26299	Gia Tân 1	Gia Tan 1	Xã Gia Tân 1	Gia Tan 1 Commune	gia_tan_1	738	10
26302	Gia Tân 2	Gia Tan 2	Xã Gia Tân 2	Gia Tan 2 Commune	gia_tan_2	738	10
26305	Gia Tân 3	Gia Tan 3	Xã Gia Tân 3	Gia Tan 3 Commune	gia_tan_3	738	10
26308	Gia Kiệm	Gia Kiem	Xã Gia Kiệm	Gia Kiem Commune	gia_kiem	738	10
26311	Quang Trung	Quang Trung	Xã Quang Trung	Quang Trung Commune	quang_trung	738	10
26314	Bàu Hàm 2	Bau Ham 2	Xã Bàu Hàm 2	Bau Ham 2 Commune	bau_ham_2	738	10
26317	Hưng Lộc	Hung Loc	Xã Hưng Lộc	Hung Loc Commune	hung_loc	738	10
26320	Lộ 25	Lo 25	Xã Lộ 25	Lo 25 Commune	lo_25	738	10
26323	Xuân Thiện	Xuan Thien	Xã Xuân Thiện	Xuan Thien Commune	xuan_thien	738	10
26326	Dầu Giây	Dau Giay	Thị trấn Dầu Giây	Dau Giay Township	dau_giay	738	9
26329	Sông Nhạn	Song Nhan	Xã Sông Nhạn	Song Nhan Commune	song_nhan	739	10
26332	Xuân Quế	Xuan Que	Xã Xuân Quế	Xuan Que Commune	xuan_que	739	10
26335	Nhân Nghĩa	Nhan Nghia	Xã Nhân Nghĩa	Nhan Nghia Commune	nhan_nghia	739	10
26338	Xuân Đường	Xuan Duong	Xã Xuân Đường	Xuan Duong Commune	xuan_duong	739	10
26341	Long Giao	Long Giao	Thị trấn Long Giao	Long Giao Township	long_giao	739	9
26344	Xuân Mỹ	Xuan My	Xã Xuân Mỹ	Xuan My Commune	xuan_my	739	10
26347	Thừa Đức	Thua Duc	Xã Thừa Đức	Thua Duc Commune	thua_duc	739	10
26350	Bảo Bình	Bao Binh	Xã Bảo Bình	Bao Binh Commune	bao_binh	739	10
26353	Xuân Bảo	Xuan Bao	Xã Xuân Bảo	Xuan Bao Commune	xuan_bao	739	10
26356	Xuân Tây	Xuan Tay	Xã Xuân Tây	Xuan Tay Commune	xuan_tay	739	10
26359	Xuân Đông	Xuan Dong	Xã Xuân Đông	Xuan Dong Commune	xuan_dong	739	10
26362	Sông Ray	Song Ray	Xã Sông Ray	Song Ray Commune	song_ray	739	10
26365	Lâm San	Lam San	Xã Lâm San	Lam San Commune	lam_san	739	10
26368	Long Thành	Long Thanh	Thị trấn Long Thành	Long Thanh Township	long_thanh	740	9
26383	An Phước	An Phuoc	Xã An Phước	An Phuoc Commune	an_phuoc	740	10
26386	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	740	10
26389	Long Đức	Long Duc	Xã Long Đức	Long Duc Commune	long_duc	740	10
26392	Lộc An	Loc An	Xã Lộc An	Loc An Commune	loc_an	740	10
26395	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	740	10
26398	Tam An	Tam An	Xã Tam An	Tam An Commune	tam_an	740	10
26401	Cẩm Đường	Cam Duong	Xã Cẩm Đường	Cam Duong Commune	cam_duong	740	10
26404	Long An	Long An	Xã Long An	Long An Commune	long_an	740	10
26410	Bàu Cạn	Bau Can	Xã Bàu Cạn	Bau Can Commune	bau_can	740	10
26413	Long Phước	Long Phuoc	Xã Long Phước	Long Phuoc Commune	long_phuoc	740	10
26416	Phước Bình	Phuoc Binh	Xã Phước Bình	Phuoc Binh Commune	phuoc_binh	740	10
26419	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	740	10
26422	Phước Thái	Phuoc Thai	Xã Phước Thái	Phuoc Thai Commune	phuoc_thai	740	10
26425	Gia Ray	Gia Ray	Thị trấn Gia Ray	Gia Ray Township	gia_ray	741	9
26428	Xuân Bắc	Xuan Bac	Xã Xuân Bắc	Xuan Bac Commune	xuan_bac	741	10
26431	Suối Cao	Suoi Cao	Xã Suối Cao	Suoi Cao Commune	suoi_cao	741	10
26434	Xuân Thành	Xuan Thanh	Xã Xuân Thành	Xuan Thanh Commune	xuan_thanh	741	10
26437	Xuân Thọ	Xuan Tho	Xã Xuân Thọ	Xuan Tho Commune	xuan_tho	741	10
26440	Xuân Trường	Xuan Truong	Xã Xuân Trường	Xuan Truong Commune	xuan_truong	741	10
26443	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	741	10
26446	Xuân Hưng	Xuan Hung	Xã Xuân Hưng	Xuan Hung Commune	xuan_hung	741	10
26449	Xuân Tâm	Xuan Tam	Xã Xuân Tâm	Xuan Tam Commune	xuan_tam	741	10
26452	Suối Cát	Suoi Cat	Xã Suối Cát	Suoi Cat Commune	suoi_cat	741	10
26455	Xuân Hiệp	Xuan Hiep	Xã Xuân Hiệp	Xuan Hiep Commune	xuan_hiep	741	10
26458	Xuân Phú	Xuan Phu	Xã Xuân Phú	Xuan Phu Commune	xuan_phu	741	10
26461	Xuân Định	Xuan Dinh	Xã Xuân Định	Xuan Dinh Commune	xuan_dinh	741	10
26464	Bảo Hoà	Bao Hoa	Xã Bảo Hoà	Bao Hoa Commune	bao_hoa	741	10
26467	Lang Minh	Lang Minh	Xã Lang Minh	Lang Minh Commune	lang_minh	741	10
26470	Phước Thiền	Phuoc Thien	Xã Phước Thiền	Phuoc Thien Commune	phuoc_thien	742	10
26473	Long Tân	Long Tan	Xã Long Tân	Long Tan Commune	long_tan	742	10
26476	Đại Phước	Dai Phuoc	Xã Đại Phước	Dai Phuoc Commune	dai_phuoc	742	10
26479	Hiệp Phước	Hiep Phuoc	Thị trấn Hiệp Phước	Hiep Phuoc Township	hiep_phuoc	742	9
26482	Phú Hữu	Phu Huu	Xã Phú Hữu	Phu Huu Commune	phu_huu	742	10
26485	Phú Hội	Phu Hoi	Xã Phú Hội	Phu Hoi Commune	phu_hoi	742	10
26488	Phú Thạnh	Phu Thanh	Xã Phú Thạnh	Phu Thanh Commune	phu_thanh	742	10
26491	Phú Đông	Phu Dong	Xã Phú Đông	Phu Dong Commune	phu_dong	742	10
26494	Long Thọ	Long Tho	Xã Long Thọ	Long Tho Commune	long_tho	742	10
26497	Vĩnh Thanh	Vinh Thanh	Xã Vĩnh Thanh	Vinh Thanh Commune	vinh_thanh	742	10
26500	Phước Khánh	Phuoc Khanh	Xã Phước Khánh	Phuoc Khanh Commune	phuoc_khanh	742	10
26503	Phước An	Phuoc An	Xã Phước An	Phuoc An Commune	phuoc_an	742	10
26506	1	1	Phường 1	1 Ward	1	747	8
26508	Thắng Tam	Thang Tam	Phường Thắng Tam	Thang Tam Ward	thang_tam	747	8
26509	2	2	Phường 2	2 Ward	2	747	8
26512	3	3	Phường 3	3 Ward	3	747	8
26515	4	4	Phường 4	4 Ward	4	747	8
26518	5	5	Phường 5	5 Ward	5	747	8
26521	Thắng Nhì	Thang Nhi	Phường Thắng Nhì	Thang Nhi Ward	thang_nhi	747	8
26524	7	7	Phường 7	7 Ward	7	747	8
26526	Nguyễn An Ninh	Nguyen An Ninh	Phường Nguyễn An Ninh	Nguyen An Ninh Ward	nguyen_an_ninh	747	8
26527	8	8	Phường 8	8 Ward	8	747	8
26530	9	9	Phường 9	9 Ward	9	747	8
26533	Thắng Nhất	Thang Nhat	Phường Thắng Nhất	Thang Nhat Ward	thang_nhat	747	8
26535	Rạch Dừa	Rach Dua	Phường Rạch Dừa	Rach Dua Ward	rach_dua	747	8
26536	10	10	Phường 10	10 Ward	10	747	8
26539	11	11	Phường 11	11 Ward	11	747	8
26542	12	12	Phường 12	12 Ward	12	747	8
26545	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	747	10
26548	Phước Hưng	Phuoc Hung	Phường Phước Hưng	Phuoc Hung Ward	phuoc_hung	748	8
26551	Phước Hiệp	Phuoc Hiep	Phường Phước Hiệp	Phuoc Hiep Ward	phuoc_hiep	748	8
26554	Phước Nguyên	Phuoc Nguyen	Phường Phước Nguyên	Phuoc Nguyen Ward	phuoc_nguyen	748	8
26557	Long Toàn	Long Toan	Phường Long Toàn	Long Toan Ward	long_toan	748	8
26558	Long Tâm	Long Tam	Phường Long Tâm	Long Tam Ward	long_tam	748	8
26560	Phước Trung	Phuoc Trung	Phường Phước Trung	Phuoc Trung Ward	phuoc_trung	748	8
26563	Long Hương	Long Huong	Phường Long Hương	Long Huong Ward	long_huong	748	8
26566	Kim Dinh	Kim Dinh	Phường Kim Dinh	Kim Dinh Ward	kim_dinh	748	8
26567	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	748	10
26569	Long Phước	Long Phuoc	Xã Long Phước	Long Phuoc Commune	long_phuoc	748	10
26572	Hoà Long	Hoa Long	Xã Hoà Long	Hoa Long Commune	hoa_long	748	10
26574	Bàu Chinh	Bau Chinh	Xã Bàu Chinh	Bau Chinh Commune	bau_chinh	750	10
26575	Ngãi Giao	Ngai Giao	Thị trấn Ngãi Giao	Ngai Giao Township	ngai_giao	750	9
26578	Bình Ba	Binh Ba	Xã Bình Ba	Binh Ba Commune	binh_ba	750	10
26581	Suối Nghệ	Suoi Nghe	Xã Suối Nghệ	Suoi Nghe Commune	suoi_nghe	750	10
26584	Xuân Sơn	Xuan Son	Xã Xuân Sơn	Xuan Son Commune	xuan_son	750	10
26587	Sơn Bình	Son Binh	Xã Sơn Bình	Son Binh Commune	son_binh	750	10
26590	Bình Giã	Binh Gia	Xã Bình Giã	Binh Gia Commune	binh_gia	750	10
26593	Bình Trung	Binh Trung	Xã Bình Trung	Binh Trung Commune	binh_trung	750	10
26596	Xà Bang	Xa Bang	Xã Xà Bang	Xa Bang Commune	xa_bang	750	10
26599	Cù Bị	Cu Bi	Xã Cù Bị	Cu Bi Commune	cu_bi	750	10
26602	Láng Lớn	Lang Lon	Xã Láng Lớn	Lang Lon Commune	lang_lon	750	10
26605	Quảng Thành	Quang Thanh	Xã Quảng Thành	Quang Thanh Commune	quang_thanh	750	10
26608	Kim Long	Kim Long	Xã Kim Long	Kim Long Commune	kim_long	750	10
26611	Suối Rao	Suoi Rao	Xã Suối Rao	Suoi Rao Commune	suoi_rao	750	10
26614	Đá Bạc	Da Bac	Xã Đá Bạc	Da Bac Commune	da_bac	750	10
26617	Nghĩa Thành	Nghia Thanh	Xã Nghĩa Thành	Nghia Thanh Commune	nghia_thanh	750	10
26620	Phước Bửu	Phuoc Buu	Thị trấn Phước Bửu	Phuoc Buu Township	phuoc_buu	751	9
26623	Phước Thuận	Phuoc Thuan	Xã Phước Thuận	Phuoc Thuan Commune	phuoc_thuan	751	10
26626	Phước Tân	Phuoc Tan	Xã Phước Tân	Phuoc Tan Commune	phuoc_tan	751	10
26629	Xuyên Mộc	Xuyen Moc	Xã Xuyên Mộc	Xuyen Moc Commune	xuyen_moc	751	10
26632	Bông Trang	Bong Trang	Xã Bông Trang	Bong Trang Commune	bong_trang	751	10
26635	Tân Lâm	Tan Lam	Xã Tân Lâm	Tan Lam Commune	tan_lam	751	10
26638	Bàu Lâm	Bau Lam	Xã Bàu Lâm	Bau Lam Commune	bau_lam	751	10
26641	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	751	10
26644	Hòa Hưng	Hoa Hung	Xã Hòa Hưng	Hoa Hung Commune	hoa_hung	751	10
26647	Hòa Hiệp	Hoa Hiep	Xã Hòa Hiệp	Hoa Hiep Commune	hoa_hiep	751	10
26650	Hòa Hội	Hoa Hoi	Xã Hòa Hội	Hoa Hoi Commune	hoa_hoi	751	10
26653	Bưng Riềng	Bung Rieng	Xã Bưng Riềng	Bung Rieng Commune	bung_rieng	751	10
26656	Bình Châu	Binh Chau	Xã Bình Châu	Binh Chau Commune	binh_chau	751	10
26659	Long Điền	Long Dien	Thị trấn Long Điền	Long Dien Township	long_dien	752	9
26662	Long Hải	Long Hai	Thị trấn Long Hải	Long Hai Township	long_hai	752	9
26665	An Ngãi	An Ngai	Xã An Ngãi	An Ngai Commune	an_ngai	752	10
26668	Tam Phước	Tam Phuoc	Xã Tam Phước	Tam Phuoc Commune	tam_phuoc	752	10
27334	05	05	Phường 05	05 Ward	05	774	8
26671	An Nhứt	An Nhut	Xã An Nhứt	An Nhut Commune	an_nhut	752	10
26674	Phước Tỉnh	Phuoc Tinh	Xã Phước Tỉnh	Phuoc Tinh Commune	phuoc_tinh	752	10
26677	Phước Hưng	Phuoc Hung	Xã Phước Hưng	Phuoc Hung Commune	phuoc_hung	752	10
26680	Đất Đỏ	Dat Do	Thị trấn Đất Đỏ	Dat Do Township	dat_do	753	9
26683	Phước Long Thọ	Phuoc Long Tho	Xã Phước Long Thọ	Phuoc Long Tho Commune	phuoc_long_tho	753	10
26686	Phước Hội	Phuoc Hoi	Xã Phước Hội	Phuoc Hoi Commune	phuoc_hoi	753	10
26689	Long Mỹ	Long My	Xã Long Mỹ	Long My Commune	long_my	753	10
26692	Phước Hải	Phuoc Hai	Thị trấn Phước Hải	Phuoc Hai Township	phuoc_hai	753	9
26695	Long Tân	Long Tan	Xã Long Tân	Long Tan Commune	long_tan	753	10
26698	Láng Dài	Lang Dai	Xã Láng Dài	Lang Dai Commune	lang_dai	753	10
26701	Lộc An	Loc An	Xã Lộc An	Loc An Commune	loc_an	753	10
26704	Phú Mỹ	Phu My	Phường Phú Mỹ	Phu My Ward	phu_my	754	8
26707	Tân Hoà	Tan Hoa	Xã Tân Hoà	Tan Hoa Commune	tan_hoa	754	10
26710	Tân Hải	Tan Hai	Xã Tân Hải	Tan Hai Commune	tan_hai	754	10
26713	Phước Hoà	Phuoc Hoa	Phường Phước Hoà	Phuoc Hoa Ward	phuoc_hoa	754	8
26716	Tân Phước	Tan Phuoc	Phường Tân Phước	Tan Phuoc Ward	tan_phuoc	754	8
26719	Mỹ Xuân	My Xuan	Phường Mỹ Xuân	My Xuan Ward	my_xuan	754	8
26722	Sông Xoài	Song Xoai	Xã Sông Xoài	Song Xoai Commune	song_xoai	754	10
26725	Hắc Dịch	Hac Dich	Phường Hắc Dịch	Hac Dich Ward	hac_dich	754	8
26728	Châu Pha	Chau Pha	Xã Châu Pha	Chau Pha Commune	chau_pha	754	10
26731	Tóc Tiên	Toc Tien	Xã Tóc Tiên	Toc Tien Commune	toc_tien	754	10
26734	Tân Định	Tan Dinh	Phường Tân Định	Tan Dinh Ward	tan_dinh	760	8
26737	Đa Kao	Da Kao	Phường Đa Kao	Da Kao Ward	da_kao	760	8
26740	Bến Nghé	Ben Nghe	Phường Bến Nghé	Ben Nghe Ward	ben_nghe	760	8
26743	Bến Thành	Ben Thanh	Phường Bến Thành	Ben Thanh Ward	ben_thanh	760	8
26746	Nguyễn Thái Bình	Nguyen Thai Binh	Phường Nguyễn Thái Bình	Nguyen Thai Binh Ward	nguyen_thai_binh	760	8
27370	01	01	Phường 01	01 Ward	01	775	8
26749	Phạm Ngũ Lão	Pham Ngu Lao	Phường Phạm Ngũ Lão	Pham Ngu Lao Ward	pham_ngu_lao	760	8
26752	Cầu Ông Lãnh	Cau Ong Lanh	Phường Cầu Ông Lãnh	Cau Ong Lanh Ward	cau_ong_lanh	760	8
26755	Cô Giang	Co Giang	Phường Cô Giang	Co Giang Ward	co_giang	760	8
26758	Nguyễn Cư Trinh	Nguyen Cu Trinh	Phường Nguyễn Cư Trinh	Nguyen Cu Trinh Ward	nguyen_cu_trinh	760	8
26761	Cầu Kho	Cau Kho	Phường Cầu Kho	Cau Kho Ward	cau_kho	760	8
26764	Thạnh Xuân	Thanh Xuan	Phường Thạnh Xuân	Thanh Xuan Ward	thanh_xuan	761	8
26767	Thạnh Lộc	Thanh Loc	Phường Thạnh Lộc	Thanh Loc Ward	thanh_loc	761	8
26770	Hiệp Thành	Hiep Thanh	Phường Hiệp Thành	Hiep Thanh Ward	hiep_thanh	761	8
26773	Thới An	Thoi An	Phường Thới An	Thoi An Ward	thoi_an	761	8
26776	Tân Chánh Hiệp	Tan Chanh Hiep	Phường Tân Chánh Hiệp	Tan Chanh Hiep Ward	tan_chanh_hiep	761	8
26779	An Phú Đông	An Phu Dong	Phường An Phú Đông	An Phu Dong Ward	an_phu_dong	761	8
26782	Tân Thới Hiệp	Tan Thoi Hiep	Phường Tân Thới Hiệp	Tan Thoi Hiep Ward	tan_thoi_hiep	761	8
26785	Trung Mỹ Tây	Trung My Tay	Phường Trung Mỹ Tây	Trung My Tay Ward	trung_my_tay	761	8
26787	Tân Hưng Thuận	Tan Hung Thuan	Phường Tân Hưng Thuận	Tan Hung Thuan Ward	tan_hung_thuan	761	8
26788	Đông Hưng Thuận	Dong Hung Thuan	Phường Đông Hưng Thuận	Dong Hung Thuan Ward	dong_hung_thuan	761	8
26791	Tân Thới Nhất	Tan Thoi Nhat	Phường Tân Thới Nhất	Tan Thoi Nhat Ward	tan_thoi_nhat	761	8
26869	15	15	Phường 15	15 Ward	15	764	8
26872	13	13	Phường 13	13 Ward	13	764	8
26875	17	17	Phường 17	17 Ward	17	764	8
26876	6	6	Phường 6	6 Ward	6	764	8
26878	16	16	Phường 16	16 Ward	16	764	8
26881	12	12	Phường 12	12 Ward	12	764	8
26882	14	14	Phường 14	14 Ward	14	764	8
26884	10	10	Phường 10	10 Ward	10	764	8
26887	05	05	Phường 05	05 Ward	05	764	8
26890	07	07	Phường 07	07 Ward	07	764	8
26893	04	04	Phường 04	04 Ward	04	764	8
26896	01	01	Phường 01	01 Ward	01	764	8
26897	9	9	Phường 9	9 Ward	9	764	8
26898	8	8	Phường 8	8 Ward	8	764	8
26899	11	11	Phường 11	11 Ward	11	764	8
26902	03	03	Phường 03	03 Ward	03	764	8
26905	13	13	Phường 13	13 Ward	13	765	8
26908	11	11	Phường 11	11 Ward	11	765	8
26911	27	27	Phường 27	27 Ward	27	765	8
26914	26	26	Phường 26	26 Ward	26	765	8
26917	12	12	Phường 12	12 Ward	12	765	8
26920	25	25	Phường 25	25 Ward	25	765	8
26923	05	05	Phường 05	05 Ward	05	765	8
26926	07	07	Phường 07	07 Ward	07	765	8
26929	24	24	Phường 24	24 Ward	24	765	8
26932	06	06	Phường 06	06 Ward	06	765	8
26935	14	14	Phường 14	14 Ward	14	765	8
26938	15	15	Phường 15	15 Ward	15	765	8
26941	02	02	Phường 02	02 Ward	02	765	8
26944	01	01	Phường 01	01 Ward	01	765	8
26947	03	03	Phường 03	03 Ward	03	765	8
26950	17	17	Phường 17	17 Ward	17	765	8
26953	21	21	Phường 21	21 Ward	21	765	8
26956	22	22	Phường 22	22 Ward	22	765	8
26959	19	19	Phường 19	19 Ward	19	765	8
26962	28	28	Phường 28	28 Ward	28	765	8
26965	02	02	Phường 02	02 Ward	02	766	8
26968	04	04	Phường 04	04 Ward	04	766	8
26971	12	12	Phường 12	12 Ward	12	766	8
26974	13	13	Phường 13	13 Ward	13	766	8
26977	01	01	Phường 01	01 Ward	01	766	8
26980	03	03	Phường 03	03 Ward	03	766	8
26983	11	11	Phường 11	11 Ward	11	766	8
26986	07	07	Phường 07	07 Ward	07	766	8
26989	05	05	Phường 05	05 Ward	05	766	8
26992	10	10	Phường 10	10 Ward	10	766	8
26995	06	06	Phường 06	06 Ward	06	766	8
26998	08	08	Phường 08	08 Ward	08	766	8
27001	09	09	Phường 09	09 Ward	09	766	8
27004	14	14	Phường 14	14 Ward	14	766	8
27007	15	15	Phường 15	15 Ward	15	766	8
27010	Tân Sơn Nhì	Tan Son Nhi	Phường Tân Sơn Nhì	Tan Son Nhi Ward	tan_son_nhi	767	8
27013	Tây Thạnh	Tay Thanh	Phường Tây Thạnh	Tay Thanh Ward	tay_thanh	767	8
27016	Sơn Kỳ	Son Ky	Phường Sơn Kỳ	Son Ky Ward	son_ky	767	8
27019	Tân Quý	Tan Quy	Phường Tân Quý	Tan Quy Ward	tan_quy	767	8
27022	Tân Thành	Tan Thanh	Phường Tân Thành	Tan Thanh Ward	tan_thanh	767	8
27025	Phú Thọ Hòa	Phu Tho Hoa	Phường Phú Thọ Hòa	Phu Tho Hoa Ward	phu_tho_hoa	767	8
27028	Phú Thạnh	Phu Thanh	Phường Phú Thạnh	Phu Thanh Ward	phu_thanh	767	8
27031	Phú Trung	Phu Trung	Phường Phú Trung	Phu Trung Ward	phu_trung	767	8
27034	Hòa Thạnh	Hoa Thanh	Phường Hòa Thạnh	Hoa Thanh Ward	hoa_thanh	767	8
27037	Hiệp Tân	Hiep Tan	Phường Hiệp Tân	Hiep Tan Ward	hiep_tan	767	8
27040	Tân Thới Hòa	Tan Thoi Hoa	Phường Tân Thới Hòa	Tan Thoi Hoa Ward	tan_thoi_hoa	767	8
27043	04	04	Phường 04	04 Ward	04	768	8
27046	05	05	Phường 05	05 Ward	05	768	8
27049	09	09	Phường 09	09 Ward	09	768	8
27052	07	07	Phường 07	07 Ward	07	768	8
27055	03	03	Phường 03	03 Ward	03	768	8
27058	01	01	Phường 01	01 Ward	01	768	8
27061	02	02	Phường 02	02 Ward	02	768	8
27064	08	08	Phường 08	08 Ward	08	768	8
27067	15	15	Phường 15	15 Ward	15	768	8
27070	10	10	Phường 10	10 Ward	10	768	8
27073	11	11	Phường 11	11 Ward	11	768	8
27076	17	17	Phường 17	17 Ward	17	768	8
26794	Linh Xuân	Linh Xuan	Phường Linh Xuân	Linh Xuan Ward	linh_xuan	769	8
26797	Bình Chiểu	Binh Chieu	Phường Bình Chiểu	Binh Chieu Ward	binh_chieu	769	8
26800	Linh Trung	Linh Trung	Phường Linh Trung	Linh Trung Ward	linh_trung	769	8
26803	Tam Bình	Tam Binh	Phường Tam Bình	Tam Binh Ward	tam_binh	769	8
26806	Tam Phú	Tam Phu	Phường Tam Phú	Tam Phu Ward	tam_phu	769	8
26809	Hiệp Bình Phước	Hiep Binh Phuoc	Phường Hiệp Bình Phước	Hiep Binh Phuoc Ward	hiep_binh_phuoc	769	8
26812	Hiệp Bình Chánh	Hiep Binh Chanh	Phường Hiệp Bình Chánh	Hiep Binh Chanh Ward	hiep_binh_chanh	769	8
26815	Linh Chiểu	Linh Chieu	Phường Linh Chiểu	Linh Chieu Ward	linh_chieu	769	8
26818	Linh Tây	Linh Tay	Phường Linh Tây	Linh Tay Ward	linh_tay	769	8
26821	Linh Đông	Linh Dong	Phường Linh Đông	Linh Dong Ward	linh_dong	769	8
26824	Bình Thọ	Binh Tho	Phường Bình Thọ	Binh Tho Ward	binh_tho	769	8
26827	Trường Thọ	Truong Tho	Phường Trường Thọ	Truong Tho Ward	truong_tho	769	8
26830	Long Bình	Long Binh	Phường Long Bình	Long Binh Ward	long_binh	769	8
26833	Long Thạnh Mỹ	Long Thanh My	Phường Long Thạnh Mỹ	Long Thanh My Ward	long_thanh_my	769	8
26836	Tân Phú	Tan Phu	Phường Tân Phú	Tan Phu Ward	tan_phu	769	8
26839	Hiệp Phú	Hiep Phu	Phường Hiệp Phú	Hiep Phu Ward	hiep_phu	769	8
26842	Tăng Nhơn Phú A	Tang Nhon Phu A	Phường Tăng Nhơn Phú A	Tang Nhon Phu A Ward	tang_nhon_phu_a	769	8
26845	Tăng Nhơn Phú B	Tang Nhon Phu B	Phường Tăng Nhơn Phú B	Tang Nhon Phu B Ward	tang_nhon_phu_b	769	8
26848	Phước Long B	Phuoc Long B	Phường Phước Long B	Phuoc Long B Ward	phuoc_long_b	769	8
26851	Phước Long A	Phuoc Long A	Phường Phước Long A	Phuoc Long A Ward	phuoc_long_a	769	8
26854	Trường Thạnh	Truong Thanh	Phường Trường Thạnh	Truong Thanh Ward	truong_thanh	769	8
26857	Long Phước	Long Phuoc	Phường Long Phước	Long Phuoc Ward	long_phuoc	769	8
26860	Long Trường	Long Truong	Phường Long Trường	Long Truong Ward	long_truong	769	8
26863	Phước Bình	Phuoc Binh	Phường Phước Bình	Phuoc Binh Ward	phuoc_binh	769	8
26866	Phú Hữu	Phu Huu	Phường Phú Hữu	Phu Huu Ward	phu_huu	769	8
27088	Thảo Điền	Thao Dien	Phường Thảo Điền	Thao Dien Ward	thao_dien	769	8
27091	An Phú	An Phu	Phường An Phú	An Phu Ward	an_phu	769	8
27094	An Khánh	An Khanh	Phường An Khánh	An Khanh Ward	an_khanh	769	8
27097	Bình Trưng Đông	Binh Trung Dong	Phường Bình Trưng Đông	Binh Trung Dong Ward	binh_trung_dong	769	8
27100	Bình Trưng Tây	Binh Trung Tay	Phường Bình Trưng Tây	Binh Trung Tay Ward	binh_trung_tay	769	8
27109	Cát Lái	Cat Lai	Phường Cát Lái	Cat Lai Ward	cat_lai	769	8
27112	Thạnh Mỹ Lợi	Thanh My Loi	Phường Thạnh Mỹ Lợi	Thanh My Loi Ward	thanh_my_loi	769	8
27115	An Lợi Đông	An Loi Dong	Phường An Lợi Đông	An Loi Dong Ward	an_loi_dong	769	8
27118	Thủ Thiêm	Thu Thiem	Phường Thủ Thiêm	Thu Thiem Ward	thu_thiem	769	8
27127	14	14	Phường 14	14 Ward	14	770	8
27130	12	12	Phường 12	12 Ward	12	770	8
27133	11	11	Phường 11	11 Ward	11	770	8
27136	13	13	Phường 13	13 Ward	13	770	8
27139	Võ Thị Sáu	Vo Thi Sau	Phường Võ Thị Sáu	Vo Thi Sau Ward	vo_thi_sau	770	8
27142	09	09	Phường 09	09 Ward	09	770	8
27145	10	10	Phường 10	10 Ward	10	770	8
27148	04	04	Phường 04	04 Ward	04	770	8
27151	05	05	Phường 05	05 Ward	05	770	8
27154	03	03	Phường 03	03 Ward	03	770	8
27157	02	02	Phường 02	02 Ward	02	770	8
27160	01	01	Phường 01	01 Ward	01	770	8
27163	15	15	Phường 15	15 Ward	15	771	8
27166	13	13	Phường 13	13 Ward	13	771	8
27169	14	14	Phường 14	14 Ward	14	771	8
27172	12	12	Phường 12	12 Ward	12	771	8
27175	11	11	Phường 11	11 Ward	11	771	8
27178	10	10	Phường 10	10 Ward	10	771	8
27181	09	09	Phường 09	09 Ward	09	771	8
27184	01	01	Phường 01	01 Ward	01	771	8
27187	08	08	Phường 08	08 Ward	08	771	8
27190	02	02	Phường 02	02 Ward	02	771	8
27193	04	04	Phường 04	04 Ward	04	771	8
27196	07	07	Phường 07	07 Ward	07	771	8
27199	05	05	Phường 05	05 Ward	05	771	8
27202	06	06	Phường 06	06 Ward	06	771	8
27208	15	15	Phường 15	15 Ward	15	772	8
27211	05	05	Phường 05	05 Ward	05	772	8
27214	14	14	Phường 14	14 Ward	14	772	8
27217	11	11	Phường 11	11 Ward	11	772	8
27220	03	03	Phường 03	03 Ward	03	772	8
27223	10	10	Phường 10	10 Ward	10	772	8
27226	13	13	Phường 13	13 Ward	13	772	8
27229	08	08	Phường 08	08 Ward	08	772	8
27232	09	09	Phường 09	09 Ward	09	772	8
27235	12	12	Phường 12	12 Ward	12	772	8
27238	07	07	Phường 07	07 Ward	07	772	8
27241	06	06	Phường 06	06 Ward	06	772	8
27244	04	04	Phường 04	04 Ward	04	772	8
27247	01	01	Phường 01	01 Ward	01	772	8
27250	02	02	Phường 02	02 Ward	02	772	8
27253	16	16	Phường 16	16 Ward	16	772	8
27343	13	13	Phường 13	13 Ward	13	774	8
27346	14	14	Phường 14	14 Ward	14	775	8
27349	13	13	Phường 13	13 Ward	13	775	8
27352	09	09	Phường 09	09 Ward	09	775	8
27355	06	06	Phường 06	06 Ward	06	775	8
27358	12	12	Phường 12	12 Ward	12	775	8
27361	05	05	Phường 05	05 Ward	05	775	8
27364	11	11	Phường 11	11 Ward	11	775	8
27367	02	02	Phường 02	02 Ward	02	775	8
27373	04	04	Phường 04	04 Ward	04	775	8
27376	08	08	Phường 08	08 Ward	08	775	8
27379	03	03	Phường 03	03 Ward	03	775	8
27382	07	07	Phường 07	07 Ward	07	775	8
27385	10	10	Phường 10	10 Ward	10	775	8
27388	08	08	Phường 08	08 Ward	08	776	8
27391	02	02	Phường 02	02 Ward	02	776	8
27394	01	01	Phường 01	01 Ward	01	776	8
27397	03	03	Phường 03	03 Ward	03	776	8
27400	11	11	Phường 11	11 Ward	11	776	8
27403	09	09	Phường 09	09 Ward	09	776	8
27406	10	10	Phường 10	10 Ward	10	776	8
27409	04	04	Phường 04	04 Ward	04	776	8
27412	13	13	Phường 13	13 Ward	13	776	8
27415	12	12	Phường 12	12 Ward	12	776	8
27418	05	05	Phường 05	05 Ward	05	776	8
27421	14	14	Phường 14	14 Ward	14	776	8
27424	06	06	Phường 06	06 Ward	06	776	8
27427	15	15	Phường 15	15 Ward	15	776	8
27430	16	16	Phường 16	16 Ward	16	776	8
27433	07	07	Phường 07	07 Ward	07	776	8
27436	Bình Hưng Hòa	Binh Hung Hoa	Phường Bình Hưng Hòa	Binh Hung Hoa Ward	binh_hung_hoa	777	8
27439	Bình Hưng Hoà A	Binh Hung Hoa A	Phường Bình Hưng Hoà A	Binh Hung Hoa A Ward	binh_hung_hoa_a	777	8
27442	Bình Hưng Hoà B	Binh Hung Hoa B	Phường Bình Hưng Hoà B	Binh Hung Hoa B Ward	binh_hung_hoa_b	777	8
27445	Bình Trị Đông	Binh Tri Dong	Phường Bình Trị Đông	Binh Tri Dong Ward	binh_tri_dong	777	8
27448	Bình Trị Đông A	Binh Tri Dong A	Phường Bình Trị Đông A	Binh Tri Dong A Ward	binh_tri_dong_a	777	8
27451	Bình Trị Đông B	Binh Tri Dong B	Phường Bình Trị Đông B	Binh Tri Dong B Ward	binh_tri_dong_b	777	8
27454	Tân Tạo	Tan Tao	Phường Tân Tạo	Tan Tao Ward	tan_tao	777	8
27457	Tân Tạo A	Tan Tao A	Phường Tân Tạo A	Tan Tao A Ward	tan_tao_a	777	8
27460	 An Lạc	 An Lac	Phường  An Lạc	 An Lac Ward	_an_lac	777	8
27463	An Lạc A	An Lac A	Phường An Lạc A	An Lac A Ward	an_lac_a	777	8
27466	Tân Thuận Đông	Tan Thuan Dong	Phường Tân Thuận Đông	Tan Thuan Dong Ward	tan_thuan_dong	778	8
27469	Tân Thuận Tây	Tan Thuan Tay	Phường Tân Thuận Tây	Tan Thuan Tay Ward	tan_thuan_tay	778	8
27472	Tân Kiểng	Tan Kieng	Phường Tân Kiểng	Tan Kieng Ward	tan_kieng	778	8
27475	Tân Hưng	Tan Hung	Phường Tân Hưng	Tan Hung Ward	tan_hung	778	8
27478	Bình Thuận	Binh Thuan	Phường Bình Thuận	Binh Thuan Ward	binh_thuan	778	8
27481	Tân Quy	Tan Quy	Phường Tân Quy	Tan Quy Ward	tan_quy	778	8
27484	Phú Thuận	Phu Thuan	Phường Phú Thuận	Phu Thuan Ward	phu_thuan	778	8
27487	Tân Phú	Tan Phu	Phường Tân Phú	Tan Phu Ward	tan_phu	778	8
27490	Tân Phong	Tan Phong	Phường Tân Phong	Tan Phong Ward	tan_phong	778	8
27493	Phú Mỹ	Phu My	Phường Phú Mỹ	Phu My Ward	phu_my	778	8
27496	Củ Chi	Cu Chi	Thị trấn Củ Chi	Cu Chi Township	cu_chi	783	9
27499	Phú Mỹ Hưng	Phu My Hung	Xã Phú Mỹ Hưng	Phu My Hung Commune	phu_my_hung	783	10
27502	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	783	10
27505	Trung Lập Thượng	Trung Lap Thuong	Xã Trung Lập Thượng	Trung Lap Thuong Commune	trung_lap_thuong	783	10
27508	An Nhơn Tây	An Nhon Tay	Xã An Nhơn Tây	An Nhon Tay Commune	an_nhon_tay	783	10
27511	Nhuận Đức	Nhuan Duc	Xã Nhuận Đức	Nhuan Duc Commune	nhuan_duc	783	10
27514	Phạm Văn Cội	Pham Van Coi	Xã Phạm Văn Cội	Pham Van Coi Commune	pham_van_coi	783	10
27517	Phú Hòa Đông	Phu Hoa Dong	Xã Phú Hòa Đông	Phu Hoa Dong Commune	phu_hoa_dong	783	10
27520	Trung Lập Hạ	Trung Lap Ha	Xã Trung Lập Hạ	Trung Lap Ha Commune	trung_lap_ha	783	10
27523	Trung An	Trung An	Xã Trung An	Trung An Commune	trung_an	783	10
27526	Phước Thạnh	Phuoc Thanh	Xã Phước Thạnh	Phuoc Thanh Commune	phuoc_thanh	783	10
27529	Phước Hiệp	Phuoc Hiep	Xã Phước Hiệp	Phuoc Hiep Commune	phuoc_hiep	783	10
27532	Tân An Hội	Tan An Hoi	Xã Tân An Hội	Tan An Hoi Commune	tan_an_hoi	783	10
27535	Phước Vĩnh An	Phuoc Vinh An	Xã Phước Vĩnh An	Phuoc Vinh An Commune	phuoc_vinh_an	783	10
27538	Thái Mỹ	Thai My	Xã Thái Mỹ	Thai My Commune	thai_my	783	10
27541	Tân Thạnh Tây	Tan Thanh Tay	Xã Tân Thạnh Tây	Tan Thanh Tay Commune	tan_thanh_tay	783	10
27544	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	783	10
27547	Tân Thạnh Đông	Tan Thanh Dong	Xã Tân Thạnh Đông	Tan Thanh Dong Commune	tan_thanh_dong	783	10
27550	Bình Mỹ	Binh My	Xã Bình Mỹ	Binh My Commune	binh_my	783	10
27553	Tân Phú Trung	Tan Phu Trung	Xã Tân Phú Trung	Tan Phu Trung Commune	tan_phu_trung	783	10
27556	Tân Thông Hội	Tan Thong Hoi	Xã Tân Thông Hội	Tan Thong Hoi Commune	tan_thong_hoi	783	10
27559	Hóc Môn	Hoc Mon	Thị trấn Hóc Môn	Hoc Mon Township	hoc_mon	784	9
27562	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	784	10
27565	Nhị Bình	Nhi Binh	Xã Nhị Bình	Nhi Binh Commune	nhi_binh	784	10
27568	Đông Thạnh	Dong Thanh	Xã Đông Thạnh	Dong Thanh Commune	dong_thanh	784	10
27571	Tân Thới Nhì	Tan Thoi Nhi	Xã Tân Thới Nhì	Tan Thoi Nhi Commune	tan_thoi_nhi	784	10
27574	Thới Tam Thôn	Thoi Tam Thon	Xã Thới Tam Thôn	Thoi Tam Thon Commune	thoi_tam_thon	784	10
27577	Xuân Thới Sơn	Xuan Thoi Son	Xã Xuân Thới Sơn	Xuan Thoi Son Commune	xuan_thoi_son	784	10
27580	Tân Xuân	Tan Xuan	Xã Tân Xuân	Tan Xuan Commune	tan_xuan	784	10
27583	Xuân Thới Đông	Xuan Thoi Dong	Xã Xuân Thới Đông	Xuan Thoi Dong Commune	xuan_thoi_dong	784	10
27586	Trung Chánh	Trung Chanh	Xã Trung Chánh	Trung Chanh Commune	trung_chanh	784	10
27589	Xuân Thới Thượng	Xuan Thoi Thuong	Xã Xuân Thới Thượng	Xuan Thoi Thuong Commune	xuan_thoi_thuong	784	10
27592	Bà Điểm	Ba Diem	Xã Bà Điểm	Ba Diem Commune	ba_diem	784	10
27595	Tân Túc	Tan Tuc	Thị trấn Tân Túc	Tan Tuc Township	tan_tuc	785	9
27598	Phạm Văn Hai	Pham Van Hai	Xã Phạm Văn Hai	Pham Van Hai Commune	pham_van_hai	785	10
27601	Vĩnh Lộc A	Vinh Loc A	Xã Vĩnh Lộc A	Vinh Loc A Commune	vinh_loc_a	785	10
27604	Vĩnh Lộc B	Vinh Loc B	Xã Vĩnh Lộc B	Vinh Loc B Commune	vinh_loc_b	785	10
27607	Bình Lợi	Binh Loi	Xã Bình Lợi	Binh Loi Commune	binh_loi	785	10
27610	Lê Minh Xuân	Le Minh Xuan	Xã Lê Minh Xuân	Le Minh Xuan Commune	le_minh_xuan	785	10
27613	Tân Nhựt	Tan Nhut	Xã Tân Nhựt	Tan Nhut Commune	tan_nhut	785	10
27616	Tân Kiên	Tan Kien	Xã Tân Kiên	Tan Kien Commune	tan_kien	785	10
27619	Bình Hưng	Binh Hung	Xã Bình Hưng	Binh Hung Commune	binh_hung	785	10
27622	Phong Phú	Phong Phu	Xã Phong Phú	Phong Phu Commune	phong_phu	785	10
27625	An Phú Tây	An Phu Tay	Xã An Phú Tây	An Phu Tay Commune	an_phu_tay	785	10
27628	Hưng Long	Hung Long	Xã Hưng Long	Hung Long Commune	hung_long	785	10
27631	Đa Phước	Da Phuoc	Xã Đa Phước	Da Phuoc Commune	da_phuoc	785	10
27634	Tân Quý Tây	Tan Quy Tay	Xã Tân Quý Tây	Tan Quy Tay Commune	tan_quy_tay	785	10
27637	Bình Chánh	Binh Chanh	Xã Bình Chánh	Binh Chanh Commune	binh_chanh	785	10
27640	Quy Đức	Quy Duc	Xã Quy Đức	Quy Duc Commune	quy_duc	785	10
27643	Nhà Bè	Nha Be	Thị trấn Nhà Bè	Nha Be Township	nha_be	786	9
27646	Phước Kiển	Phuoc Kien	Xã Phước Kiển	Phuoc Kien Commune	phuoc_kien	786	10
27649	Phước Lộc	Phuoc Loc	Xã Phước Lộc	Phuoc Loc Commune	phuoc_loc	786	10
27652	Nhơn Đức	Nhon Duc	Xã Nhơn Đức	Nhon Duc Commune	nhon_duc	786	10
27655	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	786	10
27658	Long Thới	Long Thoi	Xã Long Thới	Long Thoi Commune	long_thoi	786	10
27661	Hiệp Phước	Hiep Phuoc	Xã Hiệp Phước	Hiep Phuoc Commune	hiep_phuoc	786	10
27664	Cần Thạnh	Can Thanh	Thị trấn Cần Thạnh	Can Thanh Township	can_thanh	787	9
27667	Bình Khánh	Binh Khanh	Xã Bình Khánh	Binh Khanh Commune	binh_khanh	787	10
27670	Tam Thôn Hiệp	Tam Thon Hiep	Xã Tam Thôn Hiệp	Tam Thon Hiep Commune	tam_thon_hiep	787	10
27673	An Thới Đông	An Thoi Dong	Xã An Thới Đông	An Thoi Dong Commune	an_thoi_dong	787	10
27676	Thạnh An	Thanh An	Xã Thạnh An	Thanh An Commune	thanh_an	787	10
27679	Long Hòa	Long Hoa	Xã Long Hòa	Long Hoa Commune	long_hoa	787	10
27682	Lý Nhơn	Ly Nhon	Xã Lý Nhơn	Ly Nhon Commune	ly_nhon	787	10
27685	5	5	Phường 5	5 Ward	5	794	8
27688	2	2	Phường 2	2 Ward	2	794	8
27691	4	4	Phường 4	4 Ward	4	794	8
27692	Tân Khánh	Tan Khanh	Phường Tân Khánh	Tan Khanh Ward	tan_khanh	794	8
27694	1	1	Phường 1	1 Ward	1	794	8
27697	3	3	Phường 3	3 Ward	3	794	8
27698	7	7	Phường 7	7 Ward	7	794	8
27700	6	6	Phường 6	6 Ward	6	794	8
27703	Hướng Thọ Phú	Huong Tho Phu	Xã Hướng Thọ Phú	Huong Tho Phu Commune	huong_tho_phu	794	10
27706	Nhơn Thạnh Trung	Nhon Thanh Trung	Xã Nhơn Thạnh Trung	Nhon Thanh Trung Commune	nhon_thanh_trung	794	10
27709	Lợi Bình Nhơn	Loi Binh Nhon	Xã Lợi Bình Nhơn	Loi Binh Nhon Commune	loi_binh_nhon	794	10
27712	Bình Tâm	Binh Tam	Xã Bình Tâm	Binh Tam Commune	binh_tam	794	10
27715	Khánh Hậu	Khanh Hau	Phường Khánh Hậu	Khanh Hau Ward	khanh_hau	794	8
27718	An Vĩnh Ngãi	An Vinh Ngai	Xã An Vĩnh Ngãi	An Vinh Ngai Commune	an_vinh_ngai	794	10
27787	1	1	Phường 1	1 Ward	1	795	8
27788	2	2	Phường 2	2 Ward	2	795	8
27790	Thạnh Trị	Thanh Tri	Xã Thạnh Trị	Thanh Tri Commune	thanh_tri	795	10
27793	Bình Hiệp	Binh Hiep	Xã Bình Hiệp	Binh Hiep Commune	binh_hiep	795	10
27799	Bình Tân	Binh Tan	Xã Bình Tân	Binh Tan Commune	binh_tan	795	10
27805	Tuyên Thạnh	Tuyen Thanh	Xã Tuyên Thạnh	Tuyen Thanh Commune	tuyen_thanh	795	10
27806	3	3	Phường 3	3 Ward	3	795	8
27817	Thạnh Hưng	Thanh Hung	Xã Thạnh Hưng	Thanh Hung Commune	thanh_hung	795	10
27721	Tân Hưng	Tan Hung	Thị trấn Tân Hưng	Tan Hung Township	tan_hung	796	9
27724	Hưng Hà	Hung Ha	Xã Hưng Hà	Hung Ha Commune	hung_ha	796	10
27727	Hưng Điền B	Hung Dien B	Xã Hưng Điền B	Hung Dien B Commune	hung_dien_b	796	10
27730	Hưng Điền	Hung Dien	Xã Hưng Điền	Hung Dien Commune	hung_dien	796	10
27733	Thạnh Hưng	Thanh Hung	Xã Thạnh Hưng	Thanh Hung Commune	thanh_hung	796	10
27736	Hưng Thạnh	Hung Thanh	Xã Hưng Thạnh	Hung Thanh Commune	hung_thanh	796	10
27739	Vĩnh Thạnh	Vinh Thanh	Xã Vĩnh Thạnh	Vinh Thanh Commune	vinh_thanh	796	10
27742	Vĩnh Châu B	Vinh Chau B	Xã Vĩnh Châu B	Vinh Chau B Commune	vinh_chau_b	796	10
27745	Vĩnh Lợi	Vinh Loi	Xã Vĩnh Lợi	Vinh Loi Commune	vinh_loi	796	10
27748	Vĩnh Đại	Vinh Dai	Xã Vĩnh Đại	Vinh Dai Commune	vinh_dai	796	10
27751	Vĩnh Châu A	Vinh Chau A	Xã Vĩnh Châu A	Vinh Chau A Commune	vinh_chau_a	796	10
27754	Vĩnh Bửu	Vinh Buu	Xã Vĩnh Bửu	Vinh Buu Commune	vinh_buu	796	10
27757	Vĩnh Hưng	Vinh Hung	Thị trấn Vĩnh Hưng	Vinh Hung Township	vinh_hung	797	9
27760	Hưng Điền A	Hung Dien A	Xã Hưng Điền A	Hung Dien A Commune	hung_dien_a	797	10
27763	Khánh Hưng	Khanh Hung	Xã Khánh Hưng	Khanh Hung Commune	khanh_hung	797	10
27766	Thái Trị	Thai Tri	Xã Thái Trị	Thai Tri Commune	thai_tri	797	10
27769	Vĩnh Trị	Vinh Tri	Xã Vĩnh Trị	Vinh Tri Commune	vinh_tri	797	10
27772	Thái Bình Trung	Thai Binh Trung	Xã Thái Bình Trung	Thai Binh Trung Commune	thai_binh_trung	797	10
27775	Vĩnh Bình	Vinh Binh	Xã Vĩnh Bình	Vinh Binh Commune	vinh_binh	797	10
27778	Vĩnh Thuận	Vinh Thuan	Xã Vĩnh Thuận	Vinh Thuan Commune	vinh_thuan	797	10
27781	Tuyên Bình	Tuyen Binh	Xã Tuyên Bình	Tuyen Binh Commune	tuyen_binh	797	10
27784	Tuyên Bình Tây	Tuyen Binh Tay	Xã Tuyên Bình Tây	Tuyen Binh Tay Commune	tuyen_binh_tay	797	10
27796	Bình Hòa Tây	Binh Hoa Tay	Xã Bình Hòa Tây	Binh Hoa Tay Commune	binh_hoa_tay	798	10
27802	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	798	10
27808	Bình Hòa Trung	Binh Hoa Trung	Xã Bình Hòa Trung	Binh Hoa Trung Commune	binh_hoa_trung	798	10
27811	Bình Hòa Đông	Binh Hoa Dong	Xã Bình Hòa Đông	Binh Hoa Dong Commune	binh_hoa_dong	798	10
27814	Bình Phong Thạnh	Binh Phong Thanh	Thị trấn Bình Phong Thạnh	Binh Phong Thanh Township	binh_phong_thanh	798	9
27820	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	798	10
27823	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	798	10
27826	Tân Thạnh	Tan Thanh	Thị trấn Tân Thạnh	Tan Thanh Township	tan_thanh	799	9
27829	Bắc Hòa	Bac Hoa	Xã Bắc Hòa	Bac Hoa Commune	bac_hoa	799	10
27832	Hậu Thạnh Tây	Hau Thanh Tay	Xã Hậu Thạnh Tây	Hau Thanh Tay Commune	hau_thanh_tay	799	10
27835	Nhơn Hòa Lập	Nhon Hoa Lap	Xã Nhơn Hòa Lập	Nhon Hoa Lap Commune	nhon_hoa_lap	799	10
27838	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	799	10
27841	Hậu Thạnh Đông	Hau Thanh Dong	Xã Hậu Thạnh Đông	Hau Thanh Dong Commune	hau_thanh_dong	799	10
27844	Nhơn Hoà	Nhon Hoa	Xã Nhơn Hoà	Nhon Hoa Commune	nhon_hoa	799	10
27847	Kiến Bình	Kien Binh	Xã Kiến Bình	Kien Binh Commune	kien_binh	799	10
27850	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	799	10
27853	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	799	10
27856	Tân Ninh	Tan Ninh	Xã Tân Ninh	Tan Ninh Commune	tan_ninh	799	10
27859	Nhơn Ninh	Nhon Ninh	Xã Nhơn Ninh	Nhon Ninh Commune	nhon_ninh	799	10
27862	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	799	10
27865	Thạnh Hóa	Thanh Hoa	Thị trấn Thạnh Hóa	Thanh Hoa Township	thanh_hoa	800	9
27868	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	800	10
27871	Thuận Bình	Thuan Binh	Xã Thuận Bình	Thuan Binh Commune	thuan_binh	800	10
27874	Thạnh Phước	Thanh Phuoc	Xã Thạnh Phước	Thanh Phuoc Commune	thanh_phuoc	800	10
27877	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	800	10
27880	Thuận Nghĩa Hòa	Thuan Nghia Hoa	Xã Thuận Nghĩa Hòa	Thuan Nghia Hoa Commune	thuan_nghia_hoa	800	10
27883	Thủy Đông	Thuy Dong	Xã Thủy Đông	Thuy Dong Commune	thuy_dong	800	10
27886	Thủy Tây	Thuy Tay	Xã Thủy Tây	Thuy Tay Commune	thuy_tay	800	10
27889	Tân Tây	Tan Tay	Xã Tân Tây	Tan Tay Commune	tan_tay	800	10
27892	Tân Đông	Tan Dong	Xã Tân Đông	Tan Dong Commune	tan_dong	800	10
27895	Thạnh An	Thanh An	Xã Thạnh An	Thanh An Commune	thanh_an	800	10
27898	Đông Thành	Dong Thanh	Thị trấn Đông Thành	Dong Thanh Township	dong_thanh	801	9
27901	Mỹ Quý Đông	My Quy Dong	Xã Mỹ Quý Đông	My Quy Dong Commune	my_quy_dong	801	10
27904	Mỹ Thạnh Bắc	My Thanh Bac	Xã Mỹ Thạnh Bắc	My Thanh Bac Commune	my_thanh_bac	801	10
27907	Mỹ Quý Tây	My Quy Tay	Xã Mỹ Quý Tây	My Quy Tay Commune	my_quy_tay	801	10
27910	Mỹ Thạnh Tây	My Thanh Tay	Xã Mỹ Thạnh Tây	My Thanh Tay Commune	my_thanh_tay	801	10
27913	Mỹ Thạnh Đông	My Thanh Dong	Xã Mỹ Thạnh Đông	My Thanh Dong Commune	my_thanh_dong	801	10
27916	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	801	10
27919	Bình Hòa Bắc	Binh Hoa Bac	Xã Bình Hòa Bắc	Binh Hoa Bac Commune	binh_hoa_bac	801	10
27922	Bình Hòa Hưng	Binh Hoa Hung	Xã Bình Hòa Hưng	Binh Hoa Hung Commune	binh_hoa_hung	801	10
27925	Bình Hòa Nam	Binh Hoa Nam	Xã Bình Hòa Nam	Binh Hoa Nam Commune	binh_hoa_nam	801	10
27928	Mỹ Bình	My Binh	Xã Mỹ Bình	My Binh Commune	my_binh	801	10
27931	Hậu Nghĩa	Hau Nghia	Thị trấn Hậu Nghĩa	Hau Nghia Township	hau_nghia	802	9
27934	Hiệp Hòa	Hiep Hoa	Thị trấn Hiệp Hòa	Hiep Hoa Township	hiep_hoa	802	9
27937	Đức Hòa	Duc Hoa	Thị trấn Đức Hòa	Duc Hoa Township	duc_hoa	802	9
27940	Lộc Giang	Loc Giang	Xã Lộc Giang	Loc Giang Commune	loc_giang	802	10
27943	An Ninh Đông	An Ninh Dong	Xã An Ninh Đông	An Ninh Dong Commune	an_ninh_dong	802	10
27946	An Ninh Tây	An Ninh Tay	Xã An Ninh Tây	An Ninh Tay Commune	an_ninh_tay	802	10
27949	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	802	10
27952	Hiệp Hòa	Hiep Hoa	Xã Hiệp Hòa	Hiep Hoa Commune	hiep_hoa	802	10
27955	Đức Lập Thượng	Duc Lap Thuong	Xã Đức Lập Thượng	Duc Lap Thuong Commune	duc_lap_thuong	802	10
27958	Đức Lập Hạ	Duc Lap Ha	Xã Đức Lập Hạ	Duc Lap Ha Commune	duc_lap_ha	802	10
27961	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	802	10
27964	Mỹ Hạnh Bắc	My Hanh Bac	Xã Mỹ Hạnh Bắc	My Hanh Bac Commune	my_hanh_bac	802	10
27967	Đức Hòa Thượng	Duc Hoa Thuong	Xã Đức Hòa Thượng	Duc Hoa Thuong Commune	duc_hoa_thuong	802	10
27970	Hòa Khánh Tây	Hoa Khanh Tay	Xã Hòa Khánh Tây	Hoa Khanh Tay Commune	hoa_khanh_tay	802	10
27973	Hòa Khánh Đông	Hoa Khanh Dong	Xã Hòa Khánh Đông	Hoa Khanh Dong Commune	hoa_khanh_dong	802	10
27976	Mỹ Hạnh Nam	My Hanh Nam	Xã Mỹ Hạnh Nam	My Hanh Nam Commune	my_hanh_nam	802	10
27979	Hòa Khánh Nam	Hoa Khanh Nam	Xã Hòa Khánh Nam	Hoa Khanh Nam Commune	hoa_khanh_nam	802	10
27982	Đức Hòa Đông	Duc Hoa Dong	Xã Đức Hòa Đông	Duc Hoa Dong Commune	duc_hoa_dong	802	10
27985	Đức Hòa Hạ	Duc Hoa Ha	Xã Đức Hòa Hạ	Duc Hoa Ha Commune	duc_hoa_ha	802	10
27988	Hựu Thạnh	Huu Thanh	Xã Hựu Thạnh	Huu Thanh Commune	huu_thanh	802	10
27991	Bến Lức	Ben Luc	Thị trấn Bến Lức	Ben Luc Township	ben_luc	803	9
27994	Thạnh Lợi	Thanh Loi	Xã Thạnh Lợi	Thanh Loi Commune	thanh_loi	803	10
27997	Lương Bình	Luong Binh	Xã Lương Bình	Luong Binh Commune	luong_binh	803	10
28000	Thạnh Hòa	Thanh Hoa	Xã Thạnh Hòa	Thanh Hoa Commune	thanh_hoa	803	10
28003	Lương Hòa	Luong Hoa	Xã Lương Hòa	Luong Hoa Commune	luong_hoa	803	10
29551	2	2	Phường 2	2 Ward	2	855	8
28006	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	803	10
28009	Tân Bửu	Tan Buu	Xã Tân Bửu	Tan Buu Commune	tan_buu	803	10
28012	An Thạnh	An Thanh	Xã An Thạnh	An Thanh Commune	an_thanh	803	10
28015	Bình Đức	Binh Duc	Xã Bình Đức	Binh Duc Commune	binh_duc	803	10
28018	Mỹ Yên	My Yen	Xã Mỹ Yên	My Yen Commune	my_yen	803	10
28021	Thanh Phú	Thanh Phu	Xã Thanh Phú	Thanh Phu Commune	thanh_phu	803	10
28024	Long Hiệp	Long Hiep	Xã Long Hiệp	Long Hiep Commune	long_hiep	803	10
28027	Thạnh Đức	Thanh Duc	Xã Thạnh Đức	Thanh Duc Commune	thanh_duc	803	10
28030	Phước Lợi	Phuoc Loi	Xã Phước Lợi	Phuoc Loi Commune	phuoc_loi	803	10
28033	Nhựt Chánh	Nhut Chanh	Xã Nhựt Chánh	Nhut Chanh Commune	nhut_chanh	803	10
28036	Thủ Thừa	Thu Thua	Thị trấn Thủ Thừa	Thu Thua Township	thu_thua	804	9
28039	Long Thạnh	Long Thanh	Xã Long Thạnh	Long Thanh Commune	long_thanh	804	10
28042	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	804	10
28045	Long Thuận	Long Thuan	Xã Long Thuận	Long Thuan Commune	long_thuan	804	10
28048	Mỹ Lạc	My Lac	Xã Mỹ Lạc	My Lac Commune	my_lac	804	10
28051	Mỹ Thạnh	My Thanh	Xã Mỹ Thạnh	My Thanh Commune	my_thanh	804	10
28054	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	804	10
28057	Nhị Thành	Nhi Thanh	Xã Nhị Thành	Nhi Thanh Commune	nhi_thanh	804	10
28060	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	804	10
28063	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	804	10
28066	Mỹ Phú	My Phu	Xã Mỹ Phú	My Phu Commune	my_phu	804	10
28072	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	804	10
28075	Tân Trụ	Tan Tru	Thị trấn Tân Trụ	Tan Tru Township	tan_tru	805	9
28078	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	805	10
28084	Quê Mỹ Thạnh	Que My Thanh	Xã Quê Mỹ Thạnh	Que My Thanh Commune	que_my_thanh	805	10
28087	Lạc Tấn	Lac Tan	Xã Lạc Tấn	Lac Tan Commune	lac_tan	805	10
28090	Bình Trinh Đông	Binh Trinh Dong	Xã Bình Trinh Đông	Binh Trinh Dong Commune	binh_trinh_dong	805	10
28093	Tân Phước Tây	Tan Phuoc Tay	Xã Tân Phước Tây	Tan Phuoc Tay Commune	tan_phuoc_tay	805	10
28096	Bình Lãng	Binh Lang	Xã Bình Lãng	Binh Lang Commune	binh_lang	805	10
28099	Bình Tịnh	Binh Tinh	Xã Bình Tịnh	Binh Tinh Commune	binh_tinh	805	10
28102	Đức Tân	Duc Tan	Xã Đức Tân	Duc Tan Commune	duc_tan	805	10
28105	Nhựt Ninh	Nhut Ninh	Xã Nhựt Ninh	Nhut Ninh Commune	nhut_ninh	805	10
28108	Cần Đước	Can Duoc	Thị trấn Cần Đước	Can Duoc Township	can_duoc	806	9
28111	Long Trạch	Long Trach	Xã Long Trạch	Long Trach Commune	long_trach	806	10
28114	Long Khê	Long Khe	Xã Long Khê	Long Khe Commune	long_khe	806	10
28117	Long Định	Long Dinh	Xã Long Định	Long Dinh Commune	long_dinh	806	10
28120	Phước Vân	Phuoc Van	Xã Phước Vân	Phuoc Van Commune	phuoc_van	806	10
28123	Long Hòa	Long Hoa	Xã Long Hòa	Long Hoa Commune	long_hoa	806	10
28126	Long Cang	Long Cang	Xã Long Cang	Long Cang Commune	long_cang	806	10
28129	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	806	10
28132	Tân Trạch	Tan Trach	Xã Tân Trạch	Tan Trach Commune	tan_trach	806	10
28135	Mỹ Lệ	My Le	Xã Mỹ Lệ	My Le Commune	my_le	806	10
28138	Tân Lân	Tan Lan	Xã Tân Lân	Tan Lan Commune	tan_lan	806	10
28141	Phước Tuy	Phuoc Tuy	Xã Phước Tuy	Phuoc Tuy Commune	phuoc_tuy	806	10
28144	Long Hựu Đông	Long Huu Dong	Xã Long Hựu Đông	Long Huu Dong Commune	long_huu_dong	806	10
28147	Tân Ân	Tan An	Xã Tân Ân	Tan An Commune	tan_an	806	10
28150	Phước Đông	Phuoc Dong	Xã Phước Đông	Phuoc Dong Commune	phuoc_dong	806	10
28153	Long Hựu Tây	Long Huu Tay	Xã Long Hựu Tây	Long Huu Tay Commune	long_huu_tay	806	10
28156	Tân Chánh	Tan Chanh	Xã Tân Chánh	Tan Chanh Commune	tan_chanh	806	10
28159	Cần Giuộc	Can Giuoc	Thị trấn Cần Giuộc	Can Giuoc Township	can_giuoc	807	9
28162	Phước Lý	Phuoc Ly	Xã Phước Lý	Phuoc Ly Commune	phuoc_ly	807	10
28165	Long Thượng	Long Thuong	Xã Long Thượng	Long Thuong Commune	long_thuong	807	10
28168	Long Hậu	Long Hau	Xã Long Hậu	Long Hau Commune	long_hau	807	10
28174	Phước Hậu	Phuoc Hau	Xã Phước Hậu	Phuoc Hau Commune	phuoc_hau	807	10
28177	Mỹ Lộc	My Loc	Xã Mỹ Lộc	My Loc Commune	my_loc	807	10
28180	Phước Lại	Phuoc Lai	Xã Phước Lại	Phuoc Lai Commune	phuoc_lai	807	10
28183	Phước Lâm	Phuoc Lam	Xã Phước Lâm	Phuoc Lam Commune	phuoc_lam	807	10
28189	Thuận Thành	Thuan Thanh	Xã Thuận Thành	Thuan Thanh Commune	thuan_thanh	807	10
28192	Phước Vĩnh Tây	Phuoc Vinh Tay	Xã Phước Vĩnh Tây	Phuoc Vinh Tay Commune	phuoc_vinh_tay	807	10
28195	Phước Vĩnh Đông	Phuoc Vinh Dong	Xã Phước Vĩnh Đông	Phuoc Vinh Dong Commune	phuoc_vinh_dong	807	10
28198	Long An	Long An	Xã Long An	Long An Commune	long_an	807	10
28201	Long Phụng	Long Phung	Xã Long Phụng	Long Phung Commune	long_phung	807	10
28204	Đông Thạnh	Dong Thanh	Xã Đông Thạnh	Dong Thanh Commune	dong_thanh	807	10
28207	Tân Tập	Tan Tap	Xã Tân Tập	Tan Tap Commune	tan_tap	807	10
28210	Tầm Vu	Tam Vu	Thị trấn Tầm Vu	Tam Vu Township	tam_vu	808	9
28213	Bình Quới	Binh Quoi	Xã Bình Quới	Binh Quoi Commune	binh_quoi	808	10
28216	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	808	10
28219	Phú Ngãi Trị	Phu Ngai Tri	Xã Phú Ngãi Trị	Phu Ngai Tri Commune	phu_ngai_tri	808	10
28222	Vĩnh Công	Vinh Cong	Xã Vĩnh Công	Vinh Cong Commune	vinh_cong	808	10
28225	Thuận Mỹ	Thuan My	Xã Thuận Mỹ	Thuan My Commune	thuan_my	808	10
28228	Hiệp Thạnh	Hiep Thanh	Xã Hiệp Thạnh	Hiep Thanh Commune	hiep_thanh	808	10
29554	4	4	Phường 4	4 Ward	4	855	8
28231	Phước Tân Hưng	Phuoc Tan Hung	Xã Phước Tân Hưng	Phuoc Tan Hung Commune	phuoc_tan_hung	808	10
28234	Thanh Phú Long	Thanh Phu Long	Xã Thanh Phú Long	Thanh Phu Long Commune	thanh_phu_long	808	10
28237	Dương Xuân Hội	Duong Xuan Hoi	Xã Dương Xuân Hội	Duong Xuan Hoi Commune	duong_xuan_hoi	808	10
28240	An Lục Long	An Luc Long	Xã An Lục Long	An Luc Long Commune	an_luc_long	808	10
28243	Long Trì	Long Tri	Xã Long Trì	Long Tri Commune	long_tri	808	10
28246	Thanh Vĩnh Đông	Thanh Vinh Dong	Xã Thanh Vĩnh Đông	Thanh Vinh Dong Commune	thanh_vinh_dong	808	10
28249	5	5	Phường 5	5 Ward	5	815	8
28252	4	4	Phường 4	4 Ward	4	815	8
28255	7	7	Phường 7	7 Ward	7	815	8
28258	3	3	Phường 3	3 Ward	3	815	8
28261	1	1	Phường 1	1 Ward	1	815	8
28264	2	2	Phường 2	2 Ward	2	815	8
28267	8	8	Phường 8	8 Ward	8	815	8
28270	6	6	Phường 6	6 Ward	6	815	8
28273	9	9	Phường 9	9 Ward	9	815	8
28276	10	10	Phường 10	10 Ward	10	815	8
28279	Tân Long	Tan Long	Phường Tân Long	Tan Long Ward	tan_long	815	8
28282	Đạo Thạnh	Dao Thanh	Xã Đạo Thạnh	Dao Thanh Commune	dao_thanh	815	10
28285	Trung An	Trung An	Xã Trung An	Trung An Commune	trung_an	815	10
28288	Mỹ Phong	My Phong	Xã Mỹ Phong	My Phong Commune	my_phong	815	10
28291	Tân Mỹ Chánh	Tan My Chanh	Xã Tân Mỹ Chánh	Tan My Chanh Commune	tan_my_chanh	815	10
28567	Phước Thạnh	Phuoc Thanh	Xã Phước Thạnh	Phuoc Thanh Commune	phuoc_thanh	815	10
28591	Thới Sơn	Thoi Son	Xã Thới Sơn	Thoi Son Commune	thoi_son	815	10
28294	3	3	Phường 3	3 Ward	3	816	8
28297	2	2	Phường 2	2 Ward	2	816	8
28300	4	4	Phường 4	4 Ward	4	816	8
28303	1	1	Phường 1	1 Ward	1	816	8
28306	5	5	Phường 5	5 Ward	5	816	8
28309	Long Hưng	Long Hung	Xã Long Hưng	Long Hung Commune	long_hung	816	10
28312	Long Thuận	Long Thuan	Xã Long Thuận	Long Thuan Commune	long_thuan	816	10
28315	Long Chánh	Long Chanh	Xã Long Chánh	Long Chanh Commune	long_chanh	816	10
28318	Long Hòa	Long Hoa	Xã Long Hòa	Long Hoa Commune	long_hoa	816	10
28708	Bình Đông	Binh Dong	Xã Bình Đông	Binh Dong Commune	binh_dong	816	10
28717	Bình Xuân	Binh Xuan	Xã Bình Xuân	Binh Xuan Commune	binh_xuan	816	10
28729	Tân Trung	Tan Trung	Xã Tân Trung	Tan Trung Commune	tan_trung	816	10
28435	1	1	Phường 1	1 Ward	1	817	8
28436	2	2	Phường 2	2 Ward	2	817	8
28437	3	3	Phường 3	3 Ward	3	817	8
28439	4	4	Phường 4	4 Ward	4	817	8
28440	5	5	Phường 5	5 Ward	5	817	8
28447	Mỹ Phước Tây	My Phuoc Tay	Xã Mỹ Phước Tây	My Phuoc Tay Commune	my_phuoc_tay	817	10
28450	Mỹ Hạnh Đông	My Hanh Dong	Xã Mỹ Hạnh Đông	My Hanh Dong Commune	my_hanh_dong	817	10
28453	Mỹ Hạnh Trung	My Hanh Trung	Xã Mỹ Hạnh Trung	My Hanh Trung Commune	my_hanh_trung	817	10
28459	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	817	10
28462	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	817	10
28468	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	817	10
28474	Nhị Mỹ	Nhi My	Phường Nhị Mỹ	Nhi My Ward	nhi_my	817	8
28477	Nhị Quý	Nhi Quy	Xã Nhị Quý	Nhi Quy Commune	nhi_quy	817	10
28480	Thanh Hòa	Thanh Hoa	Xã Thanh Hòa	Thanh Hoa Commune	thanh_hoa	817	10
28483	Phú Quý	Phu Quy	Xã Phú Quý	Phu Quy Commune	phu_quy	817	10
28486	Long Khánh	Long Khanh	Xã Long Khánh	Long Khanh Commune	long_khanh	817	10
28321	Mỹ Phước	My Phuoc	Thị trấn Mỹ Phước	My Phuoc Township	my_phuoc	818	9
28903	Mỏ Cày	Mo Cay	Thị trấn Mỏ Cày	Mo Cay Township	mo_cay	833	9
28324	Tân Hòa Đông	Tan Hoa Dong	Xã Tân Hòa Đông	Tan Hoa Dong Commune	tan_hoa_dong	818	10
28327	Thạnh Tân	Thanh Tan	Xã Thạnh Tân	Thanh Tan Commune	thanh_tan	818	10
28330	Thạnh Mỹ	Thanh My	Xã Thạnh Mỹ	Thanh My Commune	thanh_my	818	10
28333	Thạnh Hoà	Thanh Hoa	Xã Thạnh Hoà	Thanh Hoa Commune	thanh_hoa	818	10
28336	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	818	10
28339	Tân Hòa Thành	Tan Hoa Thanh	Xã Tân Hòa Thành	Tan Hoa Thanh Commune	tan_hoa_thanh	818	10
28342	Hưng Thạnh	Hung Thanh	Xã Hưng Thạnh	Hung Thanh Commune	hung_thanh	818	10
28345	Tân Lập 1	Tan Lap 1	Xã Tân Lập 1	Tan Lap 1 Commune	tan_lap_1	818	10
28348	Tân Hòa Tây	Tan Hoa Tay	Xã Tân Hòa Tây	Tan Hoa Tay Commune	tan_hoa_tay	818	10
28354	Tân Lập 2	Tan Lap 2	Xã Tân Lập 2	Tan Lap 2 Commune	tan_lap_2	818	10
28357	Phước Lập	Phuoc Lap	Xã Phước Lập	Phuoc Lap Commune	phuoc_lap	818	10
28360	Cái Bè	Cai Be	Thị trấn Cái Bè	Cai Be Township	cai_be	819	9
28363	Hậu Mỹ Bắc B	Hau My Bac B	Xã Hậu Mỹ Bắc B	Hau My Bac B Commune	hau_my_bac_b	819	10
28366	Hậu Mỹ Bắc A	Hau My Bac A	Xã Hậu Mỹ Bắc A	Hau My Bac A Commune	hau_my_bac_a	819	10
28369	Mỹ Trung	My Trung	Xã Mỹ Trung	My Trung Commune	my_trung	819	10
28372	Hậu Mỹ Trinh	Hau My Trinh	Xã Hậu Mỹ Trinh	Hau My Trinh Commune	hau_my_trinh	819	10
28375	Hậu Mỹ Phú	Hau My Phu	Xã Hậu Mỹ Phú	Hau My Phu Commune	hau_my_phu	819	10
28378	Mỹ Tân	My Tan	Xã Mỹ Tân	My Tan Commune	my_tan	819	10
28381	Mỹ Lợi B	My Loi B	Xã Mỹ Lợi B	My Loi B Commune	my_loi_b	819	10
28384	Thiện Trung	Thien Trung	Xã Thiện Trung	Thien Trung Commune	thien_trung	819	10
28387	Mỹ Hội	My Hoi	Xã Mỹ Hội	My Hoi Commune	my_hoi	819	10
28390	An Cư	An Cu	Xã An Cư	An Cu Commune	an_cu	819	10
28393	Hậu Thành	Hau Thanh	Xã Hậu Thành	Hau Thanh Commune	hau_thanh	819	10
28396	Mỹ Lợi A	My Loi A	Xã Mỹ Lợi A	My Loi A Commune	my_loi_a	819	10
28399	Hòa Khánh	Hoa Khanh	Xã Hòa Khánh	Hoa Khanh Commune	hoa_khanh	819	10
29557	3	3	Phường 3	3 Ward	3	855	8
28402	Thiện Trí	Thien Tri	Xã Thiện Trí	Thien Tri Commune	thien_tri	819	10
28405	Mỹ Đức Đông	My Duc Dong	Xã Mỹ Đức Đông	My Duc Dong Commune	my_duc_dong	819	10
28408	Mỹ Đức Tây	My Duc Tay	Xã Mỹ Đức Tây	My Duc Tay Commune	my_duc_tay	819	10
28411	Đông Hòa Hiệp	Dong Hoa Hiep	Xã Đông Hòa Hiệp	Dong Hoa Hiep Commune	dong_hoa_hiep	819	10
28414	An Thái Đông	An Thai Dong	Xã An Thái Đông	An Thai Dong Commune	an_thai_dong	819	10
28417	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	819	10
28420	Mỹ Lương	My Luong	Xã Mỹ Lương	My Luong Commune	my_luong	819	10
28423	Tân Thanh	Tan Thanh	Xã Tân Thanh	Tan Thanh Commune	tan_thanh	819	10
28426	An Thái Trung	An Thai Trung	Xã An Thái Trung	An Thai Trung Commune	an_thai_trung	819	10
28429	An Hữu	An Huu	Xã An Hữu	An Huu Commune	an_huu	819	10
28432	Hòa Hưng	Hoa Hung	Xã Hòa Hưng	Hoa Hung Commune	hoa_hung	819	10
28438	Thạnh Lộc	Thanh Loc	Xã Thạnh Lộc	Thanh Loc Commune	thanh_loc	820	10
28441	Mỹ Thành Bắc	My Thanh Bac	Xã Mỹ Thành Bắc	My Thanh Bac Commune	my_thanh_bac	820	10
28444	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	820	10
28456	Mỹ Thành Nam	My Thanh Nam	Xã Mỹ Thành Nam	My Thanh Nam Commune	my_thanh_nam	820	10
28465	Phú Nhuận	Phu Nhuan	Xã Phú Nhuận	Phu Nhuan Commune	phu_nhuan	820	10
28471	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	820	10
28489	Cẩm Sơn	Cam Son	Xã Cẩm Sơn	Cam Son Commune	cam_son	820	10
28492	Phú An	Phu An	Xã Phú An	Phu An Commune	phu_an	820	10
28495	Mỹ Long	My Long	Xã Mỹ Long	My Long Commune	my_long	820	10
28498	Long Tiên	Long Tien	Xã Long Tiên	Long Tien Commune	long_tien	820	10
28501	Hiệp Đức	Hiep Duc	Xã Hiệp Đức	Hiep Duc Commune	hiep_duc	820	10
28504	Long Trung	Long Trung	Xã Long Trung	Long Trung Commune	long_trung	820	10
28507	Hội Xuân	Hoi Xuan	Xã Hội Xuân	Hoi Xuan Commune	hoi_xuan	820	10
28510	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	820	10
28513	Tam Bình	Tam Binh	Xã Tam Bình	Tam Binh Commune	tam_binh	820	10
28516	Ngũ Hiệp	Ngu Hiep	Xã Ngũ Hiệp	Ngu Hiep Commune	ngu_hiep	820	10
28519	Tân Hiệp	Tan Hiep	Thị trấn Tân Hiệp	Tan Hiep Township	tan_hiep	821	9
28522	Tân Hội Đông	Tan Hoi Dong	Xã Tân Hội Đông	Tan Hoi Dong Commune	tan_hoi_dong	821	10
28525	Tân Hương	Tan Huong	Xã Tân Hương	Tan Huong Commune	tan_huong	821	10
28528	Tân Lý Đông	Tan Ly Dong	Xã Tân Lý Đông	Tan Ly Dong Commune	tan_ly_dong	821	10
28531	Tân Lý Tây	Tan Ly Tay	Xã Tân Lý Tây	Tan Ly Tay Commune	tan_ly_tay	821	10
28534	Thân Cửu Nghĩa	Than Cuu Nghia	Xã Thân Cửu Nghĩa	Than Cuu Nghia Commune	than_cuu_nghia	821	10
28537	Tam Hiệp	Tam Hiep	Xã Tam Hiệp	Tam Hiep Commune	tam_hiep	821	10
28540	Điềm Hy	Diem Hy	Xã Điềm Hy	Diem Hy Commune	diem_hy	821	10
28543	Nhị Bình	Nhi Binh	Xã Nhị Bình	Nhi Binh Commune	nhi_binh	821	10
28546	Dưỡng Điềm	Duong Diem	Xã Dưỡng Điềm	Duong Diem Commune	duong_diem	821	10
28549	Đông Hòa	Dong Hoa	Xã Đông Hòa	Dong Hoa Commune	dong_hoa	821	10
28552	Long Định	Long Dinh	Xã Long Định	Long Dinh Commune	long_dinh	821	10
28555	Hữu Đạo	Huu Dao	Xã Hữu Đạo	Huu Dao Commune	huu_dao	821	10
28558	Long An	Long An	Xã Long An	Long An Commune	long_an	821	10
28561	Long Hưng	Long Hung	Xã Long Hưng	Long Hung Commune	long_hung	821	10
28564	Bình Trưng	Binh Trung	Xã Bình Trưng	Binh Trung Commune	binh_trung	821	10
28570	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	821	10
28573	Bàn Long	Ban Long	Xã Bàn Long	Ban Long Commune	ban_long	821	10
28576	Vĩnh Kim	Vinh Kim	Xã Vĩnh Kim	Vinh Kim Commune	vinh_kim	821	10
28579	Bình Đức	Binh Duc	Xã Bình Đức	Binh Duc Commune	binh_duc	821	10
28582	Song Thuận	Song Thuan	Xã Song Thuận	Song Thuan Commune	song_thuan	821	10
28585	Kim Sơn	Kim Son	Xã Kim Sơn	Kim Son Commune	kim_son	821	10
28588	Phú Phong	Phu Phong	Xã Phú Phong	Phu Phong Commune	phu_phong	821	10
28594	Chợ Gạo	Cho Gao	Thị trấn Chợ Gạo	Cho Gao Township	cho_gao	822	9
28597	Trung Hòa	Trung Hoa	Xã Trung Hòa	Trung Hoa Commune	trung_hoa	822	10
28600	Hòa Tịnh	Hoa Tinh	Xã Hòa Tịnh	Hoa Tinh Commune	hoa_tinh	822	10
28603	Mỹ Tịnh An	My Tinh An	Xã Mỹ Tịnh An	My Tinh An Commune	my_tinh_an	822	10
28606	Tân Bình Thạnh	Tan Binh Thanh	Xã Tân Bình Thạnh	Tan Binh Thanh Commune	tan_binh_thanh	822	10
28609	Phú Kiết	Phu Kiet	Xã Phú Kiết	Phu Kiet Commune	phu_kiet	822	10
28612	Lương Hòa Lạc	Luong Hoa Lac	Xã Lương Hòa Lạc	Luong Hoa Lac Commune	luong_hoa_lac	822	10
28615	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	822	10
28618	Quơn Long	Quon Long	Xã Quơn Long	Quon Long Commune	quon_long	822	10
28621	Bình Phục Nhứt	Binh Phuc Nhut	Xã Bình Phục Nhứt	Binh Phuc Nhut Commune	binh_phuc_nhut	822	10
28624	Đăng Hưng Phước	Dang Hung Phuoc	Xã Đăng Hưng Phước	Dang Hung Phuoc Commune	dang_hung_phuoc	822	10
28627	Tân Thuận Bình	Tan Thuan Binh	Xã Tân Thuận Bình	Tan Thuan Binh Commune	tan_thuan_binh	822	10
28630	Song Bình	Song Binh	Xã Song Bình	Song Binh Commune	song_binh	822	10
28633	Bình Phan	Binh Phan	Xã Bình Phan	Binh Phan Commune	binh_phan	822	10
28636	Long Bình Điền	Long Binh Dien	Xã Long Bình Điền	Long Binh Dien Commune	long_binh_dien	822	10
28639	An Thạnh Thủy	An Thanh Thuy	Xã An Thạnh Thủy	An Thanh Thuy Commune	an_thanh_thuy	822	10
28642	Xuân Đông	Xuan Dong	Xã Xuân Đông	Xuan Dong Commune	xuan_dong	822	10
28645	Hòa Định	Hoa Dinh	Xã Hòa Định	Hoa Dinh Commune	hoa_dinh	822	10
28648	Bình Ninh	Binh Ninh	Xã Bình Ninh	Binh Ninh Commune	binh_ninh	822	10
28651	Vĩnh Bình	Vinh Binh	Thị trấn Vĩnh Bình	Vinh Binh Township	vinh_binh	823	9
28654	Đồng Sơn	Dong Son	Xã Đồng Sơn	Dong Son Commune	dong_son	823	10
28657	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	823	10
28660	Đồng Thạnh	Dong Thanh	Xã Đồng Thạnh	Dong Thanh Commune	dong_thanh	823	10
28663	Thành Công	Thanh Cong	Xã Thành Công	Thanh Cong Commune	thanh_cong	823	10
28666	Bình Nhì	Binh Nhi	Xã Bình Nhì	Binh Nhi Commune	binh_nhi	823	10
28669	Yên Luông	Yen Luong	Xã Yên Luông	Yen Luong Commune	yen_luong	823	10
28672	Thạnh Trị	Thanh Tri	Xã Thạnh Trị	Thanh Tri Commune	thanh_tri	823	10
28675	Thạnh Nhựt	Thanh Nhut	Xã Thạnh Nhựt	Thanh Nhut Commune	thanh_nhut	823	10
28678	Long Vĩnh	Long Vinh	Xã Long Vĩnh	Long Vinh Commune	long_vinh	823	10
28681	Bình Tân	Binh Tan	Xã Bình Tân	Binh Tan Commune	binh_tan	823	10
28684	Vĩnh Hựu	Vinh Huu	Xã Vĩnh Hựu	Vinh Huu Commune	vinh_huu	823	10
28687	Long Bình	Long Binh	Xã Long Bình	Long Binh Commune	long_binh	823	10
28702	Tân Hòa	Tan Hoa	Thị trấn Tân Hòa	Tan Hoa Township	tan_hoa	824	9
28705	Tăng Hoà	Tang Hoa	Xã Tăng Hoà	Tang Hoa Commune	tang_hoa	824	10
28711	Tân Phước	Tan Phuoc	Xã Tân Phước	Tan Phuoc Commune	tan_phuoc	824	10
28714	Gia Thuận	Gia Thuan	Xã Gia Thuận	Gia Thuan Commune	gia_thuan	824	10
28720	Vàm Láng	Vam Lang	Thị trấn Vàm Láng	Vam Lang Township	vam_lang	824	9
28723	Tân Tây	Tan Tay	Xã Tân Tây	Tan Tay Commune	tan_tay	824	10
28726	Kiểng Phước	Kieng Phuoc	Xã Kiểng Phước	Kieng Phuoc Commune	kieng_phuoc	824	10
28732	Tân Đông	Tan Dong	Xã Tân Đông	Tan Dong Commune	tan_dong	824	10
28735	Bình Ân	Binh An	Xã Bình Ân	Binh An Commune	binh_an	824	10
28738	Tân Điền	Tan Dien	Xã Tân Điền	Tan Dien Commune	tan_dien	824	10
28741	Bình Nghị	Binh Nghi	Xã Bình Nghị	Binh Nghi Commune	binh_nghi	824	10
28744	Phước Trung	Phuoc Trung	Xã Phước Trung	Phuoc Trung Commune	phuoc_trung	824	10
28747	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	824	10
28690	Tân Thới	Tan Thoi	Xã Tân Thới	Tan Thoi Commune	tan_thoi	825	10
28693	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	825	10
28696	Phú Thạnh	Phu Thanh	Xã Phú Thạnh	Phu Thanh Commune	phu_thanh	825	10
28699	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	825	10
28750	Phú Đông	Phu Dong	Xã Phú Đông	Phu Dong Commune	phu_dong	825	10
28753	Phú Tân	Phu Tan	Xã Phú Tân	Phu Tan Commune	phu_tan	825	10
28756	Phú Khương	Phu Khuong	Phường Phú Khương	Phu Khuong Ward	phu_khuong	829	8
28757	Phú Tân	Phu Tan	Phường Phú Tân	Phu Tan Ward	phu_tan	829	8
28762	6	6	Phường 6	6 Ward	6	829	8
28765	4	4	Phường 4	4 Ward	4	829	8
28768	5	5	Phường 5	5 Ward	5	829	8
28777	An Hội	An Hoi	Phường An Hội	An Hoi Ward	an_hoi	829	8
28780	7	7	Phường 7	7 Ward	7	829	8
28783	Sơn Đông	Son Dong	Xã Sơn Đông	Son Dong Commune	son_dong	829	10
28786	Phú Hưng	Phu Hung	Xã Phú Hưng	Phu Hung Commune	phu_hung	829	10
28789	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	829	10
28792	Mỹ Thạnh An	My Thanh An	Xã Mỹ Thạnh An	My Thanh An Commune	my_thanh_an	829	10
28795	Nhơn Thạnh	Nhon Thanh	Xã Nhơn Thạnh	Nhon Thanh Commune	nhon_thanh	829	10
28798	Phú Nhuận	Phu Nhuan	Xã Phú Nhuận	Phu Nhuan Commune	phu_nhuan	829	10
28801	Châu Thành	Chau Thanh	Thị trấn Châu Thành	Chau Thanh Township	chau_thanh	831	9
28804	Tân Thạch	Tan Thach	Xã Tân Thạch	Tan Thach Commune	tan_thach	831	10
28807	Qưới Sơn	Quoi Son	Xã Qưới Sơn	Quoi Son Commune	quoi_son	831	10
28810	An Khánh	An Khanh	Xã An Khánh	An Khanh Commune	an_khanh	831	10
28813	Giao Long	Giao Long	Xã Giao Long	Giao Long Commune	giao_long	831	10
28819	Phú Túc	Phu Tuc	Xã Phú Túc	Phu Tuc Commune	phu_tuc	831	10
28822	Phú Đức	Phu Duc	Xã Phú Đức	Phu Duc Commune	phu_duc	831	10
28825	Phú An Hòa	Phu An Hoa	Xã Phú An Hòa	Phu An Hoa Commune	phu_an_hoa	831	10
28828	An Phước	An Phuoc	Xã An Phước	An Phuoc Commune	an_phuoc	831	10
28831	Tam Phước	Tam Phuoc	Xã Tam Phước	Tam Phuoc Commune	tam_phuoc	831	10
28834	Thành Triệu	Thanh Trieu	Xã Thành Triệu	Thanh Trieu Commune	thanh_trieu	831	10
28837	Tường Đa	Tuong Da	Xã Tường Đa	Tuong Da Commune	tuong_da	831	10
28840	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	831	10
28843	Quới Thành	Quoi Thanh	Xã Quới Thành	Quoi Thanh Commune	quoi_thanh	831	10
28846	Phước Thạnh	Phuoc Thanh	Xã Phước Thạnh	Phuoc Thanh Commune	phuoc_thanh	831	10
28849	An Hóa	An Hoa	Xã An Hóa	An Hoa Commune	an_hoa	831	10
28852	Tiên Long	Tien Long	Xã Tiên Long	Tien Long Commune	tien_long	831	10
28855	An Hiệp	An Hiep	Xã An Hiệp	An Hiep Commune	an_hiep	831	10
28858	Hữu Định	Huu Dinh	Xã Hữu Định	Huu Dinh Commune	huu_dinh	831	10
28861	Tiên Thủy	Tien Thuy	Xã Tiên Thủy	Tien Thuy Commune	tien_thuy	831	10
28864	Sơn Hòa	Son Hoa	Xã Sơn Hòa	Son Hoa Commune	son_hoa	831	10
28870	Chợ Lách	Cho Lach	Thị trấn Chợ Lách	Cho Lach Township	cho_lach	832	9
28873	Phú Phụng	Phu Phung	Xã Phú Phụng	Phu Phung Commune	phu_phung	832	10
28876	Sơn Định	Son Dinh	Xã Sơn Định	Son Dinh Commune	son_dinh	832	10
28879	Vĩnh Bình	Vinh Binh	Xã Vĩnh Bình	Vinh Binh Commune	vinh_binh	832	10
28882	Hòa Nghĩa	Hoa Nghia	Xã Hòa Nghĩa	Hoa Nghia Commune	hoa_nghia	832	10
28885	Long Thới	Long Thoi	Xã Long Thới	Long Thoi Commune	long_thoi	832	10
28888	Phú Sơn	Phu Son	Xã Phú Sơn	Phu Son Commune	phu_son	832	10
28891	Tân Thiềng	Tan Thieng	Xã Tân Thiềng	Tan Thieng Commune	tan_thieng	832	10
28894	Vĩnh Thành	Vinh Thanh	Xã Vĩnh Thành	Vinh Thanh Commune	vinh_thanh	832	10
28897	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	832	10
28900	Hưng Khánh Trung B	Hung Khanh Trung B	Xã Hưng Khánh Trung B	Hung Khanh Trung B Commune	hung_khanh_trung_b	832	10
28930	Định Thủy	Dinh Thuy	Xã Định Thủy	Dinh Thuy Commune	dinh_thuy	833	10
28939	Đa Phước Hội	Da Phuoc Hoi	Xã Đa Phước Hội	Da Phuoc Hoi Commune	da_phuoc_hoi	833	10
28940	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	833	10
28942	Phước Hiệp	Phuoc Hiep	Xã Phước Hiệp	Phuoc Hiep Commune	phuoc_hiep	833	10
28945	Bình Khánh 	Binh Khanh 	Xã Bình Khánh 	Binh Khanh  Commune	binh_khanh_	833	10
28951	An Thạnh	An Thanh	Xã An Thạnh	An Thanh Commune	an_thanh	833	10
28957	An Định	An Dinh	Xã An Định	An Dinh Commune	an_dinh	833	10
28960	Thành Thới B	Thanh Thoi B	Xã Thành Thới B	Thanh Thoi B Commune	thanh_thoi_b	833	10
28963	Tân Trung	Tan Trung	Xã Tân Trung	Tan Trung Commune	tan_trung	833	10
28966	An Thới	An Thoi	Xã An Thới	An Thoi Commune	an_thoi	833	10
28969	Thành Thới A	Thanh Thoi A	Xã Thành Thới A	Thanh Thoi A Commune	thanh_thoi_a	833	10
28972	Minh Đức	Minh Duc	Xã Minh Đức	Minh Duc Commune	minh_duc	833	10
28975	Ngãi Đăng	Ngai Dang	Xã Ngãi Đăng	Ngai Dang Commune	ngai_dang	833	10
28978	Cẩm Sơn	Cam Son	Xã Cẩm Sơn	Cam Son Commune	cam_son	833	10
28981	Hương Mỹ	Huong My	Xã Hương Mỹ	Huong My Commune	huong_my	833	10
28984	Giồng Trôm	Giong Trom	Thị trấn Giồng Trôm	Giong Trom Township	giong_trom	834	9
28987	Phong Nẫm	Phong Nam	Xã Phong Nẫm	Phong Nam Commune	phong_nam	834	10
28993	Mỹ Thạnh	My Thanh	Xã Mỹ Thạnh	My Thanh Commune	my_thanh	834	10
28996	Châu Hòa	Chau Hoa	Xã Châu Hòa	Chau Hoa Commune	chau_hoa	834	10
28999	Lương Hòa	Luong Hoa	Xã Lương Hòa	Luong Hoa Commune	luong_hoa	834	10
29002	Lương Quới	Luong Quoi	Xã Lương Quới	Luong Quoi Commune	luong_quoi	834	10
29005	Lương Phú	Luong Phu	Xã Lương Phú	Luong Phu Commune	luong_phu	834	10
29008	Châu Bình	Chau Binh	Xã Châu Bình	Chau Binh Commune	chau_binh	834	10
29011	Thuận Điền	Thuan Dien	Xã Thuận Điền	Thuan Dien Commune	thuan_dien	834	10
29014	Sơn Phú	Son Phu	Xã Sơn Phú	Son Phu Commune	son_phu	834	10
29017	Bình Hoà	Binh Hoa	Xã Bình Hoà	Binh Hoa Commune	binh_hoa	834	10
29020	Phước Long	Phuoc Long	Xã Phước Long	Phuoc Long Commune	phuoc_long	834	10
29023	Hưng Phong	Hung Phong	Xã Hưng Phong	Hung Phong Commune	hung_phong	834	10
29026	Long Mỹ	Long My	Xã Long Mỹ	Long My Commune	long_my	834	10
29029	Tân Hào	Tan Hao	Xã Tân Hào	Tan Hao Commune	tan_hao	834	10
29032	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	834	10
29035	Tân Thanh	Tan Thanh	Xã Tân Thanh	Tan Thanh Commune	tan_thanh	834	10
29038	Tân Lợi Thạnh	Tan Loi Thanh	Xã Tân Lợi Thạnh	Tan Loi Thanh Commune	tan_loi_thanh	834	10
29041	Thạnh Phú Đông	Thanh Phu Dong	Xã Thạnh Phú Đông	Thanh Phu Dong Commune	thanh_phu_dong	834	10
29044	Hưng Nhượng	Hung Nhuong	Xã Hưng Nhượng	Hung Nhuong Commune	hung_nhuong	834	10
29047	Hưng Lễ	Hung Le	Xã Hưng Lễ	Hung Le Commune	hung_le	834	10
29050	Bình Đại	Binh Dai	Thị trấn Bình Đại	Binh Dai Township	binh_dai	835	9
29053	Tam Hiệp	Tam Hiep	Xã Tam Hiệp	Tam Hiep Commune	tam_hiep	835	10
29056	Long Định	Long Dinh	Xã Long Định	Long Dinh Commune	long_dinh	835	10
29059	Long Hòa	Long Hoa	Xã Long Hòa	Long Hoa Commune	long_hoa	835	10
29062	Phú Thuận	Phu Thuan	Xã Phú Thuận	Phu Thuan Commune	phu_thuan	835	10
29065	Vang Quới Tây	Vang Quoi Tay	Xã Vang Quới Tây	Vang Quoi Tay Commune	vang_quoi_tay	835	10
29068	Vang Quới Đông	Vang Quoi Dong	Xã Vang Quới Đông	Vang Quoi Dong Commune	vang_quoi_dong	835	10
29071	Châu Hưng	Chau Hung	Xã Châu Hưng	Chau Hung Commune	chau_hung	835	10
29074	Phú Vang	Phu Vang	Xã Phú Vang	Phu Vang Commune	phu_vang	835	10
29077	Lộc Thuận	Loc Thuan	Xã Lộc Thuận	Loc Thuan Commune	loc_thuan	835	10
29080	Định Trung	Dinh Trung	Xã Định Trung	Dinh Trung Commune	dinh_trung	835	10
29083	Thới Lai	Thoi Lai	Xã Thới Lai	Thoi Lai Commune	thoi_lai	835	10
29086	Bình Thới	Binh Thoi	Xã Bình Thới	Binh Thoi Commune	binh_thoi	835	10
29089	Phú Long	Phu Long	Xã Phú Long	Phu Long Commune	phu_long	835	10
29092	Bình Thắng	Binh Thang	Xã Bình Thắng	Binh Thang Commune	binh_thang	835	10
29095	Thạnh Trị	Thanh Tri	Xã Thạnh Trị	Thanh Tri Commune	thanh_tri	835	10
29098	Đại Hòa Lộc	Dai Hoa Loc	Xã Đại Hòa Lộc	Dai Hoa Loc Commune	dai_hoa_loc	835	10
29101	Thừa Đức	Thua Duc	Xã Thừa Đức	Thua Duc Commune	thua_duc	835	10
29104	Thạnh Phước	Thanh Phuoc	Xã Thạnh Phước	Thanh Phuoc Commune	thanh_phuoc	835	10
29107	Thới Thuận	Thoi Thuan	Xã Thới Thuận	Thoi Thuan Commune	thoi_thuan	835	10
29110	Ba Tri	Ba Tri	Thị trấn Ba Tri	Ba Tri Township	ba_tri	836	9
29113	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	836	10
29116	Mỹ Hòa	My Hoa	Xã Mỹ Hòa	My Hoa Commune	my_hoa	836	10
29119	Tân Xuân	Tan Xuan	Xã Tân Xuân	Tan Xuan Commune	tan_xuan	836	10
29122	Mỹ Chánh	My Chanh	Xã Mỹ Chánh	My Chanh Commune	my_chanh	836	10
29125	Bảo Thạnh	Bao Thanh	Xã Bảo Thạnh	Bao Thanh Commune	bao_thanh	836	10
29128	An Phú Trung	An Phu Trung	Xã An Phú Trung	An Phu Trung Commune	an_phu_trung	836	10
29131	Mỹ Thạnh	My Thanh	Xã Mỹ Thạnh	My Thanh Commune	my_thanh	836	10
29134	Mỹ Nhơn	My Nhon	Xã Mỹ Nhơn	My Nhon Commune	my_nhon	836	10
29137	Phước Ngãi	Phuoc Ngai	Xã Phước Ngãi	Phuoc Ngai Commune	phuoc_ngai	836	10
29143	An Ngãi Trung	An Ngai Trung	Xã An Ngãi Trung	An Ngai Trung Commune	an_ngai_trung	836	10
29146	Phú Lễ	Phu Le	Xã Phú Lễ	Phu Le Commune	phu_le	836	10
29149	An Bình Tây	An Binh Tay	Xã An Bình Tây	An Binh Tay Commune	an_binh_tay	836	10
29560	8	8	Phường 8	8 Ward	8	855	8
29152	Bảo Thuận	Bao Thuan	Xã Bảo Thuận	Bao Thuan Commune	bao_thuan	836	10
29155	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	836	10
29158	An Ngãi Tây	An Ngai Tay	Xã An Ngãi Tây	An Ngai Tay Commune	an_ngai_tay	836	10
29161	An Hiệp	An Hiep	Xã An Hiệp	An Hiep Commune	an_hiep	836	10
29164	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	836	10
29167	Tân Thủy	Tan Thuy	Xã Tân Thủy	Tan Thuy Commune	tan_thuy	836	10
29170	Vĩnh An	Vinh An	Xã Vĩnh An	Vinh An Commune	vinh_an	836	10
29173	An Đức	An Duc	Xã An Đức	An Duc Commune	an_duc	836	10
29176	An Hòa Tây	An Hoa Tay	Xã An Hòa Tây	An Hoa Tay Commune	an_hoa_tay	836	10
29179	An Thủy	An Thuy	Xã An Thủy	An Thuy Commune	an_thuy	836	10
29182	Thạnh Phú	Thanh Phu	Thị trấn Thạnh Phú	Thanh Phu Township	thanh_phu	837	9
29185	Phú Khánh	Phu Khanh	Xã Phú Khánh	Phu Khanh Commune	phu_khanh	837	10
29188	Đại Điền	Dai Dien	Xã Đại Điền	Dai Dien Commune	dai_dien	837	10
29191	Quới Điền	Quoi Dien	Xã Quới Điền	Quoi Dien Commune	quoi_dien	837	10
29194	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	837	10
29197	Mỹ Hưng	My Hung	Xã Mỹ Hưng	My Hung Commune	my_hung	837	10
29200	An Thạnh	An Thanh	Xã An Thạnh	An Thanh Commune	an_thanh	837	10
29203	Thới Thạnh	Thoi Thanh	Xã Thới Thạnh	Thoi Thanh Commune	thoi_thanh	837	10
29206	Hòa Lợi	Hoa Loi	Xã Hòa Lợi	Hoa Loi Commune	hoa_loi	837	10
29209	An Điền	An Dien	Xã An Điền	An Dien Commune	an_dien	837	10
29212	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	837	10
29215	An Thuận	An Thuan	Xã An Thuận	An Thuan Commune	an_thuan	837	10
29218	An Quy	An Quy	Xã An Quy	An Quy Commune	an_quy	837	10
29221	Thạnh Hải	Thanh Hai	Xã Thạnh Hải	Thanh Hai Commune	thanh_hai	837	10
29224	An Nhơn	An Nhon	Xã An Nhơn	An Nhon Commune	an_nhon	837	10
29227	Giao Thạnh	Giao Thanh	Xã Giao Thạnh	Giao Thanh Commune	giao_thanh	837	10
29230	Thạnh Phong	Thanh Phong	Xã Thạnh Phong	Thanh Phong Commune	thanh_phong	837	10
29233	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	837	10
28889	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	838	10
28901	Hưng Khánh Trung A	Hung Khanh Trung A	Xã Hưng Khánh Trung A	Hung Khanh Trung A Commune	hung_khanh_trung_a	838	10
28906	Thanh Tân	Thanh Tan	Xã Thanh Tân	Thanh Tan Commune	thanh_tan	838	10
28909	Thạnh Ngãi	Thanh Ngai	Xã Thạnh Ngãi	Thanh Ngai Commune	thanh_ngai	838	10
28912	Tân Phú Tây	Tan Phu Tay	Xã Tân Phú Tây	Tan Phu Tay Commune	tan_phu_tay	838	10
28915	Phước Mỹ Trung	Phuoc My Trung	Xã Phước Mỹ Trung	Phuoc My Trung Commune	phuoc_my_trung	838	10
28918	Tân Thành Bình	Tan Thanh Binh	Xã Tân Thành Bình	Tan Thanh Binh Commune	tan_thanh_binh	838	10
28921	Thành An	Thanh An	Xã Thành An	Thanh An Commune	thanh_an	838	10
28924	Hòa Lộc	Hoa Loc	Xã Hòa Lộc	Hoa Loc Commune	hoa_loc	838	10
28927	Tân Thanh Tây	Tan Thanh Tay	Xã Tân Thanh Tây	Tan Thanh Tay Commune	tan_thanh_tay	838	10
28933	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	838	10
28936	Nhuận Phú Tân	Nhuan Phu Tan	Xã Nhuận Phú Tân	Nhuan Phu Tan Commune	nhuan_phu_tan	838	10
28948	Khánh Thạnh Tân	Khanh Thanh Tan	Xã Khánh Thạnh Tân	Khanh Thanh Tan Commune	khanh_thanh_tan	838	10
29239	1	1	Phường 1	1 Ward	1	842	8
29242	3	3	Phường 3	3 Ward	3	842	8
29245	2	2	Phường 2	2 Ward	2	842	8
29248	5	5	Phường 5	5 Ward	5	842	8
29251	6	6	Phường 6	6 Ward	6	842	8
29254	7	7	Phường 7	7 Ward	7	842	8
29257	8	8	Phường 8	8 Ward	8	842	8
29260	9	9	Phường 9	9 Ward	9	842	8
29263	Long Đức	Long Duc	Xã Long Đức	Long Duc Commune	long_duc	842	10
29266	Càng Long	Cang Long	Thị trấn Càng Long	Cang Long Township	cang_long	844	9
29269	Mỹ Cẩm	My Cam	Xã Mỹ Cẩm	My Cam Commune	my_cam	844	10
29272	An Trường A	An Truong A	Xã An Trường A	An Truong A Commune	an_truong_a	844	10
29275	An Trường	An Truong	Xã An Trường	An Truong Commune	an_truong	844	10
29278	Huyền Hội	Huyen Hoi	Xã Huyền Hội	Huyen Hoi Commune	huyen_hoi	844	10
29281	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	844	10
29284	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	844	10
29287	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	844	10
29290	Phương Thạnh	Phuong Thanh	Xã Phương Thạnh	Phuong Thanh Commune	phuong_thanh	844	10
29293	Đại Phúc	Dai Phuc	Xã Đại Phúc	Dai Phuc Commune	dai_phuc	844	10
29296	Đại Phước	Dai Phuoc	Xã Đại Phước	Dai Phuoc Commune	dai_phuoc	844	10
29299	Nhị Long Phú	Nhi Long Phu	Xã Nhị Long Phú	Nhi Long Phu Commune	nhi_long_phu	844	10
29302	Nhị Long	Nhi Long	Xã Nhị Long	Nhi Long Commune	nhi_long	844	10
29305	Đức Mỹ	Duc My	Xã Đức Mỹ	Duc My Commune	duc_my	844	10
29308	Cầu Kè	Cau Ke	Thị trấn Cầu Kè	Cau Ke Township	cau_ke	845	9
29311	Hòa Ân	Hoa An	Xã Hòa Ân	Hoa An Commune	hoa_an	845	10
29314	Châu Điền	Chau Dien	Xã Châu Điền	Chau Dien Commune	chau_dien	845	10
29317	An Phú Tân	An Phu Tan	Xã An Phú Tân	An Phu Tan Commune	an_phu_tan	845	10
29320	Hoà Tân	Hoa Tan	Xã Hoà Tân	Hoa Tan Commune	hoa_tan	845	10
29323	Ninh Thới	Ninh Thoi	Xã Ninh Thới	Ninh Thoi Commune	ninh_thoi	845	10
29326	Phong Phú	Phong Phu	Xã Phong Phú	Phong Phu Commune	phong_phu	845	10
29329	Phong Thạnh	Phong Thanh	Xã Phong Thạnh	Phong Thanh Commune	phong_thanh	845	10
29332	Tam Ngãi	Tam Ngai	Xã Tam Ngãi	Tam Ngai Commune	tam_ngai	845	10
29335	Thông Hòa	Thong Hoa	Xã Thông Hòa	Thong Hoa Commune	thong_hoa	845	10
29338	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	845	10
29341	Tiểu Cần	Tieu Can	Thị trấn Tiểu Cần	Tieu Can Township	tieu_can	846	9
29344	Cầu Quan	Cau Quan	Thị trấn Cầu Quan	Cau Quan Township	cau_quan	846	9
29347	Phú Cần	Phu Can	Xã Phú Cần	Phu Can Commune	phu_can	846	10
29350	Hiếu Tử	Hieu Tu	Xã Hiếu Tử	Hieu Tu Commune	hieu_tu	846	10
29353	Hiếu Trung	Hieu Trung	Xã Hiếu Trung	Hieu Trung Commune	hieu_trung	846	10
29356	Long Thới	Long Thoi	Xã Long Thới	Long Thoi Commune	long_thoi	846	10
29359	Hùng Hòa	Hung Hoa	Xã Hùng Hòa	Hung Hoa Commune	hung_hoa	846	10
29362	Tân Hùng	Tan Hung	Xã Tân Hùng	Tan Hung Commune	tan_hung	846	10
29365	Tập Ngãi	Tap Ngai	Xã Tập Ngãi	Tap Ngai Commune	tap_ngai	846	10
29368	Ngãi Hùng	Ngai Hung	Xã Ngãi Hùng	Ngai Hung Commune	ngai_hung	846	10
29371	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	846	10
29374	Châu Thành	Chau Thanh	Thị trấn Châu Thành	Chau Thanh Township	chau_thanh	847	9
29377	Đa Lộc	Da Loc	Xã Đa Lộc	Da Loc Commune	da_loc	847	10
29380	Mỹ Chánh	My Chanh	Xã Mỹ Chánh	My Chanh Commune	my_chanh	847	10
29383	Thanh Mỹ	Thanh My	Xã Thanh Mỹ	Thanh My Commune	thanh_my	847	10
29386	Lương Hoà A	Luong Hoa A	Xã Lương Hoà A	Luong Hoa A Commune	luong_hoa_a	847	10
29389	Lương Hòa	Luong Hoa	Xã Lương Hòa	Luong Hoa Commune	luong_hoa	847	10
29392	Song Lộc	Song Loc	Xã Song Lộc	Song Loc Commune	song_loc	847	10
29395	Nguyệt Hóa	Nguyet Hoa	Xã Nguyệt Hóa	Nguyet Hoa Commune	nguyet_hoa	847	10
29398	Hòa Thuận	Hoa Thuan	Xã Hòa Thuận	Hoa Thuan Commune	hoa_thuan	847	10
29401	Hòa Lợi	Hoa Loi	Xã Hòa Lợi	Hoa Loi Commune	hoa_loi	847	10
29404	Phước Hảo	Phuoc Hao	Xã Phước Hảo	Phuoc Hao Commune	phuoc_hao	847	10
29407	Hưng Mỹ	Hung My	Xã Hưng Mỹ	Hung My Commune	hung_my	847	10
29410	Hòa Minh	Hoa Minh	Xã Hòa Minh	Hoa Minh Commune	hoa_minh	847	10
29413	Long Hòa	Long Hoa	Xã Long Hòa	Long Hoa Commune	long_hoa	847	10
29416	Cầu Ngang	Cau Ngang	Thị trấn Cầu Ngang	Cau Ngang Township	cau_ngang	848	9
29419	Mỹ Long	My Long	Thị trấn Mỹ Long	My Long Township	my_long	848	9
29422	Mỹ Long Bắc	My Long Bac	Xã Mỹ Long Bắc	My Long Bac Commune	my_long_bac	848	10
29425	Mỹ Long Nam	My Long Nam	Xã Mỹ Long Nam	My Long Nam Commune	my_long_nam	848	10
29428	Mỹ Hòa	My Hoa	Xã Mỹ Hòa	My Hoa Commune	my_hoa	848	10
29431	Vĩnh Kim	Vinh Kim	Xã Vĩnh Kim	Vinh Kim Commune	vinh_kim	848	10
29434	Kim Hòa	Kim Hoa	Xã Kim Hòa	Kim Hoa Commune	kim_hoa	848	10
29437	Hiệp Hòa	Hiep Hoa	Xã Hiệp Hòa	Hiep Hoa Commune	hiep_hoa	848	10
29440	Thuận Hòa	Thuan Hoa	Xã Thuận Hòa	Thuan Hoa Commune	thuan_hoa	848	10
29443	Long Sơn	Long Son	Xã Long Sơn	Long Son Commune	long_son	848	10
29446	Nhị Trường	Nhi Truong	Xã Nhị Trường	Nhi Truong Commune	nhi_truong	848	10
29449	Trường Thọ	Truong Tho	Xã Trường Thọ	Truong Tho Commune	truong_tho	848	10
29452	Hiệp Mỹ Đông	Hiep My Dong	Xã Hiệp Mỹ Đông	Hiep My Dong Commune	hiep_my_dong	848	10
29455	Hiệp Mỹ Tây	Hiep My Tay	Xã Hiệp Mỹ Tây	Hiep My Tay Commune	hiep_my_tay	848	10
29458	Thạnh Hòa Sơn	Thanh Hoa Son	Xã Thạnh Hòa Sơn	Thanh Hoa Son Commune	thanh_hoa_son	848	10
29461	Trà Cú	Tra Cu	Thị trấn Trà Cú	Tra Cu Township	tra_cu	849	9
29462	Định An	Dinh An	Thị trấn Định An	Dinh An Township	dinh_an	849	9
29464	Phước Hưng	Phuoc Hung	Xã Phước Hưng	Phuoc Hung Commune	phuoc_hung	849	10
29467	Tập Sơn	Tap Son	Xã Tập Sơn	Tap Son Commune	tap_son	849	10
29470	Tân Sơn	Tan Son	Xã Tân Sơn	Tan Son Commune	tan_son	849	10
29473	An Quảng Hữu	An Quang Huu	Xã An Quảng Hữu	An Quang Huu Commune	an_quang_huu	849	10
29476	Lưu Nghiệp Anh	Luu Nghiep Anh	Xã Lưu Nghiệp Anh	Luu Nghiep Anh Commune	luu_nghiep_anh	849	10
29479	Ngãi Xuyên	Ngai Xuyen	Xã Ngãi Xuyên	Ngai Xuyen Commune	ngai_xuyen	849	10
29482	Kim Sơn	Kim Son	Xã Kim Sơn	Kim Son Commune	kim_son	849	10
29485	Thanh Sơn	Thanh Son	Xã Thanh Sơn	Thanh Son Commune	thanh_son	849	10
29488	Hàm Giang	Ham Giang	Xã Hàm Giang	Ham Giang Commune	ham_giang	849	10
29489	Hàm Tân	Ham Tan	Xã Hàm Tân	Ham Tan Commune	ham_tan	849	10
29491	Đại An	Dai An	Xã Đại An	Dai An Commune	dai_an	849	10
29494	Định An	Dinh An	Xã Định An	Dinh An Commune	dinh_an	849	10
29503	Ngọc Biên	Ngoc Bien	Xã Ngọc Biên	Ngoc Bien Commune	ngoc_bien	849	10
29506	Long Hiệp	Long Hiep	Xã Long Hiệp	Long Hiep Commune	long_hiep	849	10
29509	Tân Hiệp	Tan Hiep	Xã Tân Hiệp	Tan Hiep Commune	tan_hiep	849	10
29497	Đôn Xuân	Don Xuan	Xã Đôn Xuân	Don Xuan Commune	don_xuan	850	10
29500	Đôn Châu	Don Chau	Xã Đôn Châu	Don Chau Commune	don_chau	850	10
29513	Long Thành	Long Thanh	Thị trấn Long Thành	Long Thanh Township	long_thanh	850	9
29521	Long Khánh	Long Khanh	Xã Long Khánh	Long Khanh Commune	long_khanh	850	10
29530	Ngũ Lạc	Ngu Lac	Xã Ngũ Lạc	Ngu Lac Commune	ngu_lac	850	10
29533	Long Vĩnh	Long Vinh	Xã Long Vĩnh	Long Vinh Commune	long_vinh	850	10
29536	Đông Hải	Dong Hai	Xã Đông Hải	Dong Hai Commune	dong_hai	850	10
29512	1	1	Phường 1	1 Ward	1	851	8
29515	Long Toàn	Long Toan	Xã Long Toàn	Long Toan Commune	long_toan	851	10
29516	2	2	Phường 2	2 Ward	2	851	8
29518	Long Hữu	Long Huu	Xã Long Hữu	Long Huu Commune	long_huu	851	10
29524	Dân Thành	Dan Thanh	Xã Dân Thành	Dan Thanh Commune	dan_thanh	851	10
29527	Trường Long Hòa	Truong Long Hoa	Xã Trường Long Hòa	Truong Long Hoa Commune	truong_long_hoa	851	10
29539	Hiệp Thạnh	Hiep Thanh	Xã Hiệp Thạnh	Hiep Thanh Commune	hiep_thanh	851	10
29542	9	9	Phường 9	9 Ward	9	855	8
29545	5	5	Phường 5	5 Ward	5	855	8
29548	1	1	Phường 1	1 Ward	1	855	8
29563	Tân Ngãi	Tan Ngai	Phường Tân Ngãi	Tan Ngai Ward	tan_ngai	855	8
29566	Tân Hòa	Tan Hoa	Phường Tân Hòa	Tan Hoa Ward	tan_hoa	855	8
29569	Tân Hội	Tan Hoi	Phường Tân Hội	Tan Hoi Ward	tan_hoi	855	8
29572	Trường An	Truong An	Phường Trường An	Truong An Ward	truong_an	855	8
29575	Long Hồ	Long Ho	Thị trấn Long Hồ	Long Ho Township	long_ho	857	9
29578	Đồng Phú	Dong Phu	Xã Đồng Phú	Dong Phu Commune	dong_phu	857	10
29581	Bình Hòa Phước	Binh Hoa Phuoc	Xã Bình Hòa Phước	Binh Hoa Phuoc Commune	binh_hoa_phuoc	857	10
29584	Hòa Ninh	Hoa Ninh	Xã Hòa Ninh	Hoa Ninh Commune	hoa_ninh	857	10
29587	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	857	10
29590	Thanh Đức	Thanh Duc	Xã Thanh Đức	Thanh Duc Commune	thanh_duc	857	10
29593	Tân Hạnh	Tan Hanh	Xã Tân Hạnh	Tan Hanh Commune	tan_hanh	857	10
29596	Phước Hậu	Phuoc Hau	Xã Phước Hậu	Phuoc Hau Commune	phuoc_hau	857	10
29599	Long Phước	Long Phuoc	Xã Long Phước	Long Phuoc Commune	long_phuoc	857	10
29602	Phú Đức	Phu Duc	Xã Phú Đức	Phu Duc Commune	phu_duc	857	10
29605	Lộc Hòa	Loc Hoa	Xã Lộc Hòa	Loc Hoa Commune	loc_hoa	857	10
29608	Long An	Long An	Xã Long An	Long An Commune	long_an	857	10
29611	Phú Quới	Phu Quoi	Xã Phú Quới	Phu Quoi Commune	phu_quoi	857	10
29614	Thạnh Quới	Thanh Quoi	Xã Thạnh Quới	Thanh Quoi Commune	thanh_quoi	857	10
29617	Hòa Phú	Hoa Phu	Xã Hòa Phú	Hoa Phu Commune	hoa_phu	857	10
29623	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	858	10
29626	Mỹ Phước	My Phuoc	Xã Mỹ Phước	My Phuoc Commune	my_phuoc	858	10
29629	An Phước	An Phuoc	Xã An Phước	An Phuoc Commune	an_phuoc	858	10
29632	Nhơn Phú	Nhon Phu	Xã Nhơn Phú	Nhon Phu Commune	nhon_phu	858	10
29635	Long Mỹ	Long My	Xã Long Mỹ	Long My Commune	long_my	858	10
29638	Hòa Tịnh	Hoa Tinh	Xã Hòa Tịnh	Hoa Tinh Commune	hoa_tinh	858	10
29641	Cái Nhum	Cai Nhum	Thị trấn Cái Nhum	Cai Nhum Township	cai_nhum	858	9
29644	Bình Phước	Binh Phuoc	Xã Bình Phước	Binh Phuoc Commune	binh_phuoc	858	10
29647	Chánh An	Chanh An	Xã Chánh An	Chanh An Commune	chanh_an	858	10
29650	Tân An Hội	Tan An Hoi	Xã Tân An Hội	Tan An Hoi Commune	tan_an_hoi	858	10
29653	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	858	10
29656	Tân Long Hội	Tan Long Hoi	Xã Tân Long Hội	Tan Long Hoi Commune	tan_long_hoi	858	10
29659	Vũng Liêm	Vung Liem	Thị trấn Vũng Liêm	Vung Liem Township	vung_liem	859	9
29662	Tân Quới Trung	Tan Quoi Trung	Xã Tân Quới Trung	Tan Quoi Trung Commune	tan_quoi_trung	859	10
29665	Quới Thiện	Quoi Thien	Xã Quới Thiện	Quoi Thien Commune	quoi_thien	859	10
29668	Quới An	Quoi An	Xã Quới An	Quoi An Commune	quoi_an	859	10
29671	Trung Chánh	Trung Chanh	Xã Trung Chánh	Trung Chanh Commune	trung_chanh	859	10
29674	Tân An Luông	Tan An Luong	Xã Tân An Luông	Tan An Luong Commune	tan_an_luong	859	10
29677	Thanh Bình	Thanh Binh	Xã Thanh Bình	Thanh Binh Commune	thanh_binh	859	10
29680	Trung Thành Tây	Trung Thanh Tay	Xã Trung Thành Tây	Trung Thanh Tay Commune	trung_thanh_tay	859	10
29683	Trung Hiệp	Trung Hiep	Xã Trung Hiệp	Trung Hiep Commune	trung_hiep	859	10
29686	Hiếu Phụng	Hieu Phung	Xã Hiếu Phụng	Hieu Phung Commune	hieu_phung	859	10
29689	Trung Thành Đông	Trung Thanh Dong	Xã Trung Thành Đông	Trung Thanh Dong Commune	trung_thanh_dong	859	10
29692	Trung Thành	Trung Thanh	Xã Trung Thành	Trung Thanh Commune	trung_thanh	859	10
29695	Trung Hiếu	Trung Hieu	Xã Trung Hiếu	Trung Hieu Commune	trung_hieu	859	10
29698	Trung Ngãi	Trung Ngai	Xã Trung Ngãi	Trung Ngai Commune	trung_ngai	859	10
29701	Hiếu Thuận	Hieu Thuan	Xã Hiếu Thuận	Hieu Thuan Commune	hieu_thuan	859	10
29704	Trung Nghĩa	Trung Nghia	Xã Trung Nghĩa	Trung Nghia Commune	trung_nghia	859	10
29707	Trung An	Trung An	Xã Trung An	Trung An Commune	trung_an	859	10
29710	Hiếu Nhơn	Hieu Nhon	Xã Hiếu Nhơn	Hieu Nhon Commune	hieu_nhon	859	10
29713	Hiếu Thành	Hieu Thanh	Xã Hiếu Thành	Hieu Thanh Commune	hieu_thanh	859	10
29716	Hiếu Nghĩa	Hieu Nghia	Xã Hiếu Nghĩa	Hieu Nghia Commune	hieu_nghia	859	10
29719	Tam Bình	Tam Binh	Thị trấn Tam Bình	Tam Binh Township	tam_binh	860	9
29722	Tân Lộc	Tan Loc	Xã Tân Lộc	Tan Loc Commune	tan_loc	860	10
29725	Phú Thịnh	Phu Thinh	Xã Phú Thịnh	Phu Thinh Commune	phu_thinh	860	10
29728	Hậu Lộc	Hau Loc	Xã Hậu Lộc	Hau Loc Commune	hau_loc	860	10
29731	Hòa Thạnh	Hoa Thanh	Xã Hòa Thạnh	Hoa Thanh Commune	hoa_thanh	860	10
29734	Hoà Lộc	Hoa Loc	Xã Hoà Lộc	Hoa Loc Commune	hoa_loc	860	10
29737	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	860	10
29740	Song Phú	Song Phu	Xã Song Phú	Song Phu Commune	song_phu	860	10
29743	Hòa Hiệp	Hoa Hiep	Xã Hòa Hiệp	Hoa Hiep Commune	hoa_hiep	860	10
29746	Mỹ Lộc	My Loc	Xã Mỹ Lộc	My Loc Commune	my_loc	860	10
29749	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	860	10
29752	Long Phú	Long Phu	Xã Long Phú	Long Phu Commune	long_phu	860	10
29755	Mỹ Thạnh Trung	My Thanh Trung	Xã Mỹ Thạnh Trung	My Thanh Trung Commune	my_thanh_trung	860	10
29758	Tường Lộc	Tuong Loc	Xã Tường Lộc	Tuong Loc Commune	tuong_loc	860	10
29761	Loan Mỹ	Loan My	Xã Loan Mỹ	Loan My Commune	loan_my	860	10
29764	Ngãi Tứ	Ngai Tu	Xã Ngãi Tứ	Ngai Tu Commune	ngai_tu	860	10
29767	Bình Ninh	Binh Ninh	Xã Bình Ninh	Binh Ninh Commune	binh_ninh	860	10
29770	Cái Vồn	Cai Von	Phường Cái Vồn	Cai Von Ward	cai_von	861	8
29771	Thành Phước	Thanh Phuoc	Phường Thành Phước	Thanh Phuoc Ward	thanh_phuoc	861	8
29806	Thuận An	Thuan An	Xã Thuận An	Thuan An Commune	thuan_an	861	10
29809	Đông Thạnh	Dong Thanh	Xã Đông Thạnh	Dong Thanh Commune	dong_thanh	861	10
29812	Đông Bình	Dong Binh	Xã Đông Bình	Dong Binh Commune	dong_binh	861	10
29813	Đông Thuận	Dong Thuan	Phường Đông Thuận	Dong Thuan Ward	dong_thuan	861	8
29815	Mỹ Hòa	My Hoa	Xã Mỹ Hòa	My Hoa Commune	my_hoa	861	10
29818	Đông Thành	Dong Thanh	Xã Đông Thành	Dong Thanh Commune	dong_thanh	861	10
29821	Trà Ôn	Tra On	Thị trấn Trà Ôn	Tra On Township	tra_on	862	9
29824	Xuân Hiệp	Xuan Hiep	Xã Xuân Hiệp	Xuan Hiep Commune	xuan_hiep	862	10
29827	Nhơn Bình	Nhon Binh	Xã Nhơn Bình	Nhon Binh Commune	nhon_binh	862	10
29830	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	862	10
29833	Thới Hòa	Thoi Hoa	Xã Thới Hòa	Thoi Hoa Commune	thoi_hoa	862	10
29836	Trà Côn	Tra Con	Xã Trà Côn	Tra Con Commune	tra_con	862	10
29839	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	862	10
29842	Hựu Thành	Huu Thanh	Xã Hựu Thành	Huu Thanh Commune	huu_thanh	862	10
29845	Vĩnh Xuân	Vinh Xuan	Xã Vĩnh Xuân	Vinh Xuan Commune	vinh_xuan	862	10
29848	Thuận Thới	Thuan Thoi	Xã Thuận Thới	Thuan Thoi Commune	thuan_thoi	862	10
29851	Phú Thành	Phu Thanh	Xã Phú Thành	Phu Thanh Commune	phu_thanh	862	10
29854	Thiện Mỹ	Thien My	Xã Thiện Mỹ	Thien My Commune	thien_my	862	10
29857	Lục Sỹ Thành	Luc Sy Thanh	Xã Lục Sỹ Thành	Luc Sy Thanh Commune	luc_sy_thanh	862	10
29860	Tích Thiện	Tich Thien	Xã Tích Thiện	Tich Thien Commune	tich_thien	862	10
29773	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	863	10
29776	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	863	10
29779	Thành Trung	Thanh Trung	Xã Thành Trung	Thanh Trung Commune	thanh_trung	863	10
29782	Tân An Thạnh	Tan An Thanh	Xã Tân An Thạnh	Tan An Thanh Commune	tan_an_thanh	863	10
29785	Tân Lược	Tan Luoc	Xã Tân Lược	Tan Luoc Commune	tan_luoc	863	10
29788	Nguyễn Văn Thảnh	Nguyen Van Thanh	Xã Nguyễn Văn Thảnh	Nguyen Van Thanh Commune	nguyen_van_thanh	863	10
29791	Thành Lợi	Thanh Loi	Xã Thành Lợi	Thanh Loi Commune	thanh_loi	863	10
29794	Mỹ Thuận	My Thuan	Xã Mỹ Thuận	My Thuan Commune	my_thuan	863	10
29797	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	863	10
29800	Tân Quới	Tan Quoi	Thị trấn Tân Quới	Tan Quoi Township	tan_quoi	863	9
29863	11	11	Phường 11	11 Ward	11	866	8
29866	1	1	Phường 1	1 Ward	1	866	8
29869	2	2	Phường 2	2 Ward	2	866	8
29872	4	4	Phường 4	4 Ward	4	866	8
29875	3	3	Phường 3	3 Ward	3	866	8
29878	6	6	Phường 6	6 Ward	6	866	8
29881	Mỹ Ngãi	My Ngai	Xã Mỹ Ngãi	My Ngai Commune	my_ngai	866	10
29884	Mỹ Tân	My Tan	Xã Mỹ Tân	My Tan Commune	my_tan	866	10
29887	Mỹ Trà	My Tra	Xã Mỹ Trà	My Tra Commune	my_tra	866	10
29888	Mỹ Phú	My Phu	Phường Mỹ Phú	My Phu Ward	my_phu	866	8
29890	Tân Thuận Tây	Tan Thuan Tay	Xã Tân Thuận Tây	Tan Thuan Tay Commune	tan_thuan_tay	866	10
29892	Hoà Thuận	Hoa Thuan	Phường Hoà Thuận	Hoa Thuan Ward	hoa_thuan	866	8
29893	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	866	10
29896	Tân Thuận Đông	Tan Thuan Dong	Xã Tân Thuận Đông	Tan Thuan Dong Commune	tan_thuan_dong	866	10
29899	Tịnh Thới	Tinh Thoi	Xã Tịnh Thới	Tinh Thoi Commune	tinh_thoi	866	10
29902	3	3	Phường 3	3 Ward	3	867	8
29905	1	1	Phường 1	1 Ward	1	867	8
29908	4	4	Phường 4	4 Ward	4	867	8
29911	2	2	Phường 2	2 Ward	2	867	8
29914	Tân Khánh Đông	Tan Khanh Dong	Xã Tân Khánh Đông	Tan Khanh Dong Commune	tan_khanh_dong	867	10
29917	Tân Quy Đông	Tan Quy Dong	Phường Tân Quy Đông	Tan Quy Dong Ward	tan_quy_dong	867	8
29919	An Hoà	An Hoa	Phường An Hoà	An Hoa Ward	an_hoa	867	8
29920	Tân Quy Tây	Tan Quy Tay	Xã Tân Quy Tây	Tan Quy Tay Commune	tan_quy_tay	867	10
29923	Tân Phú Đông	Tan Phu Dong	Xã Tân Phú Đông	Tan Phu Dong Commune	tan_phu_dong	867	10
29954	An Lộc	An Loc	Phường An Lộc	An Loc Ward	an_loc	868	8
29955	An Thạnh	An Thanh	Phường An Thạnh	An Thanh Ward	an_thanh	868	8
29959	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	868	10
29965	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	868	10
29978	An Lạc	An Lac	Phường An Lạc	An Lac Ward	an_lac	868	8
29986	An Bình B	An Binh B	Phường An Bình B	An Binh B Ward	an_binh_b	868	8
29989	An Bình A	An Binh A	Phường An Bình A	An Binh A Ward	an_binh_a	868	8
29926	Sa Rài	Sa Rai	Thị trấn Sa Rài	Sa Rai Township	sa_rai	869	9
29929	Tân Hộ Cơ	Tan Ho Co	Xã Tân Hộ Cơ	Tan Ho Co Commune	tan_ho_co	869	10
29932	Thông Bình	Thong Binh	Xã Thông Bình	Thong Binh Commune	thong_binh	869	10
29935	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	869	10
29938	Tân Thành A	Tan Thanh A	Xã Tân Thành A	Tan Thanh A Commune	tan_thanh_a	869	10
29941	Tân Thành B	Tan Thanh B	Xã Tân Thành B	Tan Thanh B Commune	tan_thanh_b	869	10
29944	Tân Phước	Tan Phuoc	Xã Tân Phước	Tan Phuoc Commune	tan_phuoc	869	10
29947	Tân Công Chí	Tan Cong Chi	Xã Tân Công Chí	Tan Cong Chi Commune	tan_cong_chi	869	10
29950	An Phước	An Phuoc	Xã An Phước	An Phuoc Commune	an_phuoc	869	10
29956	Thường Phước 1	Thuong Phuoc 1	Xã Thường Phước 1	Thuong Phuoc 1 Commune	thuong_phuoc_1	870	10
29962	Thường Thới Hậu A	Thuong Thoi Hau A	Xã Thường Thới Hậu A	Thuong Thoi Hau A Commune	thuong_thoi_hau_a	870	10
29971	Thường Thới Tiền	Thuong Thoi Tien	Thị trấn Thường Thới Tiền	Thuong Thoi Tien Township	thuong_thoi_tien	870	9
29974	Thường Phước 2	Thuong Phuoc 2	Xã Thường Phước 2	Thuong Phuoc 2 Commune	thuong_phuoc_2	870	10
29977	Thường Lạc	Thuong Lac	Xã Thường Lạc	Thuong Lac Commune	thuong_lac	870	10
29980	Long Khánh A	Long Khanh A	Xã Long Khánh A	Long Khanh A Commune	long_khanh_a	870	10
29983	Long Khánh B	Long Khanh B	Xã Long Khánh B	Long Khanh B Commune	long_khanh_b	870	10
29992	Long Thuận	Long Thuan	Xã Long Thuận	Long Thuan Commune	long_thuan	870	10
29995	Phú Thuận B	Phu Thuan B	Xã Phú Thuận B	Phu Thuan B Commune	phu_thuan_b	870	10
29998	Phú Thuận A	Phu Thuan A	Xã Phú Thuận A	Phu Thuan A Commune	phu_thuan_a	870	10
30001	Tràm Chim	Tram Chim	Thị trấn Tràm Chim	Tram Chim Township	tram_chim	871	9
30004	Hoà Bình	Hoa Binh	Xã Hoà Bình	Hoa Binh Commune	hoa_binh	871	10
30007	Tân Công Sính	Tan Cong Sinh	Xã Tân Công Sính	Tan Cong Sinh Commune	tan_cong_sinh	871	10
30010	Phú Hiệp	Phu Hiep	Xã Phú Hiệp	Phu Hiep Commune	phu_hiep	871	10
30013	Phú Đức	Phu Duc	Xã Phú Đức	Phu Duc Commune	phu_duc	871	10
30016	Phú Thành B	Phu Thanh B	Xã Phú Thành B	Phu Thanh B Commune	phu_thanh_b	871	10
30019	An Hòa	An Hoa	Xã An Hòa	An Hoa Commune	an_hoa	871	10
30022	An Long	An Long	Xã An Long	An Long Commune	an_long	871	10
30025	Phú Cường	Phu Cuong	Xã Phú Cường	Phu Cuong Commune	phu_cuong	871	10
30028	Phú Ninh	Phu Ninh	Xã Phú Ninh	Phu Ninh Commune	phu_ninh	871	10
30031	Phú Thọ	Phu Tho	Xã Phú Thọ	Phu Tho Commune	phu_tho	871	10
30034	Phú Thành A	Phu Thanh A	Xã Phú Thành A	Phu Thanh A Commune	phu_thanh_a	871	10
30037	Mỹ An	My An	Thị trấn Mỹ An	My An Township	my_an	872	9
30040	Thạnh Lợi	Thanh Loi	Xã Thạnh Lợi	Thanh Loi Commune	thanh_loi	872	10
30043	Hưng Thạnh	Hung Thanh	Xã Hưng Thạnh	Hung Thanh Commune	hung_thanh	872	10
30046	Trường Xuân	Truong Xuan	Xã Trường Xuân	Truong Xuan Commune	truong_xuan	872	10
30049	Tân Kiều	Tan Kieu	Xã Tân Kiều	Tan Kieu Commune	tan_kieu	872	10
30052	Mỹ Hòa	My Hoa	Xã Mỹ Hòa	My Hoa Commune	my_hoa	872	10
30055	Mỹ Quý	My Quy	Xã Mỹ Quý	My Quy Commune	my_quy	872	10
30058	Mỹ Đông	My Dong	Xã Mỹ Đông	My Dong Commune	my_dong	872	10
30061	Đốc Binh Kiều	Doc Binh Kieu	Xã Đốc Binh Kiều	Doc Binh Kieu Commune	doc_binh_kieu	872	10
30064	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	872	10
30067	Phú Điền	Phu Dien	Xã Phú Điền	Phu Dien Commune	phu_dien	872	10
30070	Láng Biển	Lang Bien	Xã Láng Biển	Lang Bien Commune	lang_bien	872	10
30073	Thanh Mỹ	Thanh My	Xã Thanh Mỹ	Thanh My Commune	thanh_my	872	10
30076	Mỹ Thọ	My Tho	Thị trấn Mỹ Thọ	My Tho Township	my_tho	873	9
30079	Gáo Giồng	Gao Giong	Xã Gáo Giồng	Gao Giong Commune	gao_giong	873	10
30082	Phương Thịnh	Phuong Thinh	Xã Phương Thịnh	Phuong Thinh Commune	phuong_thinh	873	10
30085	Ba Sao	Ba Sao	Xã Ba Sao	Ba Sao Commune	ba_sao	873	10
30088	Phong Mỹ	Phong My	Xã Phong Mỹ	Phong My Commune	phong_my	873	10
30091	Tân Nghĩa	Tan Nghia	Xã Tân Nghĩa	Tan Nghia Commune	tan_nghia	873	10
30094	Phương Trà	Phuong Tra	Xã Phương Trà	Phuong Tra Commune	phuong_tra	873	10
30097	Nhị Mỹ	Nhi My	Xã Nhị Mỹ	Nhi My Commune	nhi_my	873	10
30100	Mỹ Thọ	My Tho	Xã Mỹ Thọ	My Tho Commune	my_tho	873	10
30103	Tân Hội Trung	Tan Hoi Trung	Xã Tân Hội Trung	Tan Hoi Trung Commune	tan_hoi_trung	873	10
30106	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	873	10
30109	Mỹ Hội	My Hoi	Xã Mỹ Hội	My Hoi Commune	my_hoi	873	10
30112	Mỹ Hiệp	My Hiep	Xã Mỹ Hiệp	My Hiep Commune	my_hiep	873	10
30115	Mỹ Long	My Long	Xã Mỹ Long	My Long Commune	my_long	873	10
30118	Bình Hàng Trung	Binh Hang Trung	Xã Bình Hàng Trung	Binh Hang Trung Commune	binh_hang_trung	873	10
30121	Mỹ Xương	My Xuong	Xã Mỹ Xương	My Xuong Commune	my_xuong	873	10
30124	Bình Hàng Tây	Binh Hang Tay	Xã Bình Hàng Tây	Binh Hang Tay Commune	binh_hang_tay	873	10
30127	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	873	10
30130	Thanh Bình	Thanh Binh	Thị trấn Thanh Bình	Thanh Binh Township	thanh_binh	874	9
30133	Tân Quới	Tan Quoi	Xã Tân Quới	Tan Quoi Commune	tan_quoi	874	10
30136	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	874	10
30139	An Phong	An Phong	Xã An Phong	An Phong Commune	an_phong	874	10
30142	Phú Lợi	Phu Loi	Xã Phú Lợi	Phu Loi Commune	phu_loi	874	10
30145	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	874	10
30148	Bình Tấn	Binh Tan	Xã Bình Tấn	Binh Tan Commune	binh_tan	874	10
30151	Tân Huề	Tan Hue	Xã Tân Huề	Tan Hue Commune	tan_hue	874	10
30154	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	874	10
30157	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	874	10
30160	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	874	10
30163	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	874	10
30166	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	874	10
30169	Lấp Vò	Lap Vo	Thị trấn Lấp Vò	Lap Vo Township	lap_vo	875	9
30172	Mỹ An Hưng A	My An Hung A	Xã Mỹ An Hưng A	My An Hung A Commune	my_an_hung_a	875	10
30175	Tân Mỹ	Tan My	Xã Tân Mỹ	Tan My Commune	tan_my	875	10
30178	Mỹ An Hưng B	My An Hung B	Xã Mỹ An Hưng B	My An Hung B Commune	my_an_hung_b	875	10
30181	Tân  Khánh Trung	Tan  Khanh Trung	Xã Tân  Khánh Trung	Tan  Khanh Trung Commune	tan__khanh_trung	875	10
30184	Long Hưng A	Long Hung A	Xã Long Hưng A	Long Hung A Commune	long_hung_a	875	10
30187	Vĩnh Thạnh	Vinh Thanh	Xã Vĩnh Thạnh	Vinh Thanh Commune	vinh_thanh	875	10
30190	Long Hưng B	Long Hung B	Xã Long Hưng B	Long Hung B Commune	long_hung_b	875	10
30193	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	875	10
30196	Định An	Dinh An	Xã Định An	Dinh An Commune	dinh_an	875	10
30199	Định Yên	Dinh Yen	Xã Định Yên	Dinh Yen Commune	dinh_yen	875	10
30202	Hội An Đông	Hoi An Dong	Xã Hội An Đông	Hoi An Dong Commune	hoi_an_dong	875	10
30205	Bình Thạnh Trung	Binh Thanh Trung	Xã Bình Thạnh Trung	Binh Thanh Trung Commune	binh_thanh_trung	875	10
30208	Lai Vung	Lai Vung	Thị trấn Lai Vung	Lai Vung Township	lai_vung	876	9
30211	Tân Dương	Tan Duong	Xã Tân Dương	Tan Duong Commune	tan_duong	876	10
30214	Hòa Thành	Hoa Thanh	Xã Hòa Thành	Hoa Thanh Commune	hoa_thanh	876	10
30217	Long Hậu	Long Hau	Xã Long Hậu	Long Hau Commune	long_hau	876	10
30220	Tân Phước	Tan Phuoc	Xã Tân Phước	Tan Phuoc Commune	tan_phuoc	876	10
30223	Hòa Long	Hoa Long	Xã Hòa Long	Hoa Long Commune	hoa_long	876	10
30226	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	876	10
30229	Long Thắng	Long Thang	Xã Long Thắng	Long Thang Commune	long_thang	876	10
30232	Vĩnh Thới	Vinh Thoi	Xã Vĩnh Thới	Vinh Thoi Commune	vinh_thoi	876	10
30235	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	876	10
30238	Định Hòa	Dinh Hoa	Xã Định Hòa	Dinh Hoa Commune	dinh_hoa	876	10
30241	Phong Hòa	Phong Hoa	Xã Phong Hòa	Phong Hoa Commune	phong_hoa	876	10
30244	Cái Tàu Hạ	Cai Tau Ha	Thị trấn Cái Tàu Hạ	Cai Tau Ha Township	cai_tau_ha	877	9
30247	An Hiệp	An Hiep	Xã An Hiệp	An Hiep Commune	an_hiep	877	10
30250	An Nhơn	An Nhon	Xã An Nhơn	An Nhon Commune	an_nhon	877	10
30253	Tân Nhuận Đông	Tan Nhuan Dong	Xã Tân Nhuận Đông	Tan Nhuan Dong Commune	tan_nhuan_dong	877	10
30256	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	877	10
30259	Tân Phú Trung	Tan Phu Trung	Xã Tân Phú Trung	Tan Phu Trung Commune	tan_phu_trung	877	10
30262	Phú Long	Phu Long	Xã Phú Long	Phu Long Commune	phu_long	877	10
30265	An Phú Thuận	An Phu Thuan	Xã An Phú Thuận	An Phu Thuan Commune	an_phu_thuan	877	10
30268	Phú Hựu	Phu Huu	Xã Phú Hựu	Phu Huu Commune	phu_huu	877	10
30271	An Khánh	An Khanh	Xã An Khánh	An Khanh Commune	an_khanh	877	10
30274	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	877	10
30277	Hòa Tân	Hoa Tan	Xã Hòa Tân	Hoa Tan Commune	hoa_tan	877	10
30280	Mỹ Bình	My Binh	Phường Mỹ Bình	My Binh Ward	my_binh	883	8
30283	Mỹ Long	My Long	Phường Mỹ Long	My Long Ward	my_long	883	8
30285	Đông Xuyên	Dong Xuyen	Phường Đông Xuyên	Dong Xuyen Ward	dong_xuyen	883	8
30286	Mỹ Xuyên	My Xuyen	Phường Mỹ Xuyên	My Xuyen Ward	my_xuyen	883	8
30289	Bình Đức	Binh Duc	Phường Bình Đức	Binh Duc Ward	binh_duc	883	8
30292	Bình Khánh	Binh Khanh	Phường Bình Khánh	Binh Khanh Ward	binh_khanh	883	8
30295	Mỹ Phước	My Phuoc	Phường Mỹ Phước	My Phuoc Ward	my_phuoc	883	8
30298	Mỹ Quý	My Quy	Phường Mỹ Quý	My Quy Ward	my_quy	883	8
30301	Mỹ Thới	My Thoi	Phường Mỹ Thới	My Thoi Ward	my_thoi	883	8
30304	Mỹ Thạnh	My Thanh	Phường Mỹ Thạnh	My Thanh Ward	my_thanh	883	8
30307	Mỹ Hòa	My Hoa	Phường Mỹ Hòa	My Hoa Ward	my_hoa	883	8
30310	Mỹ Khánh	My Khanh	Xã Mỹ Khánh	My Khanh Commune	my_khanh	883	10
30313	Mỹ Hoà Hưng	My Hoa Hung	Xã Mỹ Hoà Hưng	My Hoa Hung Commune	my_hoa_hung	883	10
30316	Châu Phú B	Chau Phu B	Phường Châu Phú B	Chau Phu B Ward	chau_phu_b	884	8
30319	Châu Phú A	Chau Phu A	Phường Châu Phú A	Chau Phu A Ward	chau_phu_a	884	8
30322	Vĩnh Mỹ	Vinh My	Phường Vĩnh Mỹ	Vinh My Ward	vinh_my	884	8
30325	Núi Sam	Nui Sam	Phường Núi Sam	Nui Sam Ward	nui_sam	884	8
30328	Vĩnh Ngươn	Vinh Nguon	Phường Vĩnh Ngươn	Vinh Nguon Ward	vinh_nguon	884	8
30331	Vĩnh Tế	Vinh Te	Xã Vĩnh Tế	Vinh Te Commune	vinh_te	884	10
30334	Vĩnh Châu	Vinh Chau	Xã Vĩnh Châu	Vinh Chau Commune	vinh_chau	884	10
30337	An Phú	An Phu	Thị trấn An Phú	An Phu Township	an_phu	886	9
30340	Khánh An	Khanh An	Xã Khánh An	Khanh An Commune	khanh_an	886	10
30341	Long Bình	Long Binh	Thị trấn Long Bình	Long Binh Township	long_binh	886	9
30343	Khánh Bình	Khanh Binh	Xã Khánh Bình	Khanh Binh Commune	khanh_binh	886	10
30346	Quốc Thái	Quoc Thai	Xã Quốc Thái	Quoc Thai Commune	quoc_thai	886	10
30349	Nhơn Hội	Nhon Hoi	Xã Nhơn Hội	Nhon Hoi Commune	nhon_hoi	886	10
30352	Phú Hữu	Phu Huu	Xã Phú Hữu	Phu Huu Commune	phu_huu	886	10
30355	Phú Hội	Phu Hoi	Xã Phú Hội	Phu Hoi Commune	phu_hoi	886	10
30358	Phước Hưng	Phuoc Hung	Xã Phước Hưng	Phuoc Hung Commune	phuoc_hung	886	10
30361	Vĩnh Lộc	Vinh Loc	Xã Vĩnh Lộc	Vinh Loc Commune	vinh_loc	886	10
30364	Vĩnh Hậu	Vinh Hau	Xã Vĩnh Hậu	Vinh Hau Commune	vinh_hau	886	10
30367	Vĩnh Trường	Vinh Truong	Xã Vĩnh Trường	Vinh Truong Commune	vinh_truong	886	10
30370	Vĩnh Hội Đông	Vinh Hoi Dong	Xã Vĩnh Hội Đông	Vinh Hoi Dong Commune	vinh_hoi_dong	886	10
30373	Đa Phước	Da Phuoc	Xã Đa Phước	Da Phuoc Commune	da_phuoc	886	10
30376	Long Thạnh	Long Thanh	Phường Long Thạnh	Long Thanh Ward	long_thanh	887	8
30377	Long Hưng	Long Hung	Phường Long Hưng	Long Hung Ward	long_hung	887	8
30378	Long Châu	Long Chau	Phường Long Châu	Long Chau Ward	long_chau	887	8
30379	Phú Lộc	Phu Loc	Xã Phú Lộc	Phu Loc Commune	phu_loc	887	10
30382	Vĩnh Xương	Vinh Xuong	Xã Vĩnh Xương	Vinh Xuong Commune	vinh_xuong	887	10
30385	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	887	10
30387	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	887	10
30388	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	887	10
30391	Long An	Long An	Xã Long An	Long An Commune	long_an	887	10
30394	Long Phú	Long Phu	Phường Long Phú	Long Phu Ward	long_phu	887	8
30397	Châu Phong	Chau Phong	Xã Châu Phong	Chau Phong Commune	chau_phong	887	10
30400	Phú Vĩnh	Phu Vinh	Xã Phú Vĩnh	Phu Vinh Commune	phu_vinh	887	10
30403	Lê Chánh	Le Chanh	Xã Lê Chánh	Le Chanh Commune	le_chanh	887	10
30412	Long Sơn	Long Son	Phường Long Sơn	Long Son Ward	long_son	887	8
30406	Phú Mỹ	Phu My	Thị trấn Phú Mỹ	Phu My Township	phu_my	888	9
30409	Chợ Vàm	Cho Vam	Thị trấn Chợ Vàm	Cho Vam Township	cho_vam	888	9
30415	Long Hoà	Long Hoa	Xã Long Hoà	Long Hoa Commune	long_hoa	888	10
30418	Phú Long	Phu Long	Xã Phú Long	Phu Long Commune	phu_long	888	10
30421	Phú Lâm	Phu Lam	Xã Phú Lâm	Phu Lam Commune	phu_lam	888	10
30424	Phú Hiệp	Phu Hiep	Xã Phú Hiệp	Phu Hiep Commune	phu_hiep	888	10
30427	Phú Thạnh	Phu Thanh	Xã Phú Thạnh	Phu Thanh Commune	phu_thanh	888	10
30430	Hoà Lạc	Hoa Lac	Xã Hoà Lạc	Hoa Lac Commune	hoa_lac	888	10
30433	Phú Thành	Phu Thanh	Xã Phú Thành	Phu Thanh Commune	phu_thanh	888	10
30436	Phú An	Phu An	Xã Phú An	Phu An Commune	phu_an	888	10
30439	Phú Xuân	Phu Xuan	Xã Phú Xuân	Phu Xuan Commune	phu_xuan	888	10
30442	Hiệp Xương	Hiep Xuong	Xã Hiệp Xương	Hiep Xuong Commune	hiep_xuong	888	10
30445	Phú Bình	Phu Binh	Xã Phú Bình	Phu Binh Commune	phu_binh	888	10
30448	Phú Thọ	Phu Tho	Xã Phú Thọ	Phu Tho Commune	phu_tho	888	10
30451	Phú Hưng	Phu Hung	Xã Phú Hưng	Phu Hung Commune	phu_hung	888	10
30454	Bình Thạnh Đông	Binh Thanh Dong	Xã Bình Thạnh Đông	Binh Thanh Dong Commune	binh_thanh_dong	888	10
30457	Tân Hòa	Tan Hoa	Xã Tân Hòa	Tan Hoa Commune	tan_hoa	888	10
30460	Tân Trung	Tan Trung	Xã Tân Trung	Tan Trung Commune	tan_trung	888	10
30463	Cái Dầu	Cai Dau	Thị trấn Cái Dầu	Cai Dau Township	cai_dau	889	9
30466	Khánh Hòa	Khanh Hoa	Xã Khánh Hòa	Khanh Hoa Commune	khanh_hoa	889	10
30469	Mỹ Đức	My Duc	Xã Mỹ Đức	My Duc Commune	my_duc	889	10
30472	Mỹ Phú	My Phu	Xã Mỹ Phú	My Phu Commune	my_phu	889	10
30475	Ô Long Vỹ	O Long Vy	Xã Ô Long Vỹ	O Long Vy Commune	o_long_vy	889	10
30478	Vĩnh Thạnh Trung	Vinh Thanh Trung	Thị trấn Vĩnh Thạnh Trung	Vinh Thanh Trung Township	vinh_thanh_trung	889	9
30481	Thạnh Mỹ Tây	Thanh My Tay	Xã Thạnh Mỹ Tây	Thanh My Tay Commune	thanh_my_tay	889	10
30484	Bình Long	Binh Long	Xã Bình Long	Binh Long Commune	binh_long	889	10
30487	Bình Mỹ	Binh My	Xã Bình Mỹ	Binh My Commune	binh_my	889	10
30490	Bình Thủy	Binh Thuy	Xã Bình Thủy	Binh Thuy Commune	binh_thuy	889	10
30493	Đào Hữu Cảnh	Dao Huu Canh	Xã Đào Hữu Cảnh	Dao Huu Canh Commune	dao_huu_canh	889	10
30496	Bình Phú	Binh Phu	Xã Bình Phú	Binh Phu Commune	binh_phu	889	10
30499	Bình Chánh	Binh Chanh	Xã Bình Chánh	Binh Chanh Commune	binh_chanh	889	10
30502	Nhà Bàng	Nha Bang	Thị trấn Nhà Bàng	Nha Bang Township	nha_bang	890	9
30505	Chi Lăng	Chi Lang	Thị trấn Chi Lăng	Chi Lang Township	chi_lang	890	9
30508	Núi Voi	Nui Voi	Xã Núi Voi	Nui Voi Commune	nui_voi	890	10
30511	Nhơn Hưng	Nhon Hung	Xã Nhơn Hưng	Nhon Hung Commune	nhon_hung	890	10
30514	An Phú	An Phu	Xã An Phú	An Phu Commune	an_phu	890	10
30517	Thới Sơn	Thoi Son	Xã Thới Sơn	Thoi Son Commune	thoi_son	890	10
30520	Tịnh Biên	Tinh Bien	Thị trấn Tịnh Biên	Tinh Bien Township	tinh_bien	890	9
30523	Văn Giáo	Van Giao	Xã Văn Giáo	Van Giao Commune	van_giao	890	10
30526	An Cư	An Cu	Xã An Cư	An Cu Commune	an_cu	890	10
30529	An Nông	An Nong	Xã An Nông	An Nong Commune	an_nong	890	10
30532	Vĩnh Trung	Vinh Trung	Xã Vĩnh Trung	Vinh Trung Commune	vinh_trung	890	10
30535	Tân Lợi	Tan Loi	Xã Tân Lợi	Tan Loi Commune	tan_loi	890	10
30538	An Hảo	An Hao	Xã An Hảo	An Hao Commune	an_hao	890	10
30541	Tân Lập	Tan Lap	Xã Tân Lập	Tan Lap Commune	tan_lap	890	10
30544	Tri Tôn	Tri Ton	Thị trấn Tri Tôn	Tri Ton Township	tri_ton	891	9
30547	Ba Chúc	Ba Chuc	Thị trấn Ba Chúc	Ba Chuc Township	ba_chuc	891	9
30550	Lạc Quới	Lac Quoi	Xã Lạc Quới	Lac Quoi Commune	lac_quoi	891	10
30553	Lê Trì	Le Tri	Xã Lê Trì	Le Tri Commune	le_tri	891	10
30556	Vĩnh Gia	Vinh Gia	Xã Vĩnh Gia	Vinh Gia Commune	vinh_gia	891	10
30559	Vĩnh Phước	Vinh Phuoc	Xã Vĩnh Phước	Vinh Phuoc Commune	vinh_phuoc	891	10
30562	Châu Lăng	Chau Lang	Xã Châu Lăng	Chau Lang Commune	chau_lang	891	10
30565	Lương Phi	Luong Phi	Xã Lương Phi	Luong Phi Commune	luong_phi	891	10
30568	Lương An Trà	Luong An Tra	Xã Lương An Trà	Luong An Tra Commune	luong_an_tra	891	10
30571	Tà Đảnh	Ta Danh	Xã Tà Đảnh	Ta Danh Commune	ta_danh	891	10
30574	Núi Tô	Nui To	Xã Núi Tô	Nui To Commune	nui_to	891	10
30577	An Tức	An Tuc	Xã An Tức	An Tuc Commune	an_tuc	891	10
30580	Cô Tô	Co To	Thị trấn Cô Tô	Co To Township	co_to	891	9
30583	Tân Tuyến	Tan Tuyen	Xã Tân Tuyến	Tan Tuyen Commune	tan_tuyen	891	10
30586	Ô Lâm	O Lam	Xã Ô Lâm	O Lam Commune	o_lam	891	10
30589	An Châu	An Chau	Thị trấn An Châu	An Chau Township	an_chau	892	9
30592	An Hòa	An Hoa	Xã An Hòa	An Hoa Commune	an_hoa	892	10
30595	Cần Đăng	Can Dang	Xã Cần Đăng	Can Dang Commune	can_dang	892	10
30598	Vĩnh Hanh	Vinh Hanh	Xã Vĩnh Hanh	Vinh Hanh Commune	vinh_hanh	892	10
30601	Bình Thạnh	Binh Thanh	Xã Bình Thạnh	Binh Thanh Commune	binh_thanh	892	10
30604	Vĩnh Bình	Vinh Binh	Thị trấn Vĩnh Bình	Vinh Binh Township	vinh_binh	892	9
30607	Bình Hòa	Binh Hoa	Xã Bình Hòa	Binh Hoa Commune	binh_hoa	892	10
30610	Vĩnh An	Vinh An	Xã Vĩnh An	Vinh An Commune	vinh_an	892	10
30613	Hòa Bình Thạnh	Hoa Binh Thanh	Xã Hòa Bình Thạnh	Hoa Binh Thanh Commune	hoa_binh_thanh	892	10
30616	Vĩnh Lợi	Vinh Loi	Xã Vĩnh Lợi	Vinh Loi Commune	vinh_loi	892	10
30619	Vĩnh Nhuận	Vinh Nhuan	Xã Vĩnh Nhuận	Vinh Nhuan Commune	vinh_nhuan	892	10
30622	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	892	10
30625	Vĩnh Thành	Vinh Thanh	Xã Vĩnh Thành	Vinh Thanh Commune	vinh_thanh	892	10
30628	Chợ Mới	Cho Moi	Thị trấn Chợ Mới	Cho Moi Township	cho_moi	893	9
30631	Mỹ Luông	My Luong	Thị trấn Mỹ Luông	My Luong Township	my_luong	893	9
30634	Kiến An	Kien An	Xã Kiến An	Kien An Commune	kien_an	893	10
30637	Mỹ Hội Đông	My Hoi Dong	Xã Mỹ Hội Đông	My Hoi Dong Commune	my_hoi_dong	893	10
30640	Long Điền A	Long Dien A	Xã Long Điền A	Long Dien A Commune	long_dien_a	893	10
30643	Tấn Mỹ	Tan My	Xã Tấn Mỹ	Tan My Commune	tan_my	893	10
30646	Long Điền B	Long Dien B	Xã Long Điền B	Long Dien B Commune	long_dien_b	893	10
30649	Kiến Thành	Kien Thanh	Xã Kiến Thành	Kien Thanh Commune	kien_thanh	893	10
30652	Mỹ Hiệp	My Hiep	Xã Mỹ Hiệp	My Hiep Commune	my_hiep	893	10
30655	Mỹ An	My An	Xã Mỹ An	My An Commune	my_an	893	10
30658	Nhơn Mỹ	Nhon My	Xã Nhơn Mỹ	Nhon My Commune	nhon_my	893	10
30661	Long Giang	Long Giang	Xã Long Giang	Long Giang Commune	long_giang	893	10
30664	Long Kiến	Long Kien	Xã Long Kiến	Long Kien Commune	long_kien	893	10
30667	Bình Phước Xuân	Binh Phuoc Xuan	Xã Bình Phước Xuân	Binh Phuoc Xuan Commune	binh_phuoc_xuan	893	10
30670	An Thạnh Trung	An Thanh Trung	Xã An Thạnh Trung	An Thanh Trung Commune	an_thanh_trung	893	10
30673	Hội An	Hoi An	Xã Hội An	Hoi An Commune	hoi_an	893	10
30676	Hòa Bình	Hoa Binh	Xã Hòa Bình	Hoa Binh Commune	hoa_binh	893	10
30679	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	893	10
30682	Núi Sập	Nui Sap	Thị trấn Núi Sập	Nui Sap Township	nui_sap	894	9
30685	Phú Hoà	Phu Hoa	Thị trấn Phú Hoà	Phu Hoa Township	phu_hoa	894	9
30688	Óc Eo	Oc Eo	Thị trấn Óc Eo	Oc Eo Township	oc_eo	894	9
30691	Tây Phú	Tay Phu	Xã Tây Phú	Tay Phu Commune	tay_phu	894	10
30692	An Bình	An Binh	Xã An Bình	An Binh Commune	an_binh	894	10
30694	Vĩnh Phú	Vinh Phu	Xã Vĩnh Phú	Vinh Phu Commune	vinh_phu	894	10
30697	Vĩnh Trạch	Vinh Trach	Xã Vĩnh Trạch	Vinh Trach Commune	vinh_trach	894	10
30700	Phú Thuận	Phu Thuan	Xã Phú Thuận	Phu Thuan Commune	phu_thuan	894	10
30703	Vĩnh Chánh	Vinh Chanh	Xã Vĩnh Chánh	Vinh Chanh Commune	vinh_chanh	894	10
30706	Định Mỹ	Dinh My	Xã Định Mỹ	Dinh My Commune	dinh_my	894	10
30709	Định Thành	Dinh Thanh	Xã Định Thành	Dinh Thanh Commune	dinh_thanh	894	10
30712	Mỹ Phú Đông	My Phu Dong	Xã Mỹ Phú Đông	My Phu Dong Commune	my_phu_dong	894	10
30715	Vọng Đông	Vong Dong	Xã Vọng Đông	Vong Dong Commune	vong_dong	894	10
30718	Vĩnh Khánh	Vinh Khanh	Xã Vĩnh Khánh	Vinh Khanh Commune	vinh_khanh	894	10
30721	Thoại Giang	Thoai Giang	Xã Thoại Giang	Thoai Giang Commune	thoai_giang	894	10
30724	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	894	10
30727	Vọng Thê	Vong The	Xã Vọng Thê	Vong The Commune	vong_the	894	10
30730	Vĩnh Thanh Vân	Vinh Thanh Van	Phường Vĩnh Thanh Vân	Vinh Thanh Van Ward	vinh_thanh_van	899	8
30733	Vĩnh Thanh	Vinh Thanh	Phường Vĩnh Thanh	Vinh Thanh Ward	vinh_thanh	899	8
30736	Vĩnh Quang	Vinh Quang	Phường Vĩnh Quang	Vinh Quang Ward	vinh_quang	899	8
30739	Vĩnh Hiệp	Vinh Hiep	Phường Vĩnh Hiệp	Vinh Hiep Ward	vinh_hiep	899	8
30742	Vĩnh Bảo	Vinh Bao	Phường Vĩnh Bảo	Vinh Bao Ward	vinh_bao	899	8
30745	Vĩnh Lạc	Vinh Lac	Phường Vĩnh Lạc	Vinh Lac Ward	vinh_lac	899	8
30748	An Hòa	An Hoa	Phường An Hòa	An Hoa Ward	an_hoa	899	8
30751	An Bình	An Binh	Phường An Bình	An Binh Ward	an_binh	899	8
30754	Rạch Sỏi	Rach Soi	Phường Rạch Sỏi	Rach Soi Ward	rach_soi	899	8
30757	Vĩnh Lợi	Vinh Loi	Phường Vĩnh Lợi	Vinh Loi Ward	vinh_loi	899	8
30760	Vĩnh Thông	Vinh Thong	Phường Vĩnh Thông	Vinh Thong Ward	vinh_thong	899	8
30763	Phi Thông	Phi Thong	Xã Phi Thông	Phi Thong Commune	phi_thong	899	10
30766	Tô Châu	To Chau	Phường Tô Châu	To Chau Ward	to_chau	900	8
30769	Đông Hồ	Dong Ho	Phường Đông Hồ	Dong Ho Ward	dong_ho	900	8
30772	Bình San	Binh San	Phường Bình San	Binh San Ward	binh_san	900	8
30775	Pháo Đài	Phao Dai	Phường Pháo Đài	Phao Dai Ward	phao_dai	900	8
30778	Mỹ Đức	My Duc	Phường Mỹ Đức	My Duc Ward	my_duc	900	8
30781	Tiên Hải	Tien Hai	Xã Tiên Hải	Tien Hai Commune	tien_hai	900	10
30784	Thuận Yên	Thuan Yen	Xã Thuận Yên	Thuan Yen Commune	thuan_yen	900	10
30787	Kiên Lương	Kien Luong	Thị trấn Kiên Lương	Kien Luong Township	kien_luong	902	9
30790	Kiên Bình	Kien Binh	Xã Kiên Bình	Kien Binh Commune	kien_binh	902	10
30802	Hòa Điền	Hoa Dien	Xã Hòa Điền	Hoa Dien Commune	hoa_dien	902	10
30805	Dương Hòa	Duong Hoa	Xã Dương Hòa	Duong Hoa Commune	duong_hoa	902	10
30808	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	902	10
30809	Bình Trị	Binh Tri	Xã Bình Trị	Binh Tri Commune	binh_tri	902	10
30811	Sơn Hải	Son Hai	Xã Sơn Hải	Son Hai Commune	son_hai	902	10
30814	Hòn Nghệ	Hon Nghe	Xã Hòn Nghệ	Hon Nghe Commune	hon_nghe	902	10
30817	Hòn Đất	Hon Dat	Thị trấn Hòn Đất	Hon Dat Township	hon_dat	903	9
30820	Sóc Sơn	Soc Son	Thị trấn Sóc Sơn	Soc Son Township	soc_son	903	9
30823	Bình Sơn	Binh Son	Xã Bình Sơn	Binh Son Commune	binh_son	903	10
30826	Bình Giang	Binh Giang	Xã Bình Giang	Binh Giang Commune	binh_giang	903	10
30828	Mỹ Thái	My Thai	Xã Mỹ Thái	My Thai Commune	my_thai	903	10
30829	Nam Thái Sơn	Nam Thai Son	Xã Nam Thái Sơn	Nam Thai Son Commune	nam_thai_son	903	10
30832	Mỹ Hiệp Sơn	My Hiep Son	Xã Mỹ Hiệp Sơn	My Hiep Son Commune	my_hiep_son	903	10
30835	Sơn Kiên	Son Kien	Xã Sơn Kiên	Son Kien Commune	son_kien	903	10
30836	Sơn Bình	Son Binh	Xã Sơn Bình	Son Binh Commune	son_binh	903	10
30838	Mỹ Thuận	My Thuan	Xã Mỹ Thuận	My Thuan Commune	my_thuan	903	10
30840	Lình Huỳnh	Linh Huynh	Xã Lình Huỳnh	Linh Huynh Commune	linh_huynh	903	10
30841	Thổ Sơn	Tho Son	Xã Thổ Sơn	Tho Son Commune	tho_son	903	10
30844	Mỹ Lâm	My Lam	Xã Mỹ Lâm	My Lam Commune	my_lam	903	10
30847	Mỹ Phước	My Phuoc	Xã Mỹ Phước	My Phuoc Commune	my_phuoc	903	10
30850	Tân Hiệp	Tan Hiep	Thị trấn Tân Hiệp	Tan Hiep Township	tan_hiep	904	9
30853	Tân Hội	Tan Hoi	Xã Tân Hội	Tan Hoi Commune	tan_hoi	904	10
30856	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	904	10
30859	Tân Hiệp B	Tan Hiep B	Xã Tân Hiệp B	Tan Hiep B Commune	tan_hiep_b	904	10
30860	Tân Hoà	Tan Hoa	Xã Tân Hoà	Tan Hoa Commune	tan_hoa	904	10
30862	Thạnh Đông B	Thanh Dong B	Xã Thạnh Đông B	Thanh Dong B Commune	thanh_dong_b	904	10
30865	Thạnh Đông	Thanh Dong	Xã Thạnh Đông	Thanh Dong Commune	thanh_dong	904	10
30868	Tân Hiệp A	Tan Hiep A	Xã Tân Hiệp A	Tan Hiep A Commune	tan_hiep_a	904	10
30871	Tân An	Tan An	Xã Tân An	Tan An Commune	tan_an	904	10
30874	Thạnh Đông A	Thanh Dong A	Xã Thạnh Đông A	Thanh Dong A Commune	thanh_dong_a	904	10
30877	Thạnh Trị	Thanh Tri	Xã Thạnh Trị	Thanh Tri Commune	thanh_tri	904	10
30880	Minh Lương	Minh Luong	Thị trấn Minh Lương	Minh Luong Township	minh_luong	905	9
30883	Mong Thọ A	Mong Tho A	Xã Mong Thọ A	Mong Tho A Commune	mong_tho_a	905	10
30886	Mong Thọ B	Mong Tho B	Xã Mong Thọ B	Mong Tho B Commune	mong_tho_b	905	10
30887	Mong Thọ	Mong Tho	Xã Mong Thọ	Mong Tho Commune	mong_tho	905	10
30889	Giục Tượng	Giuc Tuong	Xã Giục Tượng	Giuc Tuong Commune	giuc_tuong	905	10
30892	Vĩnh Hòa Hiệp	Vinh Hoa Hiep	Xã Vĩnh Hòa Hiệp	Vinh Hoa Hiep Commune	vinh_hoa_hiep	905	10
30893	Vĩnh Hoà Phú	Vinh Hoa Phu	Xã Vĩnh Hoà Phú	Vinh Hoa Phu Commune	vinh_hoa_phu	905	10
30895	Minh Hòa	Minh Hoa	Xã Minh Hòa	Minh Hoa Commune	minh_hoa	905	10
30898	Bình An	Binh An	Xã Bình An	Binh An Commune	binh_an	905	10
30901	Thạnh Lộc	Thanh Loc	Xã Thạnh Lộc	Thanh Loc Commune	thanh_loc	905	10
30904	Giồng Riềng	Giong Rieng	Thị trấn Giồng Riềng	Giong Rieng Township	giong_rieng	906	9
30907	Thạnh Hưng	Thanh Hung	Xã Thạnh Hưng	Thanh Hung Commune	thanh_hung	906	10
30910	Thạnh Phước	Thanh Phuoc	Xã Thạnh Phước	Thanh Phuoc Commune	thanh_phuoc	906	10
30913	Thạnh Lộc	Thanh Loc	Xã Thạnh Lộc	Thanh Loc Commune	thanh_loc	906	10
30916	Thạnh Hòa	Thanh Hoa	Xã Thạnh Hòa	Thanh Hoa Commune	thanh_hoa	906	10
30917	Thạnh Bình	Thanh Binh	Xã Thạnh Bình	Thanh Binh Commune	thanh_binh	906	10
30919	Bàn Thạch	Ban Thach	Xã Bàn Thạch	Ban Thach Commune	ban_thach	906	10
30922	Bàn Tân Định	Ban Tan Dinh	Xã Bàn Tân Định	Ban Tan Dinh Commune	ban_tan_dinh	906	10
30925	Ngọc Thành	Ngoc Thanh	Xã Ngọc Thành	Ngoc Thanh Commune	ngoc_thanh	906	10
30928	Ngọc Chúc	Ngoc Chuc	Xã Ngọc Chúc	Ngoc Chuc Commune	ngoc_chuc	906	10
30931	Ngọc Thuận	Ngoc Thuan	Xã Ngọc Thuận	Ngoc Thuan Commune	ngoc_thuan	906	10
30934	Hòa Hưng	Hoa Hung	Xã Hòa Hưng	Hoa Hung Commune	hoa_hung	906	10
30937	Hoà Lợi	Hoa Loi	Xã Hoà Lợi	Hoa Loi Commune	hoa_loi	906	10
30940	Hoà An	Hoa An	Xã Hoà An	Hoa An Commune	hoa_an	906	10
30943	Long Thạnh	Long Thanh	Xã Long Thạnh	Long Thanh Commune	long_thanh	906	10
30946	Vĩnh Thạnh	Vinh Thanh	Xã Vĩnh Thạnh	Vinh Thanh Commune	vinh_thanh	906	10
30947	Vĩnh Phú	Vinh Phu	Xã Vĩnh Phú	Vinh Phu Commune	vinh_phu	906	10
30949	 Hòa Thuận	 Hoa Thuan	Xã  Hòa Thuận	 Hoa Thuan Commune	_hoa_thuan	906	10
30950	Ngọc Hoà	Ngoc Hoa	Xã Ngọc Hoà	Ngoc Hoa Commune	ngoc_hoa	906	10
30952	Gò Quao	Go Quao	Thị trấn Gò Quao	Go Quao Township	go_quao	907	9
30955	Vĩnh Hòa Hưng Bắc	Vinh Hoa Hung Bac	Xã Vĩnh Hòa Hưng Bắc	Vinh Hoa Hung Bac Commune	vinh_hoa_hung_bac	907	10
30958	Định Hòa	Dinh Hoa	Xã Định Hòa	Dinh Hoa Commune	dinh_hoa	907	10
30961	Thới Quản	Thoi Quan	Xã Thới Quản	Thoi Quan Commune	thoi_quan	907	10
30964	Định An	Dinh An	Xã Định An	Dinh An Commune	dinh_an	907	10
30967	Thủy Liễu	Thuy Lieu	Xã Thủy Liễu	Thuy Lieu Commune	thuy_lieu	907	10
30970	Vĩnh Hòa Hưng Nam	Vinh Hoa Hung Nam	Xã Vĩnh Hòa Hưng Nam	Vinh Hoa Hung Nam Commune	vinh_hoa_hung_nam	907	10
30973	Vĩnh Phước A	Vinh Phuoc A	Xã Vĩnh Phước A	Vinh Phuoc A Commune	vinh_phuoc_a	907	10
30976	Vĩnh Phước B	Vinh Phuoc B	Xã Vĩnh Phước B	Vinh Phuoc B Commune	vinh_phuoc_b	907	10
30979	Vĩnh Tuy	Vinh Tuy	Xã Vĩnh Tuy	Vinh Tuy Commune	vinh_tuy	907	10
30982	Vĩnh Thắng	Vinh Thang	Xã Vĩnh Thắng	Vinh Thang Commune	vinh_thang	907	10
30985	Thứ Ba	Thu Ba	Thị trấn Thứ Ba	Thu Ba Township	thu_ba	908	9
30988	Tây Yên	Tay Yen	Xã Tây Yên	Tay Yen Commune	tay_yen	908	10
30991	Tây Yên A	Tay Yen A	Xã Tây Yên A	Tay Yen A Commune	tay_yen_a	908	10
30994	Nam Yên	Nam Yen	Xã Nam Yên	Nam Yen Commune	nam_yen	908	10
30997	Hưng Yên	Hung Yen	Xã Hưng Yên	Hung Yen Commune	hung_yen	908	10
31000	Nam Thái	Nam Thai	Xã Nam Thái	Nam Thai Commune	nam_thai	908	10
31003	Nam Thái A	Nam Thai A	Xã Nam Thái A	Nam Thai A Commune	nam_thai_a	908	10
31006	Đông Thái	Dong Thai	Xã Đông Thái	Dong Thai Commune	dong_thai	908	10
31009	Đông Yên	Dong Yen	Xã Đông Yên	Dong Yen Commune	dong_yen	908	10
31018	Thứ Mười Một	Thu Muoi Mot	Thị trấn Thứ Mười Một	Thu Muoi Mot Township	thu_muoi_mot	909	9
31021	Thuận Hoà	Thuan Hoa	Xã Thuận Hoà	Thuan Hoa Commune	thuan_hoa	909	10
31024	Đông Hòa	Dong Hoa	Xã Đông Hòa	Dong Hoa Commune	dong_hoa	909	10
31030	Đông Thạnh	Dong Thanh	Xã Đông Thạnh	Dong Thanh Commune	dong_thanh	909	10
31031	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	909	10
31033	Đông Hưng	Dong Hung	Xã Đông Hưng	Dong Hung Commune	dong_hung	909	10
31036	Đông Hưng A	Dong Hung A	Xã Đông Hưng A	Dong Hung A Commune	dong_hung_a	909	10
31039	Đông Hưng B	Dong Hung B	Xã Đông Hưng B	Dong Hung B Commune	dong_hung_b	909	10
31042	Vân Khánh	Van Khanh	Xã Vân Khánh	Van Khanh Commune	van_khanh	909	10
31045	Vân Khánh Đông	Van Khanh Dong	Xã Vân Khánh Đông	Van Khanh Dong Commune	van_khanh_dong	909	10
31048	Vân Khánh Tây	Van Khanh Tay	Xã Vân Khánh Tây	Van Khanh Tay Commune	van_khanh_tay	909	10
31051	Vĩnh Thuận	Vinh Thuan	Thị trấn Vĩnh Thuận	Vinh Thuan Township	vinh_thuan	910	9
31060	Vĩnh Bình Bắc	Vinh Binh Bac	Xã Vĩnh Bình Bắc	Vinh Binh Bac Commune	vinh_binh_bac	910	10
31063	Vĩnh Bình Nam	Vinh Binh Nam	Xã Vĩnh Bình Nam	Vinh Binh Nam Commune	vinh_binh_nam	910	10
31064	Bình Minh	Binh Minh	Xã Bình Minh	Binh Minh Commune	binh_minh	910	10
31069	Vĩnh Thuận	Vinh Thuan	Xã Vĩnh Thuận	Vinh Thuan Commune	vinh_thuan	910	10
31072	Tân Thuận	Tan Thuan	Xã Tân Thuận	Tan Thuan Commune	tan_thuan	910	10
31074	Phong Đông	Phong Dong	Xã Phong Đông	Phong Dong Commune	phong_dong	910	10
31075	Vĩnh Phong	Vinh Phong	Xã Vĩnh Phong	Vinh Phong Commune	vinh_phong	910	10
31078	Dương Đông	Duong Dong	Phường Dương Đông	Duong Dong Ward	duong_dong	911	8
31081	An Thới	An Thoi	Phường An Thới	An Thoi Ward	an_thoi	911	8
31084	Cửa Cạn	Cua Can	Xã Cửa Cạn	Cua Can Commune	cua_can	911	10
31087	Gành Dầu	Ganh Dau	Xã Gành Dầu	Ganh Dau Commune	ganh_dau	911	10
31090	Cửa Dương	Cua Duong	Xã Cửa Dương	Cua Duong Commune	cua_duong	911	10
31093	Hàm Ninh	Ham Ninh	Xã Hàm Ninh	Ham Ninh Commune	ham_ninh	911	10
31096	Dương Tơ	Duong To	Xã Dương Tơ	Duong To Commune	duong_to	911	10
31102	Bãi Thơm	Bai Thom	Xã Bãi Thơm	Bai Thom Commune	bai_thom	911	10
31105	Thổ Châu	Tho Chau	Xã Thổ Châu	Tho Chau Commune	tho_chau	911	10
31108	Hòn Tre	Hon Tre	Xã Hòn Tre	Hon Tre Commune	hon_tre	912	10
31111	Lại Sơn	Lai Son	Xã Lại Sơn	Lai Son Commune	lai_son	912	10
31114	An Sơn	An Son	Xã An Sơn	An Son Commune	an_son	912	10
31115	Nam Du	Nam Du	Xã Nam Du	Nam Du Commune	nam_du	912	10
31012	Thạnh Yên	Thanh Yen	Xã Thạnh Yên	Thanh Yen Commune	thanh_yen	913	10
31015	Thạnh Yên A	Thanh Yen A	Xã Thạnh Yên A	Thanh Yen A Commune	thanh_yen_a	913	10
31027	An Minh Bắc	An Minh Bac	Xã An Minh Bắc	An Minh Bac Commune	an_minh_bac	913	10
31054	Vĩnh Hòa	Vinh Hoa	Xã Vĩnh Hòa	Vinh Hoa Commune	vinh_hoa	913	10
31057	Hoà Chánh	Hoa Chanh	Xã Hoà Chánh	Hoa Chanh Commune	hoa_chanh	913	10
31066	Minh Thuận	Minh Thuan	Xã Minh Thuận	Minh Thuan Commune	minh_thuan	913	10
30791	Vĩnh Phú	Vinh Phu	Xã Vĩnh Phú	Vinh Phu Commune	vinh_phu	914	10
30793	Vĩnh Điều	Vinh Dieu	Xã Vĩnh Điều	Vinh Dieu Commune	vinh_dieu	914	10
30796	Tân Khánh Hòa	Tan Khanh Hoa	Xã Tân Khánh Hòa	Tan Khanh Hoa Commune	tan_khanh_hoa	914	10
30797	Phú Lợi	Phu Loi	Xã Phú Lợi	Phu Loi Commune	phu_loi	914	10
30799	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	914	10
31117	Cái Khế	Cai Khe	Phường Cái Khế	Cai Khe Ward	cai_khe	916	8
31120	An Hòa	An Hoa	Phường An Hòa	An Hoa Ward	an_hoa	916	8
31123	Thới Bình	Thoi Binh	Phường Thới Bình	Thoi Binh Ward	thoi_binh	916	8
31126	An Nghiệp	An Nghiep	Phường An Nghiệp	An Nghiep Ward	an_nghiep	916	8
31129	An Cư	An Cu	Phường An Cư	An Cu Ward	an_cu	916	8
31135	Tân An	Tan An	Phường Tân An	Tan An Ward	tan_an	916	8
31141	An Phú	An Phu	Phường An Phú	An Phu Ward	an_phu	916	8
31144	Xuân Khánh	Xuan Khanh	Phường Xuân Khánh	Xuan Khanh Ward	xuan_khanh	916	8
31147	Hưng Lợi	Hung Loi	Phường Hưng Lợi	Hung Loi Ward	hung_loi	916	8
31149	An Khánh	An Khanh	Phường An Khánh	An Khanh Ward	an_khanh	916	8
31150	An Bình	An Binh	Phường An Bình	An Binh Ward	an_binh	916	8
31153	Châu Văn Liêm	Chau Van Liem	Phường Châu Văn Liêm	Chau Van Liem Ward	chau_van_liem	917	8
31154	Thới Hòa	Thoi Hoa	Phường Thới Hòa	Thoi Hoa Ward	thoi_hoa	917	8
31156	Thới Long	Thoi Long	Phường Thới Long	Thoi Long Ward	thoi_long	917	8
31157	Long Hưng	Long Hung	Phường Long Hưng	Long Hung Ward	long_hung	917	8
31159	Thới An	Thoi An	Phường Thới An	Thoi An Ward	thoi_an	917	8
31162	Phước Thới	Phuoc Thoi	Phường Phước Thới	Phuoc Thoi Ward	phuoc_thoi	917	8
31165	Trường Lạc	Truong Lac	Phường Trường Lạc	Truong Lac Ward	truong_lac	917	8
31168	Bình Thủy	Binh Thuy	Phường Bình Thủy	Binh Thuy Ward	binh_thuy	918	8
31169	Trà An	Tra An	Phường Trà An	Tra An Ward	tra_an	918	8
31171	Trà Nóc	Tra Noc	Phường Trà Nóc	Tra Noc Ward	tra_noc	918	8
31174	Thới An Đông	Thoi An Dong	Phường Thới An Đông	Thoi An Dong Ward	thoi_an_dong	918	8
31177	An Thới	An Thoi	Phường An Thới	An Thoi Ward	an_thoi	918	8
31178	Bùi Hữu Nghĩa	Bui Huu Nghia	Phường Bùi Hữu Nghĩa	Bui Huu Nghia Ward	bui_huu_nghia	918	8
31180	Long Hòa	Long Hoa	Phường Long Hòa	Long Hoa Ward	long_hoa	918	8
31183	Long Tuyền	Long Tuyen	Phường Long Tuyền	Long Tuyen Ward	long_tuyen	918	8
31186	Lê Bình	Le Binh	Phường Lê Bình	Le Binh Ward	le_binh	919	8
31189	Hưng Phú	Hung Phu	Phường Hưng Phú	Hung Phu Ward	hung_phu	919	8
31192	Hưng Thạnh	Hung Thanh	Phường Hưng Thạnh	Hung Thanh Ward	hung_thanh	919	8
31195	Ba Láng	Ba Lang	Phường Ba Láng	Ba Lang Ward	ba_lang	919	8
31198	Thường Thạnh	Thuong Thanh	Phường Thường Thạnh	Thuong Thanh Ward	thuong_thanh	919	8
31201	Phú Thứ	Phu Thu	Phường Phú Thứ	Phu Thu Ward	phu_thu	919	8
31204	Tân Phú	Tan Phu	Phường Tân Phú	Tan Phu Ward	tan_phu	919	8
31207	Thốt Nốt	Thot Not	Phường Thốt Nốt	Thot Not Ward	thot_not	923	8
31210	Thới Thuận	Thoi Thuan	Phường Thới Thuận	Thoi Thuan Ward	thoi_thuan	923	8
31212	Thuận An	Thuan An	Phường Thuận An	Thuan An Ward	thuan_an	923	8
31213	Tân Lộc	Tan Loc	Phường Tân Lộc	Tan Loc Ward	tan_loc	923	8
31216	Trung Nhứt	Trung Nhut	Phường Trung Nhứt	Trung Nhut Ward	trung_nhut	923	8
31217	Thạnh Hoà	Thanh Hoa	Phường Thạnh Hoà	Thanh Hoa Ward	thanh_hoa	923	8
31219	Trung Kiên	Trung Kien	Phường Trung Kiên	Trung Kien Ward	trung_kien	923	8
31227	Tân Hưng	Tan Hung	Phường Tân Hưng	Tan Hung Ward	tan_hung	923	8
31228	Thuận Hưng	Thuan Hung	Phường Thuận Hưng	Thuan Hung Ward	thuan_hung	923	8
31211	Vĩnh Bình	Vinh Binh	Xã Vĩnh Bình	Vinh Binh Commune	vinh_binh	924	10
31231	Thanh An	Thanh An	Thị trấn Thanh An	Thanh An Township	thanh_an	924	9
31232	Vĩnh Thạnh	Vinh Thanh	Thị trấn Vĩnh Thạnh	Vinh Thanh Township	vinh_thanh	924	9
31234	Thạnh Mỹ	Thanh My	Xã Thạnh Mỹ	Thanh My Commune	thanh_my	924	10
31237	Vĩnh Trinh	Vinh Trinh	Xã Vĩnh Trinh	Vinh Trinh Commune	vinh_trinh	924	10
31240	Thạnh An	Thanh An	Xã Thạnh An	Thanh An Commune	thanh_an	924	10
31241	Thạnh Tiến	Thanh Tien	Xã Thạnh Tiến	Thanh Tien Commune	thanh_tien	924	10
31243	Thạnh Thắng	Thanh Thang	Xã Thạnh Thắng	Thanh Thang Commune	thanh_thang	924	10
31244	Thạnh Lợi	Thanh Loi	Xã Thạnh Lợi	Thanh Loi Commune	thanh_loi	924	10
31246	Thạnh Qưới	Thanh Quoi	Xã Thạnh Qưới	Thanh Quoi Commune	thanh_quoi	924	10
31252	Thạnh Lộc	Thanh Loc	Xã Thạnh Lộc	Thanh Loc Commune	thanh_loc	924	10
31222	Trung An	Trung An	Xã Trung An	Trung An Commune	trung_an	925	10
31225	Trung Thạnh	Trung Thanh	Xã Trung Thạnh	Trung Thanh Commune	trung_thanh	925	10
31249	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	925	10
31255	Trung Hưng	Trung Hung	Xã Trung Hưng	Trung Hung Commune	trung_hung	925	10
31261	Cờ Đỏ	Co Do	Thị trấn Cờ Đỏ	Co Do Township	co_do	925	9
31264	Thới Hưng	Thoi Hung	Xã Thới Hưng	Thoi Hung Commune	thoi_hung	925	10
31273	Đông Hiệp	Dong Hiep	Xã Đông Hiệp	Dong Hiep Commune	dong_hiep	925	10
31274	Đông Thắng	Dong Thang	Xã Đông Thắng	Dong Thang Commune	dong_thang	925	10
31276	Thới Đông	Thoi Dong	Xã Thới Đông	Thoi Dong Commune	thoi_dong	925	10
31277	Thới Xuân	Thoi Xuan	Xã Thới Xuân	Thoi Xuan Commune	thoi_xuan	925	10
31299	Phong Điền	Phong Dien	Thị trấn Phong Điền	Phong Dien Township	phong_dien	926	9
31300	Nhơn Ái	Nhon Ai	Xã Nhơn Ái	Nhon Ai Commune	nhon_ai	926	10
31303	Giai Xuân	Giai Xuan	Xã Giai Xuân	Giai Xuan Commune	giai_xuan	926	10
31306	Tân Thới	Tan Thoi	Xã Tân Thới	Tan Thoi Commune	tan_thoi	926	10
31309	Trường Long	Truong Long	Xã Trường Long	Truong Long Commune	truong_long	926	10
31312	Mỹ Khánh	My Khanh	Xã Mỹ Khánh	My Khanh Commune	my_khanh	926	10
31315	Nhơn Nghĩa	Nhon Nghia	Xã Nhơn Nghĩa	Nhon Nghia Commune	nhon_nghia	926	10
31258	Thới Lai	Thoi Lai	Thị trấn Thới Lai	Thoi Lai Township	thoi_lai	927	9
31267	Thới Thạnh	Thoi Thanh	Xã Thới Thạnh	Thoi Thanh Commune	thoi_thanh	927	10
31268	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	927	10
31270	Xuân Thắng	Xuan Thang	Xã Xuân Thắng	Xuan Thang Commune	xuan_thang	927	10
31279	Đông Bình	Dong Binh	Xã Đông Bình	Dong Binh Commune	dong_binh	927	10
31282	Đông Thuận	Dong Thuan	Xã Đông Thuận	Dong Thuan Commune	dong_thuan	927	10
31285	Thới Tân	Thoi Tan	Xã Thới Tân	Thoi Tan Commune	thoi_tan	927	10
31286	Trường Thắng	Truong Thang	Xã Trường Thắng	Truong Thang Commune	truong_thang	927	10
31288	Định Môn	Dinh Mon	Xã Định Môn	Dinh Mon Commune	dinh_mon	927	10
31291	Trường Thành	Truong Thanh	Xã Trường Thành	Truong Thanh Commune	truong_thanh	927	10
31294	Trường Xuân	Truong Xuan	Xã Trường Xuân	Truong Xuan Commune	truong_xuan	927	10
31297	Trường Xuân A	Truong Xuan A	Xã Trường Xuân A	Truong Xuan A Commune	truong_xuan_a	927	10
31298	Trường Xuân B	Truong Xuan B	Xã Trường Xuân B	Truong Xuan B Commune	truong_xuan_b	927	10
31318	I	I	Phường I	I Ward	i	930	8
31321	III	III	Phường III	III Ward	iii	930	8
31324	IV	IV	Phường IV	IV Ward	iv	930	8
31327	V	V	Phường V	V Ward	v	930	8
31330	VII	VII	Phường VII	VII Ward	vii	930	8
31333	Vị Tân	Vi Tan	Xã Vị Tân	Vi Tan Commune	vi_tan	930	10
31336	Hoả Lựu	Hoa Luu	Xã Hoả Lựu	Hoa Luu Commune	hoa_luu	930	10
31338	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	930	10
31339	Hoả Tiến	Hoa Tien	Xã Hoả Tiến	Hoa Tien Commune	hoa_tien	930	10
31340	Ngã Bảy	Nga Bay	Phường Ngã Bảy	Nga Bay Ward	nga_bay	931	8
31341	Lái Hiếu	Lai Hieu	Phường Lái Hiếu	Lai Hieu Ward	lai_hieu	931	8
31343	Hiệp Thành	Hiep Thanh	Phường Hiệp Thành	Hiep Thanh Ward	hiep_thanh	931	8
31344	Hiệp Lợi	Hiep Loi	Phường Hiệp Lợi	Hiep Loi Ward	hiep_loi	931	8
31411	Đại Thành	Dai Thanh	Xã Đại Thành	Dai Thanh Commune	dai_thanh	931	10
31414	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	931	10
31342	Một Ngàn	Mot Ngan	Thị trấn Một Ngàn	Mot Ngan Township	mot_ngan	932	9
31345	Tân Hoà	Tan Hoa	Xã Tân Hoà	Tan Hoa Commune	tan_hoa	932	10
31346	Bảy Ngàn	Bay Ngan	Thị trấn Bảy Ngàn	Bay Ngan Township	bay_ngan	932	9
31348	Trường Long Tây	Truong Long Tay	Xã Trường Long Tây	Truong Long Tay Commune	truong_long_tay	932	10
31351	Trường Long A	Truong Long A	Xã Trường Long A	Truong Long A Commune	truong_long_a	932	10
31357	Nhơn Nghĩa A	Nhon Nghia A	Xã Nhơn Nghĩa A	Nhon Nghia A Commune	nhon_nghia_a	932	10
31359	Rạch Gòi	Rach Goi	Thị trấn Rạch Gòi	Rach Goi Township	rach_goi	932	9
31360	Thạnh Xuân	Thanh Xuan	Xã Thạnh Xuân	Thanh Xuan Commune	thanh_xuan	932	10
31362	Cái Tắc	Cai Tac	Thị trấn Cái Tắc	Cai Tac Township	cai_tac	932	9
31363	Tân Phú Thạnh	Tan Phu Thanh	Xã Tân Phú Thạnh	Tan Phu Thanh Commune	tan_phu_thanh	932	10
31366	Ngã Sáu	Nga Sau	Thị trấn Ngã Sáu	Nga Sau Township	nga_sau	933	9
31369	Đông Thạnh	Dong Thanh	Xã Đông Thạnh	Dong Thanh Commune	dong_thanh	933	10
31375	Đông Phú	Dong Phu	Xã Đông Phú	Dong Phu Commune	dong_phu	933	10
31378	Phú Hữu	Phu Huu	Xã Phú Hữu	Phu Huu Commune	phu_huu	933	10
31379	Phú Tân	Phu Tan	Xã Phú Tân	Phu Tan Commune	phu_tan	933	10
31381	Mái Dầm	Mai Dam	Thị trấn Mái Dầm	Mai Dam Township	mai_dam	933	9
31384	Đông Phước	Dong Phuoc	Xã Đông Phước	Dong Phuoc Commune	dong_phuoc	933	10
31387	Đông Phước A	Dong Phuoc A	Xã Đông Phước A	Dong Phuoc A Commune	dong_phuoc_a	933	10
31393	Kinh Cùng	Kinh Cung	Thị trấn Kinh Cùng	Kinh Cung Township	kinh_cung	934	9
31396	Cây Dương	Cay Duong	Thị trấn Cây Dương	Cay Duong Township	cay_duong	934	9
31399	Tân Bình	Tan Binh	Xã Tân Bình	Tan Binh Commune	tan_binh	934	10
31402	Bình Thành	Binh Thanh	Xã Bình Thành	Binh Thanh Commune	binh_thanh	934	10
31405	Thạnh Hòa	Thanh Hoa	Xã Thạnh Hòa	Thanh Hoa Commune	thanh_hoa	934	10
31408	Long Thạnh	Long Thanh	Xã Long Thạnh	Long Thanh Commune	long_thanh	934	10
31417	Phụng Hiệp	Phung Hiep	Xã Phụng Hiệp	Phung Hiep Commune	phung_hiep	934	10
31420	Hòa Mỹ	Hoa My	Xã Hòa Mỹ	Hoa My Commune	hoa_my	934	10
31423	Hòa An	Hoa An	Xã Hòa An	Hoa An Commune	hoa_an	934	10
31426	Phương Bình	Phuong Binh	Xã Phương Bình	Phuong Binh Commune	phuong_binh	934	10
31429	Hiệp Hưng	Hiep Hung	Xã Hiệp Hưng	Hiep Hung Commune	hiep_hung	934	10
31432	Tân Phước Hưng	Tan Phuoc Hung	Xã Tân Phước Hưng	Tan Phuoc Hung Commune	tan_phuoc_hung	934	10
31433	Búng Tàu	Bung Tau	Thị trấn Búng Tàu	Bung Tau Township	bung_tau	934	9
31435	Phương Phú	Phuong Phu	Xã Phương Phú	Phuong Phu Commune	phuong_phu	934	10
31438	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	934	10
31441	Nàng Mau	Nang Mau	Thị trấn Nàng Mau	Nang Mau Township	nang_mau	935	9
31444	Vị Trung	Vi Trung	Xã Vị Trung	Vi Trung Commune	vi_trung	935	10
31447	Vị Thuỷ	Vi Thuy	Xã Vị Thuỷ	Vi Thuy Commune	vi_thuy	935	10
31450	Vị Thắng	Vi Thang	Xã Vị Thắng	Vi Thang Commune	vi_thang	935	10
31453	Vĩnh Thuận Tây	Vinh Thuan Tay	Xã Vĩnh Thuận Tây	Vinh Thuan Tay Commune	vinh_thuan_tay	935	10
31456	Vĩnh Trung	Vinh Trung	Xã Vĩnh Trung	Vinh Trung Commune	vinh_trung	935	10
31459	Vĩnh Tường	Vinh Tuong	Xã Vĩnh Tường	Vinh Tuong Commune	vinh_tuong	935	10
31462	Vị Đông	Vi Dong	Xã Vị Đông	Vi Dong Commune	vi_dong	935	10
31465	Vị Thanh	Vi Thanh	Xã Vị Thanh	Vi Thanh Commune	vi_thanh	935	10
31468	Vị Bình	Vi Binh	Xã Vị Bình	Vi Binh Commune	vi_binh	935	10
31483	Thuận Hưng	Thuan Hung	Xã Thuận Hưng	Thuan Hung Commune	thuan_hung	936	10
31484	Thuận Hòa	Thuan Hoa	Xã Thuận Hòa	Thuan Hoa Commune	thuan_hoa	936	10
31486	Vĩnh Thuận Đông	Vinh Thuan Dong	Xã Vĩnh Thuận Đông	Vinh Thuan Dong Commune	vinh_thuan_dong	936	10
31489	Vĩnh Viễn	Vinh Vien	Thị trấn Vĩnh Viễn	Vinh Vien Township	vinh_vien	936	9
31490	Vĩnh Viễn A	Vinh Vien A	Xã Vĩnh Viễn A	Vinh Vien A Commune	vinh_vien_a	936	10
31492	Lương Tâm	Luong Tam	Xã Lương Tâm	Luong Tam Commune	luong_tam	936	10
31493	Lương Nghĩa	Luong Nghia	Xã Lương Nghĩa	Luong Nghia Commune	luong_nghia	936	10
31495	Xà Phiên	Xa Phien	Xã Xà Phiên	Xa Phien Commune	xa_phien	936	10
31471	Thuận An	Thuan An	Phường Thuận An	Thuan An Ward	thuan_an	937	8
31472	Trà Lồng	Tra Long	Phường Trà Lồng	Tra Long Ward	tra_long	937	8
31473	Bình Thạnh	Binh Thanh	Phường Bình Thạnh	Binh Thanh Ward	binh_thanh	937	8
31474	Long Bình	Long Binh	Xã Long Bình	Long Binh Commune	long_binh	937	10
31475	Vĩnh Tường	Vinh Tuong	Phường Vĩnh Tường	Vinh Tuong Ward	vinh_tuong	937	8
31477	Long Trị	Long Tri	Xã Long Trị	Long Tri Commune	long_tri	937	10
31478	Long Trị A	Long Tri A	Xã Long Trị A	Long Tri A Commune	long_tri_a	937	10
31480	Long Phú	Long Phu	Xã Long Phú	Long Phu Commune	long_phu	937	10
31481	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	937	10
31498	5	5	Phường 5	5 Ward	5	941	8
31501	7	7	Phường 7	7 Ward	7	941	8
31504	8	8	Phường 8	8 Ward	8	941	8
31507	6	6	Phường 6	6 Ward	6	941	8
31510	2	2	Phường 2	2 Ward	2	941	8
31513	1	1	Phường 1	1 Ward	1	941	8
31516	4	4	Phường 4	4 Ward	4	941	8
31519	3	3	Phường 3	3 Ward	3	941	8
31522	9	9	Phường 9	9 Ward	9	941	8
31525	10	10	Phường 10	10 Ward	10	941	8
31569	Châu Thành	Chau Thanh	Thị trấn Châu Thành	Chau Thanh Township	chau_thanh	942	9
31570	Hồ Đắc Kiện	Ho Dac Kien	Xã Hồ Đắc Kiện	Ho Dac Kien Commune	ho_dac_kien	942	10
31573	Phú Tâm	Phu Tam	Xã Phú Tâm	Phu Tam Commune	phu_tam	942	10
31576	Thuận Hòa	Thuan Hoa	Xã Thuận Hòa	Thuan Hoa Commune	thuan_hoa	942	10
31582	Phú Tân	Phu Tan	Xã Phú Tân	Phu Tan Commune	phu_tan	942	10
31585	Thiện Mỹ	Thien My	Xã Thiện Mỹ	Thien My Commune	thien_my	942	10
31594	An Hiệp	An Hiep	Xã An Hiệp	An Hiep Commune	an_hiep	942	10
31600	An Ninh	An Ninh	Xã An Ninh	An Ninh Commune	an_ninh	942	10
31528	Kế Sách	Ke Sach	Thị trấn Kế Sách	Ke Sach Township	ke_sach	943	9
31531	An Lạc Thôn	An Lac Thon	Thị trấn An Lạc Thôn	An Lac Thon Township	an_lac_thon	943	9
31534	Xuân Hòa	Xuan Hoa	Xã Xuân Hòa	Xuan Hoa Commune	xuan_hoa	943	10
31537	Phong Nẫm	Phong Nam	Xã Phong Nẫm	Phong Nam Commune	phong_nam	943	10
31540	An Lạc Tây	An Lac Tay	Xã An Lạc Tây	An Lac Tay Commune	an_lac_tay	943	10
31543	Trinh Phú	Trinh Phu	Xã Trinh Phú	Trinh Phu Commune	trinh_phu	943	10
31546	Ba Trinh	Ba Trinh	Xã Ba Trinh	Ba Trinh Commune	ba_trinh	943	10
31549	Thới An Hội	Thoi An Hoi	Xã Thới An Hội	Thoi An Hoi Commune	thoi_an_hoi	943	10
31552	Nhơn Mỹ	Nhon My	Xã Nhơn Mỹ	Nhon My Commune	nhon_my	943	10
31555	Kế Thành	Ke Thanh	Xã Kế Thành	Ke Thanh Commune	ke_thanh	943	10
31558	Kế An	Ke An	Xã Kế An	Ke An Commune	ke_an	943	10
31561	Đại Hải	Dai Hai	Xã Đại Hải	Dai Hai Commune	dai_hai	943	10
31567	Huỳnh Hữu Nghĩa	Huynh Huu Nghia	Thị trấn Huỳnh Hữu Nghĩa	Huynh Huu Nghia Township	huynh_huu_nghia	944	9
31579	Long Hưng	Long Hung	Xã Long Hưng	Long Hung Commune	long_hung	944	10
31588	Hưng Phú	Hung Phu	Xã Hưng Phú	Hung Phu Commune	hung_phu	944	10
31591	Mỹ Hương	My Huong	Xã Mỹ Hương	My Huong Commune	my_huong	944	10
31597	Mỹ Tú	My Tu	Xã Mỹ Tú	My Tu Commune	my_tu	944	10
31603	Mỹ Phước	My Phuoc	Xã Mỹ Phước	My Phuoc Commune	my_phuoc	944	10
31606	Thuận Hưng	Thuan Hung	Xã Thuận Hưng	Thuan Hung Commune	thuan_hung	944	10
31609	Mỹ Thuận	My Thuan	Xã Mỹ Thuận	My Thuan Commune	my_thuan	944	10
31612	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	944	10
31615	Cù Lao Dung	Cu Lao Dung	Thị trấn Cù Lao Dung	Cu Lao Dung Township	cu_lao_dung	945	9
31618	An Thạnh 1	An Thanh 1	Xã An Thạnh 1	An Thanh 1 Commune	an_thanh_1	945	10
31621	An Thạnh Tây	An Thanh Tay	Xã An Thạnh Tây	An Thanh Tay Commune	an_thanh_tay	945	10
31624	An Thạnh Đông	An Thanh Dong	Xã An Thạnh Đông	An Thanh Dong Commune	an_thanh_dong	945	10
31627	Đại Ân 1	Dai An 1	Xã Đại Ân 1	Dai An 1 Commune	dai_an_1	945	10
31630	An Thạnh 2	An Thanh 2	Xã An Thạnh 2	An Thanh 2 Commune	an_thanh_2	945	10
31633	An Thạnh 3	An Thanh 3	Xã An Thạnh 3	An Thanh 3 Commune	an_thanh_3	945	10
31636	An Thạnh Nam	An Thanh Nam	Xã An Thạnh Nam	An Thanh Nam Commune	an_thanh_nam	945	10
31639	Long Phú	Long Phu	Thị trấn Long Phú	Long Phu Township	long_phu	946	9
31642	Song Phụng	Song Phung	Xã Song Phụng	Song Phung Commune	song_phung	946	10
31645	Đại Ngãi	Dai Ngai	Thị trấn Đại Ngãi	Dai Ngai Township	dai_ngai	946	9
31648	Hậu Thạnh	Hau Thanh	Xã Hậu Thạnh	Hau Thanh Commune	hau_thanh	946	10
31651	Long Đức	Long Duc	Xã Long Đức	Long Duc Commune	long_duc	946	10
31654	Trường Khánh	Truong Khanh	Xã Trường Khánh	Truong Khanh Commune	truong_khanh	946	10
31657	Phú Hữu	Phu Huu	Xã Phú Hữu	Phu Huu Commune	phu_huu	946	10
31660	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	946	10
31663	Châu Khánh	Chau Khanh	Xã Châu Khánh	Chau Khanh Commune	chau_khanh	946	10
31666	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	946	10
31669	Long Phú	Long Phu	Xã Long Phú	Long Phu Commune	long_phu	946	10
31684	Mỹ Xuyên	My Xuyen	Thị trấn Mỹ Xuyên	My Xuyen Township	my_xuyen	947	9
31690	Đại Tâm	Dai Tam	Xã Đại Tâm	Dai Tam Commune	dai_tam	947	10
31693	Tham Đôn	Tham Don	Xã Tham Đôn	Tham Don Commune	tham_don	947	10
31708	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	947	10
31711	Ngọc Đông	Ngoc Dong	Xã Ngọc Đông	Ngoc Dong Commune	ngoc_dong	947	10
31714	Thạnh Quới	Thanh Quoi	Xã Thạnh Quới	Thanh Quoi Commune	thanh_quoi	947	10
31717	Hòa Tú 1	Hoa Tu 1	Xã Hòa Tú 1	Hoa Tu 1 Commune	hoa_tu_1	947	10
31720	Gia Hòa 1	Gia Hoa 1	Xã Gia Hòa 1	Gia Hoa 1 Commune	gia_hoa_1	947	10
31723	Ngọc Tố	Ngoc To	Xã Ngọc Tố	Ngoc To Commune	ngoc_to	947	10
31726	Gia Hòa 2	Gia Hoa 2	Xã Gia Hòa 2	Gia Hoa 2 Commune	gia_hoa_2	947	10
31729	Hòa Tú II	Hoa Tu II	Xã Hòa Tú II	Hoa Tu II Commune	hoa_tu_ii	947	10
31732	1	1	Phường 1	1 Ward	1	948	8
31735	2	2	Phường 2	2 Ward	2	948	8
31738	Vĩnh Quới	Vinh Quoi	Xã Vĩnh Quới	Vinh Quoi Commune	vinh_quoi	948	10
31741	Tân Long	Tan Long	Xã Tân Long	Tan Long Commune	tan_long	948	10
31744	Long Bình	Long Binh	Xã Long Bình	Long Binh Commune	long_binh	948	10
31747	3	3	Phường 3	3 Ward	3	948	8
31750	Mỹ Bình	My Binh	Xã Mỹ Bình	My Binh Commune	my_binh	948	10
31753	Mỹ Quới	My Quoi	Xã Mỹ Quới	My Quoi Commune	my_quoi	948	10
31756	Phú Lộc	Phu Loc	Thị trấn Phú Lộc	Phu Loc Township	phu_loc	949	9
31757	Hưng Lợi	Hung Loi	Thị trấn Hưng Lợi	Hung Loi Township	hung_loi	949	9
31759	Lâm Tân	Lam Tan	Xã Lâm Tân	Lam Tan Commune	lam_tan	949	10
31762	Thạnh Tân	Thanh Tan	Xã Thạnh Tân	Thanh Tan Commune	thanh_tan	949	10
31765	Lâm Kiết	Lam Kiet	Xã Lâm Kiết	Lam Kiet Commune	lam_kiet	949	10
31768	Tuân Tức	Tuan Tuc	Xã Tuân Tức	Tuan Tuc Commune	tuan_tuc	949	10
31771	Vĩnh Thành	Vinh Thanh	Xã Vĩnh Thành	Vinh Thanh Commune	vinh_thanh	949	10
31774	Thạnh Trị	Thanh Tri	Xã Thạnh Trị	Thanh Tri Commune	thanh_tri	949	10
31777	Vĩnh Lợi	Vinh Loi	Xã Vĩnh Lợi	Vinh Loi Commune	vinh_loi	949	10
31780	Châu Hưng	Chau Hung	Xã Châu Hưng	Chau Hung Commune	chau_hung	949	10
31783	1	1	Phường 1	1 Ward	1	950	8
31786	Hòa Đông	Hoa Dong	Xã Hòa Đông	Hoa Dong Commune	hoa_dong	950	10
31789	Khánh Hòa	Khanh Hoa	Phường Khánh Hòa	Khanh Hoa Ward	khanh_hoa	950	8
31792	Vĩnh Hiệp	Vinh Hiep	Xã Vĩnh Hiệp	Vinh Hiep Commune	vinh_hiep	950	10
31795	Vĩnh Hải	Vinh Hai	Xã Vĩnh Hải	Vinh Hai Commune	vinh_hai	950	10
31798	Lạc Hòa	Lac Hoa	Xã Lạc Hòa	Lac Hoa Commune	lac_hoa	950	10
31801	2	2	Phường 2	2 Ward	2	950	8
31804	Vĩnh Phước	Vinh Phuoc	Phường Vĩnh Phước	Vinh Phuoc Ward	vinh_phuoc	950	8
31807	Vĩnh Tân	Vinh Tan	Xã Vĩnh Tân	Vinh Tan Commune	vinh_tan	950	10
31810	Lai Hòa	Lai Hoa	Xã Lai Hòa	Lai Hoa Commune	lai_hoa	950	10
31672	Đại Ân  2	Dai An  2	Xã Đại Ân  2	Dai An  2 Commune	dai_an__2	951	10
31673	Trần Đề	Tran De	Thị trấn Trần Đề	Tran De Township	tran_de	951	9
31675	Liêu Tú	Lieu Tu	Xã Liêu Tú	Lieu Tu Commune	lieu_tu	951	10
31678	Lịch Hội Thượng	Lich Hoi Thuong	Xã Lịch Hội Thượng	Lich Hoi Thuong Commune	lich_hoi_thuong	951	10
31679	Lịch Hội Thượng	Lich Hoi Thuong	Thị trấn Lịch Hội Thượng	Lich Hoi Thuong Township	lich_hoi_thuong	951	9
31681	Trung Bình	Trung Binh	Xã Trung Bình	Trung Binh Commune	trung_binh	951	10
31687	Tài Văn	Tai Van	Xã Tài Văn	Tai Van Commune	tai_van	951	10
31696	Viên An	Vien An	Xã Viên An	Vien An Commune	vien_an	951	10
31699	Thạnh Thới An	Thanh Thoi An	Xã Thạnh Thới An	Thanh Thoi An Commune	thanh_thoi_an	951	10
31702	Thạnh Thới Thuận	Thanh Thoi Thuan	Xã Thạnh Thới Thuận	Thanh Thoi Thuan Commune	thanh_thoi_thuan	951	10
31705	Viên Bình	Vien Binh	Xã Viên Bình	Vien Binh Commune	vien_binh	951	10
31813	2	2	Phường 2	2 Ward	2	954	8
31816	3	3	Phường 3	3 Ward	3	954	8
31819	5	5	Phường 5	5 Ward	5	954	8
31822	7	7	Phường 7	7 Ward	7	954	8
31825	1	1	Phường 1	1 Ward	1	954	8
31828	8	8	Phường 8	8 Ward	8	954	8
31831	Nhà Mát	Nha Mat	Phường Nhà Mát	Nha Mat Ward	nha_mat	954	8
31834	Vĩnh Trạch	Vinh Trach	Xã Vĩnh Trạch	Vinh Trach Commune	vinh_trach	954	10
31837	Vĩnh Trạch Đông	Vinh Trach Dong	Xã Vĩnh Trạch Đông	Vinh Trach Dong Commune	vinh_trach_dong	954	10
31840	Hiệp Thành	Hiep Thanh	Xã Hiệp Thành	Hiep Thanh Commune	hiep_thanh	954	10
31843	Ngan Dừa	Ngan Dua	Thị trấn Ngan Dừa	Ngan Dua Township	ngan_dua	956	9
31846	Ninh Quới	Ninh Quoi	Xã Ninh Quới	Ninh Quoi Commune	ninh_quoi	956	10
31849	Ninh Quới A	Ninh Quoi A	Xã Ninh Quới A	Ninh Quoi A Commune	ninh_quoi_a	956	10
31852	Ninh Hòa	Ninh Hoa	Xã Ninh Hòa	Ninh Hoa Commune	ninh_hoa	956	10
31855	Lộc Ninh	Loc Ninh	Xã Lộc Ninh	Loc Ninh Commune	loc_ninh	956	10
31858	Vĩnh Lộc	Vinh Loc	Xã Vĩnh Lộc	Vinh Loc Commune	vinh_loc	956	10
31861	Vĩnh Lộc A	Vinh Loc A	Xã Vĩnh Lộc A	Vinh Loc A Commune	vinh_loc_a	956	10
31863	Ninh Thạnh Lợi A	Ninh Thanh Loi A	Xã Ninh Thạnh Lợi A	Ninh Thanh Loi A Commune	ninh_thanh_loi_a	956	10
31864	Ninh Thạnh Lợi	Ninh Thanh Loi	Xã Ninh Thạnh Lợi	Ninh Thanh Loi Commune	ninh_thanh_loi	956	10
31867	Phước Long	Phuoc Long	Thị trấn Phước Long	Phuoc Long Township	phuoc_long	957	9
31870	Vĩnh Phú Đông	Vinh Phu Dong	Xã Vĩnh Phú Đông	Vinh Phu Dong Commune	vinh_phu_dong	957	10
31873	Vĩnh Phú Tây	Vinh Phu Tay	Xã Vĩnh Phú Tây	Vinh Phu Tay Commune	vinh_phu_tay	957	10
31876	Phước Long	Phuoc Long	Xã Phước Long	Phuoc Long Commune	phuoc_long	957	10
31879	Hưng Phú	Hung Phu	Xã Hưng Phú	Hung Phu Commune	hung_phu	957	10
31882	Vĩnh Thanh	Vinh Thanh	Xã Vĩnh Thanh	Vinh Thanh Commune	vinh_thanh	957	10
31885	Phong Thạnh Tây A	Phong Thanh Tay A	Xã Phong Thạnh Tây A	Phong Thanh Tay A Commune	phong_thanh_tay_a	957	10
31888	Phong Thạnh Tây B	Phong Thanh Tay B	Xã Phong Thạnh Tây B	Phong Thanh Tay B Commune	phong_thanh_tay_b	957	10
31894	Vĩnh Hưng	Vinh Hung	Xã Vĩnh Hưng	Vinh Hung Commune	vinh_hung	958	10
31897	Vĩnh Hưng A	Vinh Hung A	Xã Vĩnh Hưng A	Vinh Hung A Commune	vinh_hung_a	958	10
31900	Châu Hưng	Chau Hung	Thị trấn Châu Hưng	Chau Hung Township	chau_hung	958	9
31903	Châu Hưng A	Chau Hung A	Xã Châu Hưng A	Chau Hung A Commune	chau_hung_a	958	10
31906	Hưng Thành	Hung Thanh	Xã Hưng Thành	Hung Thanh Commune	hung_thanh	958	10
31909	Hưng Hội	Hung Hoi	Xã Hưng Hội	Hung Hoi Commune	hung_hoi	958	10
31912	Châu Thới	Chau Thoi	Xã Châu Thới	Chau Thoi Commune	chau_thoi	958	10
31921	Long Thạnh	Long Thanh	Xã Long Thạnh	Long Thanh Commune	long_thanh	958	10
31945	Hộ Phòng	Ho Phong	Phường Hộ Phòng	Ho Phong Ward	ho_phong	959	8
31948	Phong Thạnh Đông	Phong Thanh Dong	Xã Phong Thạnh Đông	Phong Thanh Dong Commune	phong_thanh_dong	959	10
31951	Láng Tròn	Lang Tron	Phường Láng Tròn	Lang Tron Ward	lang_tron	959	8
31954	Phong Tân	Phong Tan	Xã Phong Tân	Phong Tan Commune	phong_tan	959	10
31957	Tân Phong	Tan Phong	Xã Tân Phong	Tan Phong Commune	tan_phong	959	10
31960	Phong Thạnh	Phong Thanh	Xã Phong Thạnh	Phong Thanh Commune	phong_thanh	959	10
31963	Phong Thạnh A	Phong Thanh A	Xã Phong Thạnh A	Phong Thanh A Commune	phong_thanh_a	959	10
31966	Phong Thạnh Tây	Phong Thanh Tay	Xã Phong Thạnh Tây	Phong Thanh Tay Commune	phong_thanh_tay	959	10
31969	Tân Thạnh	Tan Thanh	Xã Tân Thạnh	Tan Thanh Commune	tan_thanh	959	10
31972	Gành Hào	Ganh Hao	Thị trấn Gành Hào	Ganh Hao Township	ganh_hao	960	9
31975	Long Điền Đông	Long Dien Dong	Xã Long Điền Đông	Long Dien Dong Commune	long_dien_dong	960	10
31978	Long Điền Đông A	Long Dien Dong A	Xã Long Điền Đông A	Long Dien Dong A Commune	long_dien_dong_a	960	10
31981	Long Điền	Long Dien	Xã Long Điền	Long Dien Commune	long_dien	960	10
31984	Long Điền Tây	Long Dien Tay	Xã Long Điền Tây	Long Dien Tay Commune	long_dien_tay	960	10
31985	Điền Hải	Dien Hai	Xã Điền Hải	Dien Hai Commune	dien_hai	960	10
31987	An Trạch	An Trach	Xã An Trạch	An Trach Commune	an_trach	960	10
31988	An Trạch A	An Trach A	Xã An Trạch A	An Trach A Commune	an_trach_a	960	10
31990	An Phúc	An Phuc	Xã An Phúc	An Phuc Commune	an_phuc	960	10
31993	Định Thành	Dinh Thanh	Xã Định Thành	Dinh Thanh Commune	dinh_thanh	960	10
31996	Định Thành A	Dinh Thanh A	Xã Định Thành A	Dinh Thanh A Commune	dinh_thanh_a	960	10
31891	Hòa Bình	Hoa Binh	Thị trấn Hòa Bình	Hoa Binh Township	hoa_binh	961	9
31915	Minh Diệu	Minh Dieu	Xã Minh Diệu	Minh Dieu Commune	minh_dieu	961	10
31918	Vĩnh Bình	Vinh Binh	Xã Vĩnh Bình	Vinh Binh Commune	vinh_binh	961	10
31924	Vĩnh Mỹ B	Vinh My B	Xã Vĩnh Mỹ B	Vinh My B Commune	vinh_my_b	961	10
31927	Vĩnh Hậu	Vinh Hau	Xã Vĩnh Hậu	Vinh Hau Commune	vinh_hau	961	10
31930	Vĩnh Hậu A	Vinh Hau A	Xã Vĩnh Hậu A	Vinh Hau A Commune	vinh_hau_a	961	10
31933	Vĩnh Mỹ A	Vinh My A	Xã Vĩnh Mỹ A	Vinh My A Commune	vinh_my_a	961	10
31936	Vĩnh Thịnh	Vinh Thinh	Xã Vĩnh Thịnh	Vinh Thinh Commune	vinh_thinh	961	10
31999	9	9	Phường 9	9 Ward	9	964	8
32002	4	4	Phường 4	4 Ward	4	964	8
32005	1	1	Phường 1	1 Ward	1	964	8
32008	5	5	Phường 5	5 Ward	5	964	8
32011	2	2	Phường 2	2 Ward	2	964	8
32014	8	8	Phường 8	8 Ward	8	964	8
32017	6	6	Phường 6	6 Ward	6	964	8
32020	7	7	Phường 7	7 Ward	7	964	8
32022	Tân Xuyên	Tan Xuyen	Phường Tân Xuyên	Tan Xuyen Ward	tan_xuyen	964	8
32023	An Xuyên	An Xuyen	Xã An Xuyên	An Xuyen Commune	an_xuyen	964	10
32025	Tân Thành	Tan Thanh	Phường Tân Thành	Tan Thanh Ward	tan_thanh	964	8
32026	Tân Thành	Tan Thanh	Xã Tân Thành	Tan Thanh Commune	tan_thanh	964	10
32029	Tắc Vân	Tac Van	Xã Tắc Vân	Tac Van Commune	tac_van	964	10
32032	Lý Văn Lâm	Ly Van Lam	Xã Lý Văn Lâm	Ly Van Lam Commune	ly_van_lam	964	10
32035	Định Bình	Dinh Binh	Xã Định Bình	Dinh Binh Commune	dinh_binh	964	10
32038	Hòa Thành	Hoa Thanh	Xã Hòa Thành	Hoa Thanh Commune	hoa_thanh	964	10
32041	Hòa Tân	Hoa Tan	Xã Hòa Tân	Hoa Tan Commune	hoa_tan	964	10
32044	U Minh	U Minh	Thị trấn U Minh	U Minh Township	u_minh	966	9
32047	Khánh Hòa	Khanh Hoa	Xã Khánh Hòa	Khanh Hoa Commune	khanh_hoa	966	10
32048	Khánh Thuận	Khanh Thuan	Xã Khánh Thuận	Khanh Thuan Commune	khanh_thuan	966	10
32050	Khánh Tiến	Khanh Tien	Xã Khánh Tiến	Khanh Tien Commune	khanh_tien	966	10
32053	Nguyễn Phích	Nguyen Phich	Xã Nguyễn Phích	Nguyen Phich Commune	nguyen_phich	966	10
32056	Khánh Lâm	Khanh Lam	Xã Khánh Lâm	Khanh Lam Commune	khanh_lam	966	10
32059	Khánh An	Khanh An	Xã Khánh An	Khanh An Commune	khanh_an	966	10
32062	Khánh Hội	Khanh Hoi	Xã Khánh Hội	Khanh Hoi Commune	khanh_hoi	966	10
32065	Thới Bình	Thoi Binh	Thị trấn Thới Bình	Thoi Binh Township	thoi_binh	967	9
32068	Biển Bạch	Bien Bach	Xã Biển Bạch	Bien Bach Commune	bien_bach	967	10
32069	Tân Bằng	Tan Bang	Xã Tân Bằng	Tan Bang Commune	tan_bang	967	10
32071	Trí Phải	Tri Phai	Xã Trí Phải	Tri Phai Commune	tri_phai	967	10
32072	Trí Lực	Tri Luc	Xã Trí Lực	Tri Luc Commune	tri_luc	967	10
32074	Biển Bạch Đông	Bien Bach Dong	Xã Biển Bạch Đông	Bien Bach Dong Commune	bien_bach_dong	967	10
32077	Thới Bình	Thoi Binh	Xã Thới Bình	Thoi Binh Commune	thoi_binh	967	10
32080	Tân Phú	Tan Phu	Xã Tân Phú	Tan Phu Commune	tan_phu	967	10
32083	Tân Lộc Bắc	Tan Loc Bac	Xã Tân Lộc Bắc	Tan Loc Bac Commune	tan_loc_bac	967	10
32086	Tân Lộc	Tan Loc	Xã Tân Lộc	Tan Loc Commune	tan_loc	967	10
32089	Tân Lộc Đông	Tan Loc Dong	Xã Tân Lộc Đông	Tan Loc Dong Commune	tan_loc_dong	967	10
32092	Hồ Thị Kỷ	Ho Thi Ky	Xã Hồ Thị Kỷ	Ho Thi Ky Commune	ho_thi_ky	967	10
32095	Trần Văn Thời	Tran Van Thoi	Thị trấn Trần Văn Thời	Tran Van Thoi Township	tran_van_thoi	968	9
32098	Sông Đốc	Song Doc	Thị trấn Sông Đốc	Song Doc Township	song_doc	968	9
32101	Khánh Bình Tây Bắc	Khanh Binh Tay Bac	Xã Khánh Bình Tây Bắc	Khanh Binh Tay Bac Commune	khanh_binh_tay_bac	968	10
32104	Khánh Bình Tây	Khanh Binh Tay	Xã Khánh Bình Tây	Khanh Binh Tay Commune	khanh_binh_tay	968	10
32107	Trần Hợi	Tran Hoi	Xã Trần Hợi	Tran Hoi Commune	tran_hoi	968	10
32108	Khánh Lộc	Khanh Loc	Xã Khánh Lộc	Khanh Loc Commune	khanh_loc	968	10
32110	Khánh Bình	Khanh Binh	Xã Khánh Bình	Khanh Binh Commune	khanh_binh	968	10
32113	Khánh Hưng	Khanh Hung	Xã Khánh Hưng	Khanh Hung Commune	khanh_hung	968	10
32116	Khánh Bình Đông	Khanh Binh Dong	Xã Khánh Bình Đông	Khanh Binh Dong Commune	khanh_binh_dong	968	10
32119	Khánh Hải	Khanh Hai	Xã Khánh Hải	Khanh Hai Commune	khanh_hai	968	10
32122	Lợi An	Loi An	Xã Lợi An	Loi An Commune	loi_an	968	10
32124	Phong Điền	Phong Dien	Xã Phong Điền	Phong Dien Commune	phong_dien	968	10
32125	Phong Lạc	Phong Lac	Xã Phong Lạc	Phong Lac Commune	phong_lac	968	10
32128	Cái Nước	Cai Nuoc	Thị trấn Cái Nước	Cai Nuoc Township	cai_nuoc	969	9
32130	Thạnh Phú	Thanh Phu	Xã Thạnh Phú	Thanh Phu Commune	thanh_phu	969	10
32131	Lương Thế Trân	Luong The Tran	Xã Lương Thế Trân	Luong The Tran Commune	luong_the_tran	969	10
32134	Phú Hưng	Phu Hung	Xã Phú Hưng	Phu Hung Commune	phu_hung	969	10
32137	Tân Hưng	Tan Hung	Xã Tân Hưng	Tan Hung Commune	tan_hung	969	10
32140	Hưng Mỹ	Hung My	Xã Hưng Mỹ	Hung My Commune	hung_my	969	10
32141	Hoà Mỹ	Hoa My	Xã Hoà Mỹ	Hoa My Commune	hoa_my	969	10
32142	Đông Hưng	Dong Hung	Xã Đông Hưng	Dong Hung Commune	dong_hung	969	10
32143	Đông Thới	Dong Thoi	Xã Đông Thới	Dong Thoi Commune	dong_thoi	969	10
32146	Tân Hưng Đông	Tan Hung Dong	Xã Tân Hưng Đông	Tan Hung Dong Commune	tan_hung_dong	969	10
32149	Trần Thới	Tran Thoi	Xã Trần Thới	Tran Thoi Commune	tran_thoi	969	10
32152	Đầm Dơi	Dam Doi	Thị trấn Đầm Dơi	Dam Doi Township	dam_doi	970	9
32155	Tạ An Khương	Ta An Khuong	Xã Tạ An Khương	Ta An Khuong Commune	ta_an_khuong	970	10
32158	Tạ An Khương  Đông	Ta An Khuong  Dong	Xã Tạ An Khương  Đông	Ta An Khuong  Dong Commune	ta_an_khuong__dong	970	10
32161	Trần Phán	Tran Phan	Xã Trần Phán	Tran Phan Commune	tran_phan	970	10
32162	Tân Trung	Tan Trung	Xã Tân Trung	Tan Trung Commune	tan_trung	970	10
32164	Tân Đức	Tan Duc	Xã Tân Đức	Tan Duc Commune	tan_duc	970	10
32167	Tân Thuận	Tan Thuan	Xã Tân Thuận	Tan Thuan Commune	tan_thuan	970	10
32170	Tạ An Khương  Nam	Ta An Khuong  Nam	Xã Tạ An Khương  Nam	Ta An Khuong  Nam Commune	ta_an_khuong__nam	970	10
32173	Tân Duyệt	Tan Duyet	Xã Tân Duyệt	Tan Duyet Commune	tan_duyet	970	10
32174	Tân Dân	Tan Dan	Xã Tân Dân	Tan Dan Commune	tan_dan	970	10
32176	Tân Tiến	Tan Tien	Xã Tân Tiến	Tan Tien Commune	tan_tien	970	10
32179	Quách Phẩm Bắc	Quach Pham Bac	Xã Quách Phẩm Bắc	Quach Pham Bac Commune	quach_pham_bac	970	10
32182	Quách Phẩm	Quach Pham	Xã Quách Phẩm	Quach Pham Commune	quach_pham	970	10
32185	Thanh Tùng	Thanh Tung	Xã Thanh Tùng	Thanh Tung Commune	thanh_tung	970	10
32186	Ngọc Chánh	Ngoc Chanh	Xã Ngọc Chánh	Ngoc Chanh Commune	ngoc_chanh	970	10
32188	Nguyễn Huân	Nguyen Huan	Xã Nguyễn Huân	Nguyen Huan Commune	nguyen_huan	970	10
32191	Năm Căn	Nam Can	Thị trấn Năm Căn	Nam Can Township	nam_can	971	9
32194	Hàm Rồng	Ham Rong	Xã Hàm Rồng	Ham Rong Commune	ham_rong	971	10
32197	Hiệp Tùng	Hiep Tung	Xã Hiệp Tùng	Hiep Tung Commune	hiep_tung	971	10
32200	Đất Mới	Dat Moi	Xã Đất Mới	Dat Moi Commune	dat_moi	971	10
32201	Lâm Hải	Lam Hai	Xã Lâm Hải	Lam Hai Commune	lam_hai	971	10
32203	Hàng Vịnh	Hang Vinh	Xã Hàng Vịnh	Hang Vinh Commune	hang_vinh	971	10
32206	Tam Giang	Tam Giang	Xã Tam Giang	Tam Giang Commune	tam_giang	971	10
32209	Tam Giang Đông	Tam Giang Dong	Xã Tam Giang Đông	Tam Giang Dong Commune	tam_giang_dong	971	10
32212	Cái Đôi Vàm	Cai Doi Vam	Thị trấn Cái Đôi Vàm	Cai Doi Vam Township	cai_doi_vam	972	9
32214	Phú Thuận	Phu Thuan	Xã Phú Thuận	Phu Thuan Commune	phu_thuan	972	10
32215	Phú Mỹ	Phu My	Xã Phú Mỹ	Phu My Commune	phu_my	972	10
32218	Phú Tân	Phu Tan	Xã Phú Tân	Phu Tan Commune	phu_tan	972	10
32221	Tân Hải	Tan Hai	Xã Tân Hải	Tan Hai Commune	tan_hai	972	10
32224	Việt Thắng	Viet Thang	Xã Việt Thắng	Viet Thang Commune	viet_thang	972	10
32227	Tân Hưng Tây	Tan Hung Tay	Xã Tân Hưng Tây	Tan Hung Tay Commune	tan_hung_tay	972	10
32228	Rạch Chèo	Rach Cheo	Xã Rạch Chèo	Rach Cheo Commune	rach_cheo	972	10
32230	Nguyễn Việt Khái	Nguyen Viet Khai	Xã Nguyễn Việt Khái	Nguyen Viet Khai Commune	nguyen_viet_khai	972	10
32233	Tam Giang Tây	Tam Giang Tay	Xã Tam Giang Tây	Tam Giang Tay Commune	tam_giang_tay	973	10
32236	Tân Ân Tây	Tan An Tay	Xã Tân Ân Tây	Tan An Tay Commune	tan_an_tay	973	10
32239	Viên An Đông	Vien An Dong	Xã Viên An Đông	Vien An Dong Commune	vien_an_dong	973	10
32242	Viên An	Vien An	Xã Viên An	Vien An Commune	vien_an	973	10
32244	Rạch Gốc	Rach Goc	Thị trấn Rạch Gốc	Rach Goc Township	rach_goc	973	9
32245	Tân Ân	Tan An	Xã Tân Ân	Tan An Commune	tan_an	973	10
32248	Đất Mũi	Dat Mui	Xã Đất Mũi	Dat Mui Commune	dat_mui	973	10
\.


--
-- Name: administrative_regions administrative_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrative_regions
    ADD CONSTRAINT administrative_regions_pkey PRIMARY KEY (id);


--
-- Name: administrative_units administrative_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrative_units
    ADD CONSTRAINT administrative_units_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (code);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (code);


--
-- Name: wards wards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_pkey PRIMARY KEY (code);


--
-- Name: districts districts_administrative_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES public.administrative_units(id);


--
-- Name: districts districts_province_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_province_code_fkey FOREIGN KEY (province_code) REFERENCES public.provinces(code);


--
-- Name: provinces provinces_administrative_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_administrative_region_id_fkey FOREIGN KEY (administrative_region_id) REFERENCES public.administrative_regions(id);


--
-- Name: provinces provinces_administrative_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES public.administrative_units(id);


--
-- Name: wards wards_administrative_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES public.administrative_units(id);


--
-- Name: wards wards_district_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_district_code_fkey FOREIGN KEY (district_code) REFERENCES public.districts(code);


--
-- PostgreSQL database dump complete
--

