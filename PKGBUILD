# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=DBItest
_cranver=1.7.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Testing DBI Backends"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL)
depends=(
    r-blob
    r-callr
    r-dbi
    r-desc
    r-hms
    r-lubridate
    r-palmerpenguins
    r-r6
    r-rlang
    r-testthat
    r-withr
    r-vctrs
)
optdepends=(
    r-clipr
    r-dblog
    r-debugme
    r-devtools
    r-knitr
    r-lintr
    r-rmarkdown
    r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('30b7026378fedaec7e730fa4e242968dd70642f496457d7bf47d35e5c7ab891c')

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
}
