# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5filters
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HDF5 Compression Filters"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('BSD-2-Clause')
depends=(
  bzip2
  r
  zlib
  zstd
)
makedepends=(
  r-rhdf5lib
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ad81aa9580ffdc3e26301793abc8507')
b2sums=('afee2f98ea05dc7911336920b89f52575717b55c5b7cda2cd5f57ef36f04bf1180c75b33886dfab2a9a3aedfa5d4f98b828cbdfafea5a09a9a3ad70779c8cebc')

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
