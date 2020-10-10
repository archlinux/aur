# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-udeps
pkgver=0.1.15
pkgrel=1
pkgdesc="Cargo plugin to find unused dependencies in Cargo.toml "
url="https://github.com/est31/cargo-udeps"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/est31/cargo-udeps/archive/v${pkgver}.tar.gz)
sha512sums=('8487c9551364552374621dd612f9dbff3e45b5b23b3cd24e50ad4c476f15c2954a17abdc34ebee0e3e0e3ee6c54306837e5125d56978d686aa1e2c3c3f2e223f')

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
