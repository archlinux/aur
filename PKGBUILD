# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppcseq
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Probabilistic Outlier Identification for RNA Sequencing Generalized Linear Models"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
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
md5sums=('5468f12a17171d83eebf57c63f69a293')
b2sums=('802e2c1ff719ae3dd67d46752116fae0484cb5605da23d879c19ebbd2b23d8622652304eced38dde095058f3f156a63cfcd1e9beb13089d549cc61e5292a9e11')

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
