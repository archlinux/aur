# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=1.7.0
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
sha512sums=('684fe6388e800fb44ba4d96eea8670a87973d114803c895889fc93ff38a995f6f265c17400d650a946a0950fb9adbb554db418b9d1b2f11d2aef13e22cff2d26')

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
