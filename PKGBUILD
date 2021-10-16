# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=funnyboat
pkgver=1.5
pkgrel=1
pkgdesc="side scrolling arcade shooter game on a steamboat equipped with a cannon and the ability to jump"
url="http://funnyboat.sourceforge.net/"
arch=(any)
license=('custom')
makedepends=('gendesk')
depends=(
  'python2-pygame'
)
source=("https://sourceforge.net/projects/funnyboat/files/funnyboat/${pkgver}/funnyboat-${pkgver}-src.zip/download"
        "screenshot_to_homedir.patch")
md5sums=('71724a755614c286bd861864bd0062a6'
         '06761d4d402e8d9338157292f6dfb6e8')

prepare() {
  gendesk -f -n --pkgname funnyboat --pkgdesc "${pkgdesc}" --exec "funnyboat" --categories "Game;ArcadeGame"
  patch -p1 -i "${srcdir}/screenshot_to_homedir.patch"
}

package() {
  cd "${srcdir}/funnyboat"
  install -d "${pkgdir}/usr/share/funnyboat/data"
  install -Dm644 *.py "${pkgdir}/usr/share/funnyboat"
  install -Dm644 data/* "${pkgdir}/usr/share/funnyboat/data"
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/funnyboat"
  install -Dm644 LICENSE-CODE.txt "${pkgdir}/usr/share/licenses/funnyboat/LICENSE-CODE.txt"
  install -Dm644 LICENSE-MEDIA.txt "${pkgdir}/usr/share/licenses/funnyboat/LICENSE-MEDIA.txt"
  install -Dm644 "${srcdir}/funnyboat.desktop" ${pkgdir}/usr/share/applications/funnyboat.desktop
  echo "#!/bin/sh" > funnyboat
  echo "cd /usr/share/funnyboat/" >> funnyboat
  echo "python2 main.py" >> funnyboat
  install -Dm755 funnyboat $pkgdir/usr/bin/funnyboat
}

