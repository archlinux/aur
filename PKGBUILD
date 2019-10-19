# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-migrate-parsetree-git
pkgver=20190905
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('x86_64')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
license=('custom:LGPL2.1 with linking exception')
provides=('ocaml-migrate-parsetree')
conflicts=('ocaml-migrate-parsetree')
depends=('ocaml' 'ocaml-result' 'ocaml-ppx_derivers')
makedepends=('dune')
options=('!strip')
source=("${pkgname}::git://github.com/ocaml-ppx/ocaml-migrate-parsetree.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  dune build --profile release
}

package() {
  cd "$pkgname"

  dune install --verbose --destdir "${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
