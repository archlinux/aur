# Maintainer: Your Name <your_email at domain dot tld>
pkgname=mdbook-rss-feed
pkgver=1.3.1  # Update to current version
pkgrel=1
pkgdesc='mdbook preprocessor that generates a full-content RSS 2.0, Atom, and JSON feeds'
url='https://github.com/saylesss88/mdbook-rss-feed'
license=('Apache-2.0')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('5fb1799cfc72ba4933e21200b030a639f59a83d181faca227c2f4ecde735588c844cb92ca49f591feffca1260ea10f40067bd8c1f6646112085e8e24225e29d5')

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

