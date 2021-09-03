# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-llvm-cov
pkgver=0.1.6
pkgrel=1
pkgdesc="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."
url="https://github.com/taiki-e/cargo-llvm-cov"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taiki-e/cargo-llvm-cov/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('01e689920744a545293c0da84e36ddd3a0a3bfd4bc227ebc0c4c4fbe744556534ae8eee3caafc03089496014a35bc357dc77bea11415000f473dac733aa06919')

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
