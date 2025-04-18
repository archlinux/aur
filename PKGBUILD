# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GloScope
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('686497275b93b8f5e40d5e594de254e9')
b2sums=('74f7636f258d72351f6a44cb9a4c6ffeee3279c9717dc3a8f2337851a3680821ae9208f4df44cdd762a9cd23cb68f9651ae6949641d9e372801db8c364a5d1f8')

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
