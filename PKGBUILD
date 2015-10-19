# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=caenhvwrapper
pkgver=5.77
pkgrel=1
pkgdesc='Library for CAEN Power Supply Control'
arch=('i686' 'x86_64')
url='http://www.caen.it/jsp/Template2/CaenProd.jsp?parent=42&idmod=835'
license=('custom')
source=("file://CAENHVWrapper-${pkgver}.tar.gz")
depends=('glibc>2.9')

sha256sums=('9d0a29eed7a13e2b45820dc99dbc8617581881191000861511fb624c660e6346')

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
