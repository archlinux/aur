# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=xkb-switch
pkgver=1.5.0
pkgrel=4
pkgdesc='Program that allows to query and change the XKB layout state'
arch=('i686' 'x86_64')
url='https://github.com/ierton/xkb-switch'
license=('GPL3')
depends=('libx11' 'libxkbfile')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ierton/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('5b9ee5fd2c06360ed1297e4e58dda19ae1336d85')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install

	mkdir "${pkgdir}/usr/bin"
	mkdir "${pkgdir}/usr/lib"
	mv "${pkgdir}/usr/local/bin/xkb-switch" "${pkgdir}/usr/bin"
	mv "${pkgdir}/usr/local/lib/libxkbswitch.so" "${pkgdir}/usr/lib"
	rmdir "${pkgdir}/usr/local/bin"
	rmdir "${pkgdir}/usr/local/lib"
}
