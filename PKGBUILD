# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Roman Gilg <subdiff@gmail.com>

pkgname=wrapland-git
_pkgname=wrapland
pkgver=0.519.0.beta.0.r15.g4120997
pkgrel=1
pkgdesc='Qt/C++ library that wraps and mediates the libwayland client and server API'
arch=(x86_64)
url="https://gitlab.com/kwinft/wrapland"
license=(LGPL)
depends=('kwayland' 'wayland')
provides=("wrapland")
conflicts=("wrapland")
makedepends=(extra-cmake-modules doxygen qt5-tools wayland-protocols pkgconf)
source=("$_pkgname::git+https://gitlab.com/kwinft/wrapland.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^wrapland\@//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir"/build
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
