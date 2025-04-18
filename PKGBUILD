# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ISLET
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('21b4f1579796a88040c9d2e4c390b8ef')
b2sums=('ed2800e4a1591a2b8aa19b24c5ebb6712e2c743621a4ff61e9bf12bf8e44ba168058ae44b33863da30eae4a082e816b583f26e34e5108db70f0a0586ae83cf96')

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
