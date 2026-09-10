# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=kde1d
_pkgver=1.2.0
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
  r-bh
  r-rcppeigen
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7edbbaa7410e1e58df17e54c3635eada')
b2sums=('a951a29e06822b5e92fbcfd7e5cb145e5c36cdb4c5586f9bdbc30a5d697a0365bf01a7c67c41bd5eb3ae96b91ce50cadfb4eb0c533ef1f86c162991854fe509a')

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
