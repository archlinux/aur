# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=4.12
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxcb'
  'qt6-base'
  'vulkan-icd-loader'
)
provides=('vulkan-caps-viewer')
conflicts=('vulkan-caps-viewer')
source_x86_64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
source_aarch64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_aarch64.AppImage")
sha256sums_x86_64=('1be15a8025d2474ee406ef1b6fdb9f29cf49aae71a3ca2b908439ff0e0339eee')
sha256sums_aarch64=('589fcbe96e948a4eb7037e05687f6a8fad0390632274de9ad3f13e77982a5d6a')

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
