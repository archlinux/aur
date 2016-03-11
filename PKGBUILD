# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Sergey Plaksin <serp256@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ocaml-menhir
pkgver=20160303
pkgrel=1
pkgdesc="Menhir is a LR(1) parser generator for the OCaml."
arch=("i686" "x86_64")
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('GPL' 'QPL')
depends=('ocaml>=4.02')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
source=("http://cristal.inria.fr/~fpottier/menhir/menhir-$pkgver.tar.gz")
md5sums=('feff818f880519d511bcb774f2107fd1')

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  make PREFIX="/usr" all
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make PREFIX="$pkgdir/usr" install
}
