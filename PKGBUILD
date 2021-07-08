# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lines
pkgver=5.2
pkgrel=1
pkgdesc='A modern and minimalist IDE supporting over 150 programming languages'
arch=('x86_64')
url="https://www.creatixbih.com/lines"
license=('custom:freeware')
provides=('lines-code-editor')
depends=('gtk3' 'libxss' 'nss')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.zip::https://www.creatixbih.com/dl/files/lines_linux_x64.zip")
sha256sums=('e12963bbc1c7ee1d99c6d463ae55572978b7d81abdbcef056eeb8af98c2bef0e')

package() {
  install -d "$pkgdir/opt/$pkgname/" "$pkgdir/usr/bin/"
  cp -a --no-preserve=ownership Lines/* "$pkgdir/opt/$pkgname/"
  ln -s /opt/lines/lines "$pkgdir/usr/bin/lines"
  install -Dm 644 "$pkgdir/opt/$pkgname/app/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 "$pkgdir/opt/lines/app/res/lines.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  gendesk -f -n --pkgname "$pkgname" \
          --pkgdesc "$pkgdesc" \
          --name "Lines" \
          --genericname "Text Editor" \
          --comment "$pkgname" \
          --exec "$pkgname" \
          --categories "Utility;Development;IDE"
  install -Dm 644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
