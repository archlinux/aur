# Maintainer: bigsparsh <sparshsingh7586@gmail.com>

pkgname=fileql
pkgver=0.1.0
pkgrel=1
pkgdesc="An interactive CLI application that implements a custom DSL for querying and manipulating files"
arch=('x86_64')
url="https://github.com/bigsparsh/fileql"
license=('MIT') # Update with your actual license if different
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bigsparsh/fileql/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dba73c92c580de6f493c8489fd9c0276f7b2c7c9251d720cf0765784719eb785')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/fileql"
}
