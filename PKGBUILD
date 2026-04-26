# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=packrat
_pkgver=0.9.3
pkgname=r-${_pkgname,,}
pkgdesc="A Dependency Management System for Projects and their R Package Dependencies"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-only")
pkgver=${_pkgver//-/.}
pkgrel=5

arch=("any")
depends=(
    "r>=3.0.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('197d4d46e77e7c655cbab627c9babc738c02a2ed6d317b2f460e163cb58d91e06a69b9b154faab4426fe995beee6e32e5031a446c184cfdbd69f636c15ad730b')

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
