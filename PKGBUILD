# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=setRNG
_pkgver=2024.2-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Set (Normal) Random Number Generator and Seed"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR LicenseRef-setRNG')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0360795dcce8779f150ed6eefacf04b7')
b2sums=('08b3d0ac7b6eb0241dc4c8da806e08d12012589cecbfe523a7f412ff0b90bf3962a613ad8b4f757e9699d42b21ba43c65c8e0044d123895fce0de97812d1170d')

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
