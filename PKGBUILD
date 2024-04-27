# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GloScope
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Population-level Representation on scRNA-Seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-fnn
  r-ggplot2
  r-mclust
  r-mvnfast
  r-rann
  r-rlang
  r-singlecellexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00ab18ecdd0a5768690b841f2f2448e5')
b2sums=('9bfaa3b2b4c8b1876f35a21fffd5362ba56aec8264c20694119114db9e2399d7481ef69c56d8ede4af45747114acb34aa00ae39a1e31cd30896fc4a0656d1343')

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
