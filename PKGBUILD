# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=GpGp
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Gaussian Process Computation Using Vecchia's Approximation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  blas
  lapack
  r-fnn
  r-rcpp
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
optdepends=(
  r-fields
  r-knitr
  r-maps
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1ab9b3a5bc579283cd9c3f218a19bd1')
b2sums=('a6856250bcf1f65290570ec89dca8e298b23f8a78cb8ba28ca190d6b49fb7520bed43319e5f2726ea2cbb72811137e31aebc7d105fac09f752404ba1a7efc7e7')

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
