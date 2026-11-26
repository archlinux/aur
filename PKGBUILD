# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RAREsim
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simulation of Rare Variant Genetic Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-nloptr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dc0e275a6853eb427f36e8075d39a86e')
b2sums=('56fd2062cc4f0dfada706db064181e82e49d2938813a5ba801e61bea33e9136a03d45306ace61f447bb281ddb02a882bd362700abe7b22cdc2666829fca64fec')

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
