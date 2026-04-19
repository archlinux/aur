# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=survRM2
_cranver=1.0-4
pkgname=r-survrm2
pkgdesc="Comparing Restricted Mean Survival Time"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-2.0-only")
pkgver=${_cranver//[:-]/.}
pkgrel=1
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("dc9dce563fbd56df482c73eb193ba608cd099d4f9419e1743359a98b86087879")

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
