# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=wdm
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Weighted Dependence Measures"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rcpp
)
checkdepends=(
  r-copula
  r-hmisc
  r-testthat
)
optdepends=(
  r-copula
  r-covr
  r-hmisc
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a6f80e70e6b2ae2675e4693ce49b601')
b2sums=('592893dd89bb433bc65e2f0dd601a4caef111f1107750854dad8d9d79ed8d363431a66be7148406b0605b9015b080bde758d4292423fe48e47255db8cc83ef77')

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
