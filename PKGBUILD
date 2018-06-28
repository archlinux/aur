# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_conv
pkgver=0.11.2
pkgrel=1
epoch=1
pkgdesc="Generation of S-expression conversion functions from type definitions"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_sexp_conv"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_sexp_conv/archive/v${pkgver}.tar.gz")
md5sums=('77d3b30b3d9c5810552bde2027656b8d')

build() {
  cd "${srcdir}/ppx_sexp_conv-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_sexp_conv-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
