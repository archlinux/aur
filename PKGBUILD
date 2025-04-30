# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRutils
_pkgver=1.6.0
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
  r-scales
  r-mockery
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b5d35b8fcda56b7fdea1aa550d77d5f7')
b2sums=('75cfa08bb72330795b62e10e3f0da5dd205a9d11eaf2f6c4e6c9cc26b698bbb27fa7b76f2e236494e3ee49a95a8e99dabb79080bf918212415b14f90b47185ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
