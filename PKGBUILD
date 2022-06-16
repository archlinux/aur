# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=taplo-cli
pkgver=0.6.6
pkgrel=1
pkgdesc="A TOML toolkit written in Rust."
arch=('x86_64')
url="https://taplo.tamasfe.dev/cli"
license=('MIT')
depends=('openssl' 'glibc' 'gcc-libs')
makedepends=('cargo')
provides=("${pkgname%-cli}")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('432bd0334076d5a28ec5c7b63489e394aaf569da1a63bb6b425820e1a12cf1de')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-cli}"
}
