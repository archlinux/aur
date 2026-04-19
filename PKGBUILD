# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=gettz
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgdesc="Get the Timezone Information"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL2" "GPL3")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "r"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('3ce9f447a174a47c251ed1f1cee314721b75dd9a32f3fcee96b5c84d5ec40dcf6456636509c73b815a201a79353d664490a343b6eef221bdcdcdb6ca45b45a39')

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
