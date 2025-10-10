# Maintainer: minomy13 <mail@minomy13.com>

pkgname=nerdfetch-rs
pkgver=1.2.2
pkgrel=1
pkgdesc="A minimal, fast system fetch tool - rewritten in Rust for speed, clarity, and configurability."
arch=('x86_64')
url="https://github.com/minomy13/nerdfetch-rs"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("SKIP")

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo update
  cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
