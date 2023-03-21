# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sf
_cranver=1.0-12
pkgname=r-${_cranname,,}
pkgdesc="Simple Features for R"
url="https://cran.r-project.org/package=sf"
license=("GPL-2 | MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "gdal>=2.0.1"
    "geos>=3.4.0"
    "proj>=4.8.0"
    "r>=3.3.0"
    "r-classint>=0.4.1"
    "r-dbi>=0.8"
    "r-magrittr"
    "r-rcpp>=0.12.18"
    "r-s2>=1.1.0"
    "r-units>=0.7.0"
    "sqlite3"
)
optdepends=(
    "r-blob"
    "r-covr"
    "r-dplyr>=0.8.3"
    "r-ggplot2"
    "r-knitr"
    "r-lwgeom>=0.2.1"
    "r-maps"
    "r-mapview"
    "r-matrix"
    "r-microbenchmark"
    "r-odbc"
    "r-pbapply"
    "r-pillar"
    "r-pool"
    "r-raster"
    "r-rlang"
    "r-rmarkdown"
    "r-rpostgres>=1.1.0"
    "r-rpostgresql"
    "r-rsqlite"
    "r-sp>=1.2.4"
    "r-spatstat>2.0.1"
    "r-spatstat.geom"
    "r-spatstat.linnet"
    "r-spatstat.random"
    "r-spatstat.utils"
    "r-stars>=0.2.0"
    "r-terra"
    "r-testthat>=3.0.0"
    "r-tibble>=1.4.1"
    "r-tidyr>=1.2.0"
    "r-tidyselect>=1.0.0"
    "r-tmap>=2.0"
    "r-vctrs"
    "r-wk"
)
checkdepends=(
    "r-testthat>=3.0.0"
    "r-tibble>=1.4.1"
    "r-vctrs"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("c7c4b9c95e9b2f3a60a9ba561a0db8b4361ad9be83506b64a8bb5456d71ef436295c3a7af5629b4e65d33243f9829580389f2fa23455bf9e00a76d7ea15a117f")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    cd "${srcdir}/${_cranname}/tests"
    R_LIBS="${srcdir}/build/" Rscript --vanilla testthat.R
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
