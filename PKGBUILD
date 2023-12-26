# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breakpointRdata
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Strand-seq data for demonstration purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3f74132513d150cb5d5cc62bfd49586')
b2sums=('d7f0d7a89b134d6977f657992ec8b54f8e737083e77085c5f82cf493f463c9c5b2754fb6c502ca435a4f338a188db3edaa307a228fbc8cc09be2024453238529')

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
