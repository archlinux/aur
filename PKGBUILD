# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=streamy
_cranver=0.2.1
pkgname=r-${_cranname,,}
pkgdesc="Inline Streaming of LLM Responses in RStudio"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-cli>=3.6.3"
    "r-coro>=1.1.0"
    "r-rlang"
    "r-rstudioapi>=0.17.1"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("37de88d5d3d102269acf460695579cc5894418f812c3acc917d24c02cb616329eb3dbf895bcbb9d98ae270f6a076513c027e08f66b4743fdb967244995a63d04")

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
