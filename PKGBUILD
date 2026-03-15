# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=rtree
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, colorful tree with live-search TUI"
arch=('x86_64')
url="https://github.com/marcusbandit/rtree"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e1454c9aaf77569c0e0057209f7afb64b88fba91f0455a3f3d8d456f708780f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
