# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-depgraph
pkgver=1.1.2
pkgrel=1
pkgdesc="Cargo plugin that builds dependency graphs using cargo metadata and graphviz."
url="https://sr.ht/~jplatte/cargo-depgraph/"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=(https://git.sr.ht/~jplatte/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('6050d0ff712dcea5e00401d658a164b64ac734337b71589acf68ab825c3613e2ec182ede7fb38b1b8cb7635137da45f8e0688c9a9433c68b06fc654d14d8b214')

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
