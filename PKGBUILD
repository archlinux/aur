# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spdep
_pkgver=1.3-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial Dependence: Weighting Schemes, Statistics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-deldir
  r-e1071
  r-s2
  r-sf
  r-sp
  r-spdata
  r-units
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-classint
  r-dbscan
  r-ggplot2
  r-igraph
  r-knitr
  r-rcolorbrewer
  r-rgeoda
  r-rmarkdown
  r-rspectra
  r-spam
  r-spatialreg
  r-tinytest
  r-tmap
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('682a4cee28cafcc1d72d77d3597abdce')
b2sums=('bad967b617003e19bd68c94ddb9a18ea7f757d56be211b094f4651f82540f2c6ade69cfb56a221de58c1cef63f6c853f37aa1c19bae6ddebd7ad8cf7f1f40e63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
