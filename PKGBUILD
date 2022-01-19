# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rathole
pkgver=0.3.8
pkgrel=1
pkgdesc="A reverse proxy for NAT traversal"
arch=('x86_64')
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('rust' 'libgit2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('924136362d5479df88823532e2901498e7e153c1cf1eadb85c2fedc178100a67')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
