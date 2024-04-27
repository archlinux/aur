# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=vsclust
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Feature-based variance-sensitive quantitative clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-limma
  r-matrixstats
  r-multiassayexperiment
  r-qvalue
  r-shiny
)
makedepends=(
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-knitr
  r-rmarkdown
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c492a6d65d0b230211a0f95706b51a4')
b2sums=('5f8f8849b5eb42cca0c73767cf8eae95f22473855054021ab78ecfdf2dc1725de17f06a477b742fccb40b72ab4f5af5a7f8ad083cdb28e4abee95da6b0bd737c')

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
