# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RBioFormats
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R interface to Bio-Formats"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  java-runtime
  r-ebimage
  r-rjava
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a376f226e64307c3b02230b87f0270f2')
b2sums=('b46f2ed07a06c28dcc3b7392df5bdf56af574921feac97026e34a7cde8206cab70ba05000e30c72e23230b018a90a70d2e808f99808e2b8d5201f47cb9e1b8d9')

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
