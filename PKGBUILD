# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=assorthead
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assorted Header-Only C++ Libraries"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3d29d7ace812a2181e89898b0d871c0a')
b2sums=('43f433fbfa271170094706ca909c1a24d11fd9f1bda900795548fe1ce0752fb7a5aa7843e510ccfe1ebd2bd00950691d66ad0e24bd745f229f95bf8dbb26437f')

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
