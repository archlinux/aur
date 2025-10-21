# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=torch
_pkgver=0.16.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tensors and Neural Networks with 'GPU' Acceleration"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-bit64
  r-callr
  r-cli
  r-coro
  r-desc
  r-glue
  r-jsonlite
  r-magrittr
  r-r6
  r-rcpp
  r-rlang
  r-safetensors
  r-scales
  r-withr
)
optdepends=(
  r-covr
  r-katex
  r-knitr
  r-mvtnorm
  r-numderiv
  r-palmerpenguins
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5deb6bf5ca67bd649d77e2919c212149')
b2sums=('ff6b668dee6ae9f386c11c9cdd99ab092c28045d148ebdaf3de6bd1ef89a5be51756b7627b49e19b7bcef5b1c0a3ea2cff4c4fc3e1769ee887c7e4683ccecc95')

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
