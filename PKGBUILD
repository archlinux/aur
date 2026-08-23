# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adbcdrivermanager
_pkgver=0.24.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Arrow' Database Connectivity ('ADBC') Driver Manager"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-nanoarrow
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03151544b60436ed86d5505b2eeafaa5')
b2sums=('b9081112f93e7a224501b2ece0d1ef029b25d68cfa84fdd1a0925426e7811f45b23db379bd90ca96cb2e63ee37d89046aae6c275dab0f129e0f4f4b662f4d6cd')

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
