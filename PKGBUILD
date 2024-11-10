# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=borealis
_pkgver=1.10.0
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
md5sums=('284017a6199bf885961cfe4a246bb7fc')
b2sums=('38409d982328f31fe7c7054269323b96845d3f7d2c01181062f620d85f84dc416d529e838cb67fa8a4b8b51e5596384d30ec4cb7edc49c577d479096b342d985')

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
