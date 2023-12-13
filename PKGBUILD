# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=xcore
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="xcore expression regulators inference"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
md5sums=('4dd79b63bd7ff46aaa1b84dade889db2')
sha256sums=('a76393504e53465ec243c02997f8aeb8c40dc9293738064012f1aeaf57362754')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
