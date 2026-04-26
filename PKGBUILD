# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=finalfit
_pkgver=1.1.0
pkgname=r-finalfit
pkgdesc="Quickly Create Elegant Regression Results Tables and Plots when Modelling"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-bdsmatrix"
    "r-broom"
    "r-cowplot"
    "r-dplyr"
    "r-forcats"
    "r-ggally"
    "r-ggplot2"
    "r-lme4"
    "r-magrittr"
    "r-mice>=3.17.0"
    "r-pillar"
    "r-proc"
    "r-purrr"
    "r-scales"
    "r-stringr"
    "r-tidyr>=1.0.0"
)
optdepends=(
    "r-cmprsk"
    "r-coxme"
    "r-hmisc"
    "r-knitr"
    "r-lmtest"
    "r-readr"
    "r-rlang"
    "r-rmarkdown"
    "r-rstan"
    "r-sandwich"
    "r-survey"
    "r-survminer"
    "r-testthat"
    "r-tibble"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('480bf93724b66a1565699c4c6411a2b509ef740984f8ba8320621784181dd3a2')

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
