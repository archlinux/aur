# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=fb2-clean
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI utility for clean fb2 files."
arch=("x86_64" "aarch64")
url="https://github.com/nujievik/fb2-clean"
license=("MIT OR Apache-2.0")
depends=("zstd")
makedepends=("rustup" "pkgconf" "zstd")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("831217b5bb48c00ade9ab7b7f3788cbe69014af894ced69a0dd1be22e9a3c57a")

build() {
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
