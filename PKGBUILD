# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendSql
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SQL-based Mass Spectrometry Data Backend"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('c5d7c6ce9c877e7c0bbbc1b63a71eb70')
sha256sums=('40c5538d884b82603ecb7f1b0e0fa2ad49ba4849eda48ad6be0f7af6ae2788c8')

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
