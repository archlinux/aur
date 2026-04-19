# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=REDCapR
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgdesc="Interaction Between R and REDCap"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("c654db0dbbfc10ea7158a2759176383aa14529b28543587edc96271194f3f921e67e3775e4d156d951245e6310b4e8a82651968698b0094bbf6bce0f8445f06e")

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
