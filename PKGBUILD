# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mmod
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modern Measures of Population Differentiation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-adegenet
  r-pegas
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('957b63e23536053a16e24434d06b13d6')
b2sums=('349cfb4fa0f60bc7cba4bb9564b2743744fdb70a0e492ad6a798d610f2f1a70dea237d224db3bf46f5f0e6ec175d86b8fb43b1581c1861c50d17b2215094f463')

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
