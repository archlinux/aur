# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OutSplice
_pkgver=1.4.0
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
md5sums=('9be50732d703c3dd77d71a1750619c78')
b2sums=('dad81b8ff0e99e298e44690e8cc2c72ad87bf18af09178c60110259305419b70dcd29b97c7a3fb3285189b6941f97305ad276f47e28a683285a6b13b9b2e0e0c')

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
