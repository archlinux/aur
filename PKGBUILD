# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNEXT
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interpolation and Extrapolation for Species Diversity"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ggplot2
  r-rcpp
  r-reshape2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggthemes
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cc313937b3f3f3eb86c094dea0c54b9')
b2sums=('5b56b746da5935edae098a5972f0161e231411d5939d21d324d9870435eb40ffe4a8ef32e862ed639bea7c76432f647a175180e3c46536ed67a967222ae1c6ad')

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
