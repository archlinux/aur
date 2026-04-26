# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=leaflegend
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgdesc="Add Custom Legends to 'leaflet' Maps"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=3.3.0"
    "r-base64enc"
    "r-htmltools"
    "r-htmlwidgets"
    "r-leaflet"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('29a54ea6bc5b842bbd5eba270b713129a16bc7025add0daabee038ee1dc4e1bd6fff731f4442b4bb36334f58aa96410844a96ebed5ba1f8f0f9865264881c892')

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
