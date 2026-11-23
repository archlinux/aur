# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendSql
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SQL-based Mass Spectrometry Data Backend"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-dbi
  r-fastmatch
  r-iranges
  r-mscoreutils
  r-progress
  r-protgenerics
  r-s4vectors
  r-spectra
  r-stringi
)
checkdepends=(
  r-msdatahub
  r-mzr
  r-rsqlite
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-microbenchmark
  r-msdatahub
  r-mzr
  r-rmarkdown
  r-roxygen2
  r-rsqlite
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('246f535e6509b3c03f4b607a7398a31c')
b2sums=('e202e95abd40e56663260e314dc1420236fd753ecd066026fc28f7eb297b120ca0c6592b4968d06e4818ec0c7cb0a3c21ee2569f54bdc9b1f118f36fcbc94ee5')

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
