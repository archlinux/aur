# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lemur
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Latent Embedding Multivariate Regression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  blas
  r-biocgenerics
  r-biocneighbors
  r-delayedmatrixstats
  r-glmgampoi
  r-harmony
  r-hdf5array
  r-irlba
  r-limma
  r-matrixgenerics
  r-matrixstats
  r-rcpp
  r-rlang
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-vctrs
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-edger
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-edger
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyverse
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5dea419c3db2ad11d1762a8e8dbe5804')
b2sums=('8c595f69348f6259e4c1c7684b7ca115baea0824cb9f3ad0cb03f3986f731ebb540176f61648cca4771a4dd26cc4350d7daabb88b8e54fb828d1e637f44c1360')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
