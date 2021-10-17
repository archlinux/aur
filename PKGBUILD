# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-llvm-cov
pkgver=0.1.9
pkgrel=1
pkgdesc="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."
url="https://github.com/taiki-e/cargo-llvm-cov"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taiki-e/cargo-llvm-cov/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d1ba46f9c0208758f7fe1bc6008e681bec93a7db5566fc0f857007586d448f35458832fa6a0c93e952e290189b10102a84fe07bb30bb1f2dc8dfb04b3a558f6b')

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
