# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-bin_prot
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="A binary protocol generator"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/bin_prot"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_compare' 'ocaml-ppx_custom_printf' 'ocaml-ppx_fields_conv' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_variants_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/bin_prot-v${pkgver}.tar.gz")
md5sums=('64495e0e88fe7cccba6e66b0deaef283')

build() {
  cd "${srcdir}/bin_prot-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/bin_prot-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/lib/ocaml/stubslibs" "${pkgdir}/usr/lib/ocaml/stublibs" # bug in opam
}
