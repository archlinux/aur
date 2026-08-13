# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=borealis
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bisulfite-seq OutlieR mEthylation At singLe-sIte reSolution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-bsseq
  r-cowplot
  r-doparallel
  r-dplyr
  r-dss
  r-foreach
  r-gamlss
  r-gamlss.dist
  r-genomicranges
  r-ggplot2
  r-plyr
  r-purrr
  r-r.utils
  r-rlang
  r-snow
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-annotatr
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-runit
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63a8cb12b8cc39165f4050ba7a66c74d')
b2sums=('f875aa736d5d6248c7ccd71585480e79838115f1fdde78e91986226ce91363bdacbf8e7834620884fbfec08ea7a55f65e8d9f91abe4eca29efb8d83cde940aa3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
