# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jürgen Hötzel

pkgname=ocaml4-camlp-streams
pkgver=5.0.1
pkgrel=2
pkgdesc="The Stream and Genlex libraries for use with Camlp4 and Camlp5."
arch=(x86_64)
url="https://github.com/ocaml/camlp-streams"
license=(BSD)
makedepends=(dune)
depends=(ocaml4 ocaml4-compiler-libs)
conflicts=(ocaml-camlp-streams)
options=(!strip)
source=("camlp-streams-${pkgver}.tar.gz::https://github.com/ocaml/camlp-streams/archive/v${pkgver}.tar.gz")
sha256sums=('ad71f62406e9bb4e7fb5d4593ede2af6c68f8b0d96f25574446e142c3eb0d9a4')

build() {
  cd "${srcdir}/camlp-streams-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/camlp-streams-${pkgver}"
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir="$(ocamlc -where)"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
