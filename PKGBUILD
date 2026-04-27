# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=brms
_pkgver=2.23.0
pkgname=r-brms
pkgdesc="Bayesian Regression Models using 'Stan'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-rcpp>=0.12.0"
    "r-rstan>=2.29.0"
    "r-ggplot2>=2.0.0"
    "r-loo>=2.8.0"
    "r-posterior>=1.6.0"
    "r-rstantools>=2.1.1"
    "r-bayesplot>=1.5.0"
    "r-bridgesampling>=0.3-0"
    "r-glue>=1.3.0"
    "r-rlang>=1.0.0"
    "r-future>=1.19.0"
    "r-future.apply>=1.0.0"
    "r-matrixstats"
    "r-nleqslv"
    "r-coda"
    "r-abind"
    "r-backports"
)
optdepends=(
    "r-testthat>=3.1.9"
    "r-emmeans>=1.4.2"
    "r-cmdstanr>=0.5.0"
    "r-projpred>=2.0.0"
    "r-priorsense>=1.0.0"
    "r-shinystan>=2.4.0"
    "r-splines2>=0.5.0"
    "r-rwiener"
    "r-rtdists"
    "r-extradistr"
    "r-processx"
    "r-mice"
    "r-spdep"
    "r-mnormt"
    "r-lme4"
    "r-mcmcglmm"
    "r-ape"
    "r-arm"
    "r-statmod"
    "r-digest"
    "r-diffobj"
    "r-betareg"
    "r-r.rsp"
    "r-gtable"
    "r-shiny"
    "r-knitr"
    "r-rmarkdown"
    "r-ragg"
    "r-colorspace"
    "r-mirai"
    "r-future.mirai"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5f5bb5604ec3f87b3ad99f0da4e6a37d8c5488221e8abe459171340992c37a5')

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
