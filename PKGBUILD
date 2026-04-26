# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=ellmer
_pkgver=0.4.0
pkgname=r-ellmer
pkgdesc="Chat with Large Language Models"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cli"
    "r-coro>=1.1.0"
    "r-glue"
    "r-httr2>=1.2.1"
    "r-jsonlite"
    "r-later>=1.4.0"
    "r-lifecycle"
    "r-promises>=1.3.1"
    "r-r6"
    "r-rlang>=1.1.0"
    "r-s7>=0.2.0"
    "r-tibble"
    "r-vctrs"
)
optdepends=(
    "r-connectcreds"
    "r-curl>=6.0.1"
    "r-gargle"
    "r-gitcreds"
    "r-jose"
    "r-knitr"
    "r-magick"
    "r-openssl"
    "r-paws.common"
    "r-png"
    "r-rmarkdown"
    "r-shiny"
    "r-shinychat>=0.2.0"
    "r-testthat>=3.0.0"
    "r-vcr>=2.0.0"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00febbef895d51f03c87f3377f4c2306')
sha256sums=('6778c2f9b3f7046ff33b6933a17c3abe7bd64924532df7dfb10d82bf8759c8b1')

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
