# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicInteractionNodes
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A R/Bioconductor package to detect the interaction nodes from HiC/HiChIP/HiCAR data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Apache)
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
md5sums=('bacb75bdd25ea06d5102c1ef2648c588')
sha256sums=('4c06511ba207d07b071317972fcfb9bc0c45d5d7958b8b1be9c03113a7ecc004')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
