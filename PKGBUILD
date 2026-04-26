# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=unifir
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgdesc="A Unifying API for Calling the 'Unity' '3D' Video Game Engine"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=3.5.0"
    "r-glue"
    "r-proceduralnames"
    "r-r6"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('ddfbbde989b3453cf56fda0bfd723820dbd0cdaa7939c5233c623c9f296d49affd17b745c56976c89d70a7f27dfc2445de2b6df687c6d86295801ace5e4e777c')

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
