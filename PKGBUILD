# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=sqrxz
pkgver=0.996a
pkgrel=2
pkgdesc="A fast paced jump'n'run which will please the hardcore gamer amongst you"
arch=('i686' 'x86_64')
url="http://sqrxz.de/"
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
            '0019a50f899f9534c1abc2e0e6519d558d239fa5f0e2c50fdb3d3f23d566c6a0'
            '50a787cab63f37045c35fcd2910740f1f67ae9ba8cfe7924936462c6940fac69')
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
  tail -n +16 readme.txt | head -n 17 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE

  # fix permissions
  chgrp -R games "$pkgdir"/opt/$pkgname
  chmod g+w "$pkgdir"/opt/$pkgname
}
