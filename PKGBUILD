# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SparseArray
_pkgver=1.10.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="High-performance sparse data representation and manipulation in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-s4arrays
  r-s4vectors
  r-xvector
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8dc81480e3e0186a7848fc105c78db8c')
b2sums=('0f863072b9c5c0c5cffd8294ca3c6bee4d8559a0491a73c2cfd5a00b38d34953f855eb4fdb38bcf953b2df01263ce58e2e8cd9cdf7e1da274588f5c604c09fff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
