# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=feedr
pkgdesc='A feature-rich terminal-based RSS/Atom feed reader written in Rust.'
pkgver=0.4.0
pkgrel=1
arch=(x86_64)
license=('MIT')
url='https://github.com/bahdotsh/feedr'
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5489f59667b99dea5b6b81062634b68a9563f55a3ea6bd40afd006be28ec127')

prepare() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
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

