# Contributor: adenosine
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ocaml-gsl
pkgver=1.24.0
pkgrel=1
license=('GPL3')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml libs for gsl"
url="https://mmottl.github.io/gsl-ocaml"
options=('!strip')
depends=('ocaml' 'ocaml-base' 'ocaml-stdio' 'gsl')
makedepends=('ocaml-findlib' 'dune')
source=("https://github.com/mmottl/gsl-ocaml/archive/${pkgver}.tar.gz")
md5sums=('edcbac12bd119a798a677437e2e68681')
sha1sums=('687c8afa0149bc8c87c23500da0e2118b4ea6d8b')
sha256sums=('ff901961f6c59f5c728e8a75ba77d236cc6557be5dfb977c003dc08579cc73ea')

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

