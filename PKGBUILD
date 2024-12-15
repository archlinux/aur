# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppcseq
_pkgver=1.14.0
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
md5sums=('61ba747d87e8faa669273b348c31a957')
b2sums=('b64b71bb56dd1397bf94b3e11e5b15c0dfc4209c92e74a70f4460a8e65d2eff4684d3dc2c94b338d3c8e68448379dd9513c4d7885065073b456fbf250c0464b7')

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
