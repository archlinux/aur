# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CFtime
_pkgver=1.5.1
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
md5sums=('32efd12349ed710f32b9a7d207f53c58')
b2sums=('58019c87776d0d2fbb8477392a16e4253bf52da9ebed1b833fe78c4ec04e556452cf826bb814e14a0cc006f68c301a4a2ff60a4c6f945a479d0d53586d27ca1c')

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
