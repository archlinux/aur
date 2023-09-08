# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-cmdliner
pkgver=1.2.0
pkgrel=1
pkgdesc="An OCaml module for declarative definition of command line interfaces"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/cmdliner"
license=('BSD')
depends=('ocaml')
makedepends=('dune' 'ocaml-findlib')
source=("${url}/releases/cmdliner-${pkgver}.tbz")

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  OCAMLPARAM='_,warn-error=-50' dune build
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  DESTDIR="${pkgdir}" dune install \
    --prefix="/usr" \
    --libdir="$(ocamlfind printconf destdir)"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('afed10589028394fd6f64e97b1c617e2be70de6d35ee47e04235da31a9dd0078')
