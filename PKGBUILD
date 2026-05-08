# Maintainer: v0idhrt <iws.reccolz@gmail.com>
pkgname=moirai-client-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Moirai desktop VPN client'
arch=('x86_64')
url='https://github.com/v0idhrt/moirai'
license=('custom')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsecret'
  'polkit'
)
provides=('moirai-client')
conflicts=('moirai-client')
options=('!strip')
source=("moirai-linux-x64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/moirai-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
  local bundle_dir="${srcdir}/moirai-linux-x64"
  local app_id='io.moirai.client.moirai_client'

  install -d "${pkgdir}/opt/moirai-client"
  cp -a "${bundle_dir}/." "${pkgdir}/opt/moirai-client/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/moirai-client/moirai_client "${pkgdir}/usr/bin/moirai-client"
  ln -s /opt/moirai-client/client-daemon "${pkgdir}/usr/bin/client-daemon"

  install -Dm644 "${bundle_dir}/${app_id}.desktop" \
    "${pkgdir}/usr/share/applications/${app_id}.desktop"
  install -Dm644 "${bundle_dir}/${app_id}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${app_id}.svg"
}
