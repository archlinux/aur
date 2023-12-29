# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coop
_pkgver=0.6-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Co-Operation: Fast Covariance, Correlation, and Cosine Similarity Operations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  blas
  lapack
  r
)
optdepends=(
  r-memuse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b6e2755b67964b2fb4f204c6a9ef944c')
b2sums=('d4a31336dff511ee4890b1d64fac5814b19c658a3759ce088187f8706a68d95f20a94ca8857838e4c19d7b9c55eecc01e9c117ff89383cda9e6aededbeb53e80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
