# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EmpiricalBrownsMethod
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Uses Brown's method to combine p-values from dependent tests"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dc394867e6a02949e27dc6767a2b5cd')
b2sums=('0bb2fdd88a37b80b556211fbb877fcfd400ae6141f1302a2a7d0632607c837e7a6e7843617ba9e51174c64d35944321d9e05a6c89d7f99fcd9d807bf892c0612')

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
