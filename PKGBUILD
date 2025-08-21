# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=exact2x2
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exact Tests and Confidence Intervals for 2x2 Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-exactci
  r-ssanv
)
checkdepends=(
  r-exact
  r-testthat
)
optdepends=(
  r-exact
  r-ggplot2
  r-gridextra
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('306816c647c2759d6b593f5f55bdb8e6')
b2sums=('75e3daa46700c22ae45552be4014f91de2d35e95c0fecf6b319b6322c6659f9316e2554466501ac3dbe6b6c1463b887fa0c444ae31c5cf2d7dc8b89c7a3375ef')

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
