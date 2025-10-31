# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RedisParam
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Provide a 'redis' back-end for BiocParallel"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-futile.logger
  r-redux
  r-withr
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
md5sums=('dc36e237c1b81b5aebc31cb75c258f95')
b2sums=('1c9f908222c623f3d811f41ed6f59fd9b36c0a5359d5d8779bd0085dd113eaec6562fcaf6bdc7407acc0701510f93996084f0ba29f586e729400f795fa03af75')

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
