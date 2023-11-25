# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinylogs
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Record Everything that Happens in a 'Shiny' Application"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-anytime
  r-bit64
  r-data.table
  r-digest
  r-htmltools
  r-jsonlite
  r-nanotime
  r-shiny
)
checkdepends=(
  r-dbi
  r-rsqlite
  r-testthat
)
optdepends=(
  r-covr
  r-dbi
  r-googledrive
  r-knitr
  r-rmarkdown
  r-rsqlite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25ffc5c472d557ee69e2d18aa4ae352d')
sha256sums=('527e362c0f00571d2463187c90486563922e813c988037d989764cc13ff829f0')

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
