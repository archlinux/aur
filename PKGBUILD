# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-udeps
pkgver=0.1.17
pkgrel=1
pkgdesc="Cargo plugin to find unused dependencies in Cargo.toml "
url="https://github.com/est31/cargo-udeps"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/est31/cargo-udeps/archive/v${pkgver}.tar.gz)
sha512sums=('a4a6941501ba5c144d1f433f747553fd9af3565b7409baf6c7a29dbea6a6169a47e8aeadbf6a19199cb3b994980c18532fc14cd6f71e038ebb4e8abb687d5c62')

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
