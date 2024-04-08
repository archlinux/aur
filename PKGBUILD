# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=logr
_pkgver=1.3.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creates Log Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC0-1.0')
depends=(
  r-common
  r-withr
)
checkdepends=(
  r-dplyr
  r-testthat
  r-tidylog
)
optdepends=(
  r-covr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidylog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3fde9bc158ef1d20fb0c9d50ad7a806')
b2sums=('c7bfa7202da86ac9cafff612b0a3182513e87f7d51ff8d11c29d354f24f8b0adc69e6120c6a0bac7fed4e6e6f1af8560d6cf9c14f8a547ecfd3a9cb1808ebd76')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
