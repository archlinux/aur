# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lineagespot
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('db94e06752b3f9b0c90e578d762ff64f')
b2sums=('75f6ebe26c341f3286acf3edf90233e111923ee69f221554cd972e0271fefa1339f55e6f2b2ad52db49049c70336cecafe8885e6ed333fee25b3cca724997fcd')

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
