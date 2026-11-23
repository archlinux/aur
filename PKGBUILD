# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pairedGSEA
_pkgver=1.12.1
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
  r-msigdbr
  r-s4vectors
  r-showtext
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
  r-plotly
  r-readr
  r-readxl
  r-rhdf5
  r-rmarkdown
  r-testthat
  r-writexl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b1def61b8133c994947582fbab7a08c')
b2sums=('cf90197f0d3c87908eedb644cf58462ae79a61f55e58013ffecf672d40616bc47e59755a031f80236a657061ef9ff17d4d73f31a526a17c7fbce93607eea27bc')

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
