# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=9.0.1
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim' 'pugixml' 'mustache=3.2.1' 'xapian-core' 'aria2' 'libmicrohttpd')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(0e99329f870bc0cb2a51b1cce599f084cfdc4953cba97d178536959f2a9a865f)

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
