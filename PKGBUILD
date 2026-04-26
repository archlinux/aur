# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=survRM2
_pkgver=1.0-4
pkgname=r-survrm2
pkgdesc="Comparing Restricted Mean Survival Time"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc9dce563fbd56df482c73eb193ba608cd099d4f9419e1743359a98b86087879')

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
