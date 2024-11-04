# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=replaywebpage
pkgname=$_pkgname-bin
pkgver=2.2.1
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
sha512sums=('01aaa24cf88438f0e70ae22eb9b72990de7d370700733bf0052bfd96960a3ccd2d1f16ff961f5d59b5754edfd752b5cd6ed62b1988768bd4eb1592e382dfc402')

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
