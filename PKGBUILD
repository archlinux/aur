# Maintainer: Your Name <saylesss87@proton.me at domain dot tld>
pkgname=mdbook-rss-feed
pkgver=2.0.0  # Update to current version
pkgrel=1
pkgdesc='mdbook preprocessor that generates a full-content RSS 2.0, Atom, and JSON feeds'
url='https://github.com/saylesss88/mdbook-rss-feed'
license=('Apache-2.0')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('3380613f465370a879cb9b429dfc815d35932afbcf22777e8782bd077d32932d49657be428fe3ba1c8bdb8b9269f60effe18c73d82771f4a0bc432a7322d0bcd')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

