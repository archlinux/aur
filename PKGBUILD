# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=himalaya
pkgver=0.3.2
pkgrel=1
pkgdesc="Minimalist CLI email client, written in Rust"
arch=('x86_64')
url="https://github.com/soywod/himalaya"
license=('BSD')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2da64034df53351b856d413c82155c6171bdc7e814660645b5ae59e0fb1ea133f432da7c50591c6a205a31952baccd328867b885ec7e59df7746e96d4ed9d0ce')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
