# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=backdoor
pkgver=0.6.1
pkgrel=2
pkgdesc='A deck-building card roguelike cyberpunk game.'
url="https://uspgamedev.org"
license=('GPL3')
arch=('x86_64')
depends=('luajit' 'love')
makedepends=('cmake' 'git' 'wget' 'make')
source=("https://github.com/uspgamedev/backdoor/archive/v${pkgver}.tar.gz")
sha512sums=('1f003dea0ee0e8c79e864d6d080cd42383cd94b099f40417ef7bcdcf36cb5f462a0d00e129bfb27ec148a44607d5cbad1d763798c32272d93bcc585755d08f6b')

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
