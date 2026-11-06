# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=rewise
pkgver=0.4.0
_pkgver="${pkgver}-2"
pkgrel=1
pkgdesc="Extract files from Wise installers without executing them."
arch=('x86_64')
url="https://codeberg.org/CYBERDEV/REWise"
license=('GPL3')
depends=('libbsd' 'zlib')
makedepends=('autoconf' 'automake' 'libbsd' 'zlib')
source=(
	"${pkgname}-${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz"
)
sha512sums=(
	'21f7c4e184eb150fb779dc9a795f3e2e1df3da18645640be58b44213cba25f67a477905fbe6c82fdf01538bd810693827bd87b47539f4e9f394226fd9261324e'
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
