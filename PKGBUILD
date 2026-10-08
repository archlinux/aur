# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lo
pkgver=0.2.1 # renovate: datasource=github-tags depName=savonet/ocaml-lo
pkgrel=1
pkgdesc="OCaml bindings for LO library"
arch=('x86_64')
url="https://github.com/savonet/ocaml-lo"
license=('LicenseRef-LGPL2.1-with-linking-exception')
depends=('ocaml' 'liblo')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

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

sha256sums=('6a85c0b9fc8ae28c021c3a0288d28d14b87744d4b69420e74fff520adee84cc8')
