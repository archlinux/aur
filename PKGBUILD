# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenKern
_pkgver=1.2-60
pkgname=r-${_pkgname,,}
pkgver=1.2.60
pkgrel=9
pkgdesc='Functions for generating and manipulating binned kernel density estimates'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc74225fe6a092b4b98bebcc42b5ce5632dd492cc2368b4e8087fed87c6a158b')

prepare() {
  cd $srcdir/${_pkgname}
  sed -i src/getlims.c -e 's|getlims(|double getlims(|g'
  cd $srcdir
  tar -czf $_pkgname-$_pkgver.tar.gz ${_pkgname}
}

build() {
  R CMD INSTALL ${_pkgname}-${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
