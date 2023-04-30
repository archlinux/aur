# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ffbase
_pkgver=0.13.3
pkgname=r-${_pkgname,,}
pkgver=0.13.3
pkgrel=7
pkgdesc="Basic Statistical Functions for Package 'ff'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bit
  r-fastmatch
  r-ff
)
# makedepends=(
#     tar
#     gzip
# )
optdepends=(
  r-biglm
  r-laf
  r-parallel
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3f61f80ba6851130247779786903d42a24ee5219aa24556c8470aece8a2e6b6')

build() {
  cd $srcdir/${_pkgname}/src
  # see https://github.com/edwindj/ffbase/pull/63
  sed -i 's|Sint|int|g' grouprunningcumsum.c grouprunningcumsumindex.c
  cd $srcdir
  tar -czf $_pkgname-$_pkgver.tar.gz ${_pkgname}
  R CMD INSTALL ${_pkgname}-${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
