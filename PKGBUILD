# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytofQC
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Labels normalized cells for CyTOF data and assigns probabilities for each label"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-catalyst
  r-e1071
  r-eztune
  r-flowcore
  r-gbm
  r-ggplot2
  r-hrbrthemes
  r-matrixstats
  r-randomforest
  r-rmarkdown
  r-s4vectors
  r-singlecellexperiment
  r-ssc
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-gridextra
  r-knitr
  r-rcolorbrewer
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('550d38d16388b37eb673a524357de799')
b2sums=('24136fe0b872383d9611cd48238434da55e7a97c1aab093bd606c4f90f262465dac1bab063bc786278ce7ffbad62ca2f8a49c99d6e75ff1ae1267cf67fc38c60')

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
