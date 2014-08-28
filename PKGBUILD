# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=giana
pkgver=1.001
pkgrel=4
pkgdesc="'Giana's Return', unofficial sequel to the (in)famous Mario clone 'Great Giana Sisters'"
arch=('i686' 'x86_64')
url="http://www.gianas-return.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib' 'glut' 'glu')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.gianas-return.de/gr-v${pkgver/./}-ubuntu.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
sha256sums=('cf932707776c25444cb9ff9feb91489886efdc3764aa6aeeb53845f7c1816970'
            '0468a24a04256865381f5dd0c92dfed4ed6f594270760f32678ebe2cb9bc1b5c'
            'ea2452f45c2edeb9acac12294ff759e465e010fa997cc2fdf9d2ab57af76a0d9'
            '80aa0cd19c742199c69b7c1778f28c8f75aa6646c2b3a26ae6eed608b2d6a7a4')
options=(!strip)

package() {
  # create folders
  install -d "$pkgdir"/usr/{lib/$pkgname,share/{{doc,licenses}/$pkgname,$pkgname/data}}

  # install architecture dependent executable
  case $CARCH in
    i686)
      install -m755 ${pkgname}_ubuntu32 "$pkgdir"/usr/lib/$pkgname/$pkgname;;
    x86_64)
      install -m755 ${pkgname}_ubuntu64 "$pkgdir"/usr/lib/$pkgname/$pkgname;;
  esac

  # install launcher, data, text, icon, desktop and license files
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m644 data/*.zda "$pkgdir"/usr/share/$pkgname/data
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  tail -n +45 readme.txt | head -n 8 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE
}
