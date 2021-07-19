# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rustbuster
pkgver=3.0.3
pkgrel=1
pkgdesc='A comprehensive web fuzzer and content discovery tool'
arch=('x86_64')
url="https://github.com/phra/rustbuster"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e7bc808b88e42d77b13e4b91cf64a3e9cd99a38702a1bf925aabe3ec1d7fa27f')
validpgpkeys=('91FF93D1B85D76B5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
