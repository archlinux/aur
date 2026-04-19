# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=rix
_cranver=0.18.2
pkgname=r-rix
pkgdesc="Reproducible Data Science Environments with 'Nix'"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-or-later")
pkgver=${_cranver//[:-]/.}
pkgrel=1
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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("4498723f2a378d1b228e5abbf8abec37a2e6660c36705dd3fa94f1ecec78e425")

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
