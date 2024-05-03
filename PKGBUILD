# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytofQC
_pkgver=1.4.0
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
md5sums=('5ce5a248d0f24b4a1fc223dba8ae1898')
b2sums=('4b4e148ecc9d012299e7d99876dd40d515847fe63a986ec4433325686c62e31250dfe6467ed30aeb805528e849b0133cbf04a92b259bc55da48bf920ddbb0ca3')

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
