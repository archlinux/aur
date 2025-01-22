# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adbcdrivermanager
_pkgver=0.16.0
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
md5sums=('080400e86f11454630f78a866fc29de9')
b2sums=('78a86e74736a11ba29e5bcfac54ea58f2a94defd1c42f78209d6ef59fbf1c007c8c2f347c3d4c78d5125fc1205107afc488c75b214348d11b0c4ea29966e1b7f')

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
