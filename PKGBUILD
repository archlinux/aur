# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=todoist-rs
pkgver=0.0.6
pkgrel=1
pkgdesc="terminal client for Todoist"
arch=("x86_64")
url='https://github.com/illiteratewriter/todoist-rs'
license=('MIT')
depends=(gcc-libs openssl glibc)
makedepends=("rust" "cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/illiteratewriter/todoist-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50ba6dedb5b91c5f38dfd107dabbe236bd0a3a658f39d9fe1b77132548ee2f1f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/todoist" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  #install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname-$pkgver/LICENSE" -- does not exist in current release tag
}

# vim:set ts=2 sw=2 et:
