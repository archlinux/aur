# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=pins
_cranver=1.4.2
pkgname=r-pins
pkgdesc="Pin, Discover, and Share Resources"
url="https://cran.r-project.org/package=${_cranname}"
license=("Apache License (>= 2)")
pkgver=${_cranver//[:-]/.}
pkgrel=1
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cli"
    "r-digest"
    "r-fs"
    "r-generics"
    "r-glue"
    "r-httr"
    "r-jsonlite"
    "r-lifecycle"
    "r-purrr>=1.0.0"
    "r-rappdirs"
    "r-rlang>=1.1.0"
    "r-tibble"
    "r-whisker"
    "r-withr>=2.4.3"
    "r-yaml"
)
optdepends=(
    "r-archive"
    "r-arrow"
    "r-azurestor"
    "r-covr"
    "r-data.table"
    "r-filelock"
    "r-gitcreds"
    "r-googlecloudstorager"
    "r-googledrive"
    "r-httr2"
    "r-ids"
    "r-knitr"
    "r-microsoft365r"
    "r-mime"
    "r-mockery"
    "r-nanoparquet"
    "r-openssl"
    "r-paws.storage"
    "r-qs2"
    "r-r.utils"
    "r-rmarkdown"
    "r-rsconnect"
    "r-shiny"
    "r-sodium"
    "r-testthat>=3.1.7"
    "r-webfakes>=1.2.0"
    "r-xml2"
    "r-zip"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("2fc42ea78b59b40f41f2689563e9bcdc11f5009b88095cdda5af3cb55931a6a3")

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
