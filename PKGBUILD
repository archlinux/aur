# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineOB
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R interface to a subset of OpenBabel functionalities"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
md5sums=('524dda9f50c5f7c71da385726ff5e056')
b2sums=('bae3db36d64e3d5be7a55940543b580099c80024bf7f15d80cb0d4a90723402b3208e1ac0791b9c9e57c637f6be46c2c23b551b125f2dcea9316c3f2a5bbd24f')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
