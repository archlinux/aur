# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ACME
_pkgver=2.66.0
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
md5sums=('25c0151143b6187331f05e8c8c5cb027')
b2sums=('191e9cfb6b492fa35211fe6e9ffedc7ca617eb35c05b06e2a3f07b053dfbb9efc8a6f3d62a2aff3c5be4c1b288e4972839adc19359f1f0628f2066171f620e16')

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
