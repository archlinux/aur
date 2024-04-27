# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDDboost
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A compositional model to assess expression changes from single-cell rna-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biocparallel
  r-ebseq
  r-ggplot2
  r-mclust
  r-oscope
  r-rcpp
  r-rcppeigen
  r-singlecellexperiment
  r-summarizedexperiment
)
makedepends=(
  r-bh
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
md5sums=('ac0cac5975ebe4025ea07ad00e132847')
b2sums=('2d318116d9c6ec3d231687e53c44da14b04d2f9200f9bac31b250dadb26f001bc84ba54ac3c67c428abe61bb4c54b8e7c1a403f13136f251b28b23757faca989')

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
