# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iterClust
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Iterative Clustering"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-iterClust')
depends=(
  r-biobase
)
optdepends=(
  r-bcellviper
  r-tsne
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af72d13d4200d5883ae63a99f0a49a69')
b2sums=('9811c7f4888c26f41f5842cc110cca83ad5bf80a7735ef658a2e9dac7ebcb317975308b73fe42e1be7235ac76b38c731c08bd431a66c390dcb5a0da6609869f5')

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
