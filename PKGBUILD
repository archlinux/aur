pkgname=itarmykit-bin
pkgver=2.4.17
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
source=("itarmykit-${pkgver}-amd64.deb::https://download.itarmy.com.ua/releases/${pkgver}/itarmykit-linux-amd64.deb")
sha256sums=('a49d649dd7715f952151626d7a1683a02b14a4dd6dee027ef5cc7762c97df18a')

latestver() {
  curl -fsSL https://download.itarmy.com.ua/index.html |
    grep -aoE 'data-release="[0-9]+(\.[0-9]+)*"' |
    sed -nE 's#data-release="([0-9.]+)"#\1#p' | sort -V | tail -1
}

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/ITArmyKit/itarmykit "${pkgdir}/usr/bin/itarmykit"

  rm -rf "${pkgdir}/usr/share/doc"
}
