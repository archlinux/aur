# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=regex-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A command line tool for debugging, ad hoc benchmarking and generating regular expressions for Rust's regex crate"
url="https://github.com/rust-lang/regex"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('46f07048a70592e19898589de97970b2ab0b92f4710036f87cccef0b65ea04906e17b10ec363ca1bbf5bf59daf11ee6ce5531e798d1016b80cf84e829020d404')

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
