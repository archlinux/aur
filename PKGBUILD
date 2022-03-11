# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=RcppProgress
_cranver=0.4.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An Interruptible Progress Bar with OpenMP Support for C++ in R Packages"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r)
optdepends=(
    r-rcpparmadillo
    r-devtools
    r-roxygen2
    r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b1624b21b7aeb1dafb30f092b2a4bef4c3504efd2d6b00b2cdf55dc9df194b48')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
