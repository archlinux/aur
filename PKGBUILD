# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Philip <philip1731 protonmail ch>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: adenosine
pkgname=ocaml-gsl
pkgver=1.25.1
pkgrel=1
license=('GPL-3.0-only')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml libs for gsl"
url="https://mmottl.github.io/gsl-ocaml"
options=('!strip')
depends=('glibc' 'gsl' 'ocaml' 'ocaml-base' 'ocaml-stdio')
makedepends=('ocaml-findlib' 'dune')
source=("gsl-ocaml-${pkgver}.tar.gz::https://github.com/mmottl/gsl-ocaml/archive/${pkgver}.tar.gz")
sha256sums=('20a7a96cbe1adf54be6bc3da94ec04c8a253baf7b9a4f7c361b03f55162d3eb9')

build() {
  cd "${srcdir}/gsl-ocaml-${pkgver}"
  dune build --profile release @install
}

package() {
  cd "${srcdir}/gsl-ocaml-${pkgver}"
  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix="${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "$pkgdir/usr/doc" "${pkgdir}/usr/share/"
}
