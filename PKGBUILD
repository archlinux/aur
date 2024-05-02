# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RedisParam
_pkgver=1.6.0
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
md5sums=('983e17af8d289f9bbfbc755b6213d72a')
b2sums=('24ac2105f75ea3ce0fcdc4c235942b3158d8a65ded7edb843ab14e348de766ebb17b0966bb1bfd62307c3e1926b891e18ee1cacf967c441cc7cd59a21256fc95')

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
