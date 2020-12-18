# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.25.0
pkgrel=1
pkgdesc='A web framework written in Crystal'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
conflicts=('lucky-git')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('4363b23000a519ac8aceb3b851fe4f40ac45b6a3a20ae11e79780fa9ee9ea1c6')

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
