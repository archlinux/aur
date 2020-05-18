# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-kaputt
pkgver=1.2
pkgrel=2
pkgdesc="Unit testing tool for OCaml"
arch=('i686' 'x86_64')
url="http://kaputt.x9c.fr"
license=('GPLv3')
depends=('ocaml')
makedepends=('ocaml-findlib')
_pkgname=kaputt
source=("https://kaputt.x9c.fr/distrib/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('19dae1ade0afff7f0f5f3e116793d35ced4c3cdb8f7a7cb1e5c599d2cc827039')

build () {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  chmod +x ./configure
  ./configure -ocamlfind /usr/bin/ocamlfind || return 1
  make all || return 1
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

  mkdir -p $OCAMLFIND_DESTDIR
  OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR make install || return 1
  install -D "doc/${_pkgname}.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.pdf"
}
