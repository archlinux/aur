# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unitizer
_pkgver=1.4.20
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive R Unit Tests"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-crayon
  r-diffobj
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0e2e77bc73d40eff1e07cd684a16e80')
sha256sums=('5afb6d3aebd17689c277a69970b6c7e4f81c0b359ed7f1dbf4257ddafa7e5268')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
