# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=ellmer
_pkgver=0.4.1
pkgname=r-ellmer
pkgdesc="Chat with Large Language Models"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('a11255f800934e0d34d4b0ea64f75350')
sha256sums=('00dfdbd2d1c23997cf7f4bb333b834662dc3e0466c94b512e9c76690f2b65db5')

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
