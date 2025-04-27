# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=borealis
_pkgver=1.12.0
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
md5sums=('e91261c4971cdcb27e1c35f4e9e0d7e2')
b2sums=('a96266a8473358405d7a08f0f4190a9c77a3e198d3c86d1f21c5f81711e6e0218b5cdec5ae6a9d1188a14c1bfac13441609b1152f9e79662b7728ac563fa1e7f')

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
