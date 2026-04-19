# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=REDCapR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgdesc="Interaction Between R and REDCap"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=2

arch=("any")
depends=(
    "r>=3.5.0"
    "r-checkmate>=2.0"
    "r-dplyr>=1.0"
    "r-httr>=1.4.0"
    "r-jsonlite"
    "r-magrittr>=1.5"
    "r-readr>=2.0"
    "r-rlang>=0.4"
    "r-tibble>=2.0"
    "r-tidyr>=1.0"
)
optdepends=(
    "r-covr"
    "r-dbi"
    "r-kableextra"
    "r-knitr"
    "r-odbc"
    "r-purrr"
    "r-rmarkdown"
    "r-sessioninfo"
    "r-testthat"
    "r-tidyselect"
    "r-yaml"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('c654db0dbbfc10ea7158a2759176383aa14529b28543587edc96271194f3f921e67e3775e4d156d951245e6310b4e8a82651968698b0094bbf6bce0f8445f06e')

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
