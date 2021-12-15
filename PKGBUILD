# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sf
_cranver=1.0-4
pkgname=r-${_cranname,,}
pkgdesc="Simple Features for R"
url="https://cran.r-project.org/package=sf"
license=("GPL-2 | MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r" "r-classint" "r-dbi" "r-magrittr" "r-rcpp" "r-s2" "r-units")
optdepends=("r-blob" "r-covr" "r-dplyr" "r-ggplot2" "r-knitr" "r-lwgeom" "r-maps" "r-mapview" "r-matrix" "r-microbenchmark" "r-odbc" "r-pillar" "r-pool" "r-raster" "r-rgdal" "r-rgeos" "r-rlang" "r-rmarkdown" "r-rpostgres" "r-rpostgresql" "r-rsqlite" "r-sp" "r-spatstat" "r-spatstat.geom" "r-spatstat.core" "r-spatstat.linnet" "r-spatstat.utils" "r-stars" "r-terra" "r-testthat" "r-tibble" "r-tidyr" "r-tidyselect" "r-tmap" "r-vctrs" "r-wk")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("231cf1fc67df0e608daa1b0b2ee99d30815d80e47d9898c1ff8c573ce3b0b437")

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
