# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sqrxz3
pkgver=1.05r
pkgrel=2
pkgdesc="A fast paced jump'n'run (Part III - 'Adventure for Love')"
arch=('i686' 'x86_64')
url="http://sqrxz.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.retroguru.com/$pkgname/$pkgname-v.latest-ubuntu.tar.gz"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('4fae264c4ba16c4d55f9fdad4a9925181c77135c55e4e30e1ff20ca7db3beed9'
            'd07ee6bb33dfd8187b23450bad58a2f4d68e217284d345e341a761aca14eb8c2'
            '0468a24a04256865381f5dd0c92dfed4ed6f594270760f32678ebe2cb9bc1b5c'
            '65991c5ccf77f31b012be5d7e8ce4a34c5dc2714e2700ebe11e81b42bfec9130')
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
  tail -n +16 $pkgname.txt | head -n 11 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE
}
