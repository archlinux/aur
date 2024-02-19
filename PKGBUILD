# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=recipes
_pkgver=1.0.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Preprocessing and Feature Engineering Steps for Modeling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-clock
  r-dplyr
  r-ellipsis
  r-generics
  r-glue
  r-gower
  r-hardhat
  r-ipred
  r-lifecycle
  r-lubridate
  r-magrittr
  r-purrr
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
  r-timedate
  r-vctrs
  r-withr
)
checkdepends=(
  r-ddalpha
  r-dials
  r-dimred
  r-fastica
  r-igraph
  r-kernlab
  r-mixomics
  r-modeldata
  r-rann
  r-rcppml
  r-rcpproll
  r-rsample
  r-rspectra
  r-splines2
  r-testthat
  r-workflows
)
optdepends=(
  r-covr
  r-ddalpha
  r-dials
  r-ggplot2
  r-igraph
  r-kernlab
  r-knitr
  r-modeldata
  r-parsnip
  r-rann
  r-rcpproll
  r-rmarkdown
  r-rsample
  r-rspectra
  r-splines2
  r-testthat
  r-workflows
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('678b530e6c97ca93445dc99cf69fe7b5')
b2sums=('5f82026c0e7473ed8bb8bb132b96674dfe29d1e5fb15ecd6edaae43d62c3bef8a9cab9241dad4cf54546dbffcba32d5d10e67097520f908ea2777dde8d6fedf1')

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
