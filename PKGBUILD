# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=classInt
_cranver=0.4-3
pkgname=r-${_cranname,,}
pkgdesc="Choose Univariate Class Intervals"
url="https://cran.r-project.org/package=classInt"
license=("GPL (>= 2)")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=("r" "r-e1071")
optdepends=("r-spdata" "r-units" "r-knitr" "r-rmarkdown")
makedepends=("gcc-fortran")

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=("8222cf7fca6b824a51bababc18a86659")

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
