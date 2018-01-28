# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=coinmon
pkgver=0.0.16
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("coinmon-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("${source[@]%%::*}")
sha512sums=('5587ad1a0842bd10644acb04a41e3a251804bb01d4f4f02ed0e855fbd7a4bf1e7c670f4599540c9150e84479a3b7498ffcc7a53e8394ba6cd88a8969229ea02c')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tar.gz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/coinmon
  mv usr/lib/node_modules/coinmon/LICENSE usr/share/licenses/coinmon/
  rmdir usr/etc
  rm usr/lib/node_modules/coinmon/{.,}* | true
  chmod 755 usr/bin
  find usr/lib/node_modules/coinmon/node_modules -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
