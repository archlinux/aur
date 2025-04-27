# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicInteractionNodes
_pkgver=1.12.0
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
md5sums=('a0d4b1990b5a0bae5bb0937ab180192d')
b2sums=('0985bccebcc3a2e02ce1f6194c9381bb0b8553bc5e7a96fc936bc7efedcc3b4e78a416b3b759b34ab5c32c2b78bb7d2d9f84500e8fd39b7d9988aec7d0736751')

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
