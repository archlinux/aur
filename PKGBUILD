# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intrinsicDimension
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Intrinsic Dimension Estimation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-yaimpute
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec5e20e650021dc60b13ef571c2ea4d4')
b2sums=('986c266e4c3b751734b9e4d38619dac968339ef4c7518a24d38d1e203bc2a7f5ec2ed97241ab6c057602b5d48ab5e5b064dfb2bfc50b843d0c5e32f9b0f0f6db')

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
