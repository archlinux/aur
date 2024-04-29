# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=4.8.0
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
sha512sums=('8befc24b7fbd60001cc0a7fe522992ae78edce53a31d1d815dae1b7813fa1de5f46d39cd38207df6127fbf734a66cb2293c3d6d4b2147fcc693327900336167e')

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
