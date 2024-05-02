# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=vsclust
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('82171a61a9b29573ebe5c4987120fd11')
b2sums=('bbedd1841c8272acf0603f516fed20543177af241e72ffdb944a64c57f7a53949c567ea7792d9aabd4ae39f58024ab8860f9e2b4e5eac36a95f5752615f03aef')

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
