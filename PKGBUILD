# Maintainer: CYBERDEV
pkgname=defactory
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract files from Indigo Rose Setup Factory installers without executing them."
arch=('x86_64')
url="https://codeberg.org/CYBERDEV/defactory"
license=('GPL3')
depends=('zlib')
makedepends=('make' 'gcc' 'gzip' 'zlib')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	'76bd271396a7e4aba624b4915f60d7a46f5b998db35383bbf4e038fb27bebffd454156dc2290c47dbbdf8cb31b77c33776df40b032f6c827908c0affe5c9aeaa'
)

build() {
	cd "${pkgname}"
	gzip -f defactory.1 # compress man page
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 defactory "$pkgdir/usr/bin/defactory"
	install -Dm644 defactory.1.gz "$pkgdir/usr/share/man/man1/defactory.1.gz"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/defactory/COPYING"
	install -Dm644 README.md "$pkgdir/usr/share/doc/defactory/README.md"
}
