# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=webtorrent-cli
pkgver=5.0.0
pkgrel=1
pkgdesc="The streaming torrent client. For the command line."
arch=(any)
url="https://webtorrent.io"
license=(MIT)
depends=(nodejs)
makedepends=(git npm)
provides=(webtorrent)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/webtorrent/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('a68601586d8e9d847b43578b9889437987340722525d9d8a2580ea21bb9fe5e3')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  npm install --omit=dev
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a bin node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s '/usr/lib/webtorrent-cli/bin/cmd.js' "$pkgdir/usr/bin/webtorrent"
}
