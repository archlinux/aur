# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=4.02
pkgrel=2
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'qt5-x11extras'
  'vulkan-icd-loader'
)
provides=('vulkan-caps-viewer')
conflicts=('vulkan-caps-viewer')
source_x86_64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
source_aarch64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_aarch64.AppImage")
sha256sums_x86_64=('9695992ade2913c76f8458319ef2a4dd79e4c7dfe645759a4940ae72a4424ab7')
sha256sums_aarch64=('a5c0bca37122228911e5e7c004111540405dae9114dc262c735a02d9a27c7bd8')

prepare() {
  if [ $CARCH == "aarch64" ]; then
    chmod +x "vulkancapsviewer_${pkgver}_linux64_aarch64.AppImage"
    ./"vulkancapsviewer_${pkgver}_linux64_aarch64.AppImage" --appimage-extract
  else
    chmod +x "vulkancapsviewer_${pkgver}_linux64.AppImage"
    ./"vulkancapsviewer_${pkgver}_linux64.AppImage" --appimage-extract
  fi
}

package() {
  cd squashfs-root
  install -Dm755 usr/bin/vulkanCapsViewer -t "$pkgdir/usr/bin/"
  install -Dm644 usr/share/applications/vulkanCapsViewer.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
}
