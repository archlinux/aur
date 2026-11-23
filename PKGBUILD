# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=prompter
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Add Tooltips in 'Shiny' Apps with 'Hint.css'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-shiny
)
optdepends=(
  r-htmltools
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ea31aaca314ad943990e21add4d643b')
b2sums=('07cef1d4cab459cababc131ad68f59e85717383d2548973852a5148868c7cc31ee659f6f6fffee04024b5d92845c752edc6369c203895f7879fd5d102dde6c4a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
