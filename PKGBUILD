# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-public-api
pkgver=0.22.0
pkgrel=1
pkgdesc="List and diff the public API of Rust library crates"
arch=('x86_64')
url="https://github.com/Enselic/cargo-public-api"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('63ce8d0be795eb222f9292c5dd6267feb5f78015f38d4bb16d9546f29cd3fa722cc4bff0c31fff1fb674f82017ef4060243f038ac5b9b9ebf08bdf2dacc911eb')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

# tests require nightly
#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
