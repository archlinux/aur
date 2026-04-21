# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=amnesia
pkgdesc='ram only secure notepad'
pkgver=1.2.0
pkgrel=1
arch=(x86_64)
license=('MIT')
url='https://github.com/Laticee/amnesia'
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72a2ae59fcedb565775d2ecccb9eae01d97ee427d6ebd63d9024294ddfc4a255')

prepare() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

