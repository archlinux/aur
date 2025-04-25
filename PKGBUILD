# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=graper
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=1
pkgdesc='Adaptive penalization in high-dimensional regression and classification with external covariates using variational Bayes'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-cowplot
  r-ggplot2
  r-matrixstats
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a83ddea41442f4d6ee13b877a7d2e9f30655e0ee6588849d26e3c6b8a494af5')

prepare() {
  sed -i $_pkgname/src/Makevars \
    -e '/CXX_STD/d'
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
