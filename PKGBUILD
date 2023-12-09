# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-docs-rs
pkgver=0.1.5
pkgrel=1
pkgdesc="Immitate the documentation build that docs.rs would do"
arch=('x86_64')
url="https://github.com/dtolnay/cargo-docs-rs"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "Cargo.lock")
sha512sums=('b8d65441f193e557d224fcbb6293031f1a95ca9300402bc8821897a58c9c1b1cd2e09e6c8598a4424b3c99948f674c4b22929e74fa8eb875c5c67d59f62aa8f1'
            'ed23f3c8c311ea6f97eb975affd1a47972449d9b0b656b1b0c8e80fb95c25d02ffecdf6720eae625b5435a531f15890c6aadcb51ab0ccf8372835d08c36d02e9')

prepare() {
  cd "$pkgname-$pkgver"
  cp "$srcdir/Cargo.lock" .
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
