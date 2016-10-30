# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_deriving
pkgname=ocaml-${_pkgname}
pkgver=4.1
pkgrel=1
pkgdesc="Type-driven code generation for OCaml >=4.02"
arch=('i686' 'x86_64')
url="https://github.com/whitequark/ppx_deriving"
license=('MIT')
depends=('ocaml' 'ocaml-ppx_tools' 'ocaml-result')
makedepends=('ocaml-findlib' 'cppo')
source=("https://github.com/whitequark/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('6a0cf323c97434c5a6d8529ea7e084db')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export OCAMLPATH="$(ocamlc -where):${pkgdir}$(ocamlc -where)"
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"

  make install
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
