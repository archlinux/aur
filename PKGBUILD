# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmnipathR
_pkgver=3.11.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="OmniPath web service client and more"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-checkmate
  r-crayon
  r-curl
  r-digest
  r-dplyr
  r-httr
  r-igraph
  r-jsonlite
  r-later
  r-logger
  r-lubridate
  r-magrittr
  r-progress
  r-purrr
  r-rappdirs
  r-readr
  r-readxl
  r-rlang
  r-rmarkdown
  r-rvest
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-withr
  r-xml2
  r-yaml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-biomart
  r-bookdown
  r-ggplot2
  r-ggraph
  r-gprofiler2
  r-knitr
  r-mlrmbo
  r-parallelmap
  r-paramhelpers
  r-rgraphviz
  r-sigmajs
  r-smoof
  r-suprahex
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ea1ea4056248615d3cf047520da09d9')
b2sums=('993000e16d9238df065855dc5256f12ddf8e9fb22b39b728a09bc5272d71c6a71198bf1ecf8d581d102babb8c22689e11290f1a71229d572fd7b410a996472fc')

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
