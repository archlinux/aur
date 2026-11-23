# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=DPQ
_pkgver=0.6-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Density, Probability, Quantile ('DPQ') Computations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later AND GPL-3.0-only')
depends=(
  r-sfsmisc
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-cobs
  r-dpqmpfr
  r-gmp
  r-interp
  r-rmpfr
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c7a10b665bc6897f2fa649deeb32fe5')
b2sums=('870bf91b4ce157f07a68b2af8470ad4584c543b6fab0ac80661b11d8c7d5fbf1bf03d73701c995e7d0c94aa1d5a35ffea596b00ce8bc394142a81c1301e1e0d5')

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
