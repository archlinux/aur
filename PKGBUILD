# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRstyle
_pkgver=1.12.0
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
  r-biocstyle
  r-checkmate
  r-data.table
  r-desc
  r-git2r
  r-lintr
  r-pkgbuild
  r-rcmdcheck
  r-remotes
  r-rjson
  r-withr
  r-yaml
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
md5sums=('fa73a83717c28ba52351880905369284')
b2sums=('97101e2fc46b2cd8a48878dd83d23301b27c77a0355cfc41ed5c2271c366552967b4bfe785ab0873cfab1ebbfc13f4e5a0d0c0e602b58ff75d6a5b81450b9ea0')

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
