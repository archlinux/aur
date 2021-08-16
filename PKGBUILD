# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-make
pkgver=0.35.0
pkgrel=1
pkgdesc="Rust task runner and build tool"
arch=('x86_64')
url="https://github.com/sagiegurari/cargo-make"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a5323e144fd44f6045ac9431b9ade4ea5ddd508fa9ff27b2b92a657a008804e612ffdb8502fdcfeec4fc0df45b4d6684c93e572fcb0381f81bc21095e9e4bc83')

prepare() {
  # download dependencies
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
