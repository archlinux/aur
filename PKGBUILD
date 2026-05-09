# Maintainer: Jan Horvath <johnvonbrno at tutamail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Zdenek Janak <janak@astronomie.cz>

pkgname=munipack
pkgver=0.6.2
pkgrel=1
pkgdesc="A general astronomical image processing software"
arch=('x86_64')
url="https://munipack.physics.muni.cz"
license=(GPL-3.0-or-later)
depends=(
  cfitsio
  gcc-libs
  glibc
  hicolor-icon-theme
  libminpack
  liboakleaf
  plplot
  wxwidgets-gtk3
  wxwidgets-common
)
makedepends=(gcc-fortran)

source=("https://integral.physics.muni.cz/ftp/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('50329FD7732E2AB08161435F1E625DF64972FF9A')

md5sums=("3055f3f24a64589f777b91acbfa62fc6"
        'SKIP')
INTEGRITY_CHECK=('md5')

_archive="$pkgname-$pkgver"

CFLAGS="-O2 -DNDEBUG"
CXXFLAGS="-O2 -DNDEBUG"
FCFLAGS="-O2 -ffpe-summary=invalid,zero,overflow -fno-unsafe-math-optimizations -frounding-math -fsignaling-nans"

build() {
  cd "$_archive"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
  cd "$_archive"
  make -k check
}

package() {
  cd "$_archive"
  make DESTDIR="$pkgdir/" install
}
