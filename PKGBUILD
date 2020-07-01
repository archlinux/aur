# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.23.0
pkgrel=1
pkgdesc='A web framework written in Crystal'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
conflicts=('lucky-git')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('3a45569d7e5cae2f09fbd6ff42e91098f54b4d77c27f04df2c66479cd4c18f7d')

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
