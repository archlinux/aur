# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=tidycmprsk
_pkgver=1.1.2
pkgname=r-tidycmprsk
pkgdesc="Competing Risks Estimation"
url="https://cran.r-project.org/package=${_pkgname}"
license=("AGPL (>= 3)")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-broom>=1.0.1"
    "r-cli"
    "r-cmprsk>=2.2.10"
    "r-dplyr"
    "r-ggplot2>=3.3.5"
    "r-gtsummary>=2.0.0"
    "r-hardhat>=1.3.0"
    "r-purrr>=0.3.4"
    "r-rlang"
    "r-stringr>=1.4.0"
    "r-tibble>=3.1.6"
    "r-tidyr"
)
optdepends=(
    "r-aod"
    "r-broom.helpers>=1.15.0"
    "r-cardx>=0.2.0"
    "r-covr>=3.5.1"
    "r-ggsurvfit"
    "r-knitr>=1.36"
    "r-spelling"
    "r-testthat>=3.2.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36f0470177b380a391169d2ef836a7cbac30a624f336360c4b17f3ce65d4616e')

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
