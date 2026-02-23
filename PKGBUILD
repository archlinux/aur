# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=replaywebpage
pkgname=$_pkgname-bin
pkgver=2.4.3
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
sha512sums=('7f81f83ff21927ec3087b2053f4b936fc938738864c2450fee0c7b8fb41a568fad4fbe2b192749da2e8cd9768dd5c3db8b25400cde8b1c47261d7560d74e02eb')

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
