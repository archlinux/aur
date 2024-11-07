# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=marinerData
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ExperimentHub data for the mariner package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-experimenthubdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a107161ab0d78f794f5088aa17e219bc')
b2sums=('b633d180efaa3017ccb4d1c16d9e8f99e5f7dc669ccbf25b5ee4f02df50532925fbb28ad7f12528cafb3a074d70fa3528d7e0231f1b77292cb8c2ccfa57d95c0')

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
