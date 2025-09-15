# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=replaywebpage
pkgname=$_pkgname-bin
pkgver=2.3.18
pkgrel=1
pkgdesc='Serverless Web Archive Replay'
url='https://github.com/webrecorder/replayweb.page'
license=('AGPL3')
arch=('x86_64')
depends=('glibc' 'fuse2' 'xdg-desktop-portal' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/webrecorder/replayweb.page/releases/download/v${pkgver}/ReplayWeb.page-${pkgver}.AppImage")
sha512sums=('9986e34bbdcc9efdff8cd4d738fb159ed3724aa0c06c31cb4f7040d1b6993100a61be3447bfa92e2540ea6f9d6689d1dd80209285ff300af593e74a3c9fe5ad5')

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 ReplayWeb.page-${pkgver}.AppImage
  ./ReplayWeb.page-${pkgver}.AppImage --appimage-extract
}

package() {
  install -Dm644 squashfs-root/replaywebpage.png "$pkgdir/usr/share/pixmaps/replaywebpage.png"
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|^Exec=.*|Exec=replaywebpage|g' squashfs-root/replaywebpage.desktop > "$pkgdir/usr/share/applications/replaywebpage.desktop"
  install -Dm755 ReplayWeb.page-${pkgver}.AppImage "$pkgdir/usr/bin/replaywebpage"
}
