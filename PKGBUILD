# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=6.0.1
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=5.0.2' 'pugixml' 'mustache' 'xapian-core' 'aria2')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(06e66afb523929b60400eacb92d0b5b74763b5d5e13e6a58a279634f8faf711b)

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
