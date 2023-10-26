# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineOB
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('5bd759ca398ffb70214a8076028bf0b2')
sha256sums=('b147d9e00df464d13b1c6d876b0a49e158510ff725da599e51b936faf997ca55')

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
