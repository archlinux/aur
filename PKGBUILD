# Maintainer: Charlie <c44014189@gmail.com>

pkgname=2048-rs
_pkgname=game-2048
pkgver=0.5.1
pkgrel=1
pkgdesc="A very pretty CLI implementation of the popular 2048 game written in Rust"
url="https://github.com/pierrechevalier83/2048-rs"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('ce3f98ac1bce117a108d93e7d87b9911f3df82f3d1a49abe197366cb0fd28981')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  # Changed from $pkgname to $_pkgname
  cd "$srcdir/$_pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  cargo build --offline --release --all-features
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  
}
