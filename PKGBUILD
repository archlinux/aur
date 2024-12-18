# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pairedGSEA
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Paired DGE and DGS analysis for gene set enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-aggregation
  r-biocparallel
  r-deseq2
  r-dexseq
  r-fgsea
  r-ggplot2
  r-limma
  r-s4vectors
  r-summarizedexperiment
  r-sva
)
checkdepends=(
  r-msigdbr
  r-plotly
  r-readr
  r-testthat
  r-writexl
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-msigdbr
  r-plotly
  r-readr
  r-readxl
  r-rhdf5
  r-rmarkdown
  r-testthat
  r-writexl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d182fc70ccc15823d971e759d93a8ad9')
b2sums=('734498c3562851937bc5d01f0e4beb7faf0c6d4415a192c74467dbd47c4b7c22d587d72432df57dde8a1c492f8430a85a0b6741f1628abbf0d0b511ab14f6284')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
