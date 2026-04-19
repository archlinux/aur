# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=swagger
_cranver=5.32.1
pkgname=r-${_cranname,,}
pkgdesc="Dynamically Generates Documentation from a 'Swagger' Compliant API"
url="https://cran.r-project.org/package=${_cranname}"
license=("Apache-2.0")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("de8b499c10d2467ca070ad9fa298f98ad0fea8d063735e082ee81757f75dc68eee026c606b633d85323614aba568c8c08409f0094057a0dcbbf1d5efbff3de13")

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
