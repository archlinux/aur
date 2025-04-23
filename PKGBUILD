# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ACME
_pkgver=2.64.0
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
md5sums=('20a96ce1d2b153d4b2f669a868e78aa3')
b2sums=('8603290b8aeff0a6a6afceb4e26eff9a00714e9a80be5324a25097e65144219600e8135588c872b3c6caa44821d5a2af49c23154bc50f4ba9e792d964a0a2ca3')

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
