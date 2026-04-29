# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ACME
_pkgver=2.68.0
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
md5sums=('79eb7bdedf03e3f129b1971127f8e249')
b2sums=('c39f735433d944243d9c1ce633cc96fc525810445e0042fd639a71a3cc76f743f2d6329324411d82721b80c194c66b06ad2155e0e8e7f4d3997238f2d4434404')

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
