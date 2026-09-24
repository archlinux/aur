# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=fb2-clean
pkgver=0.5.1
pkgrel=1
pkgdesc="Simple CLI utility to remove images from fb2 books."
arch=("x86_64" "aarch64")
url="https://github.com/nujievik/fb2-clean"
license=("MIT OR Apache-2.0")
depends=("zstd")
makedepends=("rust" "pkgconf" "zstd")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba0a619649ba999ae3759531e4ef80d56334b925a112cb7702531454332e1380')

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
