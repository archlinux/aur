# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=proceduralnames
_cranver=0.2.2
pkgname=r-${_cranname,,}
pkgdesc="Several Methods for Procedural Name Generation"
url="https://cran.r-project.org/package=${_cranname}"
license=("Apache-2.0")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=2.10"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("335fcd2211480fd7cc8f578960fe0db681e87b7ee0c1da2eaedfff5ae5f0a90dc55d63c2a5f832b680547992e25ab9fd11b0e780f005552c4c5d7616b7ec4476")

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
