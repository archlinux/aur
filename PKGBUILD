# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmnipathR
_pkgver=4.2.0
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
  r-filelock
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
  r-r.utils
  r-rappdirs
  r-readr
  r-readxl
  r-rlang
  r-rmarkdown
  r-rsqlite
  r-sessioninfo
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
  r-withr
  r-xml
  r-xml2
  r-yaml
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
  r-r.matlab
  r-sbmlr
  r-sigmajs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72821361fce75e1d46eac413ab85ad08')
b2sums=('0329a47239f8cb5d7248053d780fc254a715d705123022e59da55c0a51679eaa16fc1c3658a90843390d18ee86f2b6a995f058b646193f833bad2e9a0f4b2c55')

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
