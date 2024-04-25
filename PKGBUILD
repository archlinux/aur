# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRtestData
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="R data package with testing dose reponse data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-checkmate
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-data.table
  r-gdrstyle
  r-knitr
  r-qs
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8de3dea2673f0e7dc9412e36da2c4f9d')
b2sums=('78ef0775a5acf57a420f4d08c37eb7e54a9acded2361455d309ae9d3be3aaebc65a82a09d60a3577d5b80c93989818c594acfe5be60f60d0bfe0d1d0cdaca885')

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
