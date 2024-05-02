# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CTdata
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data companion to CTexploreR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-experimenthub
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac4dd73e6978ab4fbc3ef3c4d8be170c')
b2sums=('8ee144f205bc3b29baac06fac337db269b316f777ccadb231dbe8c66fd6c3ead114711e6cd9299a55991c5ca9d05b84b4606bf1475e4e1c570928439a05a64db')

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
