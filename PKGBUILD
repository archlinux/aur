# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=QuickJSR
_pkgver=1.9.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface for the 'QuickJS-NG' Lightweight 'JavaScript' Engine"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2c165f943bf543fbbba927c8ce6ea19')
b2sums=('649895d5c5879a942110f06c23b588079e9bdfa3ea3921ac2c44cfc2355a2e68792ef404f308287a86bebc7246990650cea2de57feb09897ee1c0adb0dee555a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
