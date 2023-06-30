# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-cry
pkgver=1.0.0
pkgrel=1
pkgdesc="OCaml native module for icecast/shoutcast source protocol(s)"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-cry"
license=('GPL')
depends=('ocaml' 'ocaml-ssl')
makedepends=('ocaml-findlib' 'dune')
options=(!libtool !strip zipman !makeflags staticlibs)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('0d9ef968f6352e9d64e8af27702361e643f7d2a1795deff0781d88460e289579')
