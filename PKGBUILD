# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_pkgname=bindr
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parametrized Active Bindings"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e707ad431db6f3bda28f5686fc4d09b')
b2sums=('29e20f59a43dc57bdc0448c0ad6f514fc28bc28b548d671c546f37f6e93483771b0714e82a1739cc194c65901b0c049966dee9c47c47185efa28861ebdfb09c1')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
