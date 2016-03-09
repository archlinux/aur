# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_jane
pkgver=113.24.01
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Standard Jane Street ppx rewriters"
url="https://github.com/janestreet/ppx_jane"
depends=('ocaml' 'ocaml-ppx_assert' 'ocaml-ppx_bench' 'ocaml-ppx_bin_prot' 'ocaml-ppx_compare' 'ocaml-ppx_custom_printf' 'ocaml-ppx_driver' 'ocaml-ppx_enumerate' 'ocaml-ppx_expect' 'ocaml-ppx_fail' 'ocaml-ppx_fields_conv' 'ocaml-ppx_here' 'ocaml-ppx_inline_test' 'ocaml-ppx_let' 'ocaml-ppx_pipebang' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_sexp_message' 'ocaml-ppx_sexp_value' 'ocaml-ppx_type_conv' 'ocaml-ppx_typerep_conv' 'ocaml-ppx_variants_conv')
makedepends=('ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('45670eef012a55c4307befa2ca391939'
         '7f0a951f1ac87385272ea7a6dd58762a')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  make install PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}$(ocamlc -where)"
}
