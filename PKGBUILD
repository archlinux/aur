# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=coinmon
pkgver=0.0.20
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("coinmon-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("${source[@]%%::*}")
sha512sums=('523c22311da62c9b4b504c566b2e51f0d8a7d50195442ef662575ac6d05a0e37681b3ec53998dc54c233ed8caf9dd266e6776d89dc427cf1e269a4ddc658c6bd')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tar.gz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/coinmon
  mv usr/lib/node_modules/coinmon/LICENSE usr/share/licenses/coinmon/
  rmdir usr/etc
  rm usr/lib/node_modules/coinmon/{.,}* | true
  find -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
