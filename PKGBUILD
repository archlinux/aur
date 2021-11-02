# Maintainer: Philip <philip1731 protonmail ch>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: adenosine
pkgname=ocaml-gsl
pkgver=1.24.3
pkgrel=1
license=('GPL3')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml libs for gsl"
url="https://mmottl.github.io/gsl-ocaml"
options=('!strip')
depends=('ocaml' 'ocaml-base' 'ocaml-stdio' 'gsl')
makedepends=('ocaml-findlib' 'dune')
source=("https://github.com/mmottl/gsl-ocaml/archive/${pkgver}.tar.gz")
md5sums=('67ee4a9e0a60c48f9aad346afb30e014')
sha1sums=('ba322865d99d92fd00fda45fc610534e2d2ae3ab')
sha256sums=('0699c601fe8b60a96ee57daac9f0c252564c170898878ca13b0eaf45b40b083d')

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

