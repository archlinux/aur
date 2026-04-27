# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gtsummary
_pkgver=2.5.0
pkgname=r-gtsummary
pkgdesc="Presentation-Ready Data Summary and Analytic Result Tables"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cards>=0.7.1"
    "r-cardx>=0.3.1"
    "r-cli>=3.6.3"
    "r-dplyr>=1.1.3"
    "r-glue>=1.8.0"
    "r-gt>=0.11.1"
    "r-lifecycle>=1.0.3"
    "r-rlang>=1.1.1"
    "r-tidyr>=1.3.0"
    "r-vctrs>=0.6.4"
)
optdepends=(
    "r-aod>=1.3.3"
    "r-broom>=1.0.5"
    "r-broom.helpers>=1.20.0"
    "r-broom.mixed>=0.2.9"
    "r-car>=3.0-11"
    "r-cmprsk"
    "r-effectsize>=0.6.0"
    "r-emmeans>=1.7.3"
    "r-flextable>=0.8.1"
    "r-geepack>=1.3.10"
    "r-ggstats>=0.2.1"
    "r-huxtable>=5.4.0"
    "r-insight>=0.15.0"
    "r-kableextra>=1.3.4"
    "r-knitr>=1.37"
    "r-lme4>=1.1-31"
    "r-mice>=3.10.0"
    "r-officer"
    "r-openxlsx"
    "r-parameters>=0.20.2"
    "r-parsnip>=0.1.7"
    "r-rmarkdown"
    "r-smd>=0.6.6"
    "r-spelling"
    "r-survey>=4.2"
    "r-testthat>=3.2.0"
    "r-withr>=2.5.0"
    "r-workflows>=0.2.4"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2fad5bb297a5a7cc2a77818947dac8e9daef5572923be461f80ff93551519178')

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
