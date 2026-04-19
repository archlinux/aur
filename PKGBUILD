# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=cols4all
_cranver=0.10
pkgname=r-${_cranname,,}
pkgdesc="Colors for all"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-only")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=4.1.0"
    "r-abind"
    "r-colorspace>=2.1"
    "r-png"
    "r-spacesxyz"
    "r-stringdist"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("e9973cdcedbe07b7cc5d8ca7e645456092b5c7e1d915716c47834878db301374106353ce6d3a73c57b37ce6c871ef576974f72726c545fa22533b74353a5fc86")

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
