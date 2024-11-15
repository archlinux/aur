# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=rewise
pkgver=0.3.0
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
	'9f8b3ded3acc467b8a69adff9da1df842316524cd46470f41d6482e101592be9f042a91abd3293492729aaf4c7d65cce58dc23591ef9d2e43c9b893e60f565f8'
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
