# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rmzqc
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creation, Reading and Validation of 'mzqc' Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-jsonlite
  r-jsonvalidate
  r-knitr
  r-ontologyindex
  r-r6
  r-r6p
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e1d3ebccd417f50599ee270dd08b2ee')
b2sums=('eb9d2f3e8e16b9cfc1ac1400e815a54c8f36dace7446f87cce9909cf8a45b76a9992fea7380745ba3a48fcb380fda68314fa2b15b84de6731ca926305798aadd')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
