# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop
pkgver=0.12.0
pkgrel=1
pkgdesc="Streaming torrent client."
arch=('i686' 'x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('gconf')
makedepends=('npm' 'git' 'zip')
conflicts=('webtorrent-desktop-git' 'webtorrent-desktop-bin')
source=("https://github.com/feross/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ba61b1b4b20ed11e98c522ba83384b3d61c7c3e349f457856ae99de1b524633e')

[ "$CARCH" = "i686" ]   && _platform=ia32
[ "$CARCH" = "x86_64" ] && _platform=x64

build() {
  cd "$pkgname-$pkgver"

  npm install
  npm run package -- linux --package=zip
}

package() {
  cd "$pkgname-$pkgver/dist"

  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-${_platform}" "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/WebTorrent" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "WebTorrent-linux-${_platform}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

