# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytofQC
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Labels normalized cells for CyTOF data and assigns probabilities for each label"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('d0505813678c5c80055b22702fd6efc1')
sha256sums=('2815ba1264e0a4b6e5db5d94cd3bbc97b353e0790c639a97e3f1af04d5b34e47')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
