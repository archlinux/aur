# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-wayland-bin
pkgver=3.34
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="https://vulkan.gpuinfo.org/"
license=('LGPL-3.0-or-later')
depends=('vulkan-icd-loader' 'qt5-wayland')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_wayland.AppImage")
sha256sums=('04491f51f708264cb0b8cab67c5dac84ccbf142f97d2ff36da6d32b1364bf202')

prepare() {
  chmod +x *.AppImage
  ./*.AppImage --appimage-extract
}

package() {
  cd squashfs-root
  install -Dm755 usr/bin/vulkanCapsViewer -t "$pkgdir/usr/bin"
  install -Dm644 usr/share/applications/vulkanCapsViewer.desktop -t \
    "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}
