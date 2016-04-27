# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop
pkgver=0.3.3
pkgrel=2
pkgdesc="Streaming torrent client."
arch=('x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
makedepends=('npm')
conflicts=('webtorrent-desktop-git' 'webtorrent-desktop-bin')
source=("https://github.com/feross/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('82972f1e1a5ebbef5e7097bba5bfe6320204c1e249e40f67b5d5938ae5644252')

build() {
  cd "$pkgname-$pkgver"

  sed -i "/'build-version'/d" bin/package.js

  npm run package -- linux zip
}

package() {
  cd "$pkgname-$pkgver/dist"

  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-x64" "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/WebTorrent" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "WebTorrent-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

