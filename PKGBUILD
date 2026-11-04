# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=rewise
pkgver=0.4.0
pkgrel=1
pkgdesc="Extract files from Wise installers without executing them."
arch=('x86_64')
url="https://codeberg.org/CYBERDEV/REWise"
license=('GPL3')
depends=('zlib')
makedepends=('autoconf' 'automake' 'zlib')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	'cc67a34bf764a9443e746f5efc932183b5d3176702c20f9304631f33f507ff00dfa218ff61b2bb3ed96df627c3d678ab680c1a419130f7d41fd3d2aa111d559f'
)

prepare() {
	cd "${pkgname}"
	autoreconf -i
	./configure --prefix=/usr
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" prefix=/usr install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/rewise/COPYING"
}
