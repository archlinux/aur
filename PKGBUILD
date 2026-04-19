# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=gander
_cranver=0.2.0
pkgname=r-gander
pkgdesc="High Performance, Low Friction Large Language Model Chat"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1
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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("8e9de3cd88695745bdc446c4b57ee897a53170f6371fb6ff9d0a1288955ea8f5")

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
