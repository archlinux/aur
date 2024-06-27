# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tsibble
_pkgver=1.1.5
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
md5sums=('8df4a7144f1286f35ce2b099ad3d6230')
b2sums=('6ddf26f9fd05abc23a7b439245355d691e3b3910408924284b3ceffed98a545e568ea74acb58a3f202ee80c6e5f477cb5991d7e918c9f8345c0b4ea18c41c4dc')

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
