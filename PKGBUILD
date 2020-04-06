# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libplatform-git
pkgver=2.0.1.r2.g041a8c6
pkgrel=1
pkgdesc="Platform support library used by libCEC and binary add-ons for Kodi"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/platform"
license=('GPL')
makedepends=('git' 'cmake')
provides=('libplatform' 'p8-platform')
conflicts=('libplatform' 'p8-platform')
source=('libplatform::git+https://github.com/Pulse-Eight/platform.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libplatform
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/p8\.platform\.//'
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
