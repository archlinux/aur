# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=chattr
_pkgver=0.3.1
pkgname=r-chattr
pkgdesc="Interact with Large Language Models in 'RStudio'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-rstudioapi"
    "r-lifecycle"
    "r-processx"
    "r-config"
    "r-ellmer>=0.3.0"
    "r-purrr"
    "r-rlang"
    "r-bslib"
    "r-shiny"
    "r-clipr"
    "r-httr2>=1.1.0"
    "r-yaml"
    "r-glue"
    "r-coro"
    "r-cli"
    "r-fs"
)
optdepends=(
    "r-covr"
    "r-knitr"
    "r-rmarkdown"
    "r-testthat>=3.0.0"
    "r-shinytest2"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('761d2cf63e48a0f2e4135aa12a7cfebf4a8524f48731bb5e5c4a483b70372472')

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
