# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lemur
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Latent Embedding Multivariate Regression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-biocneighbors
  r-delayedmatrixstats
  r-glmgampoi
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
  blas
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
  r-quarto
  r-testthat
  r-tidyverse
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9245f92c672547fad3ddf5a8f8d3d641')
b2sums=('8e45cff6bfd3bfc77a55a81b1c8cf0fa490d0028e5710339d37183e9f5fe5cb3b6ea9209dfaafaf3f95c95a0e2c6b51a1f4bf4d23b29565e6e73b28ea3cbb047')

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
