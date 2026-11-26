# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ACME
_pkgver=2.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Algorithms for Calculating Microarray Enrichment (ACME)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5857ff3a97c52e19ad22679582107b08')
b2sums=('e01d34b99d34bc9d254dddcd60498ee903c7a25eab1adce72beb624d609c60f08f5dc7cae44467c756ab1351f46580fe86ff80cf893b5eef9aaa550bd38dcaae')

prepare() {
  sed -i ${srcdir}/${_pkgname}/src/*.c \
    -e 's|&windowChisq|(DL_FUNC)&|g'
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
