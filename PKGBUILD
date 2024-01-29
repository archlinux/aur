# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tsibble
_pkgver=1.1.4
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
md5sums=('9e43ff1fa59c9385ba04a2bd04e04bbd')
b2sums=('5982bfd2397704b440da7bcdc5288302a795b49c60b0f17ce8abc8da01baab5db47fa02f7a5ab314acd8fbc330fa73318dc11d1aa34eebe2b83e9153b99efc18')

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
