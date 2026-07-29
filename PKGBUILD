# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ncmeta
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Straightforward 'NetCDF' Metadata"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cftime
  r-dplyr
  r-rlang
  r-rnetcdf
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0f6c4bc8b958ea13eab7e940240bbeca')
b2sums=('66d410fb895f11458de15db73d1ce0907f7b8e491c40e9e06219e661cbc2f3617bc8df5fe3d2707f2af5854d482d641dd48503ae6876214aaf0145089524d853')

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
