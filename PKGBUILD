# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-stdint-git
pkgver=20171013
pkgrel=2
pkgdesc="Various signed and unsigned integers for OCaml"
arch=('i686' 'x86_64')
url='https://github.com/andrenth/ocaml-stdint'
license=('MIT')
provides=('ocaml-stdint')
makedepends=('ocamlbuild' 'ocaml-findlib')
source=("${pkgname}::git://github.com/andrenth/ocaml-stdint.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

  ocaml setup.ml -configure --destdir "${pkgdir}"
  make all
}

package() {
  cd "$pkgname"

  mkdir -p "${OCAMLFIND_DESTDIR}"

  export OCAMLFIND_LDCONF=FOOBAR
  ocaml setup.ml -install --destdir "$pkgdir"
  rm -r "$pkgdir/usr/local"
}
