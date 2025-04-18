# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultiRNAflow
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for integrated analysis of temporal RNA-seq data with multiple biological conditions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-complexheatmap
  r-deseq2
  r-factoextra
  r-factominer
  r-ggalluvial
  r-ggplot2
  r-ggplotify
  r-ggrepel
  r-gprofiler2
  r-mfuzz
  r-plot3d
  r-plot3drgl
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-upsetr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-e1071
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ed0955827595d68f48de859abd31941')
b2sums=('c2bfb96a348f7b791595f103e99259bb3101c7768002894439b931fc4cea5e50db1740d4ef3f0be198290d1b05937dac12a89235c322e62f2d2d34841a7a00db')

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
