# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cmprsk
_pkgver=2.2-12
pkgname=r-cmprsk
pkgdesc="Subdistribution Analysis of Competing Risks"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-or-later")
pkgver=${_pkgver//-/.}
pkgrel=5
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('773ecb93be0eac7bb5dfe9ea1480380da89ea95497b7b2febb08fd7c5104acdc')

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
