# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccdata
_pkgver=1.29.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for Combination Connectivity Mapping (ccmap) Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3d2f66811dde6d1dd896f79354b8623f')
b2sums=('6406a9cfe02cdb621fbacffd2d7a0eb66c9bbdad4c27aa078157ab8234c7fd2ac8afe57affcbb1ead81f42f1a0e4621d4f0a6fdcccca75044627756ced7a97c7')

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
