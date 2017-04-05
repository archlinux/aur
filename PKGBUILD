# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor:  Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
_pkgname=sqlite3-ocaml
pkgver=4.1.2
pkgrel=1
pkgdesc="SQLite3 bindings for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/mmottl/sqlite3-ocaml"
license=('MIT')
makedepends=('ocaml' 'ocaml-findlib' 'sqlite3' 'ocamlbuild')
source=("https://github.com/mmottl/sqlite3-ocaml/releases/download/v$pkgver/sqlite3-ocaml-$pkgver.tar.gz")
md5sums=('a824c24d1011388eaf15f752bd02494e')
options=('!makeflags' 'staticlibs')

_pkgdir="$_pkgname-$pkgver"

build () {
  cd "${srcdir}/${_pkgdir}"

  ./configure --disable-debug --prefix "$pkgdir/usr" --destdir "$pkgdir"
   make all
}

package() {
  cd "${srcdir}/${_pkgdir}"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
