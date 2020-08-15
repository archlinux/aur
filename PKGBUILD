# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=backdoor
pkgver=0.7.0
pkgrel=4
pkgdesc='A deck-building card roguelike cyberpunk game.'
url="https://uspgamedev.org"
license=('GPL3')
arch=('x86_64')
depends=('luajit' 'love')
makedepends=('cmake' 'git' 'wget' 'make')
source=("https://github.com/uspgamedev/backdoor/archive/v${pkgver}.tar.gz")
sha512sums=('8813372fab3dc6d10a8b3fd927629590148f76045c057f864f0882c1c706970ef642ea15683cf15f939aa2347aa811642398919e818045f83445e17920feb83b')

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
