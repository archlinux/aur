# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rama
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
pkgrel=6
pkgdesc='Robust Analysis of MicroArrays'
arch=('x86_64')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe2eaa35c7bce7d663012e70aac0688b40eea4193b0bd84b61b673f86dcfcc44')

prepare() {
  cd $srcdir/${_pkgname}
  # For  R 4.5.0+
  sed -i src/*.c \
    -e 's|Calloc|R_Calloc|g' \
    -e 's|Realloc|R_Realloc|g' \
    -e 's|Free|R_Free|g'

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
