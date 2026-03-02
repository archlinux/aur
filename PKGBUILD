# Maintainer: sakaax <sakaax@github.com>
pkgname=memory-desktop-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Persistent cognitive layer for AI systems — desktop interface"
arch=('x86_64')
url="https://github.com/Sakaax/memory"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
)
provides=('memory-desktop')
conflicts=('memory-desktop')
source=(
  "memory_${pkgver}_amd64.deb::https://github.com/Sakaax/memory/releases/download/v${pkgver}/memory_${pkgver}_amd64.deb"
  "memory-desktop.desktop::https://raw.githubusercontent.com/Sakaax/memory/main/desktop/dist-assets/memory-desktop.desktop"
  "memory-desktop-128.png::https://raw.githubusercontent.com/Sakaax/memory/main/desktop/src-tauri/icons/128x128.png"
  "memory-desktop-32.png::https://raw.githubusercontent.com/Sakaax/memory/main/desktop/src-tauri/icons/32x32.png"
)
sha256sums=(
  '5650b6bd9357f6f141716e1539a16913103903b0448c557f4159c82cf43f8746'
  '1e2bb437df5fc47bbbbb6d98ebe345984a35ce7e0809281c3417f9f9b23b3982'
  '72bbd07c12014580f9e00e1108c704a9ff46d2a5dd215a6ec3c5f17f3549053c'
  'c95698b503684c81865d92c0fde91b56e888d5d995dbba38c7e51f1a4d9fe415'
)

package() {
  # Extract binary from .deb
  bsdtar xf "memory_${pkgver}_amd64.deb" data.tar.gz 2>/dev/null \
    || bsdtar xf "memory_${pkgver}_amd64.deb" data.tar.xz 2>/dev/null \
    || bsdtar xf "memory_${pkgver}_amd64.deb"
  bsdtar xf data.tar.* 2>/dev/null || true

  install -Dm755 "usr/bin/memory-desktop" "$pkgdir/usr/bin/memory-desktop"

  install -Dm644 "memory-desktop-128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/memory-desktop.png"
  install -Dm644 "memory-desktop-32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/memory-desktop.png"

  install -Dm644 "memory-desktop.desktop" \
    "$pkgdir/usr/share/applications/memory-desktop.desktop"
}
