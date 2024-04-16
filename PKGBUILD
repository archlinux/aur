# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=rewise
pkgver=0.2.0
pkgrel=1
pkgdesc="Extract files from Wise installers without executing them."
arch=('x86_64')
url="https://codeberg.org/CYBERDEV/REWise"
license=('GPL3')
depends=('zlib')
makedepends=('make' 'gcc' 'gzip' 'zlib')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	'a35fd0d04f4f0637a20bf95ac691342aca922c79a24996438b2a13ebed83c96a36589b41bc302931cb9ab692d43b79e367d0eca8e3b36cb9f1acfe4667d73c92'
)

build() {
	cd "${pkgname}"
	gzip -f rewise.1 # compress man page
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 rewise "$pkgdir/usr/bin/rewise"
	install -Dm644 rewise.1.gz "$pkgdir/usr/share/man/man1/rewise.1.gz"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/rewise/COPYING"
	install -Dm644 README.md "$pkgdir/usr/share/doc/rewise/CHANGELOG.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/rewise/README.md"
}
