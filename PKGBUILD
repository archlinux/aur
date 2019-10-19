# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-ppx_deriving_yojson-git
pkgver=20191009
pkgrel=1
pkgdesc="A Yojson codec generator for OCaml >= 4.02."
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppx_deriving_yojson'
license=('MIT')
provides=('ocaml-ppx_deriving_yojson')
depends=('ocaml' 'ocaml-yojson' 'ocaml-result' 'ocaml-ppx_deriving')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-ppx_tools' 'ocaml-ppxfind' 'dune' 'cppo')
source=("${pkgname}::git://github.com/ocaml-ppx/ppx_deriving_yojson.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  dune build
}

package() {
  cd "$pkgname"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
