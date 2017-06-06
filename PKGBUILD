# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_expect
pkgver=113.33.03
pkgrel=1
pkgdesc="Cram like framework for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_expect"
license=('Apache')
depends=('ocaml' 'ocaml-fieldslib' 'ocaml-ppx_assert' 'ocaml-ppx_compare' 'ocaml-ppx_core' 'ocaml-ppx_custom_printf' 'ocaml-ppx_driver' 'ocaml-ppx_fields_conv' 'ocaml-ppx_here' 'ocaml-ppx_inline_test' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_tools' 'ocaml-ppx_variants_conv' 'ocaml-re' 'ocaml-sexplib' 'ocaml-variantslib')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
md5sums=('ceca13eb18037e611717029d16ca48d7'
         '7f0a951f1ac87385272ea7a6dd58762a'
         '613b386c3d58edc66678e22d984f62c8')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
  patch -Np1 < "${srcdir}/exedir.patch"
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
