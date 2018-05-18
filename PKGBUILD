# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-ppx_derivers-git
pkgver=20180224
pkgrel=1
pkgdesc="deriving plugin registry"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppx_derivers'
license=('BSD')
provides=('ocaml-ppx_derivers')
makedepends=('ocamlbuild' 'ocaml-findlib')
source=("${pkgname}::git://github.com/ocaml-ppx/ppx_derivers.git")
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

  mkdir -p "$destdir/ppx_derivers" || return 1
  make DESTDIR="$destdir/" OCAMLFIND_DESTDIR="$destdir/" install || return 1
}
