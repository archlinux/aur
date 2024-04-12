# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=borealis
_pkgver=1.6.0
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
md5sums=('8b6aa71e360f97c8460bbf5ec3c95d91')
b2sums=('5dd874d1d3fa0da69bad3c0a63f30481442c1ad8a65c28337a947851035a41ab240c0cfc1681ea45f57757b234457289a8e4028564c4b2b1c372ced81935a9cb')

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
