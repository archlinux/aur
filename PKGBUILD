# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trigger
_pkgver=1.53.0
pkgname=r-${_pkgname,,}
pkgver=1.53.0
pkgrel=1
pkgdesc='Transcriptional Regulatory Inference from Genetics of Gene ExpRession'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
  r-qtl
  r-qvalue
  r-sva
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('68c2041d3f02ae358a2ef38df5ba47fba638be14d703fabc66e22cf425e62fd4')

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
# vim:set ts=2 sw=2 et:
