# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineOB
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="R interface to a subset of OpenBabel functionalities"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0 GPL3)
depends=(
  openbabel
  r-biocgenerics
  r-rcpp
  r-zlibbioc
)
makedepends=(
  eigen
  r-bh
)
checkdepends=(
  r-chemminer
  r-runit
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-chemminer
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d721ca0fa36f8b42fecca0ab4f98910')
sha256sums=('9115e25d3be94148fcc549b22af107c3fe0055569ac4e36ce161a203a8698450')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
