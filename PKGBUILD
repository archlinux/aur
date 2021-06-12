# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=folly-git
pkgver=2021.05.31.00.r0.g99fbca1df
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=('x86_64')
url='https://github.com/facebook/folly'
license=('Apache')
conflicts=('folly')
provides=('folly')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost'
         'boost-libs' 'fmt' 'openssl' 'zlib' 'bzip2' 'xz' 'lz4' 'zstd' 'libsodium')
makedepends=('cmake' 'gtest' 'gmock' 'git')
source=(git+https://github.com/facebook/folly.git)
md5sums=('SKIP')

pkgver() {
  cd folly
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd folly
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -S . -B _build
  cmake --build _build
}

package() {
  cd folly
  cmake --build _build --target install -- DESTDIR="$pkgdir/"
}
