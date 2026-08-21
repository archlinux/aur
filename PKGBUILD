# Maintainer: akkarriin <akkarriin@tutamail.com>

pkgname=uuplugin-bin
pkgver=14.2.2
pkgrel=2
pkgdesc="UU Steam Deck Plugin for General Linux"
arch=('x86_64')
url="https://uu.163.com/"
license=('custom')
source=(
  "uuplugin-${pkgver}.tar.gz::https://uurouter.gdl.netease.com/uuplugin/steam-deck-plugin-x86_64/v${pkgver}/uu.tar.gz"
  'uuplugin.service')
md5sums=('dcf9cc04ec1059667546893ec28a56aa'
  '3d8004125dbbea0b07b6c2e3ff225767')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/etc/uuplugin"
  install -Dm755 "${srcdir}/uuplugin" "${pkgdir}/usr/bin/uuplugin"
  # uuplugin execl's xuplugin-guardian as a sibling of its own executable path
  # (e.g. /usr/bin/uuplugin -> /usr/bin/xuplugin-guardian), NOT from WorkingDirectory
  install -Dm755 "${srcdir}/xuplugin-guardian" "${pkgdir}/usr/bin/xuplugin-guardian"
  install -Dm644 "${srcdir}/uu.conf" "${pkgdir}/etc/uuplugin/uu.conf"
  install -Dm644 "${srcdir}/uuplugin.service" "${pkgdir}/usr/lib/systemd/system/uuplugin.service"
}
