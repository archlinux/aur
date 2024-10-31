# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineOB
_pkgver=1.44.0
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
md5sums=('4e3f20d57c46d1ff27d1ed273ef4d4c4')
b2sums=('6f523ab5cda5aaebd3c0119d150940b473e9cc3610b62aae16ccc217aa35c2b6d32f9baf74d7b26e7cb17ec4dba6e3f81a4c369907d5608dc9bd573cbad323be')

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
