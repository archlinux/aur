# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=caenhvwrapper
pkgver=5.61
pkgrel=1
pkgdesc='Library for CAEN Power Supply Control'
arch=('i686' 'x86_64')
url='http://www.caen.it/jsp/Template2/CaenProd.jsp?parent=42&idmod=835'
license=('custom')
source=("file://CAENHVWrapper-${pkgver}.tgz")
depends=('glibc>2.9')

sha256sums=('d01b82098de1943663040eca26a8bbc75aaf4cd2a152e18d78c432fb842e059f')

package() {
	cd "${srcdir}/Linux"

	if [ "$CARCH" = "x86_64" ]; then
		install -D -m644 "lib/x64/libcaenhvwrapper.so.${pkgver}" "${pkgdir}/usr/lib/libcaenhvwrapper.so.${pkgver}"
	else
		install -D -m644 "lib/libcaenhvwrapper.so.${pkgver}" "${pkgdir}/usr/lib/libcaenhvwrapper.so.${pkgver}"
	fi
	ln -fs "libcaenhvwrapper.so.${pkgver}" "${pkgdir}/usr/lib/libcaenhvwrapper.so"
	install -d -m755 "${pkgdir}/usr/include"
	install -m644 include/CAENHVWrapper.h "${pkgdir}/usr/include"
	install -D -m644 CAEN_License_Agreement.txt "${pkgdir}/usr/share/licenses/${pkgname}/CAEN_License_Agreement.txt"
}
