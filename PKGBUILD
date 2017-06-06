# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_custom_printf
pkgver=113.33.03
pkgrel=1
pkgdesc="Printf-style format-strings for user-defined string conversion"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_custom_printf"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_tools')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
md5sums=('303cd723860c591491e813a43e846699'
         '7f0a951f1ac87385272ea7a6dd58762a'
         '68890ac5a31e5062096ee66bc4ff6c90')

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
