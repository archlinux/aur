# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gander
_pkgver=0.2.0
pkgname=r-gander
pkgdesc="High Performance, Low Friction Large Language Model Chat"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cli>=3.6.3"
    "r-glue>=1.8.0"
    "r-ellmer>=0.2.0"
    "r-miniui>=0.1.1.1"
    "r-rlang>=1.1.4"
    "r-rstudioapi>=0.17.1"
    "r-shiny>=1.9.1"
    "r-streamy>=0.1.0.9000"
    "r-treesitter"
    "r-treesitter.r"
)
optdepends=(
    "r-gt"
    "r-knitr"
    "r-rmarkdown"
    "r-testthat>=3.0.0"
    "r-tibble"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8e9de3cd88695745bdc446c4b57ee897a53170f6371fb6ff9d0a1288955ea8f5')

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
