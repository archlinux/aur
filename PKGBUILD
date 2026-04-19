# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=tmaptools
_cranver=3.3
pkgname=r-${_cranname,,}
pkgdesc="Thematic Map Tools"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-only")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5"
    "r-lwgeom>=0.1-4"
    "r-sf>=0.9.2"
    "r-stars>=0.4-1"
    "r-units>=0.6-1"
    "r-xml"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("69024fe5b4c75c7d5e7dfa4d2b1d884c5654f8dae8a9ae7854038492b207df811353efcf0a2c99614c6efaad891f2704a46ef65ea1e8a31885f81ce32961146f")

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
