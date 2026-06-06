pkgname=itarmykit-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Desktop shell for BaseTool load-testing workflows"
arch=('x86_64')
url="https://itarmy.com.ua"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libayatana-appindicator: system tray icon support'
)
provides=('itarmykit')
conflicts=('itarmykit')
options=('!debug')
source=("itarmykit-${pkgver}-amd64.deb::https://github.com/armyuait-rgb/itarmykit-basetool-releases/releases/download/v${pkgver}/itarmykit-linux-amd64.deb")
sha256sums=('52f60a58c6651108465e644a501d9d1326c3d9ac8e6785a9435a53f1f91b4896')

latestver() {
  gh api repos/armyuait-rgb/itarmykit-basetool-releases/releases --jq \
    '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
    sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/ITArmyKit/itarmykit "${pkgdir}/usr/bin/itarmykit"

  rm -rf "${pkgdir}/usr/share/doc"
}
