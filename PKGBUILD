# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_hash
pkgver=0.11.1
pkgrel=1
pkgdesc="A ppx rewriter that generates hash functions from type expressions and definitions"
arch=('x86_64')
url='https://github.com/janestreet/ppx_hash'
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_compare' 'ocaml-ppx_sexp_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_hash/archive/v${pkgver}.tar.gz")
md5sums=('48dfe890e195808ccdae0a7261bbb17d')

build() {
  cd "${srcdir}/ppx_hash-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/ppx_hash-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
