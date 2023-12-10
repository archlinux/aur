# Maintainer: Cosmic <CosmicHorrorDev@pm.me>

pkgname=samply
pkgver=0.11.0
pkgrel=1
pkgdesc="A command-line sampling profiler for macOS and Linux"
url="https://github.com/mstange/samply/"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('95c1d473f1a8b57173e6e2f4887024ea9a412991f72b9ca126a509df6ededd304d77be236d23ca7f7b540bb099cfc1d1f975357b95063a5bd9f6b16a6fce2458')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
