# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytofQC
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('7a4e866c0e57f639b41828c211aff31f')
b2sums=('8a36f75c1d035b1c98a8f358ad7ba0ec0811f02b12d54e67bc0ff3af92afe1aaf2e5dff06776d0bc7fb4794d3a2fa5cb383582124474fd81c07987b32cc0dd21')

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
