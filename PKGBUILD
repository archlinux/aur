# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-wayland-bin
pkgver=4.13
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'qt6-base'
  'vulkan-icd-loader'
  'wayland'
)
provides=('vulkan-caps-viewer')
conflicts=('vulkan-caps-viewer')
source_x86_64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_wayland.AppImage")
source_aarch64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_wayland_aarch64.AppImage")
sha256sums_x86_64=('f742ae883433e638f574a73f8c5bb48b6e0d4c9fbf3e90dd9c5df50f0542a3d1')
sha256sums_aarch64=('4dedcf6e4138a5caa6648c2d09753e2cc675aa00388b906e2144d33a013f9ea1')

prepare() {
  if [ $CARCH == "aarch64" ]; then
    chmod +x "vulkancapsviewer_${pkgver}_linux64_aarch64.AppImage"
    ./"vulkancapsviewer_${pkgver}_linux64_aarch64.AppImage" --appimage-extract
  else
    chmod +x "vulkancapsviewer_${pkgver}_linux64_wayland.AppImage"
    ./"vulkancapsviewer_${pkgver}_linux64_wayland.AppImage" --appimage-extract
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
