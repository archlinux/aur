# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-odn
_pkgname=ocaml-data-notation
pkgver=0.0.10
pkgrel=1
pkgdesc="OCaml data notation"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/odn"
# LGPL + linking exception
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-type-conv>=3.0.4' 'ocaml-fileutils')
makedepends=('ocaml-findlib' 'ocaml-ounit')
source=("http://forge.ocamlcore.org/frs/download.php/1029/$_pkgname-$pkgver.tar.gz")
md5sums=('35b32f58d01a8fe2e0deead4bc8d78b8')
options=(!strip)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
}
