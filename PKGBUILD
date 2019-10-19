# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-yojson-git
pkgver=20190520
pkgrel=1
pkgdesc="Low level JSON binary for OCaml"
arch=('x86_64')
url='https://github.com/ocaml-community/yojson'
license=('BSD')
options=('!strip' 'staticlibs')
provides=('ocaml-yojson')
conflicts=('ocaml-yojson')
depends=('ocaml-biniou' 'ocaml-easy-format')
makedepends=('dune' 'cppo')
source=("${pkgname}::git://github.com/ocaml-community/yojson.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  make all
}

package() {
  cd "$pkgname"

  DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="$(ocamlfind printconf destdir)"

  # remove rogue dune-package file
  rm -r "${pkgdir}"/usr/doc
  rm -r "${pkgdir}"/usr/lib/ocaml/yojson/dune-package
}
