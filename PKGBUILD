# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lemur
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Latent Embedding Multivariate Regression"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('76ef0d01a8f6f23e0f125274af96522d')
sha256sums=('2101d7bd7274d40f2402b50a5b69bc2296c6eec73c93e2061b40fb8bae4acb9b')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
