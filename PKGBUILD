# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHETAH
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast and accurate scRNA-seq cell type identification"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(AGPL3)
depends=(
  r-biodist
  r-corrplot
  r-cowplot
  r-dendextend
  r-ggplot2
  r-pheatmap
  r-plotly
  r-reshape2
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6b920a4a3f3f931acb3cd950c7a74c3')
sha256sums=('46970b6775d218fdd2e1248f24ae8f24e9f18703c768461c123c4a7dc27ce678')

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
}
