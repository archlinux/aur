# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OutSplice
_pkgver=1.6.0
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
md5sums=('6a74e00206c137f0e08703cc06a114fc')
b2sums=('9512df5e3e8d7abbbb0e4ba377f55dcb757c2942b03cf4df7a5574a43cd13068533417dd1ef49770d1d5d9b647016efda16908427193cd19300144ebb1789be9')

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
