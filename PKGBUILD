# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=float
_pkgver=0.3-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="32-Bit Floats"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5bd17f68abd9d11360b64c21c54816e8')
b2sums=('4abdbfd3c9988ad34d71800dbb9afdc412608c6651362591f8876bf3fcbe543035c0524534613fa5178491c042f244da4aab5bb8a25a8d6bc9d0fdcb6fc0a566')

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
