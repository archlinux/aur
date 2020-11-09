# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=ultimaker-libnest2d-git
_pkgname=libnest2d
pkgver=0.4.r26.g4d6fb4d
pkgrel=1
pkgdesc="2D irregular bin packaging and nesting library written in modern C++ (Ultimaker fork)"
arch=('any')
url="https://github.com/Ultimaker/libnest2d"
license=('LGPL3')
depends=(nlopt polyclipping)
makedepends=(cmake boost)
provides=(libnest2d)
conflicts=(libnest2d)
source=("git+https://github.com/Ultimaker/libnest2d")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  mkdir build
  cd build
  cmake .. -DLIBNEST2D_HEADER_ONLY=OFF -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
