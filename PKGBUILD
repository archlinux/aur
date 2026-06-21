pkgname=itarmykit-bin
pkgver=2.2.1
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
sha256sums=('5ceb0549b91ce6ad5a5d6e5e33a2c9be4cef6638724fc6c6086b16f4bcfbcf4a')

latestver() {
  curl -fsSL https://download.itarmy.com.ua/ |
    grep -aoE 'releases/[0-9]+(\.[0-9]+)*/itarmykit-linux-amd64\.deb' |
    sed -nE 's#releases/([0-9.]+)/.*#\1#p' | sort -V | tail -1
}

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/ITArmyKit/itarmykit "${pkgdir}/usr/bin/itarmykit"

  rm -rf "${pkgdir}/usr/share/doc"
}
