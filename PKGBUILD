# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-depgraph
pkgver=1.2.0
pkgrel=1
pkgdesc="Cargo plugin that builds dependency graphs using cargo metadata and graphviz."
url="https://sr.ht/~jplatte/cargo-depgraph/"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=(${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~jplatte/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('25910dc1524cc03107fbe9be9cf6ef3278e0be363bfc29dd2cc969b87a7899bc28ac1b6af71460332ae27884e3ffc3524ac836d288be0c9fae97fd328a1fa822')

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
