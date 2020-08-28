# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-udeps
pkgver=0.1.14
pkgrel=1
pkgdesc="Cargo plugin to find unused dependencies in Cargo.toml "
url="https://github.com/est31/cargo-udeps"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/est31/cargo-udeps/archive/v${pkgver}.tar.gz)
sha512sums=('b7f14c1c37d015a5be67b92bfca89be0aadf4254552be6ae7c6db55376507ee4e78d208be08bc2abc655e5e21c0f53f898701adf4ecf69b4c0a9a31042a17a95')

build() {
  cd "cargo-udeps-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "cargo-udeps-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "cargo-udeps-${pkgver}"
  install -Dm755 \
    "target/release/cargo-udeps" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
