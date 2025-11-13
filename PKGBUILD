# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=chihaya
_pkgver=1.10.0
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
md5sums=('c514f17b2ed2c6544708206be95d14aa')
b2sums=('a4c077afea475788bf25c0d66521804ea0b9bac8bcffc07fdf9f3855d81657a6c3c49b4fc5fccd4fc865d1a860f20dc74047d1e05bd6f81aba867196532deebd')

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
