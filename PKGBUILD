# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=taplo-cli
pkgver=0.6.3
pkgrel=1
pkgdesc="A TOML toolkit written in Rust."
arch=('x86_64')
url="https://taplo.tamasfe.dev/cli"
license=('MIT')
depends=('openssl' 'glibc' 'gcc-libs')
makedepends=('cargo')
provides=("${pkgname%-cli}")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('4491db080515d9d5cc2b0f0cf27601cdddc31b7a36bd9533e0fd10a9aae7b774')

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
