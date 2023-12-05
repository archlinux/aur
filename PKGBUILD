# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDDboost
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A compositional model to assess expression changes from single-cell rna-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL)
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
sha256sums=('e92ba350e3f9b73a22f634c8e81dd52b8666f905092bfbb0f264dc2863b76f87')

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
