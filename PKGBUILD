# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DepInfeR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inferring tumor-specific cancer dependencies through integrating ex-vivo drug response assays and drug-protein profiling"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-glmnet
  r-matrixstats
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ggbeeswarm
  r-ggplot2
  r-ggrepel
  r-knitr
  r-missforest
  r-pheatmap
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4cb176a6227344ded6ac96d71b9f2c46')
b2sums=('ba7b73a4863cece51914abc82c9bd94ae769ca2069ab60bd76c96e529a344708af4d5e426c6a47f0350bbb57bd6a414491f7015a8af8d24e44fdc1d4cc733248')

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
