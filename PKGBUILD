# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_inline_test
pkgver=113.33.03
pkgrel=1
pkgdesc="Syntax extension for writing in-line tests in ocaml code"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_inline_test"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_tools')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
md5sums=('6abbbcbe8aefbb9d30721e252cd5c7f4'
         '7f0a951f1ac87385272ea7a6dd58762a'
         'e4d9f81044407306bb88373ae2e12932')

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
