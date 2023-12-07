# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lemur
_pkgver=1.0.5
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
md5sums=('d6ad01367e439d6e55960148c94f3a37')
sha256sums=('404872c1445449b5bc268054627e456a1d074f3c05f3cacf78da2572ead1e980')

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
