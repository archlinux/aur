# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GloScope
_pkgver=2.4.0
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
  r-permute
  r-pheatmap
  r-rann
  r-rcolorbrewer
  r-rlang
  r-singlecellexperiment
  r-vegan
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
md5sums=('3a8738b08b5fe9d054ae001223344010')
b2sums=('59fd73c503923c24a6fb3c7655e26616a7400dc823b3332e6ed82ca06e263c107629ae715c1ff6e36617f1cfe45b8449094426a4cdffd62471a6036a9c7a21fd')

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
