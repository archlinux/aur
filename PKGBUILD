# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=APL
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Association Plots"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-ggplot2
  r-ggrepel
  r-magrittr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-plotly
  r-reticulate
  r-rlang
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-topgo
  r-viridislite
)
checkdepends=(
  python-pytorch
  r-testthat
)
optdepends=(
  "python-pytorch: faster singular value decomposition"
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('725b38bc042e6b6fd349aac0ff3d471c')
sha256sums=('700572f8633421a466702378e5996b7e69f0c508ce8fa5f27bcee03742393a5d')

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
