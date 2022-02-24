# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=3.2
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="http://vulkan.gpuinfo.org/"
license=('GPL2')
depends=('vulkan-icd-loader' 'qt5-x11extras')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
replaces=("${pkgname%-*-*}-bin")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
sha256sums=('cbc6e6a146d861cc5f842570f0e6f94c76d42bc79de228d27f740293858a0e93')

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
