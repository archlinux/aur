# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seq.hotSPOT
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Targeted sequencing panel design based on mutation hotspots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-hash
  r-r.utils
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a061f0311bfeaf86ed51a9cdc48b966')
b2sums=('f306f41589e4c6447322d4fda64220ad180624ba87e272a336d5aeee3384fd41e2e689018ae5cde8e2a47381094c33be65a66e8a2b32ffd70dc4c5b548b122c4')

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
