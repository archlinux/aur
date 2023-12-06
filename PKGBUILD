# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=vsclust
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Feature-based variance-sensitive quantitative clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
sha256sums=('3438992407e27098a9304721bbb07d30fb85d3c238bdda0d96a5cca9d0e9748d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
