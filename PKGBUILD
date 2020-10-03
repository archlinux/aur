# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=backdoor
pkgver=0.9.0
pkgrel=1
pkgdesc='A deck-building card roguelike cyberpunk game.'
url="https://uspgamedev.org"
license=('GPL3')
arch=('x86_64')
depends=('luajit' 'love')
makedepends=('cmake' 'git' 'wget' 'make')
source=("https://github.com/uspgamedev/backdoor/archive/v${pkgver}.tar.gz")
sha512sums=('023832620dd61e5ff145dabc20577c887fb3d5926052ad9aefd5ae602dddf6360abb675c134d584e440694630759d131d72b9a064b232e1e028f9535b76976f2')

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
