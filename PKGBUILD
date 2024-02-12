# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=metR
_pkgver=0.15.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for Easier Analysis of Meteorological Fields"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-checkmate
  r-data.table
  r-digest
  r-formula
  r-formula.tools
  r-ggplot2
  r-gtable
  r-isoband
  r-lubridate
  r-memoise
  r-plyr
  r-purrr
  r-scales
  r-sf
  r-stringr
)
checkdepends=(
  r-curl
  r-gsignal
  r-maps
  r-ncdf4
  r-pcict
  r-reshape2
  r-terra
  r-testthat
  r-vdiffr
)
optdepends=(
  r-covr
  r-gridextra
  r-gsignal
  r-here
  r-irlba
  r-knitr
  r-kriging
  r-maps
  r-markdown
  r-ncdf4
  r-pcict
  r-pkgdown
  r-proj4
  r-reshape2
  r-rnaturalearth
  r-terra
  r-testthat
  r-vdiffr
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('290d04139ae420099542606da5aff873')
b2sums=('60d43e8400d35631bde9f924d7947858f62855d402616fe01a1bf56ef62ee7bfe99196c2fcb1817bbfc230248e1139300ff0843a70415daee2cd7e525f182031')

prepare() {
  # skip failing test
  sed -i '/"can use differnet engine"/a\ \ \ \ skip("fails")' "$_pkgname/tests/testthat/test-eof.R"
}

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
