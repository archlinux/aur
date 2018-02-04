# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=coinmon
pkgver=0.0.19
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("coinmon-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("${source[@]%%::*}")
sha512sums=('1dcdb9f0f5c8f9f85dc00d7bd540019639a692cef797947861feea02d2ad8fa1da5da8f99fbe15f1b0bf7f38fe3784a3a6350d1349b7772f0f46a6b0c3d34f06')

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
