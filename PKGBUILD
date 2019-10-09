# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.18.0
pkgrel=1
pkgdesc='A web framework written in Crystal'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
conflicts=('lucky-git')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('cf3168acae10fc79141b0a7c1baf87672f0c4c81c31768a94e62ade0f3faf812')

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
