# Maintainer: Stephen Greenham <sg at solarisfire dot com>

pkgname=aks-desktop-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Application-focused desktop experience for Azure Kubernetes Service"
arch=('x86_64')
url="https://github.com/Azure/aks-desktop"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'cups'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
provides=('aks-desktop')
conflicts=('aks-desktop')
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Azure/aks-desktop/releases/download/v${pkgver}/aks-desktop-${pkgver}-linux-x64.tar.gz"
  "aks-desktop.png::https://raw.githubusercontent.com/Azure/aks-desktop/v${pkgver}/build/icons/aks-desktop.png"
  'aks-desktop.desktop'
)
sha256sums=(
  'a6d578964574d1d65accec5729c30e84bb58fa690a61bc1db027428dc976dc34'
  '8cab5c7d8b916bf4121585fbd92c566ec5479895d00342f2c8ae1d70c47a6e34'
  '6edafd8695f60f10f5c721fa4030cda7e2c26287ac35848f95f7e01266a31b9e'
)

package() {
  install -d "${pkgdir}/opt/aks-desktop"
  cp -a --no-preserve=ownership \
    "${srcdir}/aks-desktop-${pkgver}-linux-x64/." \
    "${pkgdir}/opt/aks-desktop/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/aks-desktop/aks-desktop "${pkgdir}/usr/bin/aks-desktop"

  install -Dm644 "${srcdir}/aks-desktop.desktop" \
    "${pkgdir}/usr/share/applications/aks-desktop.desktop"
  install -Dm644 "${srcdir}/aks-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/aks-desktop.png"
  install -Dm644 \
    "${srcdir}/aks-desktop-${pkgver}-linux-x64/resources/AKS_DESKTOP_LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
