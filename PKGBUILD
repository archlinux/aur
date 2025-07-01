# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-chef
pkgver=0.1.72
pkgrel=1
pkgdesc='A cargo-subcommand to speed up Rust Docker builds using Docker layer caching'
arch=(x86_64)
url="https://github.com/LukeMathWalker/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('2c0b893894d2c85f03b68a9eb0ee8a9728a0f87cc20ad17752e60ef0550b4179e509954a3561d4a1fa00a67fcd940e97328bb0b5af83946268e8e0666edcf1e3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
