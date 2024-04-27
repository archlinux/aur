# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spaSim
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Spatial point data simulator for tissue images"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dplyr
  r-ggplot2
  r-rann
  r-spatialexperiment
  r-spatstat.geom
  r-spatstat.random
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d69e70975aaaa9bffc5e52f95885e59c')
b2sums=('41088779a896961d27a27bb975a83bd0ecb924fa51fed560bdc401644045d98bcf0796399a46fcb6eede337db92d3fc12f8fd8e474e7f7c9adcd648a2f829b4d')

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
