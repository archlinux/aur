# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.24.0
pkgrel=1
pkgdesc='A web framework written in Crystal'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
conflicts=('lucky-git')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('03591c52b48c6abf1af60f95623d5f4646a139537016a71508f2d226c7a1fb48')

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
