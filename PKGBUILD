# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tsibble
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy Temporal Data Frames and Tools"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-anytime
  r-dplyr
  r-ellipsis
  r-generics
  r-lifecycle
  r-lubridate
  r-rlang
  r-tibble
  r-tidyselect
  r-vctrs
)
checkdepends=(
  r-ggplot2
  r-hms
  r-nanotime
  r-testthat
  r-tidyr
  r-timedate
)
optdepends=(
  r-covr
  r-ggplot2
  r-hms
  r-knitr
  r-nanotime
  r-nycflights13
  r-rmarkdown
  r-scales
  r-spelling
  r-testthat
  r-tidyr
  r-timedate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3a722b9084c50c8ff372c3a16605409d')
b2sums=('a8bea81c871768d5902a2056202c009619e1890a0d256ee85731d7295ad1d5ac34e2aff0baf4ab9a089dcde95baaea4f8847e096ce39c55d723e8a14dcc4eab9')

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
