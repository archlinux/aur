# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-odn
_pkgname=ocaml-data-notation
pkgver=0.0.11
pkgrel=1
pkgdesc="OCaml data notation"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/odn"
# LGPL + linking exception
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-type-conv>=3.0.4' 'ocaml-fileutils')
makedepends=('ocaml-findlib' 'ocaml-ounit')
source=("http://forge.ocamlcore.org/frs/download.php/1310/$_pkgname-$pkgver.tar.gz")
sha512sums=('010c6105b0745c4dbf426186915078cd71d02d56e19ca01089a37f803c9d81c02a22e64184b9b4a42d44450834527a050ff20430f8c2d8a972610717f4c653d7')
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
