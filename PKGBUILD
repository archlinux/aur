# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicInteractionNodes
_pkgver=1.8.0
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
md5sums=('db86e22bb6f88384d71ed1942d3269bb')
b2sums=('f921da5336a25bd90d4ae8f18a34044d8cb20ca5e8229e51c4411f392be3e1a744944706d7cbb07931a31a63e0d3be4c383caf0232fbb064e3838d44c93a8cb7')

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
