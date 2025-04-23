# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genoCN
_pkgver=1.59.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="genotyping and copy number study tools"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e45dd1bb1825e2484e2d676a26dcd3a1')
b2sums=('92016e55771dee7c2f01458a2773909cd5a14242162188f2d2655da6af60d56926fdcd5a0d77cf809ff0c7cc6d0b54c3e2b0d985e9f3547ee508c541f13f9216')

prepare() {
  sed -i $_pkgname/src/*.c \
    -e 's|Calloc|R_Calloc|g' \
    -e 's|Realloc|R_Realloc|g' \
    -e 's|Free|R_Free|g'
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
