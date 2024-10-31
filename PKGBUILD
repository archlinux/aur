# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendSql
_pkgver=1.6.0
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
  r-iranges
  r-mscoreutils
  r-progress
  r-protgenerics
  r-s4vectors
  r-spectra
)
checkdepends=(
  r-msdata
  r-mzr
  r-rsqlite
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-microbenchmark
  r-msdata
  r-mzr
  r-rmarkdown
  r-roxygen2
  r-rsqlite
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c744daa8fc956b4c7c99e1e4998f5db')
b2sums=('b619f3afa94b010ef4972a884958d46f2814b21e2beea2923dd212a31e0448281aa4c86857e124698c3cee2fe86ae50c3a12df35c13a5845fe1613fb0a14440d')

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
