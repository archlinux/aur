# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CFtime
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Using CF-Compliant Calendars with Climate Projection Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-r6
)
checkdepends=(
  r-ncdf4
  r-stringr
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-ncdfcf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a476268ea474cbb67b88a7d8e6eda38a')
b2sums=('f63a9b5dd36d5431e63cb3f38234b4a9aa4d3680cf9ea7d5049ea155d9e4a4ff494db22ae4b4483a00cf93f0ace34402f6ca57b34d967eaf082e97c60c29905f')

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
