# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waddR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical tests for detecting differential distributions based on the 2-Wasserstein distance"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-arm
  r-biocfilecache
  r-biocparallel
  r-eva
  r-rcpp
  r-singlecellexperiment
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-rprojroot
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3af356d154f7d640f77810e816fbab0b')
b2sums=('9fa1cf4bf9e5e627fb98f3ba26157b8caed71ba3447944eb09bb250ad6ca487a4115e8a428a2196c73c884761763f708061ac93215c9d41fb727ff910b8d5a4b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
