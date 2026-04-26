# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=satellite
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgdesc="Handling and Manipulating Remote Sensing Data"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "r>=2.10"
    "r-plyr"
    "r-raster"
    "r-rcpp>=0.10.3"
    "r-terra"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('4ad1ec391c36d4263033ad30805ef3b56974ea09e7583384cce66551b72c958a80aa7421f55a3116a18310adaee176999b853b595e66a2045fc7aaffbb0430d4')

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
