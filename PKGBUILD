# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-make
pkgver=0.35.1
pkgrel=1
pkgdesc="Rust task runner and build tool"
arch=('x86_64')
url="https://github.com/sagiegurari/cargo-make"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('1014f2aad05883f4f95ce0acfc674428547fb26d7990ad4dc3295157f281a496ec6ee2ca178e430c7332fe5a5db403faeffff7f1e72a81cca4c0b0d956f61bf7')

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
