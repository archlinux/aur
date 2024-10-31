# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DepInfeR
_pkgver=1.10.0
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
md5sums=('9b73ea2db7a9bf683124b5ba5d603c50')
b2sums=('80796ba5c604f0fc3243b1163acf49b64945a2616e41a14cfeb5031e01b5331707427f9f21280398922f9e8e3c747b6d922556181657c0e08723db64dc13f4c6')

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
