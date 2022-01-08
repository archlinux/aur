# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dssi
pkgver=0.1.4
pkgrel=1
pkgdesc="OCaml bindings for dssi plugins"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dssi"
license=('GPL2')
depends=('ocaml' 'ocaml-ladspa')
makedepends=('ocaml-findlib' 'dune' 'dssi' 'ladspa')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf examples
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('5b017c5fb139f9ef90b23c6c9661ec28948e540664e68ca70649f58994b9aca9')
