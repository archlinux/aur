# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ncmeta
_pkgver=0.4.0
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
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10a98935f8ef628b71c8f93d5e0e3224')
b2sums=('d5c3b7df301efa2af365557c9047de80bc3cca2d7a8dbf888e90e6c04daa34d00396f2d2d347b4bfe521cfbb062589bce4c37b3d7e2c0488aea6c9a5d55d19e4')

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
