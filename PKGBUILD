# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=mockr
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Mocking in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rlang
  r-withr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-fs
  r-knitr
  r-pkgload
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64562ef53ff44054bec118181cd72e65')
b2sums=('4c30b5de474f4a35bb0ca766d99fbe96426c196b507c75b3329b8d1f9477ddeda7b2a22d7d2ab67ba740e441a737f7d77591f7d2714c68eb79c8079b267c53cf')

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
