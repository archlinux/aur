# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=3.34
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="https://vulkan.gpuinfo.org/"
license=('LGPL-3.0-or-later')
depends=('vulkan-icd-loader' 'qt5-x11extras')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
replaces=("${pkgname%-*-*}-bin")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
sha256sums=('57e4832d31439536e949a41af6b904d5969fc07e54ba5855201c072be659e4d6')

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
