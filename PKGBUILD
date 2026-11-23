# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=bandle
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the Bayesian analysis of differential subcellular localisation experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  blas
  lapack
  r-biobase
  r-biocparallel
  r-biocstyle
  r-circlize
  r-coda
  r-dplyr
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-gtools
  r-knitr
  r-lbfgs
  r-msnbase
  r-plyr
  r-proloc
  r-prolocdata
  r-rcolorbrewer
  r-rcpp
  r-rlang
  r-robustbase
  r-s4vectors
  r-tidyr
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-fields
  r-interp
  r-pheatmap
  r-rmarkdown
  r-spelling
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1930934a956a53a438268f91196717b9')
b2sums=('cf54645c35ee51271685e6459d79e7f1145a54ad7183fd5458885d4a8b26f5a354bab7c31d5dacc3d188bb03fed6d685bbfe35d5b89ebdb86fcf806674e94560')

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
