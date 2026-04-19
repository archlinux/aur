# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=snowflakeauth
_cranver=0.2.2
pkgname=r-${_cranname,,}
pkgdesc="Authentication to 'Snowflake'"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("b97c68bfaee0b08de1e313276b3060a5142d6687fa73b29bd806b0bf90043d6d686b8b2b201834b24f6a279e88bb5f5bd74b4873e8b99a52c4f766854fd67e97")

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
