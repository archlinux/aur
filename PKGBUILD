# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=mall
_cranver=0.2.0
pkgname=r-mall
pkgdesc="Run Multiple Large Language Model Predictions Against a Table, or Vectors"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cli"
    "r-dplyr"
    "r-ellmer>=0.3.0"
    "r-fs"
    "r-glue"
    "r-jsonlite"
    "r-ollamar"
    "r-rlang"
)
optdepends=(
    "r-dbplyr"
    "r-testthat>=3.0.0"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("e8edbcbb048d322e1338867aa9845c22740526b74a4d105ed928f33cb4f5fe95")

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
