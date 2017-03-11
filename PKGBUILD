# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-efl
pkgver=1.18.0
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc="An OCaml interface to the Enlightenment Foundation Libraries (EFL) and Elementary"
url="https://forge.ocamlcore.org/projects/ocaml-efl/"
depends=('ocaml' 'efl')
makedepends=('ocamlbuild' 'ocaml-findlib')
source=("https://forge.ocamlcore.org/frs/download.php/1661/ocaml-efl-1.18.0.tar.gz")
options=('!strip')
md5sums=('9f47a05ac71ad068c521e880af8d24f4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}"
}
