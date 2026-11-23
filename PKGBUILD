# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GloScope
_pkgver=2.2.0
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
md5sums=('fe8a054c4a9ae6e32c58e02b0a4fee95')
b2sums=('eef6e848bb30effb769ebef351857ee91fe465569b6ff599503d3661ad44a8e037ab98e635c98e02a437f920a981d4c688504084d8975e5793cc088a76cd66f0')

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
