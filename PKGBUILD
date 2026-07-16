# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=xcore
_pkgver=1.16.0
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
md5sums=('c0f00fadbeb93c25af32e7782b6f00d8')
b2sums=('4e6be006034e09fbd8008484eab441ccabc136af7a9ffe05874d0ff9ced707c3c1511a68eed01c5b3bbffb8a87b111638973de6e9affd001ecd3bf4d526a9966')

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
