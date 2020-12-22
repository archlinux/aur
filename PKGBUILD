# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=ultimaker-libnest2d-git
_pkgname=libnest2d
pkgver=0.4.r26.g4d6fb4d
pkgrel=2
pkgdesc="2D irregular bin packaging and nesting library written in modern C++ (Ultimaker fork)"
arch=('any')
url="https://github.com/Ultimaker/libnest2d"
license=('LGPL3')
depends=(nlopt polyclipping)
makedepends=(boost cmake git)
provides=(libnest2d)
conflicts=(libnest2d)
source=("git+https://github.com/Ultimaker/libnest2d"
        "fix-cpp-version.patch")
md5sums=('SKIP'
         '9f18cc7558823f5cf24164c74b9fc9c8')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 < "$srcdir/fix-cpp-version.patch"
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
