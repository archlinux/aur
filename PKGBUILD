# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=systemd_http_health_check
pkgver=0.1.0
pkgrel=3
pkgdesc="A companion daemon to notify systemd about the health of a HTTP server" 
arch=('x86_64')
url="http://github.com/jhass/systemd_http_health_check"
license=('BSD')
depends=('systemd-libs' 'gc' 'libevent' 'pcre')
makedepends=('crystal' 'shards')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jhass/systemd_http_health_check/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
  shards install
}

build() {
  cd "$pkgname-$pkgver"
  shards build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('e999136e262c7f7896940af5718ad14f114bcf204c3bc1df1ce39ac4d27cdf90')
