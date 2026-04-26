# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=timereg
_pkgver=2.0.7
pkgname=r-${_pkgname,,}
pkgdesc="Flexible Regression Models for Survival Data"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-or-later")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "r>=2.15"
    "r-lava"
    "r-numderiv"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('02104567e3051f6c5cc6f177780ba8c6bc9e10dbb0f1dc48c060b0c33daefd4fa62c1ee0274d092db9143d344b05761ee43f5cdcdc5494e12cec8edf8ff7a539')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${srcdir}/build/${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${srcdir}/build/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
