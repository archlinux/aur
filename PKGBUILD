# Maintainer: Ice Pie <icepie.dev@gmail.com>
pkgname=niceaigc-bin
pkgver=1.0.9
pkgrel=1
pkgdesc='NiceAIGC desktop application'
arch=('x86_64')
url='https://app.niceaigc.net/'
license=('custom')
depends=(
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: system tray integration')
provides=('niceaigc')
conflicts=('niceaigc')
source=(
  "niceaigc-${pkgver}.deb::https://app.niceaigc.net/api/v1/download/linux/x64?format=deb"
)
sha256sums=('855059a295d853a65cd2bd3d883de2b1d0fe855167cb4f6b3034c15552cc6fc6')

prepare() {
  bsdtar -xf "${srcdir}/niceaigc-${pkgver}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
}

package() {
  install -d "${pkgdir}/opt/NiceAIGC" "${pkgdir}/usr"
  cp -a "${srcdir}/opt/NiceAIGC/." "${pkgdir}/opt/NiceAIGC/"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/opt/NiceAIGC/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
