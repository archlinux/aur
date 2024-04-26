# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mslp
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Predict synthetic lethal partners of tumour mutations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
  r-dorng
  r-fmsb
  r-foreach
  r-magrittr
  r-org.hs.eg.db
  r-proc
  r-randomforest
  r-rankprod
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-biocstyle
  r-dofuture
  r-future
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d78607401143e315c9ad75923a0c9c5')
b2sums=('a27df126d2d97d59f6744435cfe6abe5f72f73f10f653171ba10e8eeeb9ca807d26aec9fd405904ad3313e95616a485f2c8ef5805951544163a8c436aa6d7ab0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
