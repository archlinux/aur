# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=jdx
_cranver=0.1.4
pkgname=r-${_cranname,,}
pkgdesc="'Java' Data Exchange for 'R' and 'rJava'"
url="https://cran.r-project.org/package=jdx"
license=("GPL (>= 2) | BSD_3_clause")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=("r" "r-rjava")
optdepends=("r-testthat" "r-knitr" "r-rmarkdown" "r-pander")
makedepends=()

# source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz")
md5sums=("d9c9d467a99401afc09e0bcb0455acdf")

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
