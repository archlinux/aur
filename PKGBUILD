# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=borealis
_pkgver=1.8.0
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
md5sums=('5609663e21e3cccbc1e2ddf56bf938d4')
b2sums=('54e6b5ef1c6305d41de5ef211636cd9534d55e95f8f688cb0978a65e971d66fe548d577d589ce087246c1b21ae43d2476f543dd5a6b10052aac50e9037176387')

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
