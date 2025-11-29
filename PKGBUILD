# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=colourvalues
_pkgver=0.3.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assigns Colours to Values"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcpp
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-microbenchmark
  r-scales
  r-testthat
  r-viridislite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e311275bdfbd522e9a6cad13c040ac5e')
b2sums=('46acd07179cf13460f5e3da23a2dea68922bf690f17cfe0e203c425b614b8b0120b401120661f2d4a5d5062fecdd7ba47589de45a5ef64c0eb6ea315369dc577')

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
