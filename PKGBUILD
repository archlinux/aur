# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=replaywebpage
pkgname=$_pkgname-bin
pkgver=2.5.5
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
sha512sums=('ad43889258fd4a3d7ffd457fe313940d7a6f2eff6f95c1a71be40f2090303d2243244cb282c089df98d81aa18114a10b3cd861cc2c810e5a96b786544992e004')

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
