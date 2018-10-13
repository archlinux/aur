# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-ppx_deriving-git
pkgver=20180318
pkgrel=2
pkgdesc="Type-driven code generation for OCaml >=4.02"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppx_deriving'
license=('MIT')
provides=('ocaml-ppx_deriving')
depends=('ocaml' 'ocaml-migrate-parsetree' 'ocaml-ppx_derivers' 'ocaml-ppx_tools>=4.02.3' 'ocaml-result')
makedepends=('ocamlbuild' 'ocaml-findlib' 'cppo')
source=("${pkgname}::git://github.com/ocaml-ppx/ppx_deriving.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  export OCAMLPATH="$(ocamlc -where):${pkgdir}$(ocamlc -where)"
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"

  make install PREFIX="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
