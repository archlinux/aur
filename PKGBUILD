# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='A GUI to do stuff with the Analogue Pocket'
url='https://github.com/neil-morrison44/pocket-sync'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/neil-morrison44/pocket-sync/releases/download/v${pkgver}/pocket-sync_${pkgver}_amd64.AppImage")
sha512sums=('dd5c541c6f1568cc5de707971d6daf60711b38fab13a96c017c89f16e4c9cc089a834a47e9c43f215398f10684cb7a8297025226580d8eb1b65c8c61458b496d')

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 pocket-sync_${pkgver}_amd64.AppImage
  ./pocket-sync_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256@2/apps/pocket-sync.png "$pkgdir/usr/share/pixmaps/pocket-sync.png"
  install -Dm644 squashfs-root/usr/share/applications/pocket-sync.desktop "$pkgdir/usr/share/applications/pocket-sync.desktop"
  install -Dm755 pocket-sync_${pkgver}_amd64.AppImage "$pkgdir/usr/bin/pocket-sync"
}
