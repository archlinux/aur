# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRstyle
_pkgver=1.2.0
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
md5sums=('317ab64abcbc95e3f33899ec08309a7e')
b2sums=('c65543ffd94ba6a655aa63cb4436b6961465acd0769f3ed4b2cefac31f0b35bca11a8e830ddcb92f674d78794bbdc12d5ce48d6875722eb754d92ecae831595d')

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
