# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-mascot
pkgver=1.0
pkgrel=4
pkgdesc="Style checker for OCaml sources"
arch=("i686" "x86_64")
url="http://mascot.x9c.fr"
license=('GPL')
depends=('ocaml>=3.12.1')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags')
source=("https://mascot.x9c.fr/distrib/mascot-$pkgver.tar.gz")
sha256sums=('46cbec99e190ab149c9501c23dd4b8ab548f49ce030dd30c0c0afaff547aa350')
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
