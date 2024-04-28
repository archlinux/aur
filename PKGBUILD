# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=beachmat.hdf5
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="beachmat bindings for HDF5-backed matrices"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-beachmat
  r-delayedarray
  r-hdf5array
  r-rcpp
  zlib
)
makedepends=(
  r-rhdf5lib
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b2ca9b6358fb05895101e6a911ca0e39')
b2sums=('43e354d80d8ff674ec07e942ac12c3b6123f2902be9a0b78630b43490a4a0279bdbf023ecd9faf3691250ce1f9e6125f560a41f6fe4881f99eaf47920d1dd4fd')

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
