# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=magpie
_pkgver=1.6.0
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
md5sums=('a2d8cace71fdb5936f5e1eda05cf9989')
b2sums=('ea3f23eda8bb8e197d4ffb86eafa337ec8a950f2a2a20f054ce48ff1b7a6f2aa2d562ff849b1b16ee0afb7be1f518491513a29228e6e0d810ba732de9c6a3702')

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
