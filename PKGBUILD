# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=beachmat.hdf5
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-assorthead
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
md5sums=('bac3066f851527d8982a861525e4d433')
b2sums=('ef56de80c31bf85b0976f3817eb0fad0a6dd774292ca8387d18c6f946204b909331e4ef1cf33f32f4c8ee6613cd3338c2f3b00d94e68a0c7df9e7798110aef66')

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
