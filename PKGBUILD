# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=leaflegend
_pkgver=1.2.8
pkgname=r-${_pkgname,,}
pkgdesc="Add Custom Legends to 'leaflet' Maps"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("any")
depends=(
    "r>=3.3.0"
    "r-base64enc"
    "r-htmltools"
    "r-htmlwidgets"
    "r-leaflet"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('854f0c3769544a7047239c038fa92e6695445e1616353e6b48735a4e8de04a0e528ae4c864f847a52a4d6d7687a274c67ad62872df70f19d47d11df0f37eb06c')

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
