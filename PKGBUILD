# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicInteractionNodes
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A R/Bioconductor package to detect the interaction nodes from HiC/HiChIP/HiCAR data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-annotationdbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-go.db
  r-graph
  r-iranges
  r-rbgl
  r-s4vectors
)
checkdepends=(
  r-org.hs.eg.db
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-rtracklayer
  r-runit
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d250124934c9785b2c9b3c53727330f')
b2sums=('9aa50f282921b16c3a250ee8588f67d0c867260c75afcbdf971d8377ffad50b184b28fd9f124ad0f4d56351e4eae909f016ac9abc23cd460a853e8e880ea10df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
