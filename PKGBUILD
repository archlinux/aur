# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=ollamar
_cranver=1.2.2
pkgname=r-${_cranname,,}
pkgdesc="'Ollama' Language Models"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("2f88b03515a225e24c0519ce03934b7f1e085a046a8912eaad3fddb71ed6625dd40520f42ceaa21a52b016f4c56a9c20b1cd43797a8a7b786dcd55e9a2dc2d15")

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
