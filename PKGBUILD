# Maintainer: Lucas Rooyakkers <lucas.rooyakkers@pm.me>

pkgname=aodv
pkgver=0.2.0
pkgrel=1
pkgdesc="Userspace RFC 3561 ad hoc routing control-plane daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/Fierthraix/aodv-rs"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('d25aef1a5156e85433a9a2d321669eabfa476b9811682088f38aaa7fec23e421')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
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
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-targets --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/aodv" "$pkgdir/usr/bin/aodv"
}
