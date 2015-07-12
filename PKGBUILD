# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=warthunder
pkgver=1.0.7
pkgrel=2
pkgdesc='Updater and launcher for War Thunder - a combat game dedicated to WW2'
arch=('x86_64')
url='http://warthunder.com/'
license=('custom')
install="${pkgname}.install"
source=('warthunder.sh'
        'warthunder.desktop'
        '16x16.png'
        '48x48.png'
        '64x64.png'
        '128x128.png'
        '256x256.png')
source_x86_64=("http://yup2.gaijinent.com/updater_${pkgver}.tar.gz")
sha256sums=('885b1ef426a98365a68699dfb6d6bc1e3f99a1624eebcffae8c00facb2bd3e3a'
            '352a7289b255fc3c57692a20db23c3260de98093e3f8d86372f5a7ee511ab543'
            '48676d477d800f8ee7ca28b9e483a7ef0961b3218c4c373c754a01e62bda5c21'
            'e942263ad59cf80a133c9e493c8b18637c21aa8e5b75fe9bd5c54c970301cf26'
            'ce594219697fce830ece3a18379d106072da11ae47052aa0d1a9a372ed515065'
            '83cb65c23edf7fc22c6a74c4adb3e2544af44e1b2e5930904836039faccd732a'
            'c08846a2f9a76b74c24b2c14e2585559d87f9e61de9f08f4ec3c718ec6d3efb4')
sha256sums_x86_64=('312b247a7f04281cebafe07d98a2a38ccf23e3e9983eff89935f1f91378821d2')

package() {
  cd "$srcdir/WarThunder"
  install -Dm755 "$srcdir/warthunder.sh" "$pkgdir/usr/bin/warthunder"
  install -Dm755 updater     "$pkgdir/usr/lib/warthunder/bin/updater"
  install -Dm644 updater.blk "$pkgdir/usr/lib/warthunder/bin/updater.blk"
  ln -s /usr/lib/warthunder/bin/updater "$pkgdir/usr/bin/warthunder-updater"

  # Install desktop file
  cd "$srcdir"
  install -Dm644 warthunder.desktop "$pkgdir/usr/share/applications/warthunder.desktop"

  # Install icons
  cd "$srcdir"
  for img in *.png; do
    install -Dm644 "$img" "$pkgdir/usr/share/icons/hicolor/${img%.*}/warthunder.png"
  done
}
