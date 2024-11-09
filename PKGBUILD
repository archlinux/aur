# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=combi
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('f5df09ca854e0077d792b7cebc0f7d12')
b2sums=('9277a4c7a577fdf7d8e97bf4eef0e031e7e5f3871d25c24cf6247eacfbf712a64b7902dc8bf322aefb2dd25357cddbfd2b163547f6f6343d1663b9dc9f3b1981')

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
