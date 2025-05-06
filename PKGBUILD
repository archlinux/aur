# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=rewise
pkgver=0.3.1
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
	'4c0eb11668d01dd52ddbc95d6df50ad7fd48fcc404ffbc100842bac6a7d2b46f026f4c07ca8aaabf87e386a4e1f739a6034a7a35bfbd5b07189cd7f833cfbee4'
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
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/rewise/CHANGELOG.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/rewise/README.md"
}
