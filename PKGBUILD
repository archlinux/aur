# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDDboost
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('cc882f2ac84ac1d18ffe47d8e1844fe9')
b2sums=('e0c2c6d36bc01023b9dd4f2160bb34892d6c86a1a548be6dfe2b6e5f3f70d48ceb72e2c36632d8c8b9aa262091c4f3ad2a2abf26f7043f3d66e63feb3b24f9cd')

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
