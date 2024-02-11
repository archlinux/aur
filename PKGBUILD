# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Travel
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="An utility to create an ALTREP object with a virtual pointer"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  fuse2
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-inline
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da652100a57515f0dbaf7084fb35525e')
b2sums=('45b1cbadbfeee068cfca241237900b937555a4dfdec7bb68635ca1168e83215b6b4da781388bafd0859399985677ea16811e3cf80939ff5f84367a85e488a648')

prepare() {
  cd "$_pkgname/src"
  sed -i '7i #include <cstddef>' class_Cache_block.h
  sed -i '7i #include <cstdint>' utils.h
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
