# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=maptiles
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgdesc="Download and Display Map Tiles"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("any")
depends=(
    "r>=3.5.0"
    "r-curl"
    "r-digest"
    "r-png"
    "r-sf"
    "r-terra>=1.8.21"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('66658b9caf7099bafe3aaa70dcf1b1eda378e3ce8bec701d3a9454860a117c2d8c8de465dfb066b08d97cdec7d4d0ca972d5a399a6054e772f1d38c0333ab26d')

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
