# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=regex-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="A command line tool for debugging, ad hoc benchmarking and generating regular expressions for Rust's regex crate"
url="https://github.com/rust-lang/regex"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('7906b31770e41ba1d69905449af33b86fd10b140905c1babb34a30d018fe59ee18ea919f74205a9805a30eebecaccc5c0ddab24406d8f11892493ab727866554')

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
