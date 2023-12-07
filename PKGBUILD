# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=bandle
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the Bayesian analysis of differential subcellular localisation experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('4b2cd2fc88afad6b4b9fc729d9cb168f0df05d08f1c8f7c7ab0176354eab5fc3')

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
