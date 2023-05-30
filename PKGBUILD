# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=rewise
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract files from Wise installers without executing them."
arch=('x86_64')
url="https://notabug.org/CYBERDEViL/REWise"
license=('GPL3')
makedepends=('make' 'gcc' 'gzip')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	'6625dd8c0c49cc444ed50caacf65a5e8974963c70fd29372e57006113218b49b45b029bd28fc17f7e6b92b5bbb7795ce13b4b1e0bf589de425f30dcb69886b0d'
)

build() {
	cd "${pkgname}"
	gzip rewise.1 # compress man page
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 rewise "$pkgdir/usr/bin/rewise"
	install -Dm644 rewise.1.gz "$pkgdir/usr/share/man/man1/rewise.1.gz"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/rewise/COPYING"
	install -Dm644 README.md "$pkgdir/usr/share/doc/rewise/README.md"
}
