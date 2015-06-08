# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-kaputt
pkgver=1.2
pkgrel=1
pkgdesc="Unit testing tool for OCaml"
arch=('i686' 'x86_64')
url=("http://kaputt.x9c.fr")
license=('GPLv3')
depends=('ocaml')
makedepends=('ocaml-findlib')
_pkgname=kaputt
source=(http://kaputt.x9c.fr/distrib/${_pkgname}-${pkgver}.tar.gz)
md5sums=('b55c1a7d72d9c04c7ad076c6230b5dfd')

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
