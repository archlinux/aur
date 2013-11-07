# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=giana
pkgver=1.001
pkgrel=3
pkgdesc="Giana's Return, unofficial sequel to the (in)famous Mario clone Great Giana Sisters"
arch=('i686' 'x86_64')
url="http://www.gianas-return.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib' 'desktop-file-utils' 'glut' 'glu')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
options=(!strip)
source=("http://www.gianas-return.de/gr-v1001-ubuntu.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.install")
md5sums=('9b6f8459ecd2483f0756e170908c780d'
         '379904ec4b97453eb08dea10962b45e2'
         '602c3f7fc8440250bd1136586f93f7c5'
         '4535be161d68a7a13448eeb8abf99d15')
sha256sums=('cf932707776c25444cb9ff9feb91489886efdc3764aa6aeeb53845f7c1816970'
            'f4e95c46847c2435870a920ea94a9674f8a28fd9ea14d81f6d8c4be9d2b3d85b'
            '9aa9cd5a33c16cc529aaff71b040f055416fa25320925b344937dbe3909225cc'
            'b454a6cc67780d483beb00fa7b015a9b8ebca3fd6dbfc472a79719b7716e9f7c')

package() {
  cd "$srcdir"

  # install architecture dependent executeable
  case $CARCH in
    "i686")
      install -Dm755 ${pkgname}_ubuntu32 $pkgdir/opt/$pkgname/$pkgname;;
    "x86_64")
      install -Dm755 ${pkgname}_ubuntu64 $pkgdir/opt/$pkgname/$pkgname;;
  esac

  # install data files
  cp -r data $pkgdir/opt/$pkgname/
  mkdir -p $pkgdir/usr/share/doc/giana
  install -m644 *.txt $pkgdir/usr/share/doc/giana/

  # set group permission of folder, so we can save highscores and config later
  chgrp games $pkgdir/opt/$pkgname
  chmod g+w $pkgdir/opt/$pkgname

  # install launcher and desktop file
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
