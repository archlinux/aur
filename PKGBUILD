# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-ppxfind-git
pkgver=20190513
pkgrel=1
pkgdesc="ocamlfind ppx tool"
arch=('x86_64')
url='https://github.com/diml/ppxfind'
license=('BSD')
provides=('ocaml-ppxfind')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-migrate-parsetree')
source=("${pkgname}::git://github.com/diml/ppxfind.git")
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
  destdir="$pkgdir/$(ocamlfind printconf destdir)"

  cd "$pkgname"

  mkdir -p "${pkgdir}"/usr/bin/
  cp _build/install/default/bin/ppxfind "${pkgdir}"/usr/bin/
}
