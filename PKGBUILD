# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=backdoor
pkgver=0.8.0
pkgrel=1
pkgdesc='A deck-building card roguelike cyberpunk game.'
url="https://uspgamedev.org"
license=('GPL3')
arch=('x86_64')
depends=('luajit' 'love')
makedepends=('cmake' 'git' 'wget' 'make')
source=("https://github.com/uspgamedev/backdoor/archive/v${pkgver}.tar.gz")
sha512sums=('5c3ce6187d47d5b62faa725ebfae523179edda1de3b1d45e9844c5bfd429ea62242446865c47f3f006e0554ea86c1c9785a473d577bb44c9503c48e69b899eee')

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
