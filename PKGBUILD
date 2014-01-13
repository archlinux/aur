# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=giana
pkgver=1.001
pkgrel=3
pkgdesc="Giana's Return, unofficial sequel to the (in)famous Mario clone Great Giana Sisters"
arch=('i686' 'x86_64')
url="http://www.gianas-return.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib' 'glut' 'glu')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.gianas-return.de/gr-v1001-ubuntu.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
sha256sums=('cf932707776c25444cb9ff9feb91489886efdc3764aa6aeeb53845f7c1816970'
            '0019a50f899f9534c1abc2e0e6519d558d239fa5f0e2c50fdb3d3f23d566c6a0'
            'ea2452f45c2edeb9acac12294ff759e465e010fa997cc2fdf9d2ab57af76a0d9'
            '80aa0cd19c742199c69b7c1778f28c8f75aa6646c2b3a26ae6eed608b2d6a7a4')
options=(!strip)

package() {
  # create folders
  install -d "$pkgdir"/{opt/$pkgname/data,usr/share/{doc,licenses}/$pkgname}

  # install architecture dependent executeable
  case $CARCH in
    i686)
      install -m755 ${pkgname}_ubuntu32 "$pkgdir"/opt/$pkgname/$pkgname;;
    x86_64)
      install -m755 ${pkgname}_ubuntu64 "$pkgdir"/opt/$pkgname/$pkgname;;
  esac

  # install launcher, data, text, icon, desktop and license files
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m644 data/*.zda "$pkgdir"/opt/$pkgname/data
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  tail -n +45 readme.txt | head -n 8 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE


  # set group permission of folder, so we can save highscores and config later
  chgrp games "$pkgdir"/opt/$pkgname
  chmod g+w "$pkgdir"/opt/$pkgname
}
