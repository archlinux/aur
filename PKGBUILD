# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>

pkgname=cppdap-git
pkgver=1.59.0.r95.ge3379ed
pkgrel=2
pkgdesc="C++ library for the Debug Adapter Protocol"
arch=('x86_64')
url='https://github.com/google/cppdap'
license=('GPL')
makedepends=('cmake' 'git')
provides=('cppdap')
conflicts=('cppdap')
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
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DCPPDAP_USE_EXTERNAL_NLOHMANN_JSON_PACKAGE=ON \
        -DCPPDAP_USE_EXTERNAL_RAPIDJSON_PACKAGE=OFF \
        -DCPPDAP_USE_EXTERNAL_JSONCPP_PACKAGE=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
