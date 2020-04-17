# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=9.1.1
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=6.1.0' 'pugixml' 'mustache=3.2.1' 'xapian-core' 'aria2' 'libmicrohttpd')
makedepends=('libffi' 'meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(a048ba9cf4a680f831532589d7e041163aff161cedd5c47c2900876c2b12171c)

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
