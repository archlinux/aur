# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=distro
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgdesc="Linux Distribution Properties"
url="https://cran.r-project.org/package=${_pkgname}"
license=("Apache")
pkgver=${_pkgver//-/.}
pkgrel=2

arch=("any")
depends=(
    "r"
)

# tests fail in chroot (cannot detect distro)

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('4106aa1918bcb10772304abb2f1d5e935f80d3a839173fa2019bc9999ed47a29716902f979d305be464d0624d5f7f7f1e414251dfecff165fd12b04dd5ccf6c7')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     R_LIBS="build/" R CMD check --no-manual --as-cran "${_pkgname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
