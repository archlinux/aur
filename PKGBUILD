pkgname="stm8-spl-sdcc"
pkgver="20150517"
pkgrel="3"
pkgdesc="Port of STM8 SPL for SDCC"
arch=('any')
url='https://github.com/gicking/SPL_2.2.0_SDCC_patch'
depends=('sdcc')
makedepends=('git' 'wget' 'patch' 'unzip')
source=('http://www.st.com/st-web-ui/static/active/en/st_prod_software_internet/resource/technical/software/firmware/stsw-stm8069.zip')
md5sums=('74e6fb584ab164b37542db4b0bdc7c57')
license=('custom')

build() {
	cd "${srcdir}"
	git clone https://github.com/gicking/SPL_2.2.0_SDCC_patch
	cd STM8S_StdPeriph_Lib
	patch -p1 < ../SPL_2.2.0_SDCC_patch/STM8_SPL_v2.2.0_SDCC.patch
	sed '/stm8s_it\.h/d' Libraries/STM8S_StdPeriph_Driver/inc/stm8s.h > stm8s.h
	mv stm8s.h Libraries/STM8S_StdPeriph_Driver/inc/stm8s.h
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sdcc/include/stm8"
	cp -v STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/inc/*.h "${pkgdir}/usr/share/sdcc/include/stm8/"
	cp -v STM8S_StdPeriph_Lib/Project/STM8S_StdPeriph_Template/stm8s_conf.h "${pkgdir}/usr/share/sdcc/include/stm8/"
	mkdir -p "${pkgdir}/usr/share/sdcc/lib/src/stm8"
	cp -v STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/*.c "${pkgdir}/usr/share/sdcc/lib/src/stm8/"
}