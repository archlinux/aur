# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-docs-rs
pkgver=0.1.6
pkgrel=1
pkgdesc="Imitate the documentation build that docs.rs would do"
arch=('x86_64')
url="https://github.com/dtolnay/cargo-docs-rs"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "Cargo.lock")
sha512sums=('8e1d5c952698837af8250feb181ac82a3e541067f585a717492ea653a31483fa1ee35441e9d4e66e6987db580b1527d7eb858b75739bef212ac598a61c07db72'
            '3fbbb23d667f49974ad66117114a84e3ff53f67bd771ce720682303acf93b5bb4030e9ba65b97718196aa6c98adfb298038be5be5e35f93a3bc90b780fcec54f')

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
