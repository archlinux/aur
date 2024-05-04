# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRcore
_pkgver=1.2.0
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
md5sums=('cfb3aace029a6e907e3c52dc06fa2e4d')
b2sums=('499744f71ad0c9dde78eecf401fdae6e3329658769b2309c574138172ec390085b73579fc07f0c7f104113d6cf0555363761771f86cd4058ae6fc9f8253562e7')

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
