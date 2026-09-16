# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=ellmer
_pkgver=0.5.0
pkgname=r-ellmer
pkgdesc="Chat with Large Language Models"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=5
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
md5sums=('27f61f130720d7b77af84ded6a3afdba')
sha256sums=('1959cc2ed8f03163b2927c091c5be1185023dc83c1d8907314e611236b3fe062')

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
