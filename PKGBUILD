# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=etrunct
_pkgver=0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Computes Moments of Univariate Truncated t Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(MIT)
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3cbbc3b93874a20f653c2216cbc95030')
b2sums=('eae84d123a08a8b1ca4afa020ed19f26c56a376a362b16a5de4c30cd28510885a100ac8e98f80471c0ee5aaccf00aec02d2df430712ced7f8db63cf921d5f6f2')

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
