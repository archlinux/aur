pkgname=sidex
pkgver=1.0.0
pkgrel=1
pkgdesc="Extract files from Steam .sim / .sid files (Old Steam games on DVD's)."
arch=('x86_64')
url="https://codeberg.org/CYBERDEV/SIDEx"
license=('GPL3')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'gzip' 'openssl' 'zlib')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	'6b464587f58eedec7ab9c1f1d10978025cb9fbfab8299152f3bd7cf17e91ba30e4453d018e8bb4bc8368a05abc51d84fcb948c5d3cea4c22a377e70cd56d401f'
)

build() {
	cd "${pkgname}"
	gzip -f ${pkgname}.1 # compress man page
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
