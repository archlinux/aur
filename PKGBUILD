# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=xump
pkgver=1.00
pkgrel=1
pkgdesc="Simple puzzler (aka 'The Final Run')"
arch=('i686' 'x86_64')
url="http://retroguru.com/xump/"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.retroguru.com/$pkgname/$pkgname-v.latest-linux.tar.gz"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('4a6df3fadcf3639c3e4ae0b832cc070a0f216334127b276111ea7378745625c0'
            '2b75fd009edc6e8a84021b1700ad27b205321f91fe0bff570a793bfd10329c19'
            '0468a24a04256865381f5dd0c92dfed4ed6f594270760f32678ebe2cb9bc1b5c'
            'd9b60fdc9e2a6be48f09d493f646a9fa4267fae5f6f7849ec90443a4c2a8dcea')
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
  tail -n +18 $pkgname.txt | head -n 13 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE
}
