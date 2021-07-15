# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=webtorrent-cli
pkgver=3.4.0
pkgrel=1
pkgdesc="The streaming torrent client. For the command line."
arch=('any')
url="https://webtorrent.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('webtorrent')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/webtorrent/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('d4a1016f544ba5e0f7985563cb3fb01fdfb8839504df7ea4d6dc3632fc330b6d')

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
