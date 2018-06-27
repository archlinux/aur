# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_compare
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Generation of comparison functions from types"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_compare"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_compare/archive/v${pkgver}.tar.gz")
md5sums=('3df1a90fc90d180b1f96cdd30e64145d')

build() {
  cd "${srcdir}/ppx_compare-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_compare-${pkgver}"

  #export OPAMROOT="${srcdir}/.opam"
  #opam init -n
  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
