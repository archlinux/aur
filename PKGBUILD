# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adbcdrivermanager
_pkgver=0.15.0
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
md5sums=('18d6e458d8c193e6049fb33af6cb162e')
b2sums=('5eba4d4d998a35cda0f806eb5b268d16625eb2d57626996d4f4edfc922ccc3b8cc80f5aef7c628ccaa246f5b6aaa249e1078d48872be742b4a961e0a160e71b3')

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
