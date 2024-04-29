# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_pkgname=corpus
_pkgver=0.10.2
pkgname=r-${_pkgname,,}
pkgver=0.10.2
pkgrel=10
pkgdesc='Text Corpus Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-utf8
)
optdepends=(
  r-knitr
  r-matrix
  r-quanteda
  r-rmarkdown
  r-testthat
  r-tm
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4647fae59d7acf9d4397a5126d386c8d323ad469df9800184de95b63a1aaa3b')

prepare() {
  cd ${_pkgname}
  sed -i 's|error(errstr)|error("%s",errstr)|' src/termset.c
  cd $srcdir
  tar -cvzf ${pkgname}_${_pkgver}.tar.gz ${_pkgname}
}

build() {
  R CMD INSTALL ${pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
