# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=dbplyr
_cranver=2.3.3
pkgname=r-${_cranname,,}
pkgdesc="A ‘dplyr’ Back End for Databases"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.1"
    "r-blob>=1.2.0"
    "r-cli>=3.4.1"
    "r-dbi>=1.0.0"
    "r-dplyr>=1.1.0"
    "r-glue>=1.2.0"
    "r-lifecycle>=1.0.3"
    "r-magrittr"
    "r-pillar>=1.5.0"
    "r-purrr>=1.0.1"
    "r-r6>=2.2.2"
    "r-rlang>=1.0.6"
    "r-tibble>=1.4.2"
    "r-tidyr>=1.3.0"
    "r-tidyselect>=1.2.0"
    "r-vctrs>=0.5.0"
    "r-withr"
)
optdepends=(
    "r-bit64"
    "r-covr"
    "r-knitr"
    "r-lahman"
    "r-nycflights13"
    "r-odbc"
    "r-rmariadb>=1.0.2"
    "r-rmarkdown"
    "r-rpostgres>=1.1.3"
    "r-rpostgresql"
    "r-rsqlite>=2.2.15"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.2"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("5eae3346d05008440a4daa7f135c31f1a4e74e4eb8d74bdbef8425d667f94dbd38bc36aeb447d9034f13acb30301d6f3b74e900a9c4636913c870ab25947e184")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
