# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=folly-git
pkgver=2019.06.17.00.r21.gefaea2394
pkgrel=1
pkgdesc='C++ library developed and used at Facebook'
arch=('i686' 'x86_64')
url='https://github.com/facebook/folly'
license=('Apache')
conflicts=('folly')
provides=('folly')
depends=('google-glog' 'gflags' 'double-conversion' 'libevent' 'boost-libs' 'jemalloc' 'xz' 'lz4' 'zstd' 'snappy')
makedepends=('git' 'boost' 'python2')
source=(git+https://github.com/facebook/folly.git)
md5sums=('SKIP')

pkgver() {
  cd folly
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd folly/folly
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' {} \;
}

build() {
  cd folly
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -fPIC"
}

package() {
  cd folly
  make DESTDIR="$pkgdir" install
}
