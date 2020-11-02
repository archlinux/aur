# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=backdoor
pkgver=0.10.0
pkgrel=1
pkgdesc='A deck-building card roguelike cyberpunk game.'
url="https://uspgamedev.org"
license=('GPL3')
arch=('x86_64')
depends=('luajit' 'love')
makedepends=('zip' 'cmake' 'git' 'wget' 'make')
source=("https://github.com/uspgamedev/backdoor/archive/v${pkgver}.tar.gz")
sha512sums=('6002e57386524ea098a509654fdf712b96a893ee83214fe7e603d6984cb5dd47e9f8c3c0c669f883cde34e8868286a1dc7e829565b715ff4f9fc919a773284d9')

build() {
	cd ${pkgname}-${pkgver}
	make bin/backdoor.love
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	echo -e '#!/bin/bash\nlove /usr/share/backdoor/backdoor.love\n' > "$pkgdir/usr/bin/backdoor"
	chmod +x "${pkgdir}/usr/bin/backdoor"

	install -dm755 "${pkgdir}/usr/share/backdoor/"
	install -Dm755 "${pkgname}-${pkgver}/bin/backdoor.love" "$pkgdir/usr/share/backdoor/"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
