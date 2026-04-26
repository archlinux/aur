# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=tmaptools
_pkgver=3.3
pkgname=r-${_pkgname,,}
pkgdesc="Thematic Map Tools"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=3.5"
    "r-lwgeom>=0.1-4"
    "r-sf>=0.9.2"
    "r-stars>=0.4-1"
    "r-units>=0.6-1"
    "r-xml"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('69024fe5b4c75c7d5e7dfa4d2b1d884c5654f8dae8a9ae7854038492b207df811353efcf0a2c99614c6efaad891f2704a46ef65ea1e8a31885f81ce32961146f')

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
