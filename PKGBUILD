# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.9.2
pkgrel=1
pkgdesc='A web framework written in Crystal that helps you build apps quickly, catches bugs for you, and runs incredibly fast'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('69ac17c07a531528ebba61e2c6149c7f8a6eedc2f130d0c089e734cc0cefa1df')

build() {
  cd "lucky_cli-$pkgver"
  crystal deps
  crystal build src/lucky.cr --release --no-debug
}

package() {
  cd "lucky_cli-$pkgver"
  install -Dm755 lucky "$pkgdir/usr/bin/lucky"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
