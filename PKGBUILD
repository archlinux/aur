# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_message
pkgver=113.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="A ppx rewriter for easy construction of s-expressions"
url="https://github.com/janestreet/ppx_sexp_message"
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_tools')
makedepends=('ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('f4355b8c00f7337a3750c97c9edd8a3d'
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
