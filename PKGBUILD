# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compSPOT
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('7aa69c9c3ec0c008ad0fdfb4dbbcac57')
b2sums=('aa3273ac91f1f39b9d817d8c7a7436e4a177315626712906cf008ea9027e3a5719d3c11232d4e02281c9cb50296239a4f52eb124099c680c6e4aec31be31f09f')

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
