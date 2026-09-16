# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=gettz
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgdesc="Get the Timezone Information"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL2" "GPL3")
pkgver=${_pkgver//-/.}
pkgrel=5

arch=("i686" "x86_64")
depends=(
    "r"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('486bd56e77934e4b6b422621a6607afe8fb5060e27d55bf0127c5e47904c96ebc17d582b91375968c99e945da4d64e4c747ed0cfc5d9e6952e27f6df1a398f63')

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
