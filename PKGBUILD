# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=beachmat.hdf5
_pkgver=1.12.0
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
md5sums=('334e53df21ff045ea2dbf4c48d267534')
b2sums=('7db1518a8553b823acec4ee5642277e56005667b87c2fa2558220c5563875e1372ad162ef4b4430bfc22ad88f430c28fcd7a44cbdb8641cc594cecc1b70565a3')

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
