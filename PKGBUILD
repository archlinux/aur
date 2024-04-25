# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendSql
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('c5d7c6ce9c877e7c0bbbc1b63a71eb70')
b2sums=('64f46f0675e57a53cb8b6963d175d888a498cbe09641e702ade67bc003eddaef969d1fa7e35b47b3625a6a3ead88172d51703d762e164b9a246fe12554b39dc7')

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
