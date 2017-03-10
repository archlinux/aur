# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

_pkgname=cmdliner
pkgname=ocaml-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="An OCaml module for declarative definition of command line interfaces"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/${_pkgname}"
license=('BSD')
depends=('ocaml' 'ocaml-result')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam')
source=("http://erratique.ch/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tbz")
md5sums=('6baa375f393fbe9ca1fcb0a7a875e001')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  pkg/pkg.ml build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  opam-installer --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}$(ocamlc -where)" \
    --docdir="${pkgdir}/usr/share/doc"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
