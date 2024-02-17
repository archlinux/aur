# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRcore
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing functions and interface to process and analyze drug dose-response data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-futile.logger
  r-gdrutils
  r-multiassayexperiment
  r-purrr
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-gdrimport
  r-gdrtestdata
  r-qs
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gdrimport
  r-gdrstyle
  r-gdrtestdata
  r-iranges
  r-knitr
  r-pkgbuild
  r-qs
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c6f8d5e650506c1da3a8372f16f690da')
b2sums=('c3fcf3165910dbe3e1819afb10a12bd267a59b026e4cd009016d6c8c64c80885835c6fb10a65e10d16704e814e8aa73e53dfc84dc95c00269e570613abe4f81f')

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
