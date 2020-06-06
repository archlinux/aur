# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-udeps
pkgver=0.1.12
pkgrel=1
pkgdesc="Cargo plugin to find unused dependencies in Cargo.toml "
url="https://github.com/est31/cargo-udeps"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/est31/cargo-udeps/archive/v${pkgver}.tar.gz)
sha512sums=('b493cdfc9a42c9d252983cb8885edcc30a639338b0267a411a364cfa41558b97e1219fe10aeacb58e5d2fa4fdbcce123b1d778c80230a16d7790e2c8ea9892f9')

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
