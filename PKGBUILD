# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CFtime
_pkgver=1.7.0
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
md5sums=('4e64d34fe636771922cfc370f5f16e16')
b2sums=('901e7f22fa3817acd522c8332785571891c8f7c28c4ff5c94d770a2abcfd3ab1b9c35a3d4edca7234159e08c73066b3c26d92845e1a208f27beff47ad691314a')

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
