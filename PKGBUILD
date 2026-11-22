# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_name=folly
pkgname="${_name}-git"
pkgver=2026.10.26.00.r667.gb20004566
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Meta"
arch=('x86_64')
url="https://github.com/meta/${_name}"
license=('Apache-2.0')
conflicts=('folly')
provides=('folly')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost'
         'boost-libs' 'fmt' 'openssl' 'zlib' 'bzip2' 'xz' 'lz4' 'zstd' 'libsodium')
makedepends=('cmake' 'gtest' 'gmock' 'git')

source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -S . -B _build
  cmake --build _build
}

package() {
  cd "${_name}"
  cmake --build _build --target install -- DESTDIR="$pkgdir/"
}

