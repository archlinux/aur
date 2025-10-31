# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DepInfeR
_pkgver=1.14.0
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
md5sums=('63c6bd62901c1be3cfd4139c1fbc232e')
b2sums=('1829dafae71f24915636e3add12512d466d5d6c3d9a8b39d69150cab4879e38c3f6f6e4ecb80c4310ee5795b53f275e3ffca148a139c2c561982a9d9da7540e7')

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
