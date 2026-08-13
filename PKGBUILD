# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppcseq
_pkgver=1.20.0
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
md5sums=('3453b99bf102184026ead20fe3b2cea6')
b2sums=('28d590c888e237e2aadb6a52ead784cda5e57430bcbd5a4c1a67da1e84cdda2175f0518edc6b5c9a94938fb9a122777baf289bc743f5f78269f1ae857fc5ad4e')

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
