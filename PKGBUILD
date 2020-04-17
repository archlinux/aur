# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.6.6
pkgrel=1
pkgdesc="Cargo plugin for linting your dependencies"
url="https://github.com/EmbarkStudios/cargo-deny"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0e146c78380928d5e04c20d87127adc361d07f8413478ef19f8b4093851b0bb0e3564cb6e21505f065f6d90f8f23856370de27e838002992dda4a81d54f5fd51')

build() {
  cd "cargo-deny-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "cargo-deny-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "cargo-deny-${pkgver}"
  install -Dm755 \
    "target/release/cargo-deny" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
