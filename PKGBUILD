# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-wayland-bin
pkgver=4.11
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
sha256sums_x86_64=('3d3f1a292547e1e351a35bc1b0a2809bb84472b6f1b19025613decdf6a0de7b0')
sha256sums_aarch64=('57c231dbcd5bfd8880e7242a1832ca98c7b1da979f7d8df3a3b982b56be1b1de')

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
