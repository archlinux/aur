# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pairedGSEA
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('591cbbc31b4eab5064ef39c4b8133fa5')
b2sums=('a4b8ecaaa95a5f3c55ec1a6db289aca8a93c3617bbd82d82cff105c92cc0769e504ed23cced279098ab5ac349acad59a614e83f6d1c98618b3a11ca7597ac861')

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
