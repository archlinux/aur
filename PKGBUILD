# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=caenvmelib
pkgver=2.41
pkgrel=2
pkgdesc='Interface library for CAEN VME Bridges'
arch=('i686' 'x86_64')
url='http://www.caen.it/csite/CaenProd.jsp?idmod=689&parent=38'
license=('custom')
source=("file://CAENVMELib-${pkgver}.tgz")
depends=('glibc>2.12')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="x64"
	else
		_source_arch="x86"
	fi

	cd "${srcdir}/CAENVMELib-${pkgver}"

	install -D -m644 "lib/${_source_arch}/libCAENVME.so.${pkgver}" "${pkgdir}/usr/lib/libCAENVME.so.${pkgver}"
	ln -fs "libCAENVME.so.${pkgver}" "${pkgdir}/usr/lib/libCAENVME.so"
	install -d -m755 "${pkgdir}/usr/include"
	install -m644 include/* "${pkgdir}/usr/include"
	install -D -m644 CAEN_License_Agreement.txt "${pkgdir}/usr/share/licenses/${pkgname}/CAEN_License_Agreement.txt"
}

sha256sums=('631465e1f4fb6ae2884dd849c04ce50ce68ab30392e62f37c7df588b89805f60')
