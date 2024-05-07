# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optparse
_pkgver=1.7.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Command Line Option Parser"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-getopt
)
checkdepends=(
  r-stringr
  r-testthat
)
optdepends=(
  r-knitr
  r-stringr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c943a4299157ea22967309e8c7158c2')
b2sums=('4379ce2a3947934ca2e6c83a34fddd77ca49313ea77d91908a13b8ef583259af0c31f1d6c9f1cf15405fb5068165aed56395edcce52c3d2843b8691ed2bb000a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
