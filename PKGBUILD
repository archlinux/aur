# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=amnesia
pkgdesc='ram only secure notepad'
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
license=('MIT')
url='https://github.com/Laticee/amnesia'
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('b4957d0941dc3da4229b68b9567a4796a0e8fa966bed74089941ac46ca32839b')

prepare() {
  cd ${pkgname}-v.${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd ${pkgname}-v.${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}-v.${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-v.${pkgver}
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

