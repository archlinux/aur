# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=odbc
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgdesc="Connect to ODBC Compatible Databases (using the DBI Interface)"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=5

arch=("i686" "x86_64")
depends=(
    "r>=3.6.0"
    "r-bit64"
    "r-blob>=1.2.0"
    "r-cli"
    "r-dbi>=1.1.0"
    "r-hms"
    "r-lifecycle"
    "r-rcpp>=0.12.11"
    "r-rlang>=1.1.0"
    "unixodbc"
)
makedepends=(
    "r-cpp11"
)
optdepends=(
    "r-covr"
    "r-dbitest"
    "r-magrittr"
    "r-rmarkdown"
    "r-rsqlite"
    "r-tibble"
    "r-withr"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('d746a2a3a54e261b67f51d0521691d9e07b265a3015df03f65d4b3df04223c28917fce59c0c1e0dd6b8719581adca1acad5210c377dfb6c18caa813454cf4e0d')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}


package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
