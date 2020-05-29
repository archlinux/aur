# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-stdint-git
pkgver=20200208
pkgrel=3
pkgdesc="Various signed and unsigned integers for OCaml"
arch=('i686' 'x86_64')
url='https://github.com/andrenth/ocaml-stdint'
license=('MIT')
provides=('ocaml-stdint')
makedepends=('dune')
source=("${pkgname}::git://github.com/andrenth/ocaml-stdint.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  dune build -p stdint
}

package() {
  cd "$pkgname"

  mkdir -p "${pkgdir}"/usr/lib/ocaml/

  dune install -p stdint --libdir="${pkgdir}"/usr/lib/ocaml/ --prefix="${pkgdir}"
}
