# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=4.02
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'qt5-x11extras'
  'vulkan-icd-loader'
)
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
sha256sums=('9695992ade2913c76f8458319ef2a4dd79e4c7dfe645759a4940ae72a4424ab7')

prepare() {
  chmod +x "vulkancapsviewer_${pkgver}_linux64.AppImage"
  ./"vulkancapsviewer_${pkgver}_linux64.AppImage" --appimage-extract
}

package() {
  cd squashfs-root
  install -Dm755 usr/bin/vulkanCapsViewer -t "$pkgdir/usr/bin/"
  install -Dm644 usr/share/applications/vulkanCapsViewer.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
}
