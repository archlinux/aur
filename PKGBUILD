# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=6.0.4
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=6.0.1' 'pugixml' 'mustache=3.2.1' 'xapian-core' 'aria2')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(0cb32dc6a156a34846a8b4c8b51ea1532419a5103b1d673cea06cc7af984ecf3)

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
