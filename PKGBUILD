# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-cmdliner
pkgver=1.1.1
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

  dune build
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  DESTDIR="${pkgdir}" dune install \
    --prefix="/usr" \
    --libdir="$(ocamlfind printconf destdir)"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('a1ae87c3a79940ef8d1dd59f7440f776d1dc926e019846dd32202e464627b5fb')
