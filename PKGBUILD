# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_jane
pkgver=113.33.03
pkgrel=1
pkgdesc="Standard Jane Street ppx rewriters"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_jane"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_assert' 'ocaml-ppx_bench' 'ocaml-ppx_bin_prot' 'ocaml-ppx_compare' 'ocaml-ppx_custom_printf' 'ocaml-ppx_driver' 'ocaml-ppx_enumerate' 'ocaml-ppx_expect' 'ocaml-ppx_fail' 'ocaml-ppx_fields_conv' 'ocaml-ppx_here' 'ocaml-ppx_inline_test' 'ocaml-ppx_let' 'ocaml-ppx_pipebang' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_sexp_message' 'ocaml-ppx_sexp_value' 'ocaml-ppx_typerep_conv' 'ocaml-ppx_variants_conv')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
md5sums=('14e4dea12340e225e7b413b6c3b62a37'
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
