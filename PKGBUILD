# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=webtorrent-cli
pkgver=4.0.1
pkgrel=1
pkgdesc="The streaming torrent client. For the command line."
arch=(any)
url="https://webtorrent.io"
license=(MIT)
depends=(nodejs)
makedepends=(git npm)
provides=(webtorrent)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/webtorrent/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('6fbbf95948f8b3f49a0a1d646fe2a5c1d167a211eaedc218131121e5e4a6da92')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  npm install --production
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a bin node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s '/usr/lib/webtorrent-cli/bin/cmd.js' "$pkgdir/usr/bin/webtorrent"
}
