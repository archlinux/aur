# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pairedGSEA
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Paired DGE and DGS analysis for gene set enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('591cbbc31b4eab5064ef39c4b8133fa5')
sha256sums=('bead1ecc8d1cc2f4e370ec6062bc0a873a5b2cce3818937c5c6a1bb7e02b97d1')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
