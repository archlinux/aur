# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=replaywebpage
pkgname=$_pkgname-bin
pkgver=2.3.12
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
sha512sums=('5bfb847c08417634abeb2b50b1fc3ec05c36fdb4ea6749775d9d710c43a6edab461834c6a3eb408737c0915bbe9f0b93637988b1f77cbb2a9b87c5952534ccb4')

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
