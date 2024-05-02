# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendSql
_pkgver=1.4.0
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
md5sums=('61490d42add2d10ce6af94e1bd84200d')
b2sums=('e729bdd38cad17af96196e26481fec2caeb555d4d529d956fcdac2851481c80a46141e8829ef038791b89cf7c6fc36dbe61c262fce43bd652e251e40e37c51ee')

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
