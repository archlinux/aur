# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lineagespot
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Detection of SARS-CoV-2 lineages in wastewater samples using next-generation sequencing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-data.table
  r-httr
  r-matrixgenerics
  r-stringr
  r-summarizedexperiment
  r-variantannotation
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-refmanager
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a06bfea8fdf81ea88ebe7f4478607f6')
b2sums=('98a4e8a42bbb8706e0bc54bba2f16e4366db13b396cc54bddd69e622ae89880d2c1a28a3bead9b302dbd1c87ba236e64706deeaa96db26ba42f0d88b0f0ada45')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
