# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CFtime
_pkgver=1.5.0
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
  r-ncdf4
  r-rmarkdown
  r-rnetcdf
  r-stringr
  r-testthat
  r-ncdfcf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e9edc420def4661f323e836c19795004')
b2sums=('00b7d3e34d2fb52671400d6768c2c8ad7b0eb922032d5038a64baffe51710a2e7e9398c08864095406c4f3a669a2de7079349c15fda0a07760d6fcaf0d0fdef2')

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
