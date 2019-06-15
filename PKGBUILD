# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.15.0
pkgrel=1
pkgdesc='A Crystal web framework that catches bugs for you, runs incredibly fast, and helps you write code that lasts.'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('e4263f198f930d0ed8e6942959ddf018f6b04a393bcbca10317e347b39449d44')

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
