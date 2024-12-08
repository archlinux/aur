# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-x11-bin
pkgver=4.00
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="https://vulkan.gpuinfo.org/"
license=('LGPL-3.0-or-later')
depends=('qt5-x11extras' 'vulkan-icd-loader')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
source=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64.AppImage")
sha256sums=('bfeb4349115eca2d1314e2abbe81969ab61e2f49e1458057c7e3e6a87fba32d6')

prepare() {
  chmod +x "vulkancapsviewer_${pkgver}_linux64.AppImage"
  ./"vulkancapsviewer_${pkgver}_linux64.AppImage" --appimage-extract
}

package() {
  cd squashfs-root
  install -Dm755 usr/bin/vulkanCapsViewer -t "$pkgdir/usr/bin/"
  install -Dm644 usr/share/applications/vulkanCapsViewer.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
}
