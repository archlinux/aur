# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=magpie
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MeRIP-Seq data Analysis for Genomic Power Investigation and Evaluation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-aod
  r-biocparallel
  r-deseq2
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixstats
  r-openxlsx
  r-rcolorbrewer
  r-reshape2
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-tress
)
checkdepends=(
  r-biocgenerics
  r-runit
  r-tbx20bamsubset
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-kableextra
  r-knitr
  r-rmarkdown
  r-runit
  r-tbx20bamsubset
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df68a1e182e8a767e804d5775e385499')
b2sums=('83904271ed3fda8d7c3faaa79828a3e84702699291ef95bb5d121fa51a1500d813c40df18483d4fc82496ba78ab40911f62071240b56cdb31a122b94b285953d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
