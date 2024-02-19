# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emdist
_pkgver=0.3-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Earth Mover's Distance"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('184e126bb29ed5a079b1c8ea11402770')
b2sums=('6e8e2b0771aaf2eb1f470ee49e423176f4fe9c8020dc0803063e32cb9d4e19597f4047d8f4a231d9747b601a0520150c43af91fdde713d9f6c73091afdf7a11d')

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
