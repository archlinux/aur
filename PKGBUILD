# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-topkg
pkgver=0.9.1
pkgrel=1
pkgdesc="A packager for distributing OCaml software"
arch=('i686' 'x86_64' 'armv7h')
url="http://erratique.ch/software/topkg"
license=('BSD')
depends=('ocaml' 'ocaml-result')
makedepends=('ocaml-findlib' 'ocamlbuild' 'opam')
source=("http://erratique.ch/software/topkg/releases/topkg-${pkgver}.tbz")
md5sums=('8978a0595db1a22e4251ec62735d4b84')

build() {
  cd "${srcdir}/topkg-${pkgver}"

  pkg/pkg.ml build --pkg-name topkg
}

package() {
  cd "${srcdir}/topkg-${pkgver}"

  opam-installer --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}$(ocamlc -where)" \
    --docdir="${pkgdir}/usr/share/doc"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/topkg/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
