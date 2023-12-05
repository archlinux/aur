# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=loder
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dependency-Free Access to PNG Image Files"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(BSD)
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07ee60b41a730f551f95da3865d23760')
sha256sums=('7e1b977a8e62b29717866a61c98245860fa32ae5ab3d8362096d8e296acc83a6')

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
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}
