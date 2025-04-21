# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSVGTipsDevice
_pkgver=1.0-7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=9
pkgdesc='An R SVG Graphics Device with Dynamic Tips and Hyperlinks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://github.com/cran/${_pkgname}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('7a32f363b53289da992b4660031c008231b3990e1789cdc85ab47f3c786d1c54')

prepare() {
  cd $srcdir/${_pkgname}-${_pkgver}
  # For  R 4.5.0+
  sed -i src/devSVG.c \
    -e 's|Calloc|R_Calloc|g' \
    -e 's|Realloc|R_Realloc|g' \
    -e 's|Free|R_Free|g' \
    -e 's| debug = FALSE| debug[0] = FALSE|g'

  cd $srcdir
  tar -czf $_pkgname-$_pkgver.tar.gz ${_pkgname}-${_pkgver}
}

build() {
  R CMD INSTALL ${_pkgname}-${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
