# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsesvd
_pkgver=0.2-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sparse Truncated Singular Value Decomposition (from 'SVDLIBC')"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('30dd0b8c0bf4bc13f7c1bc691dbfef6d')
b2sums=('2d942109ea839f2dcc80964d68530aeb3ee5a97756547670f4f032f63e8a2262b8281598c53a596e6dd6913206117f5cd7a4fb139ac6f3b9c48b7775898a9531')

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
