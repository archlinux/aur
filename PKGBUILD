# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=4.10
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
sha256sums_x86_64=('7953f357e781bb039021ce35d78c9f2440d217c93a99577f45ed9ddc1eee09dc')
sha256sums_aarch64=('dfffd3b8497de7147fdb3b927cbf169f1f7ca0fb1824a3be6bf93a3c8d931cd9')

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
