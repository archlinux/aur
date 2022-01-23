# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sqrxz4
pkgver=1.00
pkgrel=2
pkgdesc="A fast paced jump'n'run (Part IV - 'Cold Cash')"
arch=('i686' 'x86_64')
url="https://www.sqrxz.de/sqrxz-4/"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("https://www.retroguru.com/$pkgname/$pkgname-v.latest-ubuntu.tar.gz"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('14693b4559de793e605e2127b34674f5a7eed378249f4d4b0fcb612b512e1023'
            '454defe9396d559b387ab2cbc2a8a03577c2d5aedcef082e3a3b3228e33ba867'
            '0468a24a04256865381f5dd0c92dfed4ed6f594270760f32678ebe2cb9bc1b5c'
            '42bfbb5ae722078b3c44e40023336cee81cfbb41b44311fedf4b97ef093c3b5e')
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
  tail -n +23 $pkgname.txt | head -n 10 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE
}
