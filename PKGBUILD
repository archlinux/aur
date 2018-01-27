# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=coinmon
pkgver=0.0.15
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("coinmon-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("${source[@]%%::*}")
sha512sums=('fca73a0dd1eb8ec6296da58671b8bcb2e86eeb5dc433b20e49e75abd2b57941d1bcdca513ea1c6b7049ac4751ede7eb306866b1527e049f75848e32ee9d0cdfb')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tar.gz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/coinmon
  mv usr/lib/node_modules/coinmon/LICENSE usr/share/licenses/coinmon/
  rmdir usr/etc
  rm usr/lib/node_modules/coinmon/{.,}* | true
  chmod 755 usr/bin usr/lib/node_modules/coinmon/node_modules{,/commander/typings}
}

# vim:set ts=2 sw=2 et:
