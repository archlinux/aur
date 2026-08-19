# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=webtorrent-cli
pkgver=6.0.1
pkgrel=1
pkgdesc="The streaming torrent client. For the command line."
arch=(any)
url="https://webtorrent.io"
license=(MIT)
depends=('nodejs>=20')
makedepends=(git npm)
provides=(webtorrent)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/webtorrent/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('bb957d5a4bf6a34f80920ba07802718105e7376e1bd05d411ecb69f392f56f24263277ca0cf4a0a11c3204f87eea29c02873f808602fc46a63ae9aceffdb166f')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  npm install --omit=dev
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a bin node_modules package.json version.cjs "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s '/usr/lib/webtorrent-cli/bin/cmd.js' "$pkgdir/usr/bin/webtorrent"
}
