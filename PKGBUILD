# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-wayland-bin
pkgver=3.1
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="http://vulkan.gpuinfo.org/"
license=('GPL2')
depends=('vulkan-icd-loader' 'qt5-wayland')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_wayland.AppImage")
sha256sums=('41f0ba0004556d7cff7cd75a05cb47019d41d1074e300c0e0e552093476d6eca')

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
