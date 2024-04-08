# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=attempt
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Tools for Defensive Programming"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rlang
)
optdepends=(
  r-curl
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4cbba3e4a87008b3aa8c60251576ccc')
b2sums=('ce366713bd58732895e5fa820221587ab88ab815658a8803516a5f836a7698b7fa3c67ee1ebff3b3876684debadff4033def7b9373c312849968c7a19f60a7c9')

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
