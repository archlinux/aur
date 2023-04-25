# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=recipes
_cranver=1.0.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Preprocessing and Feature Engineering Steps for Modeling"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    r-cli
    r-clock
    r-dplyr
    r-ellipsis
    r-generics
    r-glue
    r-gower
    r-hardhat
    r-ipred
    r-lifecycle
    r-lubridate
    r-magrittr
    r-purrr
    r-rlang
    r-tibble
    r-tidyr
    r-tidyselect
    r-timedate
    r-vctrs
    r-withr
)
optdepends=(
    r-covr
    r-ddalpha
    r-dials
    r-ggplot2
    r-igraph
    r-kernlab
    r-knitr
    r-modeldata
    r-parsnip
    r-rann
    r-rcpproll
    r-rmarkdown
    r-rsample
    r-rspectra
    r-splines2
    r-testthat
    r-workflows
    r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('105e97127cdd6aaeb9fb3348e51a9c46e21fb8bcb734cb3bbd6dbdf2b6b2fc8f'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRAN-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
