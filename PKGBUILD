# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=timereg
_cranver=2.0.7
pkgname=r-${_cranname,,}
pkgdesc="Flexible Regression Models for Survival Data"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-2.0-or-later")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=2.15"
    "r-lava"
    "r-numderiv"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("02104567e3051f6c5cc6f177780ba8c6bc9e10dbb0f1dc48c060b0c33daefd4fa62c1ee0274d092db9143d344b05761ee43f5cdcdc5494e12cec8edf8ff7a539")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${srcdir}/build/${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${srcdir}/build/${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
