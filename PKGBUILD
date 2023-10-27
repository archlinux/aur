# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.bumpy
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save and Load BumpyMatrices to/from file"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-alabaster.base
  r-biocgenerics
  r-bumpymatrix
  r-iranges
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d5111cd74d5b72fc88eb66ac5b670c3')
sha256sums=('8e950c654ecf06291866608c97328d00ee118bada10cbc78c1bf501bdec2257d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
