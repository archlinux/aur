# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fixest
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Fixed-Effects Estimations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dreamerr
  r-numderiv
  r-rcpp
  r-sandwich
  r-stringmagic
)
checkdepends=(
  r-data.table
)
optdepends=(
  r-aer
  r-data.table
  r-emmeans
  r-estimability
  r-ggplot2
  r-knitr
  r-lfe
  r-pander
  r-pdftools
  r-plm
  r-rmarkdown
  r-tinytex
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa85a1ad448d0f41fc02100eee502059')
b2sums=('e1cad001e1ce16953f560bc0f1f95dd8b9d829ab5240cc01aaed4648a0d5762eb305d33f2eb7c453290b697c587bdd96d10e9d39388a31c887b86c780899e1da')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla fixest_tests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
