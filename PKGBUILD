# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytofQC
_pkgver=2.0.0
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
  r-matrixstats
  r-mixtools
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
md5sums=('75aaf1cc9b991bc61c585fa9deea7277')
b2sums=('bf88c3bc76edea0b0f6b7c0e5f81e3889360233a0e804c61b061494f3302b820f1d4f680a6967271f392f68798c59aa29121c6c13c4fc8bdec99f60999d9dab7')

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
