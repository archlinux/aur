# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineOB
_pkgver=1.46.0
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
md5sums=('d0e5a71758858529851020ed746841ce')
b2sums=('58f492fce5af68de887e78070a8c94f375a6981f268de4d7735b7f5f612b0d4f7f060dc3e088f1966d6974c74f651de0efdaf3f4d0a61af7439d000d570d95d5')

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
