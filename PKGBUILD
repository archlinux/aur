# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GraphAlignment
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GraphAlignment"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-GraphAlignment')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9272a09ad51aee8fbb2282317784d60')
b2sums=('12dc2e60496b02878d8b9686cc90f96105ee76fe5be70211c1b2c52a3967e7336c24f53e141d7f34c8dd388f66cde1f3fe9f5d223fc4e9565825a408fc2c0519')

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
