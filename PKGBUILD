# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=qsiapi
pkgver=7.6.0
pkgrel=1
pkgdesc="C++ API for QSI camera control and image capture via the USB interface"
url="http://www.qsimaging.com/software-beta.html#api"
arch=('i686' 'x86_64')
license=('custom')
depends=('bash' 'libftdi')
source=("http://qsimaging.com/downloads/${pkgname}-${pkgver}.tar.gz")
sha1sums=('c2d91e91c48e0e3f81938da8f29c5319f02e6bd4')
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -fi
	./configure --with-ftd=ftdi1 --prefix=/usr --enable-shared
	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}/usr/lib/libqsiapi.la"	#it's a libtool file
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

