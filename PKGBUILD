# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRtestData
_pkgver=1.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R data package with testing dose reponse data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-checkmate
  r-data.table
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gdrstyle
  r-knitr
  r-qs
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebfe454b09f6a1dbf48ba4bd605cbea5')
b2sums=('bed3131bb6f5d62967562579152c434628d54ebc2b634e2a09a8813fd3d57d368d80e62dbd20faa3d35baa86326a12dcbf42e871b77f17fbe9c77533a7619527')

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
