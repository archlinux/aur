# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sccomp
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Outlier-aware Estimation of Composition and Heterogeneity for Single-cell Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  r-dplyr
  r-forcats
  r-ggplot2
  r-ggrepel
  r-glue
  r-lifecycle
  r-magrittr
  r-patchwork
  r-purrr
  r-rcpp
  r-rcppparallel
  r-readr
  r-rlang
  r-rstan
  r-rstantools
  r-scales
  r-seuratobject
  r-singlecellexperiment
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
  r-tidyseurat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-loo
  r-markdown
  r-prettydoc
  r-testthat
  r-tidyseurat
  r-tidysinglecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('38fa3fb4d650ac6866ba2586deaf34e6')
b2sums=('0d1374553310470136e97f037c7ac9d4d28768be43409ce7f76e37eba5e7851f6248cf71375078334daf77fa9d7b8249be93d6ff34e08d8bc54430139212903d')

build() {
  mkdir build
  # compilation needs a lot of memory
  MAKEFLAGS+=" -j1"
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
