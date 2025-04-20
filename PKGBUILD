# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Harshlight
_pkgver=1.79.0
pkgname=r-${_pkgname,,}
pkgver=1.79.0
pkgrel=2
pkgdesc='A "corrective make-up" program for microarray chips'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-altcdfenvs
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('679e4069eb33c8454631a61bc7e0c78b9788919930dcbf743b35686a808aa0ca')

prepare() {
  sed -i "$_pkgname"/src/Harshlight.c \
    -e '/chip_overall_header/ s/()/(int *chip_number, char **chip_name)/'
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
