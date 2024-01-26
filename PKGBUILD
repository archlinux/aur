# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=exact2x2
_pkgver=1.6.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exact Tests and Confidence Intervals for 2x2 Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-exactci
  r-ssanv
)
checkdepends=(
  r-exact
  r-testthat
)
optdepends=(
  r-exact
  r-ggplot2
  r-gridextra
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8eb9778300f5710afacf556861b07ebc')
b2sums=('183d46c95fc139fcb29c5737c4e40642854eb4a630dd63550de227b9b4be9a5ade87fe2be64337ee6bcb676535489cea885c3c92a542cac84a7ae0d3bad70f3a')

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
