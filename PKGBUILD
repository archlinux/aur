# Maintainer: kotontrion <kotontrion@kotontrion.net>

pkgname=valafmt
pkgver=0.3.0
pkgrel=1
pkgdesc='An opinionated code formatter for the Vala programming language'
url='https://github.com/Aylur/valafmt'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('9378a6e12675b649d5270f4e4eec35e2dea6d25fcf9f5067cfb133672a7741c7')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
