# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_inline_test
pkgver=113.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Syntax extension for writing in-line tests in ocaml code"
url="https://github.com/janestreet/ppx_inline_test"
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_tools')
makedepends=('ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('5d80120af94ba974670a0a28b1200160'
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
