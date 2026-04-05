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
sha256sums=('266d9c1f2a4972a26e3336d158814f8280660c1a7f80a80c811fa48dcc609081')

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
