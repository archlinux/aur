# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RedisParam
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('cf24018f96bc9de6286d2806dfd7bfaa')
b2sums=('3fa4469d68eb1d93366339d9e626bc27cd359c94c7bb48cd6badbb9563ddc43cb64a327cd039ca6b6f4e6f5d4cb9270d7b0f59d52398ecfb2ad1b83447851785')

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
