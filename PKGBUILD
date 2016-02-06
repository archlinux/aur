# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_expect
pkgver=113.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Cram like framework for OCaml"
url="https://github.com/janestreet/ppx_expect"
depends=('ocaml' 'ocaml-ppx_assert' 'ocaml-ppx_compare' 'ocaml-ppx_core' 'ocaml-ppx_custom_printf' 'ocaml-ppx_driver' 'ocaml-ppx_fields_conv' 'ocaml-ppx_inline_test' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_sexp_value' 'ocaml-ppx_tools' 'ocaml-ppx_variants_conv' 'ocaml-re' 'ocaml-sexplib' 'ocaml-variantslib')
makedepends=('ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('fa7191448707d0723e15c13a29b93315'
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
