# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-frei0r
pkgver=0.1.3 # renovate: datasource=github-tags depName=savonet/ocaml-frei0r
pkgrel=1
pkgdesc="OCaml bindings to the frei0r video API"
arch=('x86_64')
url="https://github.com/savonet/ocaml-frei0r"
license=('LGPL-2.1-or-later')
depends=('ocaml' 'frei0r-plugins')
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

sha256sums=('7184cf02b1692bf3c8069de5137b9d1cc9eec405d25b217ddb4d0d3fd506caba')
