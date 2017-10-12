# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: charlesthehawk -- yahoo -- com
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

_pkgname=xmlm
pkgname=ocaml-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="An OCaml streaming codec to decode and encode the XML data format"
arch=('i686' 'x86_64' 'armv7h')
url="http://erratique.ch/software/xmlm/"
license=('ISC')
depends=('ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam')
options=('!strip' 'staticlibs')
source=("http://erratique.ch/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tbz")
md5sums=('d63ce15d913975211196b5079e86a797')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ocaml pkg/pkg.ml build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  opam-installer "--prefix=${pkgdir}/usr" \
    "--libdir=${pkgdir}$(ocamlc -where)" \
    "--docdir=${pkgdir}/usr/share/doc"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
