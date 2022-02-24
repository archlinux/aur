# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=units
_cranver=0.8-0
pkgname=r-${_cranname,,}
pkgdesc="Measurement Units for R Vectors"
url="https://cran.r-project.org/package=units"
license=("GPL-2")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r" "r-rcpp" "udunits")
optdepends=("r-udunits2" "r-nistunits" "r-measurements" "r-xml2" "r-magrittr" "r-pillar" "r-dplyr" "r-vctrs" "r-knitr" "r-testthat" "r-ggforce" "r-rmarkdown")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("9c46fe138e8c1c3d3a51268776412f02d09673656516148cccb71b1071beb21a")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
