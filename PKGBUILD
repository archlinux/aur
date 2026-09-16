# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=rix
_pkgver=0.18.5
pkgname=r-rix
pkgdesc="Reproducible Data Science Environments with 'Nix'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-or-later")
pkgver=${_pkgver//-/.}
pkgrel=4
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
sha256sums=('df7aeecd5a5887885e9473de35d5028b046d1dbca7400e46d167de83a0b780ca')

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
