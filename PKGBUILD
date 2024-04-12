# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenProSeq
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generating Protein Sequences with Deep Generative Models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-catencoders
  r-deeppincs
  r-keras
  r-mclust
  r-reticulate
  r-tensorflow
  r-ttgsea
  r-word2vec
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggseqlogo
  r-knitr
  r-rmarkdown
  r-stringdist
  r-testthat
  r-vaexprs
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15e772912f2019256df52d192edd5402')
b2sums=('b8a9e9720d3008a3c655ca8b3917ec5f23da709e39a69e47cb3c2f87bb1c0f01a65bc3b62777ae2226cf5d506fa75cb2eed0a45519e8a33ce4d0f964adbb22af')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
