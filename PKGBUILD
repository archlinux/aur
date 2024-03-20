# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=pkgKitten
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Simple Packages Which Do not Upset R Package Checks"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-roxygen2
  r-tinytest
  r-whoami
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b58fad3ab4be2ad5ca3853c34c29f8b')
b2sums=('510f33455c03b3292142f7454f673740e914357e3f6cc23cad829c7f4555a363adf1cae276803390a6903381a3d64ff04803b7e7a49ec3629d6f5bc93b46814f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
