# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.19.0
pkgrel=1
pkgdesc='A web framework written in Crystal'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
conflicts=('lucky-git')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('eb735f827e5084a5ac12e341196734bcf922ae8c5a79e51323ee0d4a07a02d75')

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
