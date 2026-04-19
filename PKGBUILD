# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_cranname=distro
_cranver=0.1.1
pkgname=r-${_cranname,,}
pkgdesc="Linux Distribution Properties"
url="https://cran.r-project.org/package=${_cranname}"
license=("Apache")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
)

# tests fail in chroot (cannot detect distro)

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("4106aa1918bcb10772304abb2f1d5e935f80d3a839173fa2019bc9999ed47a29716902f979d305be464d0624d5f7f7f1e414251dfecff165fd12b04dd5ccf6c7")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     R_LIBS="build/" R CMD check --no-manual --as-cran "${_cranname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
