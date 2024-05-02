# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compSPOT
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tool for identifying and comparing significantly mutated genomic hotspots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-magrittr
  r-plotly
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
md5sums=('fd934e7668992328ea7758317b397eb6')
b2sums=('0698b51f55c9b42a61abdeb95bdd76fd83b2b719aaeec905d9d6711e869aa614e5f096a412f4ab4f5b85b5821f9e1d2966040b085ec5ee68a63d1fa1ff5d9488')

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
