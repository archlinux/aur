# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libplatform-git
pkgver=1.0.9
pkgrel=1
pkgdesc="Platform support library used by libCEC and binary add-ons for Kodi"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/platform"
license=('GPL')
makedepends=('git')
provides=('libplatform')
conflicts=('libplatform')
source=('libplatform::git+https://github.com/Pulse-Eight/platform.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libplatform
  git describe --tags
}

build() {
  cd "$srcdir"/libplatform
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
  make
}

package() {
  cd "$srcdir"/libplatform
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
