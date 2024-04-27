# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=combi
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Compositional omics model based visual integration"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-alabama
  r-bb
  r-biobase
  r-cobs
  r-dbi
  r-ggplot2
  r-limma
  r-nleqslv
  r-phyloseq
  r-reshape2
  r-summarizedexperiment
  r-tensor
  r-vegan
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6fe16559db40b31126eb543abf6819fa')
b2sums=('41031e9770c4cc7418c6bd8d475c478711294509d4dd3ca3702f2a5800925b23c22f5ae3978311ddcdf39c9155b896d1d1596d5be762c8791d53bcb8f6dc4286')

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
