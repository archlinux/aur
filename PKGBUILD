# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-mascot
pkgver=1.0
pkgrel=3
pkgdesc="Style checker for OCaml sources"
arch=("i686" "x86_64")
url="http://mascot.x9c.fr"
license=('GPL')
depends=('ocaml>=3.12.1')
makedepends=('ocaml-findlib')
options=("!strip !makeflags")
source=("http://mascot.x9c.fr/distrib/mascot-$pkgver.tar.gz")
md5sums=('94a0abe41b9acbc4efa661dc9d7be122')
install=ocaml-mascot.install


build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  sh configure -ocaml-prefix /usr
  make all
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
}
