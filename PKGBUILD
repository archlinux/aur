# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=bandle
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-dplyr
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-knitr
  r-lbfgs
  r-msnbase
  r-plyr
  r-proloc
  r-prolocdata
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
  r-coda
  r-fields
  r-interp
  r-pheatmap
  r-rmarkdown
  r-spelling
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c8dd928dd2b7900ff453ddc590ad6e4')
b2sums=('7a3f8452e89b2ce6dbb086a155084f91a571caed052454b4db2367c6a0d3c9aa101ea062ca6eea2ed9f2690c7c08db31b9e22e19714cdc25f8b4731e1af783f0')

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
