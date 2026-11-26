# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=xcore
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="xcore expression regulators inference"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-delayedarray
  r-edger
  r-foreach
  r-genomicranges
  r-glmnet
  r-iranges
  r-iterators
  r-magrittr
  r-multiassayexperiment
  r-s4vectors
)
checkdepends=(
  r-ridge
  r-testthat
)
optdepends=(
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-biocstyle
  r-data.table
  r-devtools
  r-doparallel
  r-experimenthub
  r-knitr
  r-pheatmap
  r-proxy
  r-ridge
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-usethis
  r-xcoredata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e8ed647329d2b03d8f646dc6a115708c')
b2sums=('cb9767d445f50ec763dc1b5c1fb52624b4449470eb8a3f1d50eb6e06d2578ffe6ac34221b79e126dcef1c4a430521a394fe2f18894301cf7bf79b19e86602485')

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
