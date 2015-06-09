# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

_pkgname=cmdliner
pkgname=ocaml-${_pkgname}
pkgver=0.9.7
pkgrel=1
pkgdesc="An OCaml module for declarative definition of command line interfaces."
arch=('i686' 'x86_64')
url="http://erratique.ch/software/${_pkgname}"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib' 'opam')
source=(http://erratique.ch/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tbz)
md5sums=('46d7553b95f623f811df2a844fb448fb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ocaml pkg/build.ml native=true native-dynlink=true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  opam-installer --prefix=$pkgdir/usr \
    --libdir=$pkgdir$(ocamlc -where) \
    --docdir=$pkgdir/usr/share/doc
}
