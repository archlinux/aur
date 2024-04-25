# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinytitle
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Update Browser Window Title in 'shiny' Session"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-shiny
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e89d52a34f6c511c475002a05a08074')
b2sums=('fc284f01cc8d92b53559af9b19abbce5803e0fff3fb5a21895e68583f949cff0288e73e10ef7b690fed160ce05658e6d0263fdaa13970b7c93147136bc1f6e99')

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
