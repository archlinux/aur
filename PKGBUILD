# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=cmprsk
_cranver=2.2-12
pkgname=r-cmprsk
pkgdesc="Subdistribution Analysis of Competing Risks"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-2.0-or-later")
pkgver=${_cranver//[:-]/.}
pkgrel=1
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("773ecb93be0eac7bb5dfe9ea1480380da89ea95497b7b2febb08fd7c5104acdc")

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
