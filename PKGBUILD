# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-llvm-cov
pkgver=0.4.14
pkgrel=1
pkgdesc="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."
url="https://github.com/taiki-e/cargo-llvm-cov"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taiki-e/cargo-llvm-cov/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('26af74aeefb59231b2c1722d0fedfce1f3000592585bb595e61738d1df534899b622d7310d3bb49ed95494b735688b5c8260720a0b062773ede303df55988f35')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release #--locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 \
    "target/release/cargo-llvm-cov" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
