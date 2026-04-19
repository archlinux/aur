# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=leafpop
_cranver=0.1.0
pkgname=r-${_cranname,,}
pkgdesc="Include Tables, Images and Graphs in Leaflet Pop-Ups"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-base64enc"
    "r-brew"
    "r-htmltools"
    "r-htmlwidgets"
    "r-sf"
    "r-svglite"
    "r-uuid"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("71bdadc56687d75e0b40d2211f18685822a064dd3103d990effde5bf1fbb810c683a86052e21e148cec7db76b220c6c79114bbfe534773f7b40e1ce50b963361")

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
