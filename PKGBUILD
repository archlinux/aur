# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenProSeq
_pkgver=1.14.0
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
md5sums=('786b395c2419fc9aa506062d02e0de76')
b2sums=('d339730c6323fee05eedfa35d31d90884fc03e8e7f566508976027b65f78f7db3e458ecdb18a7cb64c59bfc9b0cdd1506f2148113b14378fcfbb269cf56869b9')

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
