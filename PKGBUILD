# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=regex-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="A command line tool for debugging, ad hoc benchmarking and generating regular expressions for Rust's regex crate"
url="https://github.com/rust-lang/regex"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('9caaf162ef45b55a5091b2d02551eee785281f52d303d06f29bb1de14e5e11cdf3248c599335f80e820908cd2cdd84180f6751da48a191bcd17b3442bf3b03a1')

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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
