# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=INTACT
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrate TWAS and Colocalization Analysis for Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only AND AGPL-3.0-only')
depends=(
  r-bdsmatrix
  r-ggplot2
  r-numderiv
  r-squarem
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c89f1cd2831919ac32bfa860441b4155')
b2sums=('b5e6889caf901c09c65f3edd2f474cf3fcfb34a75aea9bcc49ff27f066232f04eb95564e0a9cfe301f87cfe4a9978504f803aac80673b5cde1efe33c8d730f06')

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
