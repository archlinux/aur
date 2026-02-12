# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_pkgname=RcppParallel
pkgname=r-${_pkgname,,}
pkgdesc="Parallel Programming Tools for Rcpp"
pkgver=5.1.9
pkgrel=1
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL3")

arch=("i686" "x86_64")
depends=(
    "r>=3.0.2"
    "tbb"
)
optdepends=(
    "r-knitr"
    "r-markdown"
    "r-rcpp"
    "r-runit"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${pkgver}.tar.gz")
b2sums=("bb926b01de896d8f78511444a57767aeef3ecd29bc1c8a59f4adfaf26e1e6a023389bd1bccded23d95df2962a6b48527dc119b35bd91bd3395a464a97873f506")

build() {
    R CMD INSTALL ${_pkgname}_${pkgver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
