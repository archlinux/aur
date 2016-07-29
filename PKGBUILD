# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_assert
pkgver=113.33.03
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Assert-like extension nodes that raise useful errors on failure"
url="https://github.com/janestreet/ppx_assert"
depends=('ocaml' 'ocaml-ppx_compare' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_tools' 'ocaml-ppx_type_conv' 'ocaml-sexplib')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
options=('!strip' '!emptydirs')
md5sums=('4da98302d2827397b6330451d44cd3e2'
         '7f0a951f1ac87385272ea7a6dd58762a'
         '3f9ce9a72b72a54df6c1b54cdd24b110')

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
