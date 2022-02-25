# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=DBItest
_cranver=1.7.2
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
sha256sums=('b0326452263b7b01e0672ca04d8d1311880ef864d5e69a97062f086ab045a57f')

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
