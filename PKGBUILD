# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fuzzyjoin
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Join Tables Together on Inexact Matching"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-geosphere
  r-purrr
  r-stringdist
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-ggplot2
  r-iranges
  r-testthat
)
optdepends=(
  r-covr
  r-ggplot2
  r-iranges
  r-knitr
  r-maps
  r-qdapdictionaries
  r-readr
  r-rmarkdown
  r-rvest
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac80274ea05f9711def3ff20b733c151')
b2sums=('69e4fe4eee690f11dfbe33f57d376df5922b850f03e266ef9cbb3ab0a1382cb467741b10bec63ee9f34a449190eace7dd2fb095e74347049b5c398edd8bc2135')

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
