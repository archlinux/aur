# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pairedGSEA
_pkgver=1.4.0
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
md5sums=('2e2d1521409b95e8f06e73b8341b2749')
b2sums=('2d131331baa32956d6581b3353b75bd5e032f7e298ab9f2108c2318ede8e4785b7a3fad0e1869fafc9802324241872d2e0415dc3a7c5fc6f0349201e6c873050')

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
