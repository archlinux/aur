# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cols4all
_pkgver=0.10
pkgname=r-${_pkgname,,}
pkgdesc="Colors for all"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=4.1.0"
    "r-abind"
    "r-colorspace>=2.1"
    "r-png"
    "r-spacesxyz"
    "r-stringdist"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('e9973cdcedbe07b7cc5d8ca7e645456092b5c7e1d915716c47834878db301374106353ce6d3a73c57b37ce6c871ef576974f72726c545fa22533b74353a5fc86')

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
