# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

pkgname=snappy-static
_pkgname=snappy
pkgver=1.1.7
pkgrel=1
pkgdesc='A fast compressor/decompressor library'
arch=('x86_64')
url="https://google.github.io/snappy/"
license=('BSD')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
provides=('snappy')
conflicts=('snappy')
checkdepends=('zlib')
options=('staticlibs')
source=("https://github.com/google/snappy/archive/$pkgver.tar.gz")
sha256sums=('3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4')

build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build
  cd build
  CXXFLAGS+=" -fPIC"
  cmake -DSNAPPY_BUILD_TESTS=off \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
}

package() {
  cd "$_pkgname-$pkgver"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/snappy/LICENSE"

  cd build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
