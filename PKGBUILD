# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ISLET
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Individual-Specific ceLl typE referencing Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-abind
  r-biocgenerics
  r-biocparallel
  r-lme4
  r-nnls
  r-purrr
  r-summarizedexperiment
)
checkdepends=(
  r-runit
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-htmltools
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5cf5ae7df60062c1822ca64c3989a4e0')
b2sums=('a996f64896dc329ffa266d9d71a86d74c0506173fc217025ad62e1ab458a796e714fee4183e228cd5fb12b728ee1ceff4d6ad80b609751c6a59952526d07cd67')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
