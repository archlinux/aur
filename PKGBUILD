# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compSPOT
_pkgver=1.12.0
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
md5sums=('86c298a6bce6e7ab05347a9d613d0b33')
b2sums=('339f3ae91be68e07daf578547f4e97d876abd194ad6de08abfd66c6472c020827e97cdebca2be6006852aae002fe5cab80a64b1fd54883378fab1c91b4e50a5d')

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
