# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=ollamar
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgdesc="'Ollama' Language Models"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r"
    "r-base64enc"
    "r-crayon"
    "r-glue"
    "r-httr2"
    "r-jsonlite"
    "r-tibble"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('2f88b03515a225e24c0519ce03934b7f1e085a046a8912eaad3fddb71ed6625dd40520f42ceaa21a52b016f4c56a9c20b1cd43797a8a7b786dcd55e9a2dc2d15')

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
