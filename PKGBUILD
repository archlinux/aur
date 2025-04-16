# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GraphAlignment
_pkgver=1.72.0
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
md5sums=('5427e2f515c58d9ab2a5d05d0d0496ee')
b2sums=('6d238093247916484c7beb9dfdd6d05ef78704dee87765fed64803d820426b85c2d5ff7e63a23faccad3adfb7f238f465a61fbeee095b55291d2421605f9b9d2')

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
