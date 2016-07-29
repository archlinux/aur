# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_value
pkgver=113.33.03
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="A ppx rewriter that simplifies building s-expressions from ocaml values"
url="https://github.com/janestreet/ppx_sexp_value"
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_tools')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
options=('!strip' '!emptydirs')
md5sums=('0582ea3bc8edddc6bb8731514059da84'
         '7f0a951f1ac87385272ea7a6dd58762a'
         'e155286965bf825c87fbeca63fa53e01')

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
