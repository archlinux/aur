# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=bgmn-bin
pkgver=4.2.22
pkgrel=1
pkgdesc="Rietveld refinement backend for Profex"
arch=('i686' 'x86_64')
url="http://www.bgmn.de"
license=('GPL2')
groups=('science')
depends=('glibc')
provides=('bgmn')
conflicts=('bgmn')
case ${CARCH} in
	i686)	source+=("http://profex.doebelin.org/wp-content/uploads/2014/09/bgmnwin-${pkgver}-${CARCH}.tar.gz");
		md5sums+=('4a5e777e24cee0f59820336fb16f6461')
		;;
	x86_64)	source+=("http://profex.doebelin.org/wp-content/uploads/2015/07/bgmnwin-${pkgver}-${CARCH}.tar.gz");
		md5sums+=('76f06f49d17e1b01ba4336d5c2cd9315');
		;;
	*)	error "Unsupported architecture.";
		;;
esac

package() {
	mkdir -p "${pkgdir}/opt/${pkgname%-bin}"
	mkdir -p "${pkgdir}/opt/BGMN-Templates/Structures"
	mkdir -p "${pkgdir}/opt/BGMN-Templates/Devices"
	mkdir -p "${pkgdir}/opt/BGMN-Templates/Presets"
	mkdir -p "${pkgdir}/usr"
	
	cd "${srcdir}/${pkgname%-bin}-${pkgver}"
	cp -R "./lib" "${pkgdir}/usr/"
	cp -R "./structures/." "${pkgdir}/opt/BGMN-Templates/Structures/"
	
	find . -executable -type f -exec install -Dm755 {} \
		${pkgdir}/opt/${pkgname%-bin}/{} \;
}
