# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRstyle
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A package with style requirements for the gDR suite"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-bioccheck
  r-biocmanager
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
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('473f3c2e73e05f50ec3af2b72bb18a55')
b2sums=('b4a784cec45d74b7aa4f1557ff9de1b343b2d9955cbfff8b9e95164c0186d74e6bacf55f40aa35316ecdd37bd36fdbd084426904d9782b48deefbcd65c0563ba')

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
