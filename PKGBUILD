# Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
pkgname=trustedqsl
pkgver=2.0.3
pkgrel=1
epoch=
pkgdesc="TrustedQSL - Logbook of the World"
arch=('x86_64' 'i686')
url="http://lotw.arrl.org/"
license=('ARRL')
groups=()
replaces=(tsql)
depends=(openssl expat zlib wxgtk curl)
makedepends=(openssl expat zlib wxgtk curl cmake)
source=(http://www.arrl.org/files/file/LoTW%20Instructions/tqsl-${pkgver}.tgz)
md5sums=('0e62df9f8c2fbb4b5d42d3ee9111c75a')
sha1sums=('d1ded1c8e55dcacc194db79a32c9e8fab6995af7')

build() {
	cd "$srcdir/tqsl-$pkgver"
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
		-DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8' \
		../
	make
}

package() {
	cd "$srcdir/tqsl-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
