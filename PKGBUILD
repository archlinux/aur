# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=webtorrent-cli
pkgver=3.5.0
pkgrel=1
pkgdesc="The streaming torrent client. For the command line."
arch=('any')
url="https://webtorrent.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('webtorrent')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/webtorrent/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('6e76291791364472c4d248198da16b08fe90fb2b05f6500d243dfbf24690d1f6')

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
