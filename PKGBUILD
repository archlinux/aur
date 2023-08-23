# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>

pkgname=cppdap-git
pkgver=1.59.0.r97.gcc2f205
pkgrel=1
pkgdesc="C++ library for the Debug Adapter Protocol"
arch=('x86_64')
url='https://github.com/google/cppdap'
license=('Apache-2.0')
makedepends=('cmake' 'nlohmann-json' 'git')
provides=('cppdap')
conflicts=('cppdap')
options=('!strip')
source=('git+https://github.com/google/cppdap')
sha1sums=('SKIP')

pkgver() {
  cd cppdap
  _ver="$(cat CMakeLists.txt | grep -m1 '(cppdap VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S cppdap \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPPDAP_USE_EXTERNAL_NLOHMANN_JSON_PACKAGE=ON \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
