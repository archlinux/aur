# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OutSplice
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Comparison of Splicing Events between Tumor and Normal Samples"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-annotationdbi
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-org.hs.eg.db
  r-repitools
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
md5sums=('7a55735983a79681a2bbcd567c9f0c53')
sha256sums=('04a0e39ab46157dc360a56ed4177595b7bd30eb3ace1a1e5adf5d41785804aeb')

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
