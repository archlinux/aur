# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmnipathR
_pkgver=4.0.4
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
  r-fs
  r-httr2
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
  r-sessioninfo
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-withr
  r-xml2
  r-yaml
  r-r.utils
  r-vctrs
  r-rsqlite
  r-xml
  r-zip
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bookdown
  r-ggplot2
  r-ggraph
  r-gprofiler2
  r-knitr
  r-mlrmbo
  r-parallelmap
  r-paramhelpers
  r-sbmlr
  r-sigmajs
  r-smoof
  r-testthat
  r-r.matlab
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7509a1181863f35a51c55fae5afec636')
b2sums=('dbe47e7e842ce9879bb75db2efadfa4457e8eea71699473a376980ed2d6f79a1f414829590645bf954d20c85d4eac20b683f5cbdc07db6860a396be36d875a88')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
