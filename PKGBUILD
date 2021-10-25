# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=gate88-win
pkgver=Mar19.05
pkgrel=3
pkgdesc='RTS game in space (uses Wine)'
arch=(x86_64)
url='https://www.queasygames.com/gate88'
license=(custom LGPL)
depends=(wine)
makedepends=(gendesk)
source=("https://www.queasygames.com/gate88/Gate88_${pkgver/./_}.zip"
        "https://www.queasygames.com/gate88/gate88_1.jpg")
b2sums=('ca6bddd82c44d7bc130d909c48fad00e2088a2816c32cbdf95594dd82e218c4fd73a2c1aad428cbfac2ea0064d57e9bd0022b121b983777c46cb3e5cbdb0e473'
        '3a79c4074e21085a048af9a44b05bfb1c055326f9115e5bcbbba2ddec27f494598bc97d049f6c2d627751e4924852a2870a2e17c4d77cbdcce4099a2420a6acc')

prepare() {
  convert gate88_1.jpg -resize 48x48 $pkgname.png
  echo -e "#!/bin/sh\ncd /usr/share/$pkgname\nwine gate88.exe" > $pkgname.sh
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Gate 88'
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -ru Gate88_${pkgver/./_}/* "$pkgdir/usr/share/$pkgname/"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 Gate88_${pkgver/./_}/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  chmod a+wx "$pkgdir/usr/share/$pkgname/replays"
  chmod a+w "$pkgdir/usr/share/$pkgname/"*.conf
}
