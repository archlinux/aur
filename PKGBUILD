# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unigd
_pkgver=0.1.2
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
md5sums=('8f7bdc9d6746a34658daba5b9793ba18')
b2sums=('c10cb5387b9a6edb207803ad88295e9a734b9cfefa161c16ab8144746ff8f3e0188dccbb2c848620f02ece8265e8d85c931aceaa7672b9af6be2993f2a283e60')

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
