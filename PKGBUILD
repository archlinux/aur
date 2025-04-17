# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DepInfeR
_pkgver=1.12.0
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
md5sums=('87682965f00273713b5527d49d1981bc')
b2sums=('7f6a65be33c78cb3085f52541d80f1b24d3aff98d53c22b06af4278aeddbc9f12e0b3f58e1b32609d8e22df7869fc17373c702b7847a72b592080a93729c71ec')

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
