# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-efl
pkgver=1.20.0
pkgrel=1
pkgdesc="An OCaml interface to the Enlightenment Foundation Libraries (EFL) and Elementary"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/ocaml-efl/"
license=('LGPL2.1')
depends=('ocaml' 'efl')
makedepends=('ocamlbuild' 'ocaml-findlib' 'mesa')
options=('!strip')
source=("https://forge.ocamlcore.org/frs/download.php/1733/ocaml-efl-1.20.0.tar.gz")
md5sums=('55bada4887008b29ed112241478fb32f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}/stublibs"
  make install OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}"
}
