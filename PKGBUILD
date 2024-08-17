# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmnipathR
_pkgver=3.12.2
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
md5sums=('4b016e8f17efd328324acd46bcfadc88')
b2sums=('efb8d9aa7454d3d3ac090a34b978a84b481047abf8dfd608e3e4fa6ef955f3f09794600a89bcbe13761b410a42c40d5f95a06187bbfe84fa1b7b24b996d163d9')

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
