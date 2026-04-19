# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=unifir
_cranver=0.2.4
pkgname=r-${_cranname,,}
pkgdesc="A Unifying API for Calling the 'Unity' '3D' Video Game Engine"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5.0"
    "r-glue"
    "r-proceduralnames"
    "r-r6"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("ddfbbde989b3453cf56fda0bfd723820dbd0cdaa7939c5233c623c9f296d49affd17b745c56976c89d70a7f27dfc2445de2b6df687c6d86295801ace5e4e777c")

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
