# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dssi
pkgver=0.1.5
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

sha256sums=('576d593ef431d60e07f2a1190863e7c0c9fefb0cad69d286460e0b661134ec66')
