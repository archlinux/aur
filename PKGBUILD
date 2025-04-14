pkgname=didiextract
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract files from Jazz Jackrabbit 2 installers without executing them."
arch=('x86_64')
url="https://codeberg.org/CYBERDEV/didiextract"
license=('GPL3')
depends=('zlib')
makedepends=('make' 'gcc' 'gzip' 'zlib')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	'294d308aac141a75167fb934d049163c60ec46f891b2c50caff7d4c5e74fc71b66e47bdd7b9ec53bc07be7537f3c715ead2f43da1d2bf3f0317e8864150b1b7e'
)

build() {
	cd "${pkgname}"
	gzip -f didiextract.1 # compress man page
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 didiextract "$pkgdir/usr/bin/didiextract"
	install -Dm644 didiextract.1.gz "$pkgdir/usr/share/man/man1/didiextract.1.gz"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/didiextract/COPYING"
	install -Dm644 README.md "$pkgdir/usr/share/doc/didiextract/README.md"
}
