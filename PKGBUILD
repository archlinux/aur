# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mltools
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Machine Learning Tools"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-data.table
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a27838eb72d1a9f9b9c7a922ac7efe7a')
b2sums=('cc39d31c1cf1db7437b46223463c46a4301988eea1aa1e9e26bae04baab38cb4121368310a2cb748af2c96458fc2066d5b9e8922d0d4a376b945d3c1090ee141')

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
