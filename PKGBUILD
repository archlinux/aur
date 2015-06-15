# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libcec-git
epoch=1
pkgver=2.1.4.155.g1855591
pkgrel=1
pkgdesc="Pulse-Eight's libcec for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/libcec"
license=('GPL')
makedepends=('git' 'libplatform')
depends=('udev>=151' 'lockdev' 'libplatform' 'libxrandr' 'python')
provides=('libcec')
conflicts=('libcec')
options=('!libtool')
source=('libcec::git+https://github.com/Pulse-Eight/libcec.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libcec
  git describe --tags | sed 's|libcec-||;s|-|.|g'
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
