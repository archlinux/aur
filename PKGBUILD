# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicInteractionNodes
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('bacb75bdd25ea06d5102c1ef2648c588')
b2sums=('63583dc0ed81c61483713e94c8ce648feda1d9d184999da8d1c64d56dd901099513f9fa807a97af12f48701994ec3cdf6e58dfd160cba29728fab7df5ea215da')

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
