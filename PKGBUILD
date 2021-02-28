# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dssi
pkgver=0.1.3
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

sha256sums=('536d0a01388a0ffb7ee014e639da43ce718e0f1ed44b284cce202c77fdd94201')
