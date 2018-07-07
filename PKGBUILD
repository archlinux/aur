# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.11.0
pkgrel=1
pkgdesc='A Crystal web framework that catches bugs for you, runs incredibly fast, and helps you write code that lasts.'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('8883923ecce4b862b42099e90d027bebaf4d79bdd207c59af4fdb64a587301a9')

build() {
  cd "lucky_cli-$pkgver"
  shards install
  crystal build src/lucky.cr --release --no-debug
}

package() {
  cd "lucky_cli-$pkgver"
  install -Dm755 lucky "$pkgdir/usr/bin/lucky"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
