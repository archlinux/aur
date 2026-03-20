# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tsibble
_pkgver=1.2.0
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
md5sums=('d584b250bac8891c6791065e0550d231')
b2sums=('448969d38ce1789e9d9cf92ca213fda558d52514cb90c2ce98cf0a549549ae5a52ff2ae79b66f0d804bfbd02a6532ba0cf37f04e9397aa49ac6729de739aa0fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
