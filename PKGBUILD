# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=3.9.3
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
sha512sums=('6f94c687250a3a4c893a72ba20f50ab0dad53eaf799828cd1b751e7edcb3d0a37d4b5f56eb54350cf620ff4db255345b6590ec6fbf5bd976bb86abe8aa896124')

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
