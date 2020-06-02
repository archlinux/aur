# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=9.2.1
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=6.1.1' 'pugixml' 'mustache' 'xapian-core' 'aria2' 'libmicrohttpd')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(003cec07ca8025e310a46ce44c858eee535b92a7a2aac55c5d1883bb406e244b)

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
