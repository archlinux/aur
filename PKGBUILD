# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sqrxz
pkgver=0.996a
pkgrel=3
pkgdesc="A fast paced jump'n'run which will please the hardcore gamer amongst you"
arch=('i686' 'x86_64')
url="http://sqrxz.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.retroguru.com/$pkgname/$pkgname-v0996a-ubuntu.tar.gz"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('1986ba52187e2e1c91114631209d24bcf7438174b81c4c69469d8a181e6fe31c'
            '1113cd762c2daedf7eb81872117b40b7ffd0be297db2e1d76284db531ce5025a'
            '0468a24a04256865381f5dd0c92dfed4ed6f594270760f32678ebe2cb9bc1b5c'
            'e50418c74fc18283197a0f3ef4fdadd697f0c517de35d09bffcc8d0b5eb4ac49')
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
  tail -n +16 readme.txt | head -n 17 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE
}
