# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=combi
_pkgver=1.24.0
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
md5sums=('41252ddd70b5d7105150c9db19374579')
b2sums=('ddbfcef92c8b0f51b04374842b4e7327e9920a8d273afeabae144c0532a086a79fbc5be5be55c92a04cc4c3711595d760bfc52dd00aefbec7b686d759343b721')

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
