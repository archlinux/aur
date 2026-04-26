# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=slippymath
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgdesc="Slippy Map Tile Tools"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=3.5.0"
    "r-raster"
    "r-purrr"
    "r-png"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('3157cabd367d22afb50862fdd1b79fb2289a1f31a3ffa04250cc3304887b6a4198234fbe228b62f2ac1b3e201019e25ad7d07f108862aa6c7a41911f6b3f5643')

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
