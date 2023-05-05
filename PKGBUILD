# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=measurements
_cranver=1.5.1
pkgname=r-${_cranname,,}
pkgdesc="Tools for Units of Measurement"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("d4decc3aced4709cbb3e4aad7a8872aed949badf98c499967ef617bb1a135c7f127f4a9c57a42ea07c9a66a90ce5f0eca28d7a5ffad81b132c1dc7e68536c213")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
