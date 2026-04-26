# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=rix
_pkgver=0.18.2
pkgname=r-rix
pkgdesc="Reproducible Data Science Environments with 'Nix'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-or-later")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-curl"
    "r-jsonlite"
    "r-sys"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
    "r-testthat"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4498723f2a378d1b228e5abbf8abec37a2e6660c36705dd3fa94f1ecec78e425')

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
