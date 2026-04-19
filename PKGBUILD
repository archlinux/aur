# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=parsedate
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgdesc="Recognize and Parse Dates in Various Formats"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL2")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("i686" "x86_64")
depends=(
    "r"
)
optdepends=(
    "r-covr"
    "r-withr"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('645c116366797f812c0033c41e87fea7cfe0bcdbb916e9f418fd97c6b753cbd037cc40f215eb368e079dbc20ac19c64d53f66da603ef47a8b83bb70063a839ae')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_pkgname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
