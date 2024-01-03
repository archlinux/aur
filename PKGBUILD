# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppcseq
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Probabilistic Outlier Identification for RNA Sequencing Generalized Linear Models"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r-benchmarkme
  r-dplyr
  r-edger
  r-foreach
  r-ggplot2
  r-lifecycle
  r-magrittr
  r-purrr
  r-rcpp
  r-rcppparallel
  r-rlang
  r-rstan
  r-rstantools
  r-tibble
  r-tidybayes
  r-tidyr
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a95706ac4269643dd1eb6efd4bccb67')
b2sums=('dbf5c6406bb76ea7ab53f583f6518a93157f4ae61bc49feef88a02e668219ed28281516b664aeb5440cf2f9a3f20a72a5c3c9b7331991f414870bcdc7c914d54')

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
