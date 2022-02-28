# Maintainer: Giovanni Harting

pkgname=rvpk
_repo_name="rust-vpk"
pkgver=1.1.0
pkgrel=1
pkgdesc="Extract Valve VPK (V1 & V2) archives (and create V1 archives)"
arch=(x86_64)
url="https://github.com/panzi/rust-vpk"
license=('GPL')
depends=(gcc-libs fuse2)
makedepends=(cargo)
source=("https://github.com/panzi/rust-vpk/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2f62758e7a702044b14a4be121c284e9ad1911195c8b20ceb08285cb56271a1d42bf7f907c1534caf8e9669a8ba49965857c359dfdcdc11bd1d0a89d286a86ae')

prepare() {
  cd "$_repo_name-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_repo_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_repo_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_repo_name-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/rvpk
}

# vim:set ts=2 sw=2 et:
