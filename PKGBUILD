# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=3.31
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="https://vulkan.gpuinfo.org/"
license=('LGPL3')
depends=('vulkan-icd-loader' 'qt5-x11extras')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
replaces=("${pkgname%-*-*}-bin")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
sha256sums=('98e3dd4c26038aa962d1763bccf3d59964e9bcf351ec81d8d278b248cedb423f')

prepare() {
  chmod +x *.AppImage
  ./*.AppImage --appimage-extract
}

package() {
  cd "$srcdir/squashfs-root"
  install -Dm755 usr/bin/vulkanCapsViewer -t "$pkgdir/usr/bin"
  install -Dm644 usr/share/applications/vulkanCapsViewer.desktop -t \
    "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}
