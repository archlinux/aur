# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=chihaya
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save Delayed Operations to a HDF5 File"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-delayedarray
  r-hdf5array
  r-rcpp
  r-rhdf5
  zlib
)
makedepends=(
  r-rhdf5lib
)
checkdepends=(
  r-biocsingular
  r-residualmatrix
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocsingular
  r-biocstyle
  r-knitr
  r-residualmatrix
  r-rmarkdown
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8edd98519d34972c7110c6de31416bdc')
b2sums=('2595f9bd2d8bb5d68b74217eed1df5b2a1541bbbfbd390f09a98f02ae5b2dd60d104d19920b22340f11b9424fb837bc141f21fa030c2bd3272b082a155fe06bc')

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
