# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenProSeq
_pkgver=1.16.0
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
  r-knitr
  r-rmarkdown
  r-stringdist
  r-testthat
  r-vaexprs
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9f9fdb72c8b8127b6959f6465f59e74a')
b2sums=('620534ac8f9ee2368e93e2a8b9c456e55a9c27a840c768d05b32fd28db6398c0ad1c6ce4b5c52d68284ce04c24960cef1bc95132c6bf0fa7bd7c8f190b22a70c')

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
