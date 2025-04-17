# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenProSeq
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generating Protein Sequences with Deep Generative Models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-catencoders
  r-deeppincs
  r-keras
  r-mclust
  r-reticulate
  r-tensorflow
  r-ttgsea
  r-word2vec
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringdist
  r-testthat
  r-vaexprs
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5df09c8b112e70cc6926e8045cc52190')
b2sums=('f87c4b09d3eb3aeaf346c20156d5c413fe161b6c106f4db6f7a957d08a5fa9424005b79b09b7d58b9928e826c1a0a24ecc2e3ae5e79e1579c7ef98a397d00b47')

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
