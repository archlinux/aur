# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=xcore
_pkgver=1.10.0
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
md5sums=('1f25b26360120ca184ece31f704c8daa')
b2sums=('ed092a287cad773a43cb6c068933b9f01c929bda0dccba9e99778e91dcfa6e694416488e246737b4b0ddd0e8cf53222fd2c77798cd6d056fcb6d8707e8ed96a4')

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
