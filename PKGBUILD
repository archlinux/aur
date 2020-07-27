# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-depgraph
pkgver=1.2.2
pkgrel=1
pkgdesc="Cargo plugin that builds dependency graphs using cargo metadata and graphviz."
url="https://sr.ht/~jplatte/cargo-depgraph/"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=(${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~jplatte/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('26ea057daa12c18f673097390d5de4c292543c052d29c2c2cfae429ad9cf95ed4ae8af286dc3e41dbfdacd25578d1d861426992019bb619aefa035177c1fc700')

build() {
  cd "${pkgname}-v${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-v${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm755 \
    "target/release/${pkgname}" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
