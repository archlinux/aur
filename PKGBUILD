# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky
pkgver=0.10.0
pkgrel=1
pkgdesc='A web framework written in Crystal that helps you build apps quickly, catches bugs for you, and runs incredibly fast'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
source=("lucky_cli-$pkgver.tar.gz::https://github.com/luckyframework/lucky_cli/archive/v$pkgver.tar.gz")
sha256sums=('614e23574b9643290f1edea32aa69e6f89b5e2d3c3952234ef4d80c7e00a3f9b')

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
