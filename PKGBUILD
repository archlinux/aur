# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DepInfeR
_pkgver=1.8.0
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
md5sums=('7a9fd303e64102d0d4128c2b15d0a422')
b2sums=('95bde4888ba4bc87f88440a41099e0c7cd7c381277e721e668aa6ea9af0cee5dd9c3a2ecd68bafd1837e582c758e7a6a4c3d625311c2b55438e6b4993ae2f57c')

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
