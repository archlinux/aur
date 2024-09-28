# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crochet
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implementation Helper for '[' and '[<-' of Custom Matrix-Like Types"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e18ec54d3f5186fc3527bc547e98723b')
b2sums=('59109ad4f56723aca03d18fd60f2c9057dd1a2af7750829c53b56a6fd35707dbee553851ff3708316004912ee0c0fee794710b4f080d85888a9ee3fe54eb63b1')

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
