# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_conv
pkgver=113.33.03
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Generation of S-expression conversion functions from type definitions"
url="https://github.com/janestreet/ppx_sexp_conv"
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_tools' 'ocaml-ppx_type_conv' 'ocaml-sexplib')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('065b0f514aee32a2dbcd9e19d98af85c'
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
