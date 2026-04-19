# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=leaflegend
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgdesc="Add Custom Legends to 'leaflet' Maps"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.3.0"
    "r-base64enc"
    "r-htmltools"
    "r-htmlwidgets"
    "r-leaflet"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("29a54ea6bc5b842bbd5eba270b713129a16bc7025add0daabee038ee1dc4e1bd6fff731f4442b4bb36334f58aa96410844a96ebed5ba1f8f0f9865264881c892")

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
