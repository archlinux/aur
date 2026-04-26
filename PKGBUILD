# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=shinytest2
_pkgver=0.5.1
pkgname=r-shinytest2
pkgdesc="Testing for Shiny Applications"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-testthat>=3.3.1"
    "r-callr"
    "r-checkmate>=2.0.0"
    "r-chromote>=0.5.0"
    "r-cli"
    "r-fs"
    "r-globals>=0.14.0"
    "r-httr2"
    "r-jsonlite"
    "r-lifecycle>=1.0.3"
    "r-pingr"
    "r-pkgload"
    "r-r6>=2.4.0"
    "r-rlang>=1.0.0"
    "r-rmarkdown"
    "r-shiny"
    "r-withr"
    "r-cpp11"
)
optdepends=(
    "r-box"
    "r-desolve"
    "r-diffobj"
    "r-ggplot2"
    "r-golem"
    "r-knitr"
    "r-plotly"
    "r-png"
    "r-rhino"
    "r-rstudioapi"
    "r-shinytest>=1.5.1"
    "r-shinyvalidate>=0.1.2"
    "r-shinywidgets"
    "r-showimage"
    "r-spelling"
    "r-usethis"
    "r-vdiffr>=1.0.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7da156cf2bf72e5cb7e870f506ddaa35a55afb9a132dc0a1499da29e5546583a')

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
