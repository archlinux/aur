# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sqrxz2
pkgver=1.00
pkgrel=2
pkgdesc="A fast paced jump'n'run (Part II - 'Two seconds until death')"
arch=('i686' 'x86_64')
url="http://sqrxz.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.retroguru.com/$pkgname/$pkgname-v.latest-linux.tar.gz"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('d8b8a2b649707bbc9d7f16acdee24ab0c2ce63cccd0a1b130a067893ca492150'
            'b5e9ffb25bfd97647cee92baee2d23f63581aa316809a989cdaf036abe0052ee'
            '0468a24a04256865381f5dd0c92dfed4ed6f594270760f32678ebe2cb9bc1b5c'
            '20ca71769b459034ae89bca1a89e7f4eafbe6a1ad94944bf9d306dee87714d2f')
options=(!strip)

package() {
  # create folders
  install -d "$pkgdir"/usr/{lib/$pkgname,share/{{doc,licenses}/$pkgname,$pkgname/data}}

  # install architecture dependent executable
  case $CARCH in
    i686)
      install -m755 ${pkgname}_linux32 "$pkgdir"/usr/lib/$pkgname/$pkgname;;
    x86_64)
      install -m755 ${pkgname}_linux64 "$pkgdir"/usr/lib/$pkgname/$pkgname;;
  esac

  # install launcher, data, text, icon, desktop and license files
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m644 data/*.zda "$pkgdir"/usr/share/$pkgname/data
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  tail -n +25 $pkgname.txt | head -n 9 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE
}
