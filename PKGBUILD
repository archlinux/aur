# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=colourvalues
_pkgver=0.3.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('6fafd9e1e0234875b6744ef786f62160')
b2sums=('7de6189cc37dd75df759b317bb5a331dced5117aa9e95a21649e767b166d2ec7133a39367081ae6ed9c54c16be624a662d8012b8ea0ead91dd28ba0424844edc')

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
