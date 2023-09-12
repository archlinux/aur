# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tsibble
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy Temporal Data Frames and Tools"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
md5sums=('1ba30f678a5b2040bae0b41819efc97c')
sha256sums=('1f4213eef8f6f2d6c82ac9f680b0e8f432ab2e3bf8ca09f328821a33a49e6561')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
