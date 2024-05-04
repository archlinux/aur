# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRutils
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package with helper functions for processing drug response data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-drc
  r-jsonlite
  r-jsonvalidate
  r-multiassayexperiment
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-gdrtestdata
  r-qs
  r-testthat
  r-yaml
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-futile.logger
  r-gdrstyle
  r-gdrtestdata
  r-iranges
  r-knitr
  r-lintr
  r-purrr
  r-qs
  r-rcmdcheck
  r-rmarkdown
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6fd781aed5ab1373abdd3824f7fd56be')
b2sums=('0344bab38c3cec803dbf934dd16dcfa8e75d567067e5d48a965cfb4e09574549d46adee6975c75249dbe673664bf9ddacfb85a1be2837af99ae27f2c3f277150')

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
