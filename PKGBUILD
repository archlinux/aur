# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=9.1.0
pkgrel=2
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=6.1.0' 'pugixml' 'mustache=3.2.1' 'xapian-core' 'aria2' 'libmicrohttpd')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(e93f58206f8643d539113e6ac15085c65cdbee2c401b13e8c7b7419ecb5fd28d)

build() {
	cd "${pkgname}-${pkgver}"
	# We want to ignore xapian ABI version mismatches
	arch-meson build -Dwerror=false
	ninja -C build
}

check() {
	cd "${pkgname}-${pkgver}/build"
	ninja meson-test
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
