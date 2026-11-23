# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pRolocdata
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data accompanying the pRoloc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-msnbase
)
checkdepends=(
  r-summarizedexperiment
  r-testthat
)
optdepends=(
  r-proloc
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36e3214506de387e74994e278da475da')
b2sums=('4273d9acf87d0e9cfda23577af803e5f72ef648c0b27f2c8c4df1b2ec7d871bccb6a3462c821d88f7ee536bced0ee1a7386033b90ea06e56ee8d1528a3418cb4')

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
