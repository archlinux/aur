# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cardelino
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clone Identification from Single Cell Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-combinat
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggtree
  r-matrixstats
  r-pheatmap
  r-s4vectors
  r-snpstats
  r-variantannotation
  r-vcfr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-foreach
  r-knitr
  r-pcamethods
  r-rmarkdown
  r-testthat
  r-vgam
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b78c296bb88b1ec63c5e8be26418e60a')
b2sums=('7493e95a08a054a60f055d8553ae97a41513f9c6052c3f2b06170abcc1b3ddf084e24cccb1a940121335b32411c7d2157e65933542bf9e3050184a3aa7103265')

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
