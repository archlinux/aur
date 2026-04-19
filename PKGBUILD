# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=measurements
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgdesc="Tools for Units of Measurement"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL3")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("any")
depends=(
    "r"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('d4decc3aced4709cbb3e4aad7a8872aed949badf98c499967ef617bb1a135c7f127f4a9c57a42ea07c9a66a90ce5f0eca28d7a5ffad81b132c1dc7e68536c213')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
