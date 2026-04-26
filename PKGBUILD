# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=rsconnect
_pkgver=1.8.0
pkgname=r-rsconnect
pkgdesc="Deploy Docs, Apps, and APIs to 'Posit Connect', 'shinyapps.io', and 'RPubs'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cli"
    "r-curl"
    "r-digest"
    "r-httr2"
    "r-jsonlite"
    "r-lifecycle"
    "r-openssl>=2.0.0"
    "r-pki"
    "r-packrat>=0.6"
    "r-renv>=1.0.0"
    "r-rlang>=1.0.0"
    "r-rstudioapi>=0.18.0"
    "r-snowflakeauth"
    "r-yaml>=2.1.5"
)
optdepends=(
    "r-biobase"
    "r-biocmanager"
    "r-knitr"
    "r-plumber>=0.3.2"
    "r-quarto"
    "r-reticulate"
    "r-rmarkdown>=1.1"
    "r-shiny"
    "r-testthat>=3.1.9"
    "r-webfakes"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4dc571860a22183f66c0e8e100f5ca776c9b243b3b5d13ffdd1a0343531eec11')

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
