# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=sfheaders
_pkgver=0.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Converts Between R Objects and Simple Feature Objects"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rcpp
)
makedepends=(
  r-geometries
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('28bd3e7fe95ab6d9d41c27d6f153c443')
b2sums=('a8d0e94f1b6bf4ce9957f3dfce39e2c3c4c862886c659a11e315fd2ba8b6fbde35df3b5ab2fbde25e303d762d9860921f553fe5b0aa8f1187ea66d9a59fbb5ad')

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
