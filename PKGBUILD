# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDesign3
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A unified framework of realistic in silico data generation and statistical model inference for single-cell and spatial omics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-coop
  r-dplyr
  r-gamlss
  r-gamlss.dist
  r-ggplot2
  r-irlba
  r-matrixstats
  r-mclust
  r-mvtnorm
  r-pbmcapply
  r-singlecellexperiment
  r-sparsemvn
  r-summarizedexperiment
  r-tibble
  r-umap
  r-viridis
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-mvnfast
  r-refmanager
  r-rmarkdown
  r-rvinecopulib
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c87d51aea05f7911634ff13e0bb9206a')
b2sums=('ebfbad45e4f85c890b8c2cad4712f587d52e51adebd57226f4e2576fa5c9552bffe9623aef1a897ecec433dc000fc5a3b1942f319521a8ed04208e130e5f197a')

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
