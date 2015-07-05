# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=qsiapi
pkgver=7.2.0
pkgrel=1
pkgdesc="C++ API for QSI camera control and image capture via the USB interface"
url="http://www.qsimaging.com/software-beta.html#api"
arch=('i686' 'x86_64')
license=('custom')
depends=('bash' 'libftdi')
# makedepends=('gcc46')
source=("http://qsimaging.com/downloads/${pkgname}-${pkgver}.tar.gz")
sha1sums=('3c11fcefb122856807db6da937cb7fac4b0887fd')
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --enable-libftdi --prefix=/usr --enable-shared
	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}/usr/lib/libqsiapi.la"	#it's a libtool file
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

