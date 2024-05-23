# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adbcdrivermanager
_pkgver=0.12.0
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
md5sums=('28e8be398fd50f01e5358c044f7956d0')
b2sums=('c5e2a85c3d4d424aaa3f43062ebcc8866bcbcf7f060148c43b8993e2d5ff836a75be150783906ac25af9437b5796cdf959fcae569f2b44a855a6a1cdba16c4f6')

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
