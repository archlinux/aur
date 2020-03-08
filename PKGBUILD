# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=ipred
_cranver=0.9-9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Improved Predictors"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(gpl2 gpl3)
depends=('r>=2.10' 'r-rpart>=3.1.8' r-survival r-nnet r-class r-prodlim)
makedepends=(gcc)
optdepends=(r-mvtnorm r-mlbench r-th.data)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('4587bddb82ce8bd16871f4f0e6bfd87a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
