# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=decontX
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Decontamination of single cell genomics data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  onetbb
  r-celda
  r-dbscan
  r-delayedarray
  r-ggplot2
  r-mcmcprecision
  r-patchwork
  r-plyr
  r-rcpp
  r-rcppparallel
  r-reshape2
  r-rstan
  r-rstantools
  r-s4vectors
  r-scater
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-withr
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
  r-scran
  r-singlecellmultimodal
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3e8bb59b59d977702d9acdcbee2c522a')
b2sums=('7ea57919917777c334ae6eab818254fd96dcd774f51ef70c3886873032ccc65e2c218c1f40d8ef51a9f35e684bc7c56c8ce98b72f8cc222fb8137de576446a39')

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
