# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=snowflakeauth
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgdesc="Authentication to 'Snowflake'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("any")
depends=(
    "r"
    "r-cli"
    "r-curl"
    "r-jsonlite"
    "r-jose"
    "r-openssl"
    "r-rcpptoml"
    "r-rlang"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('3e594ae7bd403a17dfade6af7762c02423ba7907329c4966c4a2ed0062eca4466be36b2c6bc3417ecf58706931f2e4293c309c9ca3a57462f31d54691e0bfd06')

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
