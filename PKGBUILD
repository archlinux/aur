# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lcov-diff
_pkgname=lcov-diff-util
pkgver=0.2.1
pkgrel=1
pkgdesc='Diff utility for LCOV coverage files'
arch=('x86_64')
url='https://github.com/capgelka/lcov-diff'
license=('MIT')
depends=('gcc-libs' 'lcov')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('17bc886295023d9bc95fac146e7498ff296d73cfadcd323654d72213276666edfc1dc2d853ce2dc4b7eb114051ae607fca6f077397788e8faccbdae788100818')
b2sums=('481a17145c72f1b23c398df4b65dd06d807941f16e06e4dbc6ea1590c41d156b1f1e15745ffa236640d3b57a8258af0e7b2b96e53370e4a3ddbedd943651b63c')

prepare() {
  cd "$_pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"

  cargo build --release --frozen --all-features
}

check() {
  cd "$_pkgname-$pkgver"

  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
