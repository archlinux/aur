# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=snowflakeauth
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgdesc="Authentication to 'Snowflake'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=5

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
b2sums=('7da1763eb03cc44b5a233b82184054b330d5ceed467748be55e27b06d2a7b1ed9f5cb9ab88b6fe8ef8052079829902180f445dfe0a433e94536bb45165b47c96')

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
