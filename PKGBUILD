# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcatest
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genotype Conditional Association TEST"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-lfa
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bedmatrix
  r-genio
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8163821065606b5edb5f7d3ccbb2d435')
b2sums=('04ef13b59d807ac1ae8d6cb9e44c3304a3cbeaba099ffa9a9766638ccafc7b9e64839fc19fa3122d487488f9bb597ff7082821047da068e3a094fa36be037ac9')

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
