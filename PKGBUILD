# Maintainer: <oliver (at) first . in - berlin . de>
# Contributor: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>

pkgname=ocaml-curses
pkgver=1.0.4
pkgrel=1
license=('LGPL')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml libs for curses"
url="http://www.nongnu.org/ocaml-tmk/"
depends=()
options=('!strip')
makedepends=('ocaml' 'ocaml-findlib')
source=("http://download.savannah.gnu.org/releases/ocaml-tmk/${pkgname}-${pkgver}.tar.gz")
md5sums=('d99dce720b60cfc7297ca77b5be4aa8d')

build() {
  echo Warning: this package currently does not check the *.sig file
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf
  ./configure --enable-widec
  make all opt
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  env DESTDIR=${pkgdir} \
      OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
      OCAMLFIND_LDCONF=ignore \
      ocamlfind install curses META *.cmi *.cmx *.cma *.cmxa *.a *.so *.mli
}
