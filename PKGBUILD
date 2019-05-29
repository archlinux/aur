# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=5.1.0
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('any')
depends=('libzim>=5.0.0' 'pugixml' 'mustache' 'xapian-core' 'aria2')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(573e1176e351fedc8b49c7746aef10746bf13c9f5a1df18186e0e6589215c546)

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
