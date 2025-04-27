# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OutSplice
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Comparison of Splicing Events between Tumor and Normal Samples"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationdbi
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-org.hs.eg.db
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1671a55f8d60afee151928d66ade60d')
b2sums=('49dc3a45bc6fd9f7dcfc30f2d17db61da9ddcc0970cf617092cd63b7494efd4a2b3bd3fd48b1106875f77233644ae23304fcfb670f7854cb41e139a50de2b842')

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
