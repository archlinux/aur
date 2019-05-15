# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_variants_conv
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Generation of accessor and iteration functions for ocaml variant types"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_variants_conv"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-variantslib' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_variants_conv/archive/v${pkgver}.tar.gz")
sha512sums=('4ec3f91bc18699b6825d7a4942c92786cabdfe44a67e14ef14329cbaa3b7b2ee7076b26acfd322f8048fe49f5f9ae029d194b181b2f1b00643fb0c4fc5f4b40d')

build() {
  cd "${srcdir}/ppx_variants_conv-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_variants_conv-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
