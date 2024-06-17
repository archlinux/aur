# Maintainer: Adam Schadler <ajschadler@gmail.com>

_pkgname=cmdstanr
_pkgver=0.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Lightweight interface to Stan. Alternative to RStan."
arch=('any')
url="https://stan-dev.r-universe.dev/${_pkgname}"
license=("BSD-3-Clause AND LicenseRef-StanDev AND CC-BY-4.0")
depends=(
    "r"
    "cmdstan"
    "r-checkmate"
    "r-data.table"
    "r-jsonlite>=1.2.0"
    "r-posterior>=1.4.1"
    "r-processx>=3.5.0"
    "r-r6>=2.4.0"
    "r-withr>=2.5.0"
    "r-rlang>=0.4.7"
)
makedepends=("r-knitr")
optdepends=(
    "r-bayesplot"
    "r-ggplot2"
    "r-knitr>=1.37"
    "r-loo>=2.0.0"
    "r-rmarkdown"
    "r-rcpp"
)
checkdepends=("r-testthat>=2.1.0" "${optdepends[@]}")
source=("https://stan-dev.r-universe.dev/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "BSD-3-Clause.txt"::"https://raw.githubusercontent.com/stan-dev/cmdstanr/master/LICENSE.md")
b2sums=('daced7015735f6fd53c3898379ff10a6ca17f6ddeb58e385b43aeb6070ff7911d4c3c74b3276e8548a23e6e309f50a5aa519e1609c2dec4346936c010602d56e'
        '103db25a67ccbd2c5ce9f1b9e4eaed6f4405629511a8d827aae09b5374ba6d9ef6268e4f311638f2c5e31701afa9a705ba9900cd625c2240df97fbd1f743fc25')

build() {
    R CMD INSTALL "${_pkgname}_${_pkgver}.tar.gz" -l "${srcdir}"
}

# Check requires optional dependencies
#check () {
#    R CMD check --no-manual -l "${srcdir}" "${_pkgname}_${_pkgver}.tar.gz"
#}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library" "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"

    # License installation
    install -Dm644 "BSD-3-Clause.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
