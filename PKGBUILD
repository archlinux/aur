# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_deriving
pkgname=ocaml-${_pkgname}
pkgver=4.2.1
pkgrel=1
pkgdesc="Type-driven code generation for OCaml >=4.02"
arch=('i686' 'x86_64')
url="https://github.com/ocaml-ppx/ppx_deriving"
license=('MIT')
depends=('ocaml' 'ocaml-migrate-parsetree' 'ocaml-ppx_derivers' 'ocaml-ppx_tools' 'ocaml-result')
makedepends=('ocamlbuild' 'ocaml-findlib' 'cppo')
source=("https://github.com/ocaml-ppx/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2195fccf2a527c3ff9ec5b4e36e2f0a8')

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
