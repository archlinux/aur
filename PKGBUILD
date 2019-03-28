# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libcec-git
epoch=1
pkgver=4.0.0.3.r0.g209884d
pkgrel=1
pkgdesc="Pulse-Eight's libcec for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/libcec"
license=('GPL')
makedepends=('git' 'p8-platform>=2.0' 'cmake')
depends=('udev>=151' 'lockdev' 'p8-platform>=2.0' 'libxrandr' 'python')
provides=('libcec')
conflicts=('libcec')
options=('!libtool')
source=('libcec::git+https://github.com/Pulse-Eight/libcec.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libcec
  git describe --long --tags | sed 's!^libcec-!!;s!\([^-]*-g\)!r\1!;s!-!.!g'
}

build() {
  cd "$srcdir"/libcec
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
  make
}

package() {
  cd "$srcdir"/libcec
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
