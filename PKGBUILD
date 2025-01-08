# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=kde1d
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Univariate Kernel Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-randtoolbox
  r-rcpp
)
makedepends=(
  r-bh
  r-rcppeigen
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54b8a448cbbbd9cc45a810bc76344b44')
b2sums=('9b4c52383c61e47c12c27baf7c1a7ad2c5482a3c0e4263f7722ac965577008ce49dab164d5b197c6e823d4b203d536c976c082958f1e119260a92fa858a7c143')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
