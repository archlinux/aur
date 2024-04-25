# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinylogs
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Record Everything that Happens in a 'Shiny' Application"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-anytime
  r-bit64
  r-data.table
  r-digest
  r-htmltools
  r-jsonlite
  r-nanotime
  r-shiny
)
checkdepends=(
  r-dbi
  r-rsqlite
  r-testthat
)
optdepends=(
  r-covr
  r-dbi
  r-googledrive
  r-knitr
  r-rmarkdown
  r-rsqlite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25ffc5c472d557ee69e2d18aa4ae352d')
b2sums=('56d2eb8e93a9bd049c364b419de69084756f75cdce18e94c81a452514b0475b4fa220d262d7b1ae3afdabafc22f29506ed1989884755a761733457e04ba55c0c')

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
