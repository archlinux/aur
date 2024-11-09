# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDDboost
_pkgver=1.8.0
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
md5sums=('888bd691549bf9be9f0c557fe50d29a4')
b2sums=('c49968575e63b50e2838f76cea53d151ded2eeaf9ebceccbb003865217e712f2b3dc7c153fa388177b8383a3ff45bc4f52ddf774cb99c034edef6d043a727d55')

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
