# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.core
_pkgver=2.4-4
pkgname=r-${_pkgname,,}
pkgver=2.4.4
pkgrel=9
pkgdesc="Core Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-goftest
  r-spatstat.data
  r-spatstat.geom
  r-spatstat.sparse
  r-spatstat.utils
  r-spatstat.random
  r-tensor
)
optdepends=(
  r-fftwtools
  r-gsl
  r-locfit
  r-maptools
  r-nleqslv
  r-randomfields
  r-randomfieldsutils
  r-sm
  r-spatial
  r-spatstat
  r-spatstat.linnet
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e38c39efe8b14d6e8fdbee8dd870b90c52f78ea571ab7988fd3685f48347d13b')

prepare() {
  cd $srcdir/${_pkgname}
  # For  R 4.5.0+
  sed -i src/sphevol.c \
    -e 's/PI/M_PI/g'
  cd $srcdir
  tar -czf $_pkgname-$_pkgver.tar.gz ${_pkgname}
}

build() {
  R CMD INSTALL ${_pkgname}-${_pkgver}.tar.gz -l "${srcdir}" --use-C17
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
