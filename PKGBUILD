# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRstyle
_pkgver=1.4.3
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
  r-testthat
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('01a503b44970dfcbe8cb651ad5521470')
b2sums=('57b932f328f400c41f51eb83fd12b538b9be08a7a914e63f6bebec4822baf2e93cd17b95b4c2df528beed399bd8e059c1fae60e6c4fd744923566706631f0e09')

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
