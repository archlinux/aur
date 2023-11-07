# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=html-query
pkgver=1.2.0
pkgrel=1
pkgdesc="jq, but for HTML"
arch=('x86_64')
url="https://github.com/orf/html-query"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgname-v$pkgver.tar.gz")
sha512sums=('006fd4e0aafad83e997f70c46bb9630b2158ce0868652c6c2a983809ee661f7a3b476739a8fa8f8c9605ccde888ae8d51e467d86deebe7853859d8962ca67b85')

prepare() {
  mv "$pkgname-$pkgname-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
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
  install -Dm 755 "target/release/hq" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
