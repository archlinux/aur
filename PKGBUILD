# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=backdoor
pkgver=0.7.0
pkgrel=3
pkgdesc='A deck-building card roguelike cyberpunk game.'
url="https://uspgamedev.org"
license=('GPL3')
arch=('x86_64')
depends=('luajit' 'love')
makedepends=('cmake' 'git' 'wget' 'make')
source=("https://github.com/uspgamedev/backdoor/archive/v${pkgver}.tar.gz")
sha512sums=('5508d3deea871845c5f17c20fa5c3f159c1816114968e3a02d312734e7f8f2a662bb41cf1d622a8ffa56f1ce9b274fdf4f701e2aca99cc92f5f9cc95a8d0b9cc')

build() {
	cd ${pkgname}-${pkgver}
	make bin/backdoor.love
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  echo -e '#!/bin/bash\nlove /usr/share/backdoor/backdoor.love\n' > "$pkgdir/usr/bin/backdoor"
  chmod +x "${pkgdir}/usr/bin/backdoor"

#  install -Dm644 "$srcdir/backdoor.desktop" "$pkgdir/usr/share/applications/backdoor.desktop"
#  install -Dm644 "$srcdir/$pkgname/src/images/menu/logo.png" "$pkgdir/usr/share/pixmaps/backdoor.png"
  install -dm755 "${pkgdir}/usr/share/backdoor/"
  install -Dm755 "${pkgname}-${pkgver}/bin/backdoor.love" "$pkgdir/usr/share/backdoor/"
}
