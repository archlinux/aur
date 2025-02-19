# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unigd
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Universal Graphics Device"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  cairo
  libpng
  libtiff
  r-systemfonts
  zlib
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-fontquiver
  r-testthat
  r-xml2
)
optdepends=(
  r-covr
  r-fontquiver
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fbfcd57df2d1d3aa19d1904c1a9d74e5')
b2sums=('7a6c8f8b123397f27b2752da745e683608e85068bc7a8d8d34ff04a847d04a222b0bc43580588ad0f3a8115e6646aeda3f923b3caa2de635826a913c9d392337')

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
