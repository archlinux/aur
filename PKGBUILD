# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=updateObject
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Find/fix old serialized S4 instances"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  git
  r-biocgenerics
  r-digest
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-interactionset
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-timirgen
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b89ed6f6a78a7c9bc7e602cdc9b6aae6')
b2sums=('94edf1065369125c5f6d32642d68742fd1b74b29dbbb01062674d9f58a981b551a7344484b5719fc2ed87f05253a9c236074b740dc1c5043add7c63e441c9564')

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
