# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=bandle
_pkgver=1.8.0
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
md5sums=('b9b2e7b766d268691f9e7bc45b5fb2d8')
b2sums=('2e8602874294d28ee422c124b14586fdba0cf698172dd4c95c1fe50e4aa86220988f1a6b5fa62d63ecfc28fa342f006fe87a12c1f0ade56d32206d7342d886ab')

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
