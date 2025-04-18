# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breakpointRdata
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('e43189b485b38a0941a6d0db26cdeaa7')
b2sums=('292fcb09c2a867e57c83c414a5a6663c32218e4c1cc2a93c00d075549d44a77265c9a5668acd518441f445b5888951c38d43ba5effa84faf948adce70b475368')

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
