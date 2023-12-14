# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

_name=abseil-cpp
pkgname=abseil-cpp11
pkgver=20220623.1
pkgrel=1
pkgdesc='Common C++ libraries (legacy for C++11)'
arch=(aarch64 x86_64)
url='https://abseil.io'
license=(Apache)
depends=(gcc-libs)
makedepends=(cmake gtest)
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('91ac87d30cc6d79f9ab974c51874a704de9c2647c40f6932597329a282217ba8')

build() {
  cd $_name-$pkgver
  cmake -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_INCLUDEDIR=/usr/include/$pkgname \
    -DCMAKE_INSTALL_LIBDIR=lib/$pkgname \
    -DCMAKE_CXX_STANDARD=11 \
    -DBUILD_SHARED_LIBS=ON \
    -DABSL_USE_EXTERNAL_GOOGLETEST=ON \
    -DABSL_FIND_GOOGLETEST=ON
  cmake --build build
}

package() {
  cd $_name-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
