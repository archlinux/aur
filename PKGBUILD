# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenProSeq
_pkgver=1.8.0
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
md5sums=('d55315036a35caebbdb1ca166ef24a7f')
b2sums=('4cee99be25d4fa0745343c90254824e7ff57288ad352c431c5803eabaaaea92b89e2d95c20a59dcab5a8bd7f26f5b96313c9a6ac0ace143b2e5f2027a2bedf6c')

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
