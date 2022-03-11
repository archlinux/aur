# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=furrr
_cranver=0.2.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Apply Mapping Functions in Parallel using Futures"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    r-future
    r-ellipsis
    r-globals
    r-lifecycle
    r-purrr
    r-rlang
    r-vctrs
)
checkdepends=(r-dplyr r-testthat)
optdepends=(
    r-carrier
    r-covr
    r-dplyr
    r-knitr
    r-listenv
    r-magrittr
    r-rmarkdown
    r-testthat
    r-withr
    r-tidyselect
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('0a213422dc0a2e84173f2d3e6c7900dcb677f980c255d6b6ccf666fba1173700'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRAN-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
