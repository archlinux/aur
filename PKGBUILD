# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=fb2-clean
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI utility for clean fb2 files. "
arch=("x86_64")
url="https://github.com/nujievik/fb2-clean"
license=("MIT OR Apache-2.0")
depends=("zstd")
makedepends=("rustup" "pkgconf" "zstd")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("1d03a0092be8f84bca5a22a7e1d974f7f8633355ae2eca4e04455c632738c03f")

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
