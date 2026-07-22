# Maintainer: lightjunction

pkgname=douyin-cli
pkgver=2026.7.22
pkgrel=1
pkgdesc='Rust CLI for Douyin OpenAPI and web workflows'
arch=('x86_64')
url='https://github.com/LIghtJUNction/douyin'
license=('AGPL-3.0-or-later')
options=('!lto')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('rust' 'clang' 'cmake')
checkdepends=('nodejs')
optdepends=('nodejs: webpage crawling and comment collection')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('e92bd33bad514d264aed943d4e74b4c36cd87dcaa59137a4dbd5dd7222abc322')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 target/release/douyin "$pkgdir/usr/bin/douyin"
  install -Dm0644 README.md USAGE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
