# Maintainer: Tambet Arak <tambetarak+nospam@gmail.com>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor:  Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
_pkgname=sqlite3-ocaml
pkgver=4.4.1
pkgrel=1
arch=('x86_64')
license=('MIT')
pkgdesc='SQLite3 bindings for OCaml'
url='https://github.com/mmottl/sqlite3-ocaml'
depends=('ocaml' 'ocaml-base' 'ocaml-stdio' 'sqlite3')
makedepends=('ocaml-findlib' 'dune')
options=()
source=("https://github.com/mmottl/sqlite3-ocaml/archive/${pkgver}.tar.gz")
md5sums=('70ffbf667411876e13071e85d6f20ca7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  dune build @install
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  dune install --prefix="$pkgdir/usr" \
    --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}

