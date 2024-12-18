# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cardelino
_pkgver=1.8.0
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
md5sums=('cd0a4c4ec8ded3c833d1e32aeb2af021')
b2sums=('bea59010f50630c72b1bb871af78c55044abb7704cac879956b25e73ca93fe3248a7c591c0b816ff475efe13aaed7c755176dda90bda93b33ac552e2db611f3a')

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
