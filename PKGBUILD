# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=simsurv
_cranver=1.0.1
pkgname=r-simsurv
pkgdesc="Simulate Survival Data"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-or-later")
pkgver=${_cranver//[:-]/.}
pkgrel=1
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
)
optdepends=(
    "r-bb>=2014.10.1"
    "r-eha>=2.4.5"
    "r-flexsurv>=1.1.0"
    "r-knitr>=1.15.1"
    "r-rmarkdown"
    "r-rstpm2>=1.4.1"
    "r-testthat>=1.0.2"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("6ee9c14d40f104ae626e24103560d1532403361c5ca3e0c022b49f5871b610b1")

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
