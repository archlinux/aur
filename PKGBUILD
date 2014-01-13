# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=sqrxz3
pkgver=1.05r
pkgrel=1
pkgdesc="A fast paced jump'n'run which will please the hardcore gamer amongst you (Part III)"
arch=('i686' 'x86_64')
url="http://sqrxz.de/"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
source=("http://www.retroguru.com/$pkgname/$pkgname-v.latest-ubuntu.tar.gz"
        "$pkgname.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('b74a4bc4010e283a6c01380aa3bb49b98d228640d73319f5c75e036dcd1ac14a'
            'd07ee6bb33dfd8187b23450bad58a2f4d68e217284d345e341a761aca14eb8c2'
            '0019a50f899f9534c1abc2e0e6519d558d239fa5f0e2c50fdb3d3f23d566c6a0'
            '194164042e5d394ce1492548002351c23da0b274f64a92851d87fec4ecb1d440')
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
  tail -n +16 sqrxz3.txt | head -n 10 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE

  # fix permissions
  chgrp -R games "$pkgdir"/opt/$pkgname
  chmod g+w "$pkgdir"/opt/$pkgname
}
