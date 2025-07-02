# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-wayland-bin
pkgver=4.02
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'qt5-wayland'
  'vulkan-icd-loader'
)
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_wayland.AppImage")
sha256sums=('ae0711f2366c80c6510ba7236dad5d78afa3c798f6b7f18363ffb4c438ef081e')

prepare() {
  chmod +x "vulkancapsviewer_${pkgver}_linux64_wayland.AppImage"
  ./"vulkancapsviewer_${pkgver}_linux64_wayland.AppImage" --appimage-extract
}

package() {
  cd squashfs-root
  install -Dm755 usr/bin/vulkanCapsViewer -t "$pkgdir/usr/bin/"
  install -Dm644 usr/share/applications/vulkanCapsViewer.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
}
