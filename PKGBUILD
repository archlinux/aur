# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passepartui
pkgver=0.1.3
pkgrel=1
pkgdesc="A TUI for pass"
arch=('x86_64')
url="https://github.com/kardwen/passepartui"
license=('MIT')
depends=('gcc-libs' 'pass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('97b86ecb6dfd3f545460246c1ca6084702acd531e3b3ec5f2acf5722ae6ea087a5425353ac42bcd2b3c2dbaa2155f65781a96a49ee6ef3983f444dc032b0fb4f')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
