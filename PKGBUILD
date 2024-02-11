# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=APL
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Association Plots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
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
md5sums=('e6a2a3a7eb66393dfc3216adbc757dc7')
b2sums=('12d42e136bb087b7aa3b3764fbdc18b8fe32ec749e9be5dcd1df67dc11fe6bebcb6608f0e5a46af3c734b4538a6355bb354e9addb2fbc38b11b18a6399592cb7')

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
}
