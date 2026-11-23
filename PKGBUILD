# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRstyle
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package with style requirements for the gDR suite"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-bioccheck
  r-biocmanager
  r-checkmate
  r-desc
  r-git2r
  r-lintr
  r-pkgbuild
  r-rcmdcheck
  r-remotes
  r-rjson
  r-withr
  r-yaml
  r-biocstyle
)
checkdepends=(
  r-pkgdown
  r-testthat
)
optdepends=(
  r-knitr
  r-pkgdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8da61129e0a206c6d788a5cabb841c40')
b2sums=('5225b4b66f4a7812c46a55df9fe314f6425d30434c88fc94be79103c80efa22b25078e76deee3a92eb2ef61dda3b545982a7e28c44bcfb0cfa61f41f215dc190')

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
