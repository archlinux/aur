# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-topkg
pkgver=0.8.1
pkgrel=1
pkgdesc="A packager for distributing OCaml software"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/topkg"
license=('BSD')
depends=('ocaml' 'ocaml-result')
makedepends=('ocaml-findlib' 'ocamlbuild' 'opam')
source=("http://erratique.ch/software/topkg/releases/topkg-${pkgver}.tbz")
md5sums=('f7c0922d5f9fe698e96804312ec068ed')

build() {
  cd "${srcdir}/topkg-${pkgver}"

  pkg/pkg.ml build
}

package() {
  cd "${srcdir}/topkg-${pkgver}"

  opam-installer --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}$(ocamlc -where)" \
    --docdir="${pkgdir}/usr/share/doc"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/topkg/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
