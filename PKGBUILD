# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Zdenek Janak <janak@astronomie.cz>

pkgname=munipack
pkgver=0.6.1
pkgrel=3
pkgdesc="A general astronomical image processing software"
arch=(x86_64)
url="http://munipack.physics.muni.cz"
license=(GPL-3.0-or-later)
depends=(
  cfitsio
  gcc-libs
  glibc
  hicolor-icon-theme
  libminpack
  liboakleaf
  plplot
  python
  python-matplotlib
  python-numpy
  wxgtk3
  wxwidgets-common
)
makedepends=(gcc-fortran)

source=("ftp://munipack.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8a34e320b2c088269483178c28e02f5a800b0426d3cc46ced686cb1d1cc7d57f')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  ./configure --prefix=/usr --libexecdir=/usr/lib

  # Parallel compilation fails
  MAKEFLAGS="-j1" make
}

package() {
  cd "$_archive"

  # Parallel compilation fails
  MAKEFLAGS="-j1" make DESTDIR="$pkgdir/" install
}
