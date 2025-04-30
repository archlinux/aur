# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dartRverse
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Install and Load the 'dartRverse' Suits of Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-httr
  r-devtools
  r-rcurl
  r-cli
  r-rlang
)
optdepends=(
  r-dartr.base
  r-dartr.sim
  r-dartr.captive
  r-dartr.popgen
  r-dartr.spatial
  r-dartr.data
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('234e3e944fdaba9f592038a1391df15c')
b2sums=('d252579a58e4235fb45531b83fda974d8382744693995e21020fc226dc3c9fce70f941c15861810129809b451b0d861af470ee891ce99fd5fd4f5cee13900f62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
