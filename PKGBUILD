# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=sqrxz2
pkgver=1.00
pkgrel=1
pkgdesc="A fast paced jump'n'run which will please the hardcore gamer amongst you (Part II)"
arch=('i686' 'x86_64')
url="http://sqrxz.de/"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.retroguru.com/$pkgname/$pkgname-v.latest-linux.zip"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('1eed7c72ab99dc87a02769d28e52927add5e32d55063570bb8f9c3944bbd229b'
            'b5e9ffb25bfd97647cee92baee2d23f63581aa316809a989cdaf036abe0052ee'
            '0019a50f899f9534c1abc2e0e6519d558d239fa5f0e2c50fdb3d3f23d566c6a0'
            'e6ac3f94f451d564354f6dd2b5e05f214f15c522d5f31416fc75f5b7c9aba889')
options=(!strip)

package() {
  # create folders
  install -d "$pkgdir"/{opt/$pkgname/data,usr/share/{doc,licenses}/$pkgname}

  # install architecture dependent executeable
  case $CARCH in
    i686)
      install -m755 ${pkgname}_linux32 "$pkgdir"/opt/$pkgname/$pkgname;;
    x86_64)
      install -m755 ${pkgname}_linux64 "$pkgdir"/opt/$pkgname/$pkgname;;
  esac

  # install launcher, data, text, icon, desktop and license files
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m644 data/*.zda "$pkgdir"/opt/$pkgname/data
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  tail -n +25 sqrxz2.txt | head -n 9 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE

  # fix permissions
  chgrp -R games "$pkgdir"/opt/$pkgname
  chmod g+w "$pkgdir"/opt/$pkgname
}
