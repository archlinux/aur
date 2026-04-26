# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=spacesXYZ
_pkgver=1.6-0
pkgname=r-${_pkgname,,}
pkgdesc="CIE XYZ and Some of Its Derived Color Spaces"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-or-later")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=4.0.0"
    "r-logger"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('45bd08cae4fc76e8414f1e16c08ec78da9808bfa1c9cc181b4d227ef3e74971852ecb4ff7150aee02e4290a23d74e2f21c9d825e2645f761d82fe216d23834fa')

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
