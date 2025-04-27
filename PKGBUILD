# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=magpie
_pkgver=1.8.0
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
md5sums=('3268730ed580168d150558c1c93a327f')
b2sums=('a0aaf726eb9b6b26b1f42dac1d8f585f340a5800006a4e849f6f0ad0b0a9555a3953c4b22e054b800ec06608272086ac28ebbccb8c787619446726ccfbc2dcfe')

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
