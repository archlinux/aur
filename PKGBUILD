# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5filters
_pkgver=1.20.0
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
md5sums=('ec4198e7943e2872cc701abe327dc3b3')
b2sums=('bcca7d987a129df2cb08f15cc441b49142d9445fda96a7d8881f9339fdf3035709a054d4f5cd0dca283bf3fc3965c87bfb7b459e8a9be184c9f8c430da37ee77')

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
