# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-llvm-cov
pkgver=0.4.1
pkgrel=1
pkgdesc="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."
url="https://github.com/taiki-e/cargo-llvm-cov"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taiki-e/cargo-llvm-cov/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d0bacf1bcaeba80dde57c5774f517478aad4eff22f3eb93c4b2326c293f310a36d32184dec7222fd0011dffea6d0a259f9a62c7e5f87e672e35f520bb6e271bc')

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
