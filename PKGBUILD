# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClustIRR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering of immune receptor repertoires"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-blaster
  r-igraph
  r-pwalign
  r-stringdist
  r-visnetwork
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-ggrepel
  r-knitr
  r-patchwork
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2a70cc35428d5d7f7029d4f29df16bb')
b2sums=('220054fcdb95fd57efcfdfe629340692d4ea055cd51d9eec9bf17e9d628456f1ef875076a9bea1149635728c00f77385e96c674e2de1681e7c7a7cf6e735309c')

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
