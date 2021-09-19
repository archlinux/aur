# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-llvm-cov
pkgver=0.1.7
pkgrel=1
pkgdesc="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."
url="https://github.com/taiki-e/cargo-llvm-cov"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taiki-e/cargo-llvm-cov/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1e33471b47c0ed7f6fd6caa4a7ee7b01d0e732792810de3f6dcc47a1319d6d605dda620814c14b322ed8f358853d9501e5fd01ddb85f110eabb1b42f7d08ed12')

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
