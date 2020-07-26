# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-depgraph
pkgver=1.2.1
pkgrel=1
pkgdesc="Cargo plugin that builds dependency graphs using cargo metadata and graphviz."
url="https://sr.ht/~jplatte/cargo-depgraph/"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=(${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~jplatte/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('416403bbb33cac6aa178335baa69e962d7ca0905e86ad5903724a870aa77f38c4eb6ae9678d5942bf03aad9abc2143518e988508d0eefa434fcb00775956b049')

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
